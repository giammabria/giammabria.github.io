#!/usr/bin/env python3
"""Check a built CV PDF: page count, expected and forbidden text, links.

Usage:
    python3 tools/check_pdf.py PDF [--max-pages N] [--expect TEXT]...
                                   [--forbid TEXT]... [--check-links]

Text comes from pdf-parse, the same extractor check_no_leak.py uses, with
all whitespace collapsed to single spaces before matching, so a phrase that
wraps across lines still matches. Matching is case-sensitive.

"Giamma241" is always forbidden, in text and in links: that GitHub account
was renamed and its URLs return 404.

Exits 0 when every check passes, 1 otherwise.
"""

import argparse
import re
import sys
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path

from check_no_leak import pdf_text

ALWAYS_FORBIDDEN = ["Giamma241"]

# Hosts that refuse scripted requests whatever the URL (LinkedIn answers 999,
# Udemy 403). Their links are listed for a manual click instead of failing.
MANUAL_HOSTS = {"www.linkedin.com", "linkedin.com", "www.udemy.com"}

PAGE = re.compile(rb"/Type\s*/Page(?!s)")
URI = re.compile(rb"/URI\s*\(([^)]*)\)")


def page_count(data: bytes) -> int:
    return len(PAGE.findall(data))


def links(data: bytes) -> list[str]:
    return sorted({u.decode("latin-1") for u in URI.findall(data)})


def http_status(url: str) -> str:
    request = urllib.request.Request(
        url, headers={"User-Agent": "Mozilla/5.0 (cv link check)"}
    )
    try:
        with urllib.request.urlopen(request, timeout=20) as response:
            return str(response.status)
    except urllib.error.HTTPError as e:
        return str(e.code)
    except OSError as e:
        return f"error: {e}"


def main(argv: list[str]) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("pdf", type=Path)
    parser.add_argument("--max-pages", type=int)
    parser.add_argument("--expect", action="append", default=[])
    parser.add_argument("--forbid", action="append", default=[])
    parser.add_argument("--check-links", action="store_true")
    args = parser.parse_args(argv)

    data = args.pdf.read_bytes()
    text = " ".join(pdf_text(args.pdf).split())
    failures = 0

    def report(ok: bool, message: str) -> None:
        nonlocal failures
        print(f"{'OK  ' if ok else 'FAIL'} {message}")
        failures += not ok

    pages = page_count(data)
    if args.max_pages is not None:
        report(pages <= args.max_pages, f"{pages} page(s), max {args.max_pages}")

    for phrase in args.expect:
        report(phrase in text, f"expected text {phrase!r}")

    found_links = links(data)
    for phrase in args.forbid + ALWAYS_FORBIDDEN:
        in_text = phrase in text
        in_links = any(phrase in u for u in found_links)
        report(not (in_text or in_links), f"forbidden text {phrase!r} absent")

    if args.check_links:
        for url in found_links:
            host = urllib.parse.urlparse(url).hostname or ""
            if host in MANUAL_HOSTS:
                print(f"MANUAL {url} (host refuses scripted requests)")
                continue
            status = http_status(url)
            report(status == "200", f"{status} {url}")

    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
