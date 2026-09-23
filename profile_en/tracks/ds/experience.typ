#import "@preview/brilliant-cv:4.1.0": cv-entry, cv-section

// Data Scientist framing of the same roles as profile_en/professional.typ.
// No ref-line: tech CVs never show referees, in either variant.

#cv-section("Professional Experience")

#cv-entry(
  title: [Banking Supervision \& Data Analyst],
  society: [European Central Bank -- DG SPL],
  date: [07/2021 -- ongoing],
  location: [Frankfurt am Main, Germany],
  description: list(
    [Built *entity-resolution and dependency-mapping tools* combining graph analytics and NLP semantic similarity to identify service providers across the outsourcing registers of 110 SIs; defined concentration-risk metrics for critical third-party providers under DORA],
    [Developed a monthly *cross-bank default-recognition tool* on granular AnaCredit debtor-level data, flagging debtors still classified as performing by one bank while another creditor had already triggered a default, and benchmarked the LSI sector on profitability and asset quality -- RoA/RoE, NII sensitivity, cost/income, NPL and coverage ratios, RWA density -- as an *early-warning signal* for unsustainable business models],
    [Unified three fragmented SREP data sources into *one standardised database*, enabling SSM-wide benchmarking that the fragmented sources had prevented],
    [Designed and deployed scalable *ETL pipelines on AWS/Cloudera* (S3, Spark, Airflow) feeding a divisional data lab of 100+ tables on all 3,000 SSM LSIs, built on SDMX standards and Git-based workflows; cut reporting cycles by up to 80% and served Tableau and Power BI dashboards for Joint Supervisory Teams and NCAs],
    [Engineered with the ECB Statistics Department *three internal Python packages* leveraging Polars and the Narwhals dataframe-interoperability layer, supporting statistical analysis, supervisory reporting and data extraction and improving the robustness, reusability and efficiency of analytical workflows],
    [Set up and maintained the *GitLab repositories* of the division's 5-person team across all its data products, each with structured technical documentation, and curated the divisional wiki on Confluence/Jira],
    [Co-led with Banca d'Italia a *data-driven thematic review* of governance across 278 LSIs in 21 jurisdictions, benchmarking board independence, experience and diversity against SIs; its recommendations were endorsed by the Supervisory Mechanism Network],
  ),
)

#cv-entry(
  title: [Consultant, Financial Services \& Risk Management],
  society: [Protiviti -- Risk Management],
  date: [10/2020 -- 06/2021],
  location: [Milan, Italy],
  description: list(
    [Built *automated tools for stress-testing business plans* and assessing operational, strategic and financial risk across three private equity portfolios],
    [Built compliance dashboards and reporting for two institutions, tracking their alignment with ECB and EBA guidelines],
  ),
)
