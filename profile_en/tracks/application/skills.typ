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
    type: [Data Modelling],
    info: [SQL (Apache Impala, Hive, PostgreSQL, SQL Server, DuckDB) #h-bar() #box[Python (Polars, pandas)] #h-bar() #box[Apache Spark] #h-bar() Parquet #h-bar() data dictionaries #h-bar() automated data tests in CI],
  )

  #cv-skill(
    type-width: 27%,
    type: [Data Visualisation],
    info: [Tableau #h-bar() Power BI #h-bar() Excel #h-bar() PowerPoint #h-bar() data storytelling],
  )

  #cv-skill(
    type-width: 27%,
    type: [Engineering],
    info: [Git, GitLab CI/CD #h-bar() Apache Airflow #h-bar() AWS S3 #h-bar() Cloudera CDP #h-bar() Docker],
  )

  #cv-skill(
    type-width: 27%,
    type: [AI],
    info: [Generative AI (Amazon Bedrock, LLM evaluation) #h-bar() AI agents (Claude Code) #h-bar() ML and NLP],
  )

  #cv-skill(
    type-width: 27%,
    type: [Ways of Working],
    info: [Agile/Scrum #h-bar() Jira, Confluence #h-bar() business and IT stakeholders],
  )
]
