#import "@preview/brilliant-cv:4.1.0": cv-honor, cv-section, h-bar

#cv-section("Certificates & Training")

// Three programmes from the same joint ECB / EUI Florence School of Banking
// and Finance offering, grouped onto one line rather than three near-identical
// rows repeating the issuer.
#cv-honor(
  date: [2026],
  title: [MiCAR Talks #h-bar() Crypto Assets Online Masterclass #h-bar() Geopolitical Risks],
  issuer: [ECB / EUI Florence School of Banking \& Finance],
)


// The source CV names no issuing body for the Lean White Belt or for JEVE.
// Those arguments are omitted rather than passed empty: cv-honor joins issuer
// and location onto the title with commas, so an empty value leaves a
// dangling separator.
#cv-honor(
  date: [2024],
  title: [Essentials of Climate and Nature Risks],
  issuer: [ECB Climate Change Centre],
  location: [Frankfurt, DE],
)

#cv-honor(
  date: [2023],
  title: [Lean White Belt Certification],
)

#cv-honor(
  date: [2021],
  title: [Automate the Boring Stuff with Python Programming],
  issuer: [Udemy],
  url: "https://www.udemy.com/certificate/UC-52f121bb-0a0f-4477-b855-d7c42adae4c1/",
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
