#import "@preview/brilliant-cv:4.1.0": cv-entry, cv-section

// Referee names are private data. They exist only in the gitignored
// private.toml and are read only for a local `--input variant=private`
// build, so this committed file contains no referee name in plain text and
// the public build renders no reference line at all.
#let variant = sys.inputs.at("variant", default: "public")
#let references = if variant == "private" {
  toml("private.toml").at("references", default: ())
} else {
  ()
}

#let accent-color = rgb(toml("metadata.toml").layout.awesome_color)

// Takes one or more keys. Several referees at the same institution are
// rendered on a single line -- "Reference: A, B -- Institution" -- rather than
// as one bullet each repeating the same employer.
#let ref-line(..keys) = {
  let matches = keys.pos().map(k => references.find(r => r.key == k)).filter(r => r != none)
  if matches.len() == 0 {
    none
  } else {
    let names = matches.map(r => if r.at("email", default: "") != "" {
      link("mailto:" + r.email)[#r.name]
    } else {
      [#r.name]
    })
    let joined = names.slice(1).fold(names.first(), (acc, n) => [#acc, #n])
    text(weight: "medium", fill: accent-color)[Reference: #joined -- #matches.first().title]
  }
}

// cv-entry's `description` takes a list; ref-line yields `none` in a public
// build, and a `none` item would render as an empty bullet, so drop them.
#let bullets(..items) = list(..items.pos().filter(b => b != none))

#cv-section("Professional Experience")

#cv-entry(
  title: [Banking Supervision \& Data Analyst],
  society: [European Central Bank -- DG SPL],
  date: [07/2021 -- ongoing],
  location: [Frankfurt am Main, Germany],
  description: bullets(
    [Led the design and implementation of the *SSM Outsourcing Register*, covering 110 SIs with NCAs across 21 jurisdictions, defining data dictionaries and reporting standards aligned with DORA; findings informed SREP assessments of operational risk and cross-SSM concentration-risk monitoring of critical third-party providers],
    [Supervisory convergence, coordinating ECB/EBA/NCA initiatives: co-led with Banca d'Italia a *cross-country thematic review of governance frameworks* across around 300 LSIs in 21 SSM jurisdictions, producing SMN-endorsed recommendations; assessed the impact and transposition of *CRD VI Art. 21c* across member states; authored the *internal policy on Online Deposit Platform risks* and how to measure banks' reliance on them; mapped, quantified and assessed *crypto-asset and stablecoin activity* across all LSIs under MiCAR; ECB liaison for Bulgaria and Portugal],
    [Ran horizontal analyses across the European banking sector -- outsourcing, ICT, cloud and concentration risk, debtor-level credit risk exposures, and fintech profitability and market share -- supported by *graph-analytics and NLP tools* for entity resolution, service-provider identification and third-party dependency mapping],
    [Designed and deployed scalable *ETL pipelines on AWS/Cloudera* (S3, Spark, Airflow), consolidating 100+ tables covering all 3,000 SSM LSIs and growing quarterly into a divisional data lab built on SDMX standards and Git-based development workflows; the infrastructure cut reporting cycles by up to 80%],
    [Engineered, tested and maintained *three internal Python packages* supporting statistical analysis, supervisory reporting and data extraction, improving the robustness, reusability and efficiency of analytical workflows],
    ref-line("ecb", "ecb2"),
  ),
)

#cv-entry(
  title: [Consultant, Financial Services \& Risk Management],
  society: [Protiviti -- Risk Management],
  date: [10/2020 -- 06/2021],
  location: [Milan, Italy],
  description: bullets(
    [Designed and implemented *risk evaluation methodologies and reporting frameworks* across three private equity portfolios, including automated tools for stress-testing business plans and assessing the operational, strategic and financial risks facing each portfolio company],
    [Built *compliance dashboards and reporting* for two institutions, tracking their alignment with ECB and EBA guidelines],
    [Drafted, reviewed and validated *operational and credit risk policies and manuals*, contributing to risk mitigation strategies],
    ref-line("protiviti"),
  ),
)
