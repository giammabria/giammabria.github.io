#import "@preview/brilliant-cv:4.1.0": cv-entry, cv-section
#import "../tech.typ": tech

// Every claim here was checked against the linked repository on 2026-09-23.
// The project name is the link; technologies are inline #tech chips.

#cv-section("Projects")

// Client work, not public: no link, client anonymised. Facts checked against
// the private repositories on 2026-09-23.
#cv-entry(
  title: [Freelance client project],
  society: [LiDAR vegetation-risk analytics for power lines],
  date: [2026],
  location: "",
  description: list(
    [Turned airborne LiDAR surveys of *a major Italian energy utility*'s medium-voltage lines into vegetation-interference criticalities per span and tree-cutting sections, with year-on-year HTML comparisons against the previous survey],
    [Staged pipeline on #tech[PyQGIS] and #tech[GDAL], with dry-run and verified backups before destructive steps\; 60 test modules],
  ),
)

#cv-entry(
  title: [Client project (pro bono)],
  society: [AI agent and drone-imagery analytics for precision agriculture],
  date: [2026],
  location: "",
  description: list(
    [*AI agent* built on #tech[Claude Code] for an agricultural drone operator: four specialised subagents (agronomy, regulation, data analysis, document library) and skills grounded in a curated knowledge base],
    [Vineyard pipeline from multispectral and thermal drone rasters to vegetation indices, HTML mission reports and a 3D viewer (#tech[rasterio], #tech[NumPy])\; 20 test modules including golden-file tests],
  ),
)

#cv-entry(
  title: [MSc thesis -- ULB],
  society: link("https://github.com/giammabria/airborne-lidar-classification")[Aerial LiDAR point-cloud segmentation],
  date: [2025],
  location: "",
  description: list(
    [Semantic segmentation of large-scale aerial LiDAR point clouds with *RandLA-Net* (#tech[PyTorch Geometric]), benchmarked against classical ground filters (CSF, PMF, SMRF); preprocessing with #tech[PDAL]],
    [*MLOps pipelines* for multi-GPU training and inference with #tech[PyTorch Lightning], configured through #tech[Hydra]\; pytest suite and spatial-statistics evaluation metrics],
  ),
)

#cv-entry(
  title: [Team project -- ULB MSc project competition],
  society: link("https://github.com/giammabria/pose-estimation-from-emg-signal")[Hand pose estimation from sEMG signals],
  date: [2025],
  location: "",
  description: list(
    [Regression of 51 hand joint angles from 8-electrode sEMG with time-domain and Riemannian covariance features, CNNs and *domain-adversarial learning (DANN)* in #tech[PyTorch], stacking/voting ensembles in #tech[scikit-learn]\; *ranked 2nd of 41*],
  ),
)

#cv-entry(
  title: [Big data course project -- ULB],
  society: link("https://github.com/giammabria/spotify-million-playlist-dataset-challenge")[Spotify Million Playlist Dataset],
  date: [2025],
  location: "",
  description: list(
    [Track and playlist similarity from #tech[sentence-transformers] embeddings and features engineered with #tech[Polars], with #tech[scikit-learn] K-means clustering for *playlist continuation* over 1M playlists; results explored through a #tech[Streamlit] app],
  ),
)

#cv-entry(
  title: [Paper replication -- ULB],
  society: link("https://arxiv.org/abs/1604.07143")[Neural Random Forests],
  date: [2025],
  location: "",
  description: list(
    [Re-implemented the neural random forest architecture in #tech[TensorFlow] and compared its interpretability with tree ensembles],
  ),
)
