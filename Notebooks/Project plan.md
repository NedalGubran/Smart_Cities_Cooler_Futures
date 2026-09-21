# Smart Cities, Cooler Futures

## Project Plan

### A Data-Driven Framework for Urban Cooling Prioritisation

---

## 1. Project Background

Urban heat is a growing challenge for European cities. High surface temperatures can become especially relevant where many people are exposed and where local cooling capacity is limited.

This project uses spatial and environmental data to investigate urban surface heat across 10 European Functional Urban Areas (FUAs). Instead of ranking whole cities, the analysis focuses on two questions: which urban characteristics are associated with higher Land Surface Temperature (LST), and where do high heat and high population exposure occur together?

The final goal is to translate the statistical evidence into transparent, local cooling priorities and practical intervention categories.

---

## 2. Business Question

> **Which urban factors are associated with higher surface heat, where should cooling interventions be prioritised, and what actions are supported by the evidence?**

---

## 3. Project Goal

The project aims to:

1. Measure local surface heat using August 2024 Land Surface Temperature.
2. Test hypotheses about urban characteristics associated with LST.
3. Distinguish statistical evidence from descriptive patterns.
4. Identify local hotspots where high heat and high population exposure coincide.
5. Quantify population exposure within these priority areas.
6. Translate hotspot characteristics into transparent cooling recommendations.
7. Communicate the findings through SQL analysis, Tableau visualisations, and a final presentation.

---

## 4. Study Areas

The analysis covers 10 European Urban Atlas Functional Urban Areas:

- Amsterdam
- Athens (Athina)
- Barcelona
- Berlin
- Budapest
- Lisbon (Lisboa)
- Madrid
- Milan (Milano)
- Prague (Praha)
- Vienna (Wien)

The study areas are FUA extents and should not be interpreted as municipal administrative boundaries.

---

## 5. Data Sources

The project combines several independent data sources:

- Copernicus Urban Atlas 2021
- Urban Atlas Street Tree Layer 2021
- JRC / Eurostat Census Population Grid 2021
- ESA CCI Land Surface Temperature, August 2024
- GHS-OBAT building data
- Urban heat / UHI data for contextual comparison
- Copernicus impervious-surface data for additional project context

The core inferential analysis uses local LST as the heat outcome and combines it with local urban and environmental characteristics.

---

## 6. Main Analytical Variables

### Outcome

**Land Surface Temperature (LST)**

Satellite-derived daytime surface temperature for August 2024.

### Urban and Cooling Factors

- Green-space / vegetated land share
- Water share
- Built-up land share
- Street-tree layer share
- Building density
- Mean building height

### Human Exposure

- Local population

Population is primarily treated as an exposure variable rather than as a physical cause of urban heat.

---

## 7. Hypothesis-Driven Analytical Approach

The analysis follows the Data Analytics Workflow:

**Business question → Hypotheses → Data preparation → Statistical testing → Evidence → Hotspots → Recommendations → Communication**

### Example Null and Alternative Hypotheses

For each factor, the analysis begins with a null hypothesis (H0) that there is no association with LST.

Examples:

- H0: Green-space share is not associated with LST.
- H1: Higher green-space share is associated with lower LST.
- H0: Built-up share is not associated with LST.
- H1: Higher built-up share is associated with higher LST.

The same evidence-based logic is applied to water, street-tree coverage, building density, and building height.

Statistical significance is evaluated using an alpha level of 0.05.

Results are interpreted as associations, not causal effects.

---

## 8. Spatial Preparation

### Local LST Grid

LST observations are extracted within the 10 FUA boundaries.

The initial dataset contains approximately 62,000 local LST cells.

### Spatial Aggregation

Neighbouring spatial cells are not fully independent. To reduce pseudoreplication, the local observations are aggregated into approximately 2 km spatial blocks.

The resulting analytical dataset contains approximately 14,000 spatial blocks.

This aggregation reduces spatial dependence but does not completely eliminate spatial autocorrelation, which remains a limitation.

---

## 9. Statistical Analysis

### Exploratory Association Tests

Spearman correlation is used to examine monotonic relationships between individual urban factors and LST.

### Multivariable Model

A multivariable OLS regression is used to estimate associations between LST and multiple urban factors simultaneously while controlling for baseline differences between cities using city fixed effects.

The final model includes:

- Green-space share
- Water share
- Built-up share
- Street-tree layer share
- Local population
- Building density
- Mean building height
- City fixed effects

HC3 robust standard errors are used to reduce sensitivity to heteroskedasticity.

### Main Evidence

The final model provides evidence that:

- Higher green-space share is associated with lower LST.
- Higher water share is associated with lower LST.
- Higher built-up share is associated with higher LST.
- Higher street-tree layer share has a small negative association with LST.
- Higher mean building height is associated with higher LST in the fitted model.
- Building density shows no evidence of an independent association after controlling for the other variables.

These results are interpreted as statistical associations and not as proof of causation.

---

## 10. Hotspot Identification

After testing the urban factors, the project moves from explanation to decision support.

A local block is defined as a **hotspot** when it is simultaneously:

- in the top 25% of LST within its own city, and
- in the top 25% of local population within its own city.

This definition identifies places where high heat and high human exposure coincide without treating the 10 cities as a competition.

The analysis identifies **954 hotspot blocks** across the 10 study areas.

---

## 11. Cooling Recommendations

Recommendations are assigned only after hotspot identification.

The intervention categories are:

- Increase green space
- Expand street trees and shade
- Cooling measures in dense built-up areas
- Add water features
- Targeted local cooling measures

The recommendation rules are applied in order using local hotspot characteristics:

- Low green space → Increase green space
- Low street-tree coverage → Expand street trees and shade
- High built-up share and no water → Cooling measures in dense built-up areas
- No water after previous conditions → Add water features
- Other hotspot conditions → Targeted local cooling measures

Median values are used to define low or high green space, street-tree coverage and built-up share. The water rule identifies hotspot blocks with no water.

These are transparent decision-support rules informed by the statistical evidence and local hotspot conditions, not causal prescriptions.

---

## 12. Technical Workflow

### Python

Python is used for:

- Data loading and cleaning
- Spatial processing
- FUA boundary preparation
- LST extraction
- Green-space, water, built-up, and street-tree calculations
- Population extraction
- Building morphology analysis
- Spatial aggregation
- Exploratory statistics
- Hypothesis testing
- Multivariable regression
- Hotspot identification
- Recommendation logic
- Preparation of final analytical datasets

### SQL

PostgreSQL / SQL is used to:

- Store the final analytical datasets
- Validate imported data
- Summarise hotspots by city
- Analyse hotspot characteristics
- Analyse intervention distributions
- Join hotspot-level and city-level outputs
- Build reusable analytical summaries using GROUP BY, window functions, JOINs, and CTEs

### Tableau

Tableau is used for the final communication layer, focusing on:

- Statistical evidence
- Spatial hotspot patterns
- Population exposure
- Cooling recommendations
- Clear decision-support visuals

### GitHub

GitHub stores the final project workflow, including:

- Main Python notebook
- SQL analysis
- Selected processed datasets
- Project documentation
- Final presentation material

---

## 13. Main Analytical Outputs

The project produces:

- A cleaned multi-source spatial dataset
- Approximately 14,000 analytical spatial blocks
- Statistical tests of urban factors associated with LST
- A multivariable regression model
- 954 heat-and-population hotspot blocks
- City-level hotspot and population-exposure summaries
- Local cooling intervention categories
- PostgreSQL tables and analytical SQL queries
- Tableau visualisations and dashboards
- GitHub project repository
- Final 10 to 15 minute presentation

---

## 14. Project Limitations

Important limitations include:

- The study areas are Functional Urban Areas rather than municipal boundaries.
- Population data are from 2021 while the core LST layer is from August 2024.
- Spatial aggregation reduces but does not remove spatial autocorrelation.
- HC3 robust standard errors address heteroskedasticity, not spatial dependence.
- City fixed effects control for baseline differences between cities but not all local confounding factors.
- The street-tree layer is interpreted cautiously because it represents mapped tree-related coverage rather than individual tree points.
- Statistical associations should not be interpreted as causal effects.

---

## 15. Final Analytical Story

The final project answers four connected questions:

### 1. WHAT is associated with higher or lower urban surface heat?

Statistical tests and the multivariable model identify which available urban characteristics are associated with LST.

### 2. WHERE do heat and human exposure coincide?

Local heat and population percentiles identify hotspot blocks within each study area.

### 3. WHO is exposed?

Population data quantify how many people are located within the identified hotspot areas.

### 4. WHAT cooling action fits these areas?

Hotspot characteristics are translated into transparent local intervention categories.

---

## 16. Expected Project Outcome

> **An evidence-based urban cooling decision-support framework that tests which urban characteristics are associated with surface heat, identifies local areas where high heat and population exposure coincide, and translates those findings into transparent cooling priorities.**