# Smart Cities, Cooler Futures

## Project Plan

### A Data-Driven Framework for Urban Cooling Prioritisation

---

# 1. Project Background

Urban heat is an increasing challenge for cities, but urban cooling priority is not determined by temperature alone.

Cities differ in their level of heat, population exposure, urban form, and cooling capacity. Understanding these differences can help cities identify where cooling action may be most important and which interventions best match local conditions.

This project combines multiple urban and environmental datasets to build a transparent framework for comparing 10 European cities and supporting urban cooling decisions.

The analysis is structured around four main dimensions:

- **Heat** — Urban Heat Island intensity
- **Exposure** — Population density
- **Urban Form** — Building density and building height
- **Cooling Capacity** — Green-space and street-tree coverage

Recent summer Land Surface Temperature and impervious-surface change are analysed separately to provide additional temporal and urban-development context.

---

# 2. Business Question

> **Where should cities act first to reduce urban heat vulnerability, and what type of cooling intervention should they prioritise?**

---

# 3. Project Goal

Develop a transparent, data-driven decision-support framework that:

1. Compares urban heat vulnerability across 10 European cities.
2. Identifies cities with higher urban cooling priority.
3. Explains the main factors behind each city's priority.
4. Tests how robust the city ranking is under different planning priorities.
5. Examines recent summer surface-temperature and urban-development patterns.
6. Quantifies selected cooling intervention gaps.
7. Translates the findings into city-specific cooling recommendations.

---

# 4. Cities in Scope

The analysis covers 10 European cities:

- Amsterdam
- Athens
- Barcelona
- Berlin
- Budapest
- Lisbon
- Madrid
- Milan
- Prague
- Vienna

---

# 5. Core Analytical Indicators

The Urban Cooling Priority Score is based on six indicators:

1. **Urban Heat Island Intensity**
   - Represents relative urban heat pressure.

2. **Population Density**
   - Represents the concentration of people potentially exposed to urban heat.

3. **Green-Space Coverage**
   - Represents vegetation availability and potential natural cooling capacity.

4. **Street-Tree Coverage**
   - Represents local tree coverage and shading potential.

5. **Building Density**
   - Represents the intensity of the built urban environment.

6. **Average Building Height**
   - Provides additional information about urban form.

The six indicators are transformed to a common risk-oriented scale before being combined into the Priority Score.

---

# 6. Additional Analytical Layers

The project extends the core Priority Score with four additional analyses.

## Summer Land Surface Temperature 2021–2024

Satellite-derived daytime summer Land Surface Temperature (LST) is analysed for June, July, and August from 2021 to 2024.

This provides a temporal heat perspective and helps distinguish absolute surface temperature from relative Urban Heat Island intensity.

## Priority Score Sensitivity Analysis

Alternative weighting scenarios are used to test whether city rankings remain stable when different planning priorities receive more weight.

The scenarios include:

- Equal weighting
- Heat-focused weighting
- Exposure-focused weighting
- Cooling-focused weighting

## Intervention Gap Analysis

Green-space and street-tree gaps are calculated relative to the median of the 10-city sample.

This provides a transparent way to connect analytical results with potential cooling interventions.

## Impervious-Surface Change 2021–2024

Recent impervious-surface change is analysed separately to provide additional urban-development context.

It is not included in the Priority Score.

---

# 7. Data Sources

The project combines multiple datasets, including:

- Copernicus Urban Atlas 2021
- Urban Atlas Street Tree Layer 2021
- Population data (2021)
- Urban Heat / Heatwave data
- Copernicus Imperviousness Change 2021–2024
- Satellite-derived Land Surface Temperature 2021–2024

The core analysis uses **2021 as a common baseline** because it provides a consistent foundation across the main indicators.

More recent 2021–2024 data are analysed separately to add temporal and recent urban-change context.

---

# 8. Analytical Approach

## Step 1 — Data Collection and Preparation

Multiple spatial and tabular datasets are collected, inspected, cleaned, standardised, and prepared for analysis.

Spatial processing is used where necessary to create comparable city-level indicators.

## Step 2 — Indicator Development

Six core indicators are calculated for each city:

- UHI intensity
- Population density
- Green-space coverage
- Street-tree coverage
- Building density
- Average building height

## Step 3 — Comparative Analysis

Cities are compared across the main indicators to identify differences in heat, exposure, urban form, and cooling capacity.

Relationships between indicators are interpreted descriptively rather than as causal evidence.

## Step 4 — Normalisation and Priority Score

The six indicators are transformed to a common 0–1 risk-oriented scale.

Indicators where higher values represent greater vulnerability are normalised directly, while green-space and street-tree coverage are reversed so that higher scores consistently represent greater cooling priority.

The six normalised indicators are combined using equal weights to create the baseline **Urban Cooling Priority Score**.

## Step 5 — City Ranking and Driver Analysis

Cities are ranked according to their Priority Score.

The strongest contributing indicators are identified for each city to explain:

> **Why is this city a priority?**

## Step 6 — Temporal Heat Analysis

Summer daytime LST is analysed from 2021–2024 to compare:

- Summer surface temperatures
- Differences between cities
- 2021–2024 change
- Interannual variability

The four-year period is treated as recent temporal context rather than a long-term climate trend.

## Step 7 — Sensitivity and Rank Stability

Alternative weighting scenarios are compared with the baseline model.

This tests whether high-priority cities remain high priority when planning perspectives change and identifies cities whose rankings are more sensitive to weighting choices.

## Step 8 — Recent Urban Change

Impervious-surface change from 2021–2024 is analysed separately from the Priority Score.

The analysis provides recent urban-development context and is compared descriptively with recent LST change.

## Step 9 — Intervention Gap Analysis

Green-space and street-tree coverage are compared with the median values of the 10-city sample.

The resulting gaps help quantify where selected cooling-capacity deficits are larger.

## Step 10 — City-Specific Recommendations

The Priority Score, priority drivers, cooling-capacity gaps, and supporting analyses are translated into city-specific cooling recommendations.

Possible intervention areas include:

- Expanding green infrastructure
- Increasing street-tree coverage
- Providing targeted cooling and shade
- Targeting cooling in dense built-up areas
- Combining multiple interventions where appropriate

---

# 9. Technical Workflow

## Python

Python is used for:

- Data loading and cleaning
- Spatial processing
- Exploratory analysis
- Indicator development
- Normalisation
- Priority Score calculation
- City ranking
- Driver analysis
- LST analysis
- Sensitivity analysis
- Rank-stability analysis
- Intervention Gap Analysis
- Preparation of final analytical datasets

## SQL

PostgreSQL / SQL is used to:

- Store prepared project data
- Query and validate analytical results
- Rank and compare cities
- Analyse priority drivers and recommendations
- Analyse summer LST patterns
- Compare Priority Scores with LST
- Examine sensitivity and rank stability
- Query intervention gaps
- Demonstrate a structured database-based analytical workflow

## Tableau

Tableau is used to communicate selected analytical findings through clear city comparisons, visualisations, and decision-support dashboards.

## GitHub

GitHub documents the project workflow and contains selected:

- Python notebooks
- SQL analysis
- Processed analytical datasets
- Project documentation
- Supporting project files

---

# 10. Project Hypothesis

### Main Hypothesis

> **Urban cooling priority is multidimensional: cities facing stronger heat pressure and population exposure, combined with more intensive urban form or lower cooling capacity, are expected to show higher overall cooling priority.**

The project evaluates whether the observed patterns across the selected cities are consistent with this hypothesis.

Because the analysis includes 10 cities, statistical relationships are interpreted as descriptive evidence rather than causal conclusions.

---

# 11. Main Analytical Outputs

The project produces:

- A cleaned multi-source analytical dataset
- Six comparable core indicators
- Urban Cooling Priority Scores
- Ranking of 10 European cities
- City-level priority-driver profiles
- Summer LST analysis for 2021–2024
- Priority Score sensitivity analysis
- Rank-stability analysis
- Impervious-surface change analysis
- Intervention Gap Analysis
- City-specific cooling recommendations
- PostgreSQL database and analytical SQL queries
- Visualisations and decision-support outputs
- GitHub project repository
- Final 10–15 minute presentation

---

# 12. Final Analytical Story

The project communicates its results through six practical questions:

### 1. WHERE should cities act first?

The Priority Score identifies and ranks cities according to their combined urban cooling priority.

### 2. WHY are priorities different?

Driver analysis explains which dimensions contribute most strongly to each city's priority profile.

### 3. IS HEAT CHANGING?

Summer LST from 2021–2024 provides recent temporal context and shows differences in surface-heat patterns and variability between cities.

### 4. HOW ROBUST is the ranking?

Sensitivity analysis tests how city rankings change under alternative planning priorities.

### 5. WHAT HAS RECENTLY CHANGED?

Impervious-surface change provides additional context about recent urban-development patterns.

### 6. WHAT SHOULD CITIES DO?

Intervention gaps and city-specific profiles translate analytical findings into practical cooling recommendations.

---

# 13. Expected Project Outcome

> **A transparent, multidimensional decision-support framework that identifies where urban cooling action should be prioritised, explains why priorities differ between cities, tests the robustness of those priorities, and translates analytical evidence into city-specific cooling recommendations.**