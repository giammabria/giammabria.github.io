#import "@preview/brilliant-cv:4.1.0": cv-entry, cv-section
#import "../tech.typ": tech

// Same facts as the ds track, checked against the repositories on
// 2026-09-23, told from the client's side: need, deliverable, safeguards.
// Client work is not public: no link, client anonymised.

#cv-section("Client Projects")

#cv-entry(
  title: [Client project (pro bono)],
  society: [AI agent and drone-imagery analytics for precision agriculture],
  date: [2026],
  location: "",
  description: list(
    [Translated an agricultural drone operator's workflows into an *AI agent* on #tech[Claude Code], delivered and demoed to the client: four specialised subagents grounded in a curated knowledge base of 51 documents, plus automated mission reporting from drone imagery],
  ),
)

#cv-entry(
  title: [Freelance client project],
  society: [LiDAR vegetation-risk analytics for power lines],
  date: [2026],
  location: "",
  description: list(
    [Turned 150M+ LiDAR interference points over the medium-voltage lines of *a major Italian energy utility* into vegetation criticalities per span and client deliverables -- GIS files, tables and HTML reports with year-on-year comparisons],
  ),
)
