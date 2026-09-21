# Smart Cities, Cooler Futures

### A Data-Driven Framework for Urban Cooling Prioritisation

## Project Overview

Urban heat is a growing challenge for European cities. High surface temperatures become especially relevant where many people are exposed and where local cooling capacity is limited.

This project develops a data-driven framework to investigate urban surface heat across 10 European Functional Urban Areas (FUAs).

The analysis combines local Land Surface Temperature (LST), population and urban characteristics to answer three main questions:

- Which urban factors are associated with higher surface heat?
- Where should cooling interventions be prioritised?
- What cooling actions are supported by the evidence?

Instead of ranking whole cities, the project analyses local spatial blocks to identify areas where high surface heat and high population occur together and translates the statistical evidence into targeted cooling recommendations.

## Business Question

**Which urban factors are associated with higher surface heat, where should cooling interventions be prioritised, and what actions are supported by the evidence?**

## Cities Analysed

Amsterdam · Athens · Barcelona · Berlin · Budapest · Lisbon · Madrid · Milan · Prague · Vienna

## Data Sources

- Copernicus Urban Atlas 2021
- Urban Atlas Street Tree Layer 2021
- JRC / Eurostat Census Population Grid 2021
- ESA CCI Land Surface Temperature, August 2024
- GHS-OBAT building data
- Urban heat / UHI data for contextual comparison
- Copernicus impervious-surface data for additional project context

## Analytical Approach

### 1. Spatial Data Preparation

Local LST observations and urban characteristics are processed within the 10 study areas.

Approximately 62,000 local LST cells are aggregated into approximately 14,000 spatial blocks of around 2 km to support the final analysis.

### 2. Statistical Analysis

Spearman correlation is used for exploratory analysis.

A multivariable OLS regression with city fixed effects and HC3 robust standard errors is used to examine how urban factors are associated with Land Surface Temperature while considering the other factors in the model.

The analysed factors include:

- Green-space share
- Water share
- Built-up share
- Street-tree coverage
- Population
- Building density
- Mean building height

Results are interpreted as statistical associations, not causal effects.

### 3. Hotspot Identification

A spatial block is classified as a hotspot when it is simultaneously:

- in the top 25% of LST within its city, and
- in the top 25% of population within its city.

This method focuses the analysis on places where relatively high surface heat and high human exposure occur together.

The final analysis identifies **954 hotspot blocks** across the 10 study areas.

### 4. Population Exposure

Population Exposure measures the percentage of the analysed city population located within identified hotspot blocks.

Hotspot Share measures the percentage of analysed spatial blocks in each city that are classified as hotspots.

Together, these measures provide two different perspectives on the distribution of urban heat priority areas.

### 5. Cooling Recommendations

Regression findings are combined with the local characteristics of each hotspot to assign a cooling recommendation.

The five intervention categories are:

- Increase green space
- Expand street trees and shade
- Cooling measures in dense built-up areas
- Add water features
- Targeted local cooling measures

The recommendation rules are applied in order:

- Low green space → Increase green space
- Low street-tree coverage → Expand street trees and shade
- High built-up share and no water → Cooling measures in dense built-up areas
- No water after previous conditions → Add water features
- Other hotspot conditions → Targeted local cooling measures

Median values are used to define low or high green space, street-tree coverage and built-up share. The water rule identifies hotspot blocks with no water.

The recommendations are transparent decision-support rules informed by statistical evidence and local hotspot conditions.

## Key Findings

- Water and green space showed the strongest cooling associations with surface temperature.
- A 10 percentage point increase in water share was associated with approximately **0.77°C lower LST**.
- A 10 percentage point increase in green-space share was associated with approximately **0.61°C lower LST**.
- Street-tree coverage was also associated with lower surface temperature.
- Higher built-up share and mean building height were associated with higher surface temperature.
- Building density showed no statistically significant independent association with LST in the final model.
- **954 high heat, high population hotspot blocks** were identified across the 10 study areas.
- Increasing green space was the most frequent cooling recommendation, assigned to **477 hotspots (50.0%)**.
- Expanding street trees and shade was recommended for **208 hotspots (21.8%)**.
- Targeted local cooling measures were assigned to **142 hotspots (14.9%)**.
- Cooling measures in dense built-up areas were assigned to **117 hotspots (12.3%)**.
- Adding water features was recommended for **10 hotspots (1.0%)**.

## Technical Workflow

**Multiple Data Sources → Python → PostgreSQL / SQL → Tableau → GitHub**

- **Python:** data cleaning, spatial processing, statistical analysis, hotspot identification and recommendation logic
- **PostgreSQL / SQL:** final data storage, validation and analytical queries
- **Tableau:** interactive visualisation and decision-support storytelling
- **GitHub:** version control and project documentation

## Repository Structure

- `Notebooks/` – main analysis notebooks and project documentation
- `data_processed/` – final analysis-ready datasets
- `SQL/` – analytical SQL queries
- `download_lst.py` – LST data retrieval workflow

> Raw geospatial and satellite datasets are not stored in this repository because of their size.

## Decision-Support Story

**WHAT is associated with surface heat? → WHERE should cities act? → WHO is exposed? → WHAT cooling actions are supported by the evidence?**

The final Tableau Story presents the analysis through:

1. Project Scope & Data
2. Heat Factors
3. Priority Locations
4. City Exposure
5. Cooling Actions
6. Conclusion

## Project Limitations

- The study areas are Functional Urban Areas rather than municipal boundaries.
- Population data are from 2021 while the core LST layer is from August 2024.
- Spatial aggregation reduces but does not completely remove spatial dependence.
- Statistical associations should not be interpreted as causal effects.
- The recommendations provide decision support. Local feasibility should be assessed before implementation.

## Project Status

Data processing, statistical analysis, hotspot identification, cooling recommendations, SQL analysis and Tableau visualisation are complete.

The project is ready for final presentation.