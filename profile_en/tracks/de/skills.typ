#import "@preview/brilliant-cv:4.1.0": cv-section, cv-skill, h-bar

// Only technologies the author confirmed as defensible in interview; see the
// spec for the excluded list. The block keeps the section on one page instead
// of stranding its heading at a page foot.

#block(breakable: false)[
  #cv-section("Skills")

  #cv-skill(
    type-width: 27%,
    type: [Languages],
    info: [Python #h-bar() SQL],
  )

  #cv-skill(
    type-width: 27%,
    type: [Processing],
    info: [Apache Spark #h-bar() Polars #h-bar() Narwhals #h-bar() pandas #h-bar() Apache Hadoop #h-bar() Apache Sedona],
  )

  #cv-skill(
    type-width: 27%,
    type: [Orchestration],
    info: [Apache Airflow],
  )

  #cv-skill(
    type-width: 27%,
    type: [Storage \& Databases],
    info: [AWS S3 #h-bar() Azure Blob Storage #h-bar() PostgreSQL #h-bar() Oracle #h-bar() SQL Server #h-bar() MySQL #h-bar() #box[Apache Hive] #h-bar() DuckDB],
  )

  #cv-skill(
    type-width: 27%,
    type: [Platform \& DevOps],
    info: [Cloudera CDP #h-bar() Docker #h-bar() Kubernetes #h-bar() Git #h-bar() GitLab #h-bar() GitHub Actions #h-bar() Linux],
  )

  #cv-skill(
    type-width: 27%,
    type: [Governance \& Standards],
    info: [Apache Atlas #h-bar() Apache Ranger #h-bar() SDMX],
  )

  #cv-skill(
    type-width: 27%,
    type: [Spoken Languages],
    info: [Italian (Native) #h-bar() English (C1) #h-bar() Spanish (B1) #h-bar() French (A2)],
  )
]
