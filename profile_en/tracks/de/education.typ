#import "@preview/brilliant-cv:4.1.0": cv-entry, cv-section, h-bar
#import "../tech.typ": honour

#cv-section("Education")

#cv-entry(
  title: [M.S. in Data Science],
  society: [Université libre de Bruxelles -- Faculty of Science],
  date: [2024 -- 2025],
  location: [Brussels, Belgium],
  description: list(
    [Graduated with #honour[Grande Distinction] #h-bar() Thesis on aerial LiDAR point-cloud processing (see Projects)],
    [Coursework: Big Data: Distributed Data Management and Scalable Analytics #h-bar() Algorithms for Big Data #h-bar() Statistical Foundations of Machine Learning #h-bar() Data Mining],
  ),
)

#cv-entry(
  title: [Double Degree M.Sc. in Economics \& Finance],
  society: [Ca' Foscari University of Venice -- Aix-Marseille University],
  date: [2018 -- 2020],
  location: [Venice, Italy / Aix-en-Provence, France],
  description: list(
    [Graduated #honour[Cum Laude] #h-bar() Major: Financial Risk Management],
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
