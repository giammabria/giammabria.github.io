#import "@preview/brilliant-cv:4.1.0": cv-entry, cv-section, h-bar
#import "../tech.typ": honour

#cv-section("Education")

#cv-entry(
  title: [M.S. in Data Science],
  society: [Université libre de Bruxelles -- Faculty of Science],
  date: [2024 -- 2025],
  location: [Brussels, Belgium],
  description: list(
    [Graduated with #honour[Grande Distinction] #h-bar() Thesis on aerial LiDAR point-cloud segmentation (see Projects)],
    [Coursework: Statistical Foundations of Machine Learning #h-bar() Pattern Recognition and Image Analysis #h-bar() Computational Statistics #h-bar() Multivariate and High-Dimensional Statistics #h-bar() Algorithms for Big Data],
  ),
)

#cv-entry(
  title: [Double Degree M.Sc. in Economics \& Finance],
  society: [Ca' Foscari University of Venice -- Aix-Marseille University],
  date: [2018 -- 2020],
  location: [Venice, Italy / Aix-en-Provence, France],
  description: list(
    [Graduated #honour[Cum Laude] #h-bar() Major: Financial Risk Management],
    [Thesis: machine learning on commodity prices to predict currency crises in low-income countries],
  ),
)

#cv-entry(
  title: [B.S. in Economics],
  society: [University of Padova],
  date: [2015 -- 2018],
  location: [Padova, Italy],
  description: list(
    [Final grade: 109/110],
  ),
)
