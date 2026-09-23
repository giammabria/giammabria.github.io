#import "@preview/brilliant-cv:4.1.0": cv-entry, cv-section
#import "../tech.typ": tech

// Every claim here was checked against the linked repository on 2026-09-23.
// The project name is the link; technologies are inline #tech chips.

#cv-section("Projects")

// Client work, not public: no link, client anonymised. Facts checked against
// the private repositories on 2026-09-23.
#cv-entry(
  title: [Freelance client project],
  society: [LiDAR-to-GIS delivery pipeline for power lines],
  date: [2026],
  location: "",
  description: list(
    [Production pipeline turning airborne LiDAR surveys of *a major Italian energy utility*'s medium-voltage lines into per-span vegetation criticalities, tree-cutting sections and client deliverables: per-line #tech[GeoPackage] files with embedded styles, tables and HTML reports],
    [Staged CLI (ingest → reconcile → apply → analyse → export) on #tech[PyQGIS] and #tech[GDAL], with dry-run and verified backups before destructive steps\; 60 test modules],
  ),
)

#cv-entry(
  title: [Client project (pro bono)],
  society: [Drone-imagery pipeline and AI agent for precision agriculture],
  date: [2026],
  location: "",
  description: list(
    [Vineyard pipeline from multispectral and thermal drone rasters to vegetation indices, HTML mission reports and a 3D viewer (#tech[rasterio], #tech[NumPy])\; 20 test modules including golden-file tests],
    [*AI agent* on #tech[Claude Code] for an agricultural drone operator: four specialised subagents and skills grounded in a curated document knowledge base],
  ),
)

#cv-entry(
  title: [MSc thesis -- ULB],
  society: link("https://github.com/giammabria/airborne-lidar-classification")[Aerial LiDAR point-cloud pipeline],
  date: [2025],
  location: "",
  description: list(
    [End-to-end point-cloud data path: #tech[PDAL] preprocessing and colourisation, LAS/LAZ merging, batch strip classification and #tech[HDF5] dataset packaging],
    [*MLOps pipelines* for multi-GPU training and inference (#tech[PyTorch Lightning], #tech[Hydra])\; pytest and code-quality CI on #tech[GitHub Actions]],
  ),
)

#cv-entry(
  title: [Big data course project -- ULB],
  society: link("https://github.com/giammabria/spotify-million-playlist-dataset-challenge")[Spotify Million Playlist Dataset],
  date: [2025],
  location: "",
  description: list(
    [Consolidated 1M playlists (2M+ unique tracks) from raw JSON into #tech[Parquet] with #tech[Polars], enriched them through the #tech[Spotify Web API], and served similarity and playlist-continuation results in a #tech[Streamlit] app],
  ),
)
