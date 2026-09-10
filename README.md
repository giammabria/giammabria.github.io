# giammabria.github.io

Source for my CV, built with [Typst](https://typst.app) and the
[brilliant-cv](https://typst.app/universe/package/brilliant-cv/) template.
Every push to `main` compiles it to English and Italian PDFs and publishes
them at <https://giammabria.github.io/>.

## Layout

- `cv.typ` — entry point. Selects the language (`--input profile=en|it`) and
  the public/full variant (`--input variant=public|private`).
- `profile_en/`, `profile_it/` — one self-contained profile per language:
  `metadata.toml` (public-safe personal data and layout config),
  `private.toml` (gitignored — real contact details and referees),
  `private.example.toml` (template for it), and the content modules
  `professional.typ`, `education.typ`, `certificates.typ`, `skills.typ`.
- `assets/fonts/` — bundled Source Sans 3, Roboto, and Font Awesome 7 Free,
  all OFL-licensed, so `--font-path assets/fonts` is self-contained and CI
  needs no font install step.
- `index.html` — landing page linking the two published PDFs.
- `tools/check_no_leak.py` — verifies no private value reached the repository
  or a public PDF.

## Public vs. full PDF

`profile_*/private.toml` never leaves this machine (it is gitignored) and
holds the real email address, phone number, street address, photo path, and
referee names. `cv.typ` overlays it only when `variant=private` is explicitly
requested. CI never passes that flag and the file is not in a CI checkout at
all, so the published site is always built from the redacted default.

Build the public PDFs — what gets published:

```sh
typst compile cv.typ output/cv-en.pdf --font-path assets/fonts --input profile=en
typst compile cv.typ output/cv-it.pdf --font-path assets/fonts --input profile=it
```

Build the full PDFs for actual applications. First copy
`profile_en/private.example.toml` to `profile_en/private.toml` and fill in
real values, once per profile:

```sh
typst compile cv.typ output/cv-en-full.pdf --font-path assets/fonts \
    --input profile=en --input variant=private
typst compile cv.typ output/cv-it-full.pdf --font-path assets/fonts \
    --input profile=it --input variant=private
```

## Checking for leaks

```sh
npm install --no-save pdf-parse   # once; the 2.x API is what the script uses
python3 tools/check_no_leak.py output/cv-en.pdf output/cv-it.pdf
```

The script reads the strings to search for out of `private.toml` at run time,
so it holds no secret of its own. It scans every file that would end up in a
commit — tracked files plus untracked ones that are not ignored — and any PDF
passed as an argument, and exits non-zero if it finds one.

Never point it at a `*-full.pdf`: those are supposed to contain private
values, and seeing it fail on one is the positive control that the PDF scan
works at all.

## Publishing

Pages must be configured once, by hand: Settings → Pages → Source →
**GitHub Actions**.

## Credits

The structure of this repository — a Typst CV split into per-language profile
directories, with contact details and referees held in a gitignored
`private.toml` that only a local `variant=private` build overlays — follows
[m9o8/m9o8.github.io](https://github.com/m9o8/m9o8.github.io). Thanks to its
author for publishing a clean solution to the "publish my CV without
publishing my phone number" problem.

Built with:

- [Typst](https://typst.app) 0.15.1
- [brilliant-cv](https://typst.app/universe/package/brilliant-cv/) 4.1.0 and
  [fontawesome](https://typst.app/universe/package/fontawesome/)
- [Source Sans 3](https://github.com/adobe-fonts/source-sans) and
  [Roboto](https://github.com/googlefonts/roboto), SIL Open Font License 1.1
- [Font Awesome Free](https://fontawesome.com) 7.3.1 — icons CC BY 4.0, fonts
  SIL OFL 1.1

Licence texts for the bundled fonts are in `assets/fonts/`.
