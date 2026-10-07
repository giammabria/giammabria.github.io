#import "@preview/brilliant-cv:4.1.0": cv-section, cv-skill, h-bar

// Only technologies the author confirmed as defensible in interview, as in
// the ds/de tracks. The block keeps the section on one page instead of
// stranding its heading at a page foot.

#block(breakable: false)[
  #cv-section("Skills")

  #cv-skill(
    type-width: 27%,
    type: [Languages],
    info: [Italian (Native) #h-bar() English (C1) #h-bar() Spanish (B1) #h-bar() French (A2)],
  )

  #cv-skill(
    type-width: 27%,
    type: [Data \& Programming],
    info: [Python #h-bar() SQL #h-bar() R #h-bar() pandas #h-bar() Polars #h-bar() PostgreSQL, Oracle, SQL Server, MySQL],
  )

  #cv-skill(
    type-width: 27%,
    type: [AI \& Analytics],
    info: [AI agents (Claude Code subagents and skills) #h-bar() NLP (spaCy, sentence-transformers) #h-bar() ML (scikit-learn, PyTorch) #h-bar() graph analytics],
  )

  #cv-skill(
    type-width: 27%,
    type: [Data Platforms],
    info: [AWS S3 #h-bar() Cloudera CDP #h-bar() Apache Spark #h-bar() Apache Airflow #h-bar() Docker],
  )

  #cv-skill(
    type-width: 27%,
    type: [Delivery \& Reporting],
    info: [Git #h-bar() GitLab #h-bar() Confluence/Jira #h-bar() Tableau #h-bar() Power BI #h-bar() Streamlit],
  )
]
