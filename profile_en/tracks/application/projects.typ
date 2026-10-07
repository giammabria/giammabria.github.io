#import "@preview/brilliant-cv:4.1.0": cv-entry, cv-section
#import "../tech.typ": tech

// Same facts as the ds/de tracks, checked against the repositories on
// 2026-09-23, told from the client's side: need, deliverable, safeguards.
// Client work is not public: no link, client anonymised.

#cv-section("Client Projects")

#cv-entry(
  title: [Client project (pro bono)],
  society: [AI agent and drone-imagery analytics for precision agriculture],
  date: [2026],
  location: "",
  description: list(
    [*AI agent* built on #tech[Claude Code] for an agricultural drone operator: four specialised subagents (agronomy, regulation, data analysis, document library) and skills grounded in a curated knowledge base of 51 documents and 13 technical sheets],
    [Vineyard pipeline from multispectral and thermal drone rasters to vegetation indices, HTML mission reports and a 3D viewer (#tech[Python], #tech[rasterio])\; 20 test modules including golden-file tests],
  ),
)

#cv-entry(
  title: [Freelance client project],
  society: [LiDAR vegetation-risk analytics for power lines],
  date: [2026],
  location: "",
  description: list(
    [Turned 150M+ LiDAR interference points over the medium-voltage lines of *a major Italian energy utility* into vegetation criticalities per span, tree-cutting sections and client deliverables -- per-line GIS files, tables and HTML reports with year-on-year comparisons against the previous survey],
    [Staged pipeline (ingest → reconcile → apply → analyse → export) on #tech[PyQGIS] and #tech[GDAL], with dry-run and verified backups before destructive steps\; 60 test modules],
  ),
)

#cv-entry(
  title: [MSc thesis -- ULB, internship at LTS],
  society: link("https://github.com/giammabria/airborne-lidar-classification")[Aerial LiDAR point-cloud segmentation],
  date: [2025],
  location: "",
  description: list(
    [Semantic segmentation of aerial LiDAR point clouds (22 tiles of \~1 km², up to 32.7M points each) with 3D neural networks in #tech[PyTorch], benchmarked against classical ground filters, with multi-GPU training and inference pipelines],
  ),
)
