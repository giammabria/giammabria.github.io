#import "@preview/brilliant-cv:4.1.0": cv-section, cv-skill, h-bar

// Only technologies the author confirmed as defensible in interview; see the
// spec for the excluded list. The block keeps the section on one page: a
// heading stranded at a page foot with a single row under it reads as a gap.

#block(breakable: false)[
  #cv-section("Skills")

  #cv-skill(
    type-width: 27%,
    type: [Programming],
    info: [Python #h-bar() SQL #h-bar() R #h-bar() C++],
  )

  #cv-skill(
    type-width: 27%,
    type: [Machine Learning],
    info: [scikit-learn #h-bar() PyTorch #h-bar() PyTorch Lightning #h-bar() TensorFlow],
  )

  #cv-skill(
    type-width: 27%,
    type: [NLP \& Graphs],
    info: [spaCy #h-bar() NLTK #h-bar() sentence-transformers #h-bar() graph analytics and entity resolution],
  )

  #cv-skill(
    type-width: 27%,
    type: [Data Processing],
    info: [pandas #h-bar() Polars #h-bar() Narwhals #h-bar() DuckDB #h-bar() Apache Spark #h-bar() Apache Sedona (geospatial)],
  )

  #cv-skill(
    type-width: 27%,
    type: [Engineering Tools],
    info: [Git #h-bar() GitLab],
  )

  #cv-skill(
    type-width: 27%,
    type: [Visualisation],
    info: [Tableau #h-bar() Power BI #h-bar() Dash #h-bar() Streamlit #h-bar() Shiny],
  )

  #cv-skill(
    type-width: 27%,
    type: [Languages],
    info: [Italian (Native) #h-bar() English (C1) #h-bar() Spanish (B1) #h-bar() French (A2)],
  )
]
