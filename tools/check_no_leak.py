#!/usr/bin/env python3
"""Fail if any private value leaked into the committed tree or a built PDF.

Reads the strings to look for out of the gitignored profile_*/private.toml
files at run time, so this script holds no secret of its own and is safe to
commit to a public repository.

Usage:
    python3 tools/check_no_leak.py [built.pdf ...]

Exits 0 when clean, 1 on the first category of failure found.
"""

import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

# Values shorter than this are too generic to grep for without false
# positives (a two-letter country code, a bare "IT"). Real emails, phone
# numbers, addresses and surnames all clear it.
MIN_SECRET_LEN = 5

# Not every value in private.toml is a secret. `key` is a public-safe slug by
# design, `title` is an employer and job title the CV already states in plain
# text, and `photo` is a path. What identifies a person is the contact
# details under [info] and a referee's `name`.
PUBLIC_KEYS = {"key", "title", "photo"}

# Python 3.10 on this machine has no tomllib and pip is unavailable, so pull
# the quoted string values out directly, keeping the TOML key beside each so
# the public ones can be dropped. private.toml is flat and hand-written,
# which makes this adequate.
KEY_VALUE = re.compile(r'^\s*([A-Za-z_][A-Za-z0-9_]*)\s*=\s*"([^"]*)"', re.M)


def secrets() -> set[str]:
    found = set()
    for private in sorted(ROOT.glob("profile_*/private.toml")):
        text = private.read_text(encoding="utf-8")
        for key, value in KEY_VALUE.findall(text):
            if key in PUBLIC_KEYS:
                continue
            value = value.strip()
            if len(value) < MIN_SECRET_LEN:
                continue
            # The whole value always counts. Individual words count too, so a
            # surname quoted alone somewhere is still caught.
            found.add(value)
            found.update(
                w for w in value.replace(",", " ").split()
                if len(w) >= MIN_SECRET_LEN
            )
    return found


def committable_files() -> list[str]:
    """Every file that would end up in a commit.

    --cached covers what is already tracked; --others --exclude-standard adds
    files that are untracked but not ignored, which are exactly the ones a
    `git add .` would sweep in. Scanning only tracked files would report a
    reassuring "OK" on a repository with no commits yet, having checked
    nothing at all.
    """
    out = subprocess.run(
        ["git", "ls-files", "-z", "--cached", "--others", "--exclude-standard"],
        cwd=ROOT,
        capture_output=True,
        text=True,
        check=True,
    ).stdout
    return sorted({p for p in out.split("\0") if p})


def scan_tree(needles: set[str]) -> list[str]:
    problems = []
    for rel in committable_files():
        path = ROOT / rel
        try:
            text = path.read_text(encoding="utf-8", errors="ignore")
        except (OSError, UnicodeDecodeError):
            continue
        lowered = text.lower()
        for needle in needles:
            if needle.lower() in lowered:
                problems.append(f"{rel}: contains private value {needle!r}")
    return problems


def pdf_text(pdf: Path) -> str:
    """Extract text with pdf-parse under Node; poppler and pip are absent.

    pdf-parse 2.x exports a PDFParse class rather than the callable its 1.x
    releases exported, hence the shape of this snippet.
    """
    script = """
        const fs = require('fs');
        const { PDFParse } = require('pdf-parse');
        (async () => {
          const data = new Uint8Array(fs.readFileSync(process.argv[1]));
          const parser = new PDFParse({ data });
          const result = await parser.getText();
          process.stdout.write(result.text);
          await parser.destroy();
        })().catch(e => { console.error(e.message); process.exit(1); });
    """
    result = subprocess.run(
        ["node", "-e", script, str(pdf)],
        cwd=ROOT,
        capture_output=True,
        text=True,
    )
    if result.returncode != 0:
        raise RuntimeError(
            f"could not read {pdf}: {result.stderr.strip()}\n"
            "Install the extractor first: npm install --no-save pdf-parse"
        )
    return result.stdout


def scan_pdfs(pdfs: list[Path], needles: set[str]) -> list[str]:
    problems = []
    for pdf in pdfs:
        text = pdf_text(pdf).lower()
        for needle in needles:
            if needle.lower() in text:
                problems.append(f"{pdf}: renders private value {needle!r}")
    return problems


def main(argv: list[str]) -> int:
    needles = secrets()
    if not needles:
        print("FAIL: no private.toml found, so nothing was actually checked.")
        print("      Create profile_en/private.toml first (see")
        print("      profile_en/private.example.toml).")
        return 1

    problems = scan_tree(needles)
    problems += scan_pdfs([Path(p) for p in argv], needles)

    if problems:
        print(f"FAIL: {len(problems)} leak(s) found")
        for p in problems:
            print(f"  {p}")
        return 1

    scanned = f" and {len(argv)} PDF(s)" if argv else ""
    print(f"OK: {len(needles)} private value(s) absent from the tree{scanned}")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
