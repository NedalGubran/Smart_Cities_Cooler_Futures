# Smart Cities, Cooler Futures

## Week 3 Check-in

### A Data-Driven Framework for Urban Cooling Prioritisation

------------------------------------------------------------------------

## 1. The Urban Heat Challenge

Urban heat is not distributed equally within or across cities.

Local surface temperature can vary with vegetation, water, built-up
land, building characteristics and other urban conditions. At the same
time, the importance of a hot area increases when many people are
exposed.

The project therefore asks:

> **Which urban factors are associated with higher surface heat, where
> should cooling interventions be prioritised, and what actions are
> supported by the evidence?**

The analysis covers 10 European Functional Urban Areas (FUAs).

------------------------------------------------------------------------

## 2. What Did We Analyse?

The analysis combines local Land Surface Temperature (LST) with
environmental, built-environment and population variables.

  -----------------------------------------------------------------------
  Dimension                           Variables
  ----------------------------------- -----------------------------------
  **Heat**                            Land Surface Temperature

  **Cooling Environment**             Green-space share, Water share,
                                      Street-tree layer share

  **Built Environment**               Built-up share, Building density,
                                      Mean building height

  **Human Exposure**                  Local population
  -----------------------------------------------------------------------

UHI data is retained as contextual information, while local LST is used
as the main heat outcome for statistical testing.

------------------------------------------------------------------------

## 3. How Did the Analysis Develop?

### Step 1: Build the Spatial Evidence Base

LST observations were extracted within the 10 FUA boundaries and
combined with local urban and environmental characteristics.

Approximately 62,000 local LST cells were prepared.

### Step 2: Reduce Spatial Pseudoreplication

Neighbouring observations are not fully independent.

The local cells were therefore aggregated into approximately 14,000
spatial blocks of roughly 2 km for the inferential analysis.

### Step 3: Define and Test Hypotheses

The analysis was restructured around testable hypotheses.

For each factor:

-   H0 assumes no association with LST.
-   H1 proposes an association with LST.

Spearman correlations were used for exploratory association testing.

### Step 4: Build a Multivariable Model

A multivariable OLS regression was used to examine the independent
association of several factors with LST while controlling for baseline
differences between cities.

The model includes:

-   Green-space share
-   Water share
-   Built-up share
-   Street-tree layer share
-   Local population
-   Building density
-   Mean building height
-   City fixed effects

HC3 robust standard errors were used.

### Step 5: Identify Priority Hotspots

After testing the factors, the analysis moved from explanation to
decision support.

A hotspot is a spatial block that is simultaneously:

-   in the top 25% of LST within its city, and
-   in the top 25% of population within its city.

This identifies areas where high heat and high human exposure coincide.

### Step 6: From Evidence to Action

Local hotspot characteristics were then used to assign transparent
cooling intervention categories.

------------------------------------------------------------------------

## 4. What Did the Statistical Analysis Show?

The final multivariable model used 12,291 spatial blocks and achieved an
R² of approximately 0.83, including city fixed effects.

Key model results:

  Factor                                       Estimated Association with LST    p-value
  ------------------------------------------ -------------------------------- ----------
  Green space, +10 percentage points                                  -0.61°C   \< 0.001
  Water, +10 percentage points                                        -0.77°C   \< 0.001
  Built-up land, +10 percentage points                                +0.12°C      0.001
  Street-tree layer, +10 percentage points                            -0.10°C   \< 0.001
  Mean building height, +1 m                                          +0.10°C   \< 0.001
  Building density, +100 buildings/km²                      approximately 0°C       0.94

The results provide evidence that green space and water are associated
with lower LST, while built-up share and mean building height are
associated with higher LST in the fitted model.

Building density does not show evidence of an independent association
after controlling for the other variables.

These are statistical associations, not causal effects.

------------------------------------------------------------------------

## 5. Where Do Heat and Population Exposure Coincide?

The hotspot analysis identified **954 local hotspot blocks** across the
10 study areas.

Hotspots are not defined by comparing cities against one another. Each
block is evaluated relative to the heat and population distributions
within its own city.

Compared with non-hotspot blocks, hotspot areas show:

-   Higher average LST
-   Lower average green-space share
-   Higher average built-up share
-   Much higher local population
-   Higher average building height

This provides a local decision-support layer rather than a city ranking.

------------------------------------------------------------------------

## 6. From Analysis to Action

Five intervention categories were assigned to hotspot blocks:

| Recommended Intervention | Hotspot Blocks |
|---|---:|
| Increase green space | 477 |
| Expand street trees and shade | 208 |
| Targeted local cooling measures | 142 |
| Cooling measures in dense built-up areas | 117 |
| Add water features | 10 |

The recommendation rules are applied in order using local hotspot characteristics:

- Low green space → Increase green space
- Low street-tree coverage → Expand street trees and shade
- High built-up share and no water → Cooling measures in dense built-up areas
- No water after previous conditions → Add water features
- Other hotspot conditions → Targeted local cooling measures

The recommendations are based on transparent hotspot characteristics and are informed by the statistical evidence.

They should be interpreted as decision-support rules rather than causal prescriptions.

------------------------------------------------------------------------

## 7. SQL Analysis

The final analytical outputs were transferred to PostgreSQL.

Two main tables were created:

-   `smart_cities_hotspots`
-   `smart_cities_city_summary`

SQL was used to:

-   Validate imported datasets
-   Summarise hotspots by city
-   Analyse hotspot characteristics
-   Calculate intervention distributions
-   Join hotspot-level and city-level outputs
-   Create analytical summaries using GROUP BY, window functions, JOINs
    and CTEs

The final database contains 954 hotspot records and 10 city-level
summary records.

------------------------------------------------------------------------

## 8. Week 3 Outcome

The analytical framework can now answer:

-   **WHAT?** Which available urban factors are associated with LST?
-   **WHERE?** Where do high heat and high population exposure coincide?
-   **WHO?** How much population is located within the identified
    hotspot areas?
-   **WHAT ACTION?** Which local cooling intervention category fits the
    hotspot characteristics?

The project has therefore moved from descriptive city comparison to a
hypothesis-driven spatial analysis supported by statistical evidence.

------------------------------------------------------------------------

## 9. Key Conclusion

> **Urban cooling decisions should not be based only on which city is
> hottest.**

The analysis shows that local heat patterns are associated with several
urban and environmental characteristics, while population data
identifies where high heat also represents high human exposure.

The resulting framework connects:

**Statistical Evidence → Local Hotspots → Population Exposure → Cooling
Action**

------------------------------------------------------------------------

## 10. Next Steps

-   **Tableau**: Build the final evidence and decision-support
    visualisations
-   **GitHub**: Organise and document the final project workflow
-   **Final Presentation**: Reduce, simplify and communicate the
    analytical story within 10 to 15 minutes
