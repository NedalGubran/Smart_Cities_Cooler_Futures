# Smart Cities, Cooler Futures

### A Data-Driven Framework for Urban Cooling Prioritisation

## Project Overview

European cities face increasing urban heat challenges, but cooling needs are not determined by temperature alone.

This project develops a data-driven framework to compare urban heat vulnerability across 10 European cities by combining four dimensions:

- **Heat** – Urban Heat Island (UHI) intensity
- **Exposure** – Population density
- **Urban Form** – Building density and average building height
- **Cooling Capacity** – Green-space and street-tree coverage

The analysis identifies where cities should act first, explains the factors behind their priority, evaluates the robustness of the ranking, examines recent surface-heat and urban-development patterns, and translates the results into city-specific cooling recommendations.

## Business Question

**Where should cities act first to reduce urban heat vulnerability, and what type of cooling intervention should they prioritise?**

## Cities Analysed

Amsterdam · Athens · Barcelona · Berlin · Budapest · Lisbon · Madrid · Milan · Prague · Vienna

## Data Sources

- Copernicus Urban Atlas 2021
- Urban Atlas Street Tree Layer 2021
- Population data (2021)
- Urban Heat and Heatwave data
- Copernicus Imperviousness Change 2021–2024
- Satellite-derived Land Surface Temperature (LST) 2021–2024

## Analytical Approach

### 1. Urban Cooling Priority Score
Six indicators are normalised and combined into a transparent Priority Score to compare cooling vulnerability across the 10 cities.

### 2. Priority Drivers
The analysis identifies the main factors contributing to each city's priority.

### 3. Summer Land Surface Temperature
Satellite-derived summer LST from 2021–2024 provides a temporal view of recent surface-heat patterns.

### 4. Sensitivity & Rank Stability
Alternative weighting scenarios test whether city rankings remain stable under different planning priorities.

### 5. Recent Urban Change
Impervious-surface change from 2021–2024 provides additional context on recent urban-development pressure.

### 6. Intervention Gap Analysis
Green-space and street-tree gaps are compared with the study median to support city-specific cooling interventions.

## Key Findings

- **Athens and Milan are robust high-priority cities**, remaining first or second across all weighting scenarios.
- Surface temperature alone does not determine cooling priority: **Madrid has the highest four-year mean summer LST but ranks fifth in the multidimensional Priority Score.**
- Nine of the ten cities recorded higher summer mean LST in 2024 than in 2021.
- **Budapest shows the greatest ranking sensitivity** across alternative weighting scenarios.
- Cooling needs differ substantially between cities: some require additional green infrastructure, others street-tree expansion or targeted cooling and shading.
- The results support a **city-specific, multidimensional approach to urban cooling** rather than prioritising cities using a single heat indicator.

## Technical Workflow

**Multiple Data Sources → Python → PostgreSQL / SQL → Visualisation & Decision Support → GitHub**

- **Python:** data cleaning, spatial processing, KPI engineering and analytical modelling
- **PostgreSQL / SQL:** structured data storage, validation and analytical queries
- **Tableau:** interactive visualisation and decision-support storytelling
- **GitHub:** version control and project documentation

## Repository Structure

- `Notebooks/` – main analysis notebooks and project documentation
- `data_processed/` – final analysis-ready datasets
- `SQL/` – analytical SQL queries
- `download_lst.py` – LST data retrieval workflow

> Raw geospatial and satellite datasets are not stored in this repository because of their size.

## Decision-Support Story

**WHERE should cities act? → WHY are they vulnerable? → IS HEAT CHANGING? → HOW ROBUST is the ranking? → WHAT HAS RECENTLY CHANGED? → WHAT SHOULD CITIES DO?**

## Project Status

Core data processing, Python analysis and SQL analysis are complete.  
The final interactive visualisation and decision-support layer is currently under development.
