#import "@preview/brilliant-cv:4.1.0": cv-honor, cv-section, h-bar

// The block keeps the section on one page instead of splitting its last rows
// onto the next. Lean White Belt and JEVE have no issuer argument: cv-honor
// joins issuer and location onto the title with commas, so an empty value
// leaves a dangling separator.

#block(breakable: false)[
  #cv-section("Certificates & Training")

  #cv-honor(
    date: [2026],
    title: [MiCAR Talks #h-bar() Crypto Assets Online Masterclass #h-bar() Geopolitical Risks],
    issuer: [ECB / EUI Florence School of Banking \& Finance],
  )

  #cv-honor(
    date: [2023],
    title: [Lean White Belt Certification],
  )

  #cv-honor(
    date: [2020],
    title: [Data Scientist with Python],
    issuer: [DataCamp],
  )

  #cv-honor(
    date: [2019 -- 2020],
    title: [JEVE Junior Enterprise -- student consulting],
    location: [Italy],
  )
]
