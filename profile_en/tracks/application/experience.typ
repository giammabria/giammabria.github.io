#import "@preview/brilliant-cv:4.1.0": cv-entry, cv-section

// Client-facing framing of the same roles as profile_en/professional.typ:
// problem, stakeholders, solution, adoption, result. Supervisory acronyms are
// spelled out for a reader outside central banking.
// No ref-line: track CVs never show referees, in either variant.

#cv-section("Professional Experience")

#cv-entry(
  title: [Banking Supervision \& Data Analyst],
  society: [European Central Bank -- DG SPL],
  date: [07/2021 -- ongoing],
  location: [Frankfurt am Main, Germany],
  description: list(
    [Led the design and implementation of the *SSM Outsourcing Register* with national supervisory authorities across 21 jurisdictions, covering 110 significant banks: translated DORA requirements into a reporting template, data dictionaries and reporting standards; findings informed supervisory assessments of operational risk and the monitoring of concentration on critical third-party providers],
    [Co-led with Banca d'Italia a *cross-country thematic review of governance* across 278 smaller banks in 21 jurisdictions, benchmarking board independence, experience and diversity, with recommendations endorsed by the Supervisory Mechanism Network; coordinated convergence initiatives between the ECB, the European Banking Authority and national authorities, and acted as ECB liaison for Bulgaria and Portugal],
    [Turned *open-ended policy questions into measurable analyses*: authored the internal policy on online deposit platform risks and on how to measure banks' reliance on them; mapped and quantified crypto-asset and stablecoin activity across all smaller banks under MiCAR],
    [Built *analytical tools used in supervision*: entity resolution and third-party dependency mapping with graph analytics and NLP, and a monthly cross-bank tool on debtor-level credit data flagging debtors one bank still reports as performing after another creditor has recorded a default],
    [Owned the *divisional data lab* on AWS/Cloudera (S3, Apache Spark, Apache Airflow): 100+ tables covering all 3,000 smaller banks under European supervision, three fragmented data sources integrated into one standardised database, outputs served to Tableau and Power BI; automation cut reporting cycles by up to 80%],
    [Made the work *reusable by the team*: three internal Python packages maintained with the ECB Statistics Department, and the GitLab repositories, technical documentation and Confluence/Jira wiki of the division's 5-person team across all its data products],
  ),
)

#cv-entry(
  title: [Consultant, Financial Services \& Risk Management],
  society: [Protiviti -- Risk Management],
  date: [10/2020 -- 06/2021],
  location: [Milan, Italy],
  description: list(
    [Designed and implemented *risk evaluation methodologies and reporting frameworks* across three private equity portfolios, including automated tools for stress-testing business plans and assessing the operational, strategic and financial risks facing each portfolio company],
    [Built *compliance dashboards and reporting* for two institutions, tracking their alignment with ECB and EBA guidelines],
    [Drafted, reviewed and validated *operational and credit risk policies and manuals*, contributing to risk mitigation strategies],
  ),
)
