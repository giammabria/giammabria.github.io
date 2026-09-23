#import "@preview/brilliant-cv:4.1.0": cv-entry, cv-section

// Data Engineer framing of the same roles as profile_en/professional.typ.
// No ref-line: tech CVs never show referees, in either variant.

#cv-section("Professional Experience")

#cv-entry(
  title: [Banking Supervision \& Data Analyst],
  society: [European Central Bank -- DG SPL],
  date: [07/2021 -- ongoing],
  location: [Frankfurt am Main, Germany],
  description: list(
    [Designed and deployed *ETL pipelines on AWS/Cloudera CDP* -- S3 data lake, Apache Spark on Cloudera Data Engineering, Apache Airflow orchestration -- ingesting COREP/FINREP and SREP supervisory data],
    [Owned the *divisional data lab*: 100+ tables covering all 3,000 SSM LSIs and growing quarterly; automating recurring delivery and transformation jobs cut reporting cycles by up to 80%; served outputs to Tableau and Power BI],
    [Integrated three fragmented SREP sources into *one standardised database*, and refactored data-delivery pipelines with Polars and Spark],
    [Designed the *data model of the SSM Outsourcing Register* -- template and data dictionaries for 110 SIs across 21 jurisdictions, aligned with DORA -- and delivered outputs in SDMX-EDI/SDMX-ML],
    [Engineered and maintained *three internal Python packages* leveraging Polars and the Narwhals dataframe-interoperability layer, supporting statistical analysis, supervisory reporting and data extraction/manipulation and improving the robustness, reusability and efficiency of analytical workflows],
    [Ran *data governance*: lineage and metadata with Apache Atlas, access control with Apache Ranger, standardised technical documentation and operational processes],
    [Set up and maintained the *GitLab repositories* of the division's 5-person team across all its data products, each with structured technical documentation, and curated the divisional wiki on Confluence/Jira],
  ),
)

#cv-entry(
  title: [Consultant, Financial Services \& Risk Management],
  society: [Protiviti -- Risk Management],
  date: [10/2020 -- 06/2021],
  location: [Milan, Italy],
  description: list(
    [Built *automated tools for stress-testing business plans* across three private equity portfolios],
    [Built compliance dashboards and reporting for two institutions, tracking their alignment with ECB and EBA guidelines],
  ),
)
