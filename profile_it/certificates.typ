#import "@preview/brilliant-cv:4.1.0": cv-honor, cv-section, h-bar

#cv-section("Certificazioni e formazione")

// Three programmes from the same joint ECB / EUI Florence School of Banking
// and Finance offering, grouped onto one line rather than three near-identical
// rows repeating the issuer.
#cv-honor(
  date: [2026],
  title: [MiCAR Talks #h-bar() Crypto Assets Online Masterclass #h-bar() Geopolitical Risks],
  issuer: [ECB / EUI Florence School of Banking \& Finance],
)


// Il CV di partenza non indica l'ente che rilascia il Lean White Belt ne'
// quello di JEVE. Gli argomenti sono omessi anziche' passati vuoti: cv-honor
// unisce issuer e location al titolo con delle virgole, quindi un valore
// vuoto lascia un separatore penzolante.
#cv-honor(
  date: [2024],
  title: [Essentials of Climate and Nature Risks],
  issuer: [ECB Climate Change Centre],
  location: [Francoforte, DE],
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
  title: [JEVE Junior Enterprise -- consulenza aziendale],
  location: [Italia],
)
