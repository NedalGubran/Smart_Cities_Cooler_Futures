# Smart Cities, Cooler Futures

## Week 4 Check-in

### A Data-Driven Framework for Urban Cooling Prioritisation

------------------------------------------------------------------------

## Business Question

> **Which urban factors are associated with higher surface heat, where
> should cooling interventions be prioritised, and what actions are
> supported by the evidence?**

------------------------------------------------------------------------

# Project Goal

The project develops an evidence-based framework for urban cooling
decisions across 10 European Functional Urban Areas.

The analysis connects three questions:

-   What urban characteristics are associated with local surface heat?
-   Where do high heat and high population exposure coincide?
-   What cooling action fits the characteristics of those priority
    areas?

------------------------------------------------------------------------

# Analytical Framework

The final analytical workflow is:

**Statistical Evidence → Local Hotspots → Population Exposure → Cooling
Action**

### WHAT: What is associated with surface heat?

Test relationships between Land Surface Temperature (LST) and available
urban and environmental factors.

### WHERE: Where should cooling action be prioritised?

Identify local spatial blocks where high LST and high population
exposure occur together.

### ACTION: What intervention fits these areas?

Translate local hotspot characteristics into transparent cooling
intervention categories.

------------------------------------------------------------------------

# Analysis 1: Statistical Evidence

## Question

**Which available urban factors are associated with higher or lower
LST?**

Local LST observations were combined with:

-   Green-space share
-   Water share
-   Built-up share
-   Street-tree layer share
-   Population
-   Building density
-   Mean building height

Approximately 62,000 local LST cells were aggregated into approximately
14,000 spatial blocks to reduce pseudoreplication.

Spearman correlation was used for exploratory association testing,
followed by a multivariable OLS model with city fixed effects and HC3
robust standard errors.

## Main Findings

The final model used 12,291 spatial blocks.

  Factor                                       Estimated Association with LST    p-value
  ------------------------------------------ -------------------------------- ----------
  Green space, +10 percentage points                                  -0.61°C   \< 0.001
  Water, +10 percentage points                                        -0.77°C   \< 0.001
  Built-up land, +10 percentage points                                +0.12°C      0.001
  Street-tree layer, +10 percentage points                            -0.10°C   \< 0.001
  Mean building height, +1 m                                          +0.10°C   \< 0.001
  Building density, +100 buildings/km²                      approximately 0°C       0.94

Green space and water are associated with lower LST. Built-up share and
mean building height are associated with higher LST in the fitted model.
Building density does not show evidence of an independent association
after controlling for the other variables.

These results are associations and should not be interpreted as causal
effects.

------------------------------------------------------------------------

# Analysis 2: Local Heat and Population Hotspots

## Question

**Where do high heat and high human exposure coincide?**

A spatial block is defined as a hotspot when it is simultaneously:

-   in the top 25% of LST within its own city, and
-   in the top 25% of population within its own city.

This approach identifies local priority areas without ranking whole
cities against one another.

## Finding

The analysis identified **954 hotspot blocks** across the 10 study
areas.

Hotspot areas have, on average:

-   Higher LST
-   Less green space
-   More built-up land
-   Much higher population
-   Taller buildings

Population exposure is then summarised for each study area to show how
many people are located within the identified hotspot blocks.

------------------------------------------------------------------------

# Analysis 3: Cooling Intervention Priorities

## Question

**What cooling action fits the identified hotspot areas?**

The recommendations are assigned using transparent local decision rules informed by the statistical evidence and hotspot characteristics.

| Recommended Intervention | Hotspot Blocks |
|---|---:|
| Increase green space | 477 |
| Expand street trees and shade | 208 |
| Targeted local cooling measures | 142 |
| Cooling measures in dense built-up areas | 117 |
| Add water features | 10 |

The recommendation rules are applied in order:

- Low green space → Increase green space
- Low street-tree coverage → Expand street trees and shade
- High built-up share and no water → Cooling measures in dense built-up areas
- No water after previous conditions → Add water features
- Other hotspot conditions → Targeted local cooling measures

The recommendation logic is local rather than city-wide. Different hotspot blocks within the same city can therefore receive different intervention categories.

The recommendations are decision-support rules, not causal prescriptions.

------------------------------------------------------------------------

# SQL Analysis

The final analytical outputs are stored in PostgreSQL in two main
tables:

-   `smart_cities_hotspots`
-   `smart_cities_city_summary`

SQL was used to:

-   Validate the imported datasets
-   Summarise hotspot characteristics
-   Analyse intervention distributions
-   Calculate percentages using window functions
-   Join hotspot-level and city-level results
-   Build analytical summaries using CTEs

The database contains:

-   954 hotspot-level records
-   10 city-level summary records

------------------------------------------------------------------------

# Tableau: Final Visualisation Focus

Tableau will communicate only the final evidence needed for the
analytical story.

The visualisation will focus on:

1.  Statistical evidence about factors associated with LST
2.  Spatial distribution of heat and population hotspots
3.  Population exposure
4.  Cooling intervention categories

The previous Priority Score ranking is no longer part of the final
analytical story.

------------------------------------------------------------------------

# Technical Workflow

### Python

-   Data loading and cleaning
-   Spatial processing
-   LST extraction
-   Spatial aggregation
-   Hypothesis testing
-   Statistical modelling
-   Hotspot identification
-   Population exposure analysis
-   Recommendation logic
-   Final dataset preparation

### SQL

-   Data storage and validation
-   Aggregation and analytical queries
-   Window functions
-   JOINs
-   CTEs

### Tableau

-   Statistical evidence visualisation
-   Hotspot mapping
-   Population exposure
-   Cooling recommendations
-   Final decision-support story

### GitHub

-   Version control
-   Final notebook
-   SQL analysis
-   Project documentation
-   Selected processed outputs
-   Presentation material

------------------------------------------------------------------------

# Key Conclusion

> **Urban cooling decisions should combine evidence about local surface
> heat with information about where people are exposed.**

The statistical analysis identifies urban characteristics associated
with LST. The hotspot analysis then identifies where high heat and high
population exposure coincide. Finally, local hotspot characteristics are
translated into cooling intervention categories.

The final framework is:

**Evidence → Hotspots → Exposure → Action**

------------------------------------------------------------------------

# Final Steps

Week 4 focuses on reducing, simplifying and polishing the project for
the final presentation:

-   Build the final Tableau story
-   Select only the strongest analytical findings
-   Finalise GitHub documentation
-   Prepare presentation slides
-   Practise the 10 to 15 minute presentation
