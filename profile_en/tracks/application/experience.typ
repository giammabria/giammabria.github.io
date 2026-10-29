#import "@preview/brilliant-cv:4.1.0": cv-entry, cv-section

// Framing of the same roles as profile_en/professional.typ for the current application:
// data models and tests first, then the dashboards and analyses built on them,
// and how their results reached decision makers. dbt is never claimed: the
// author has never used it. Supervisory acronyms are spelled out.
// No ref-line: track CVs never show referees, in either variant.

#cv-section("Professional Experience")

#cv-entry(
  title: [Banking Supervision \& Data Analyst],
  society: [European Central Bank -- DG SPL],
  date: [07/2021 -- ongoing],
  location: [Frankfurt am Main, Germany],
  description: list(
    [Owned the *divisional data lab* on AWS/Cloudera: *100+ tables* covering all 3,000 smaller banks and growing quarterly, built as SQL views and tables on Hadoop/Impala and in Spark, including one standardised database integrating three fragmented sources, with my own Tableau and Power BI dashboards on top; automation cut reporting cycles by up to 80%],
    [Shipped changes through *GitLab CI/CD with automated code and data tests* and frequent merges: validated code was deployed to the cloud automatically to regenerate the tables, with versioned releases of three internal Python packages],
    [Designed the *data models of four supervisory data collections* -- e.g. the outsourcing register for 110 significant banks, aligned with DORA: template, data dictionaries and standards -- and aligned them with national authorities in 21 countries and business and IT teams],
    [Delivered *Generative AI prototypes on Amazon Bedrock* to automate supervisory workflows -- meeting minutes, a bank's main risks -- with an LLM-as-a-judge evaluation of output quality; worked in an Agile/Scrum team with Jira and Confluence],
    [Built *analytics on credit and third-party data*: a monthly cross-bank tool on debtor-level credit data flagging defaults not yet recognised by other creditors, and NLP and graph-based entity resolution of third-party dependencies],
    [Turned data into *recommendations for decision makers*: analyses of banking business models across 21 countries -- online deposit platforms (regression against interest rates), fintech profitability and market share, crypto-assets under MiCAR -- presented to senior management, national authorities and the Supervisory Board],
  ),
)

#cv-entry(
  title: [Consultant, Financial Services \& Risk Management],
  society: [Protiviti -- Risk Management],
  date: [10/2020 -- 06/2021],
  location: [Milan, Italy],
  description: list(
    [Built *compliance dashboards and reporting* for two financial institutions, tracking their alignment with ECB and EBA guidelines],
    [Built *automated tools for stress-testing business plans* across three private equity portfolios],
  ),
)
