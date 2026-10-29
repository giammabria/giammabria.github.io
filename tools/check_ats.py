#!/usr/bin/env python3
"""Check what an applicant tracking system reads in a built CV PDF.

An ATS parses the PDF's text layer, not the rendered page, so this checks
the extraction rather than the look: the text extracted cleanly, the email
survived as literal text, the section headings come out in the track's
order, the date ranges, and how many of a posting's keywords appear.

Usage:
    python3 tools/check_ats.py PDF [--track NAME] [--keywords FILE]
                                   [--dump-text FILE]

--track reads the section headings from profile_en/tracks/NAME/: the
cv-section("...") call in each module that track.toml lists, in order.

--keywords takes a plain-text file, one keyword per line, under a
"[required]" or "[preferred]" header ("[required]" until the first header).
Alternatives follow the keyword after "|": "SQL | BigQuery". A line
starting with "#" is a comment. Matching ignores case and line wraps.
A keyword found only through an alternative is reported as synonym-only,
since many ATS match the posting's term literally.

Text comes from pdf-parse, the same extractor check_no_leak.py uses.
A date range joined by an en or em dash (Typst turns "--" into an en dash)
is a warning, not a failure: some ATS imports, Workday among them, are
reported to drop such dates.

Exits 1 if a parse check fails or a required keyword is missing, else 0.
"""

import argparse
import re
import sys
from pathlib import Path

from check_no_leak import ROOT, pdf_text

EMAIL = re.compile(r"[\w.+-]+@[\w-]+(\.[\w-]+)+")
DASH_DATE = re.compile(
    r"(?:\d{2}/)?\d{4}\s*[–—]\s*(?:(?:\d{2}/)?\d{4}|ongoing|present|today)",
    re.IGNORECASE,
)
SECTION = re.compile(r'cv-section\("([^"]+)"\)')
MODULES = re.compile(r"^modules\s*=\s*\[(.*?)\]", re.MULTILINE | re.DOTALL)
MODULE = re.compile(r'^\s*"([^"]+)"\s*,?\s*$')


def track_sections(track: str) -> list[str]:
    """Section headings of a track, in the order track.toml includes them."""
    track_dir = ROOT / "profile_en" / "tracks" / track
    toml = (track_dir / "track.toml").read_text(encoding="utf-8")
    block = MODULES.search(toml).group(1)
    sections = []
    for line in block.splitlines():
        module = MODULE.match(line)
        if not module:
            continue  # commented out, or the opening bracket
        source = (track_dir / f"{module.group(1)}.typ").read_text(encoding="utf-8")
        sections += SECTION.findall(source)
    return sections


def read_keywords(path: Path) -> list[tuple[str, list[str]]]:
    """(priority, [keyword, alternative, ...]) per line of a keyword file."""
    keywords, priority = [], "required"
    for raw in path.read_text(encoding="utf-8").splitlines():
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        if line.lower() in ("[required]", "[preferred]"):
            priority = line.lower().strip("[]")
            continue
        terms = [t.strip() for t in line.split("|") if t.strip()]
        keywords.append((priority, terms))
    return keywords


def contains(text: str, term: str) -> bool:
    # Word edges only where the term starts or ends with a word character,
    # so "R" does not match inside "Reporting" but "C++" still matches.
    pattern = re.escape(" ".join(term.split()))
    if term[0].isalnum():
        pattern = r"(?<!\w)" + pattern
    if term[-1].isalnum():
        pattern += r"(?!\w)"
    return re.search(pattern, text, re.IGNORECASE) is not None


def main(argv: list[str]) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("pdf", type=Path)
    parser.add_argument("--track")
    parser.add_argument("--keywords", type=Path)
    parser.add_argument("--dump-text", type=Path)
    args = parser.parse_args(argv)

    raw = pdf_text(args.pdf)
    text = " ".join(raw.split())
    if args.dump_text:
        args.dump_text.write_text(raw, encoding="utf-8")
    failures = 0

    def report(status: str, message: str) -> None:
        nonlocal failures
        print(f"{status:<4} {message}")
        failures += status == "FAIL"

    report("OK" if len(text) > 200 else "FAIL", f"{len(text)} characters extracted")
    garbage = text.count("(cid:") + text.count("�")
    report("OK" if not garbage else "FAIL", f"{garbage} unreadable glyph(s)")

    emails = sorted({m.group(0) for m in EMAIL.finditer(text)})
    report(
        "OK" if emails else "WARN",
        f"email as text: {', '.join(emails)}" if emails
        else "no email in the text layer (expected only in the public variant)",
    )

    if args.track:
        expected = track_sections(args.track)
        positions = [text.find(s) for s in expected]
        missing = [s for s, p in zip(expected, positions) if p < 0]
        found = [p for p in positions if p >= 0]
        report("OK" if not missing else "FAIL",
               "sections present" if not missing else f"sections missing: {missing}")
        report("OK" if found == sorted(found) else "FAIL",
               f"section order: {' > '.join(expected)}")

    dash_dates = DASH_DATE.findall(text)
    report("OK" if not dash_dates else "WARN",
           f"{len(dash_dates)} date range(s) joined by a Unicode dash"
           + (f", e.g. {dash_dates[0]!r}" if dash_dates else ""))

    if args.keywords:
        print()
        print(f"{'status':<16} {'priority':<10} keyword")
        for priority, (term, *alternatives) in read_keywords(args.keywords):
            if contains(text, term):
                status = "covered"
            elif hit := next((a for a in alternatives if contains(text, a)), None):
                status = "synonym-only"
                term = f"{term} (as {hit!r})"
            else:
                status = "missing"
                failures += priority == "required"
            print(f"{status:<16} {priority:<10} {term}")

    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
