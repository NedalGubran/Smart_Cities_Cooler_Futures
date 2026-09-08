
-- ============================================================
-- SMART CITIES, COOLER FUTURES - SQL ANALYSIS
-- Final Analytical Dataset
-- ============================================================


-- ============================================================
-- 1. Urban Cooling Priority Ranking
-- WHERE should cities act first?
-- ============================================================

SELECT
    city,
    priority_score,
    priority_rank,
    recommended_intervention
FROM s_nedalgubran.smart_cities_cooler_futures_tableau_clean
ORDER BY priority_rank;


-- ============================================================
-- 2. Identify High-Priority Cities
-- Priority Score >= 0.60
-- ============================================================

SELECT
    city,
    priority_score,
    priority_rank,
    primary_driver,
    secondary_driver,
    recommended_intervention
FROM s_nedalgubran.smart_cities_cooler_futures_tableau_clean
WHERE priority_score >= 0.60
ORDER BY priority_score DESC;


-- ============================================================
-- 3. Priority Drivers by City
-- WHY are cities prioritised?
-- ============================================================

SELECT
    city,
    priority_score,
    priority_rank,
    primary_driver,
    secondary_driver
FROM s_nedalgubran.smart_cities_cooler_futures_tableau_clean
ORDER BY priority_rank;


-- ============================================================
-- 4. City-Specific Cooling Recommendations
-- WHAT should cities do?
-- ============================================================

SELECT
    city,
    priority_score,
    primary_driver,
    secondary_driver,
    recommended_intervention
FROM s_nedalgubran.smart_cities_cooler_futures_tableau_clean
ORDER BY priority_score DESC;


-- ============================================================
-- 5. Top 5 Highest-Priority Cities
-- ============================================================

SELECT
    city,
    priority_score,
    priority_rank,
    primary_driver,
    recommended_intervention
FROM s_nedalgubran.smart_cities_cooler_futures_tableau_clean
ORDER BY priority_score DESC
LIMIT 5;


-- ============================================================
-- 6. Impervious Surface Change
-- WHAT CHANGED? 2021-2024
-- ============================================================

SELECT
    city,
    impervious_increase_pct,
    impervious_decrease_pct,
    stable_impervious_pct
FROM s_nedalgubran.smart_cities_cooler_futures_tableau_clean
ORDER BY impervious_increase_pct DESC;


-- ============================================================
-- 7. Priority vs Impervious Surface Change
-- Supporting context only
-- ============================================================

SELECT
    city,
    priority_score,
    priority_rank,
    impervious_increase_pct,
    impervious_decrease_pct,
    stable_impervious_pct
FROM s_nedalgubran.smart_cities_cooler_futures_tableau_clean
ORDER BY impervious_increase_pct DESC;

-- ============================================================
-- 8. Overall Urban Cooling Summary
-- Aggregate indicators across the 10 cities
-- ============================================================

SELECT
    COUNT(*) AS number_of_cities,
    ROUND(AVG(priority_score)::numeric, 3) AS avg_priority_score,
    ROUND(AVG(uhi_intensity_c)::numeric, 3) AS avg_uhi_intensity_c,
    ROUND(AVG(population_density_per_km2)::numeric, 2) AS avg_population_density,
    ROUND(AVG(green_space_pct)::numeric, 2) AS avg_green_space_pct,
    ROUND(AVG(street_tree_pct)::numeric, 2) AS avg_street_tree_pct
FROM s_nedalgubran.smart_cities_cooler_futures_tableau_clean;


-- ============================================================
-- 9. Summer Land Surface Temperature (2021–2024)
-- How did summer surface heat vary across cities and years?
-- ============================================================

SELECT
    city,
    year,
    summer_mean_lst_c,
    avg_pixel_count
FROM s_nedalgubran.lst_summer
ORDER BY city, year;

-- ============================================================
-- 10. Summer LST Patterns by City
-- Heat persistence and interannual variability (2021–2024)
-- ============================================================

SELECT
    city,
    ROUND(AVG(summer_mean_lst_c)::numeric, 2) AS mean_lst_c,
    ROUND(MIN(summer_mean_lst_c)::numeric, 2) AS min_lst_c,
    ROUND(MAX(summer_mean_lst_c)::numeric, 2) AS max_lst_c,
    ROUND((MAX(summer_mean_lst_c) - MIN(summer_mean_lst_c))::numeric, 2) AS lst_range_c
FROM s_nedalgubran.lst_summer
GROUP BY city
ORDER BY mean_lst_c DESC;

UPDATE s_nedalgubran.lst_summer
SET city = CASE
    WHEN city = 'Athens' THEN 'ATHINA'
    WHEN city = 'Milan' THEN 'MILANO'
    WHEN city = 'Vienna' THEN 'WIEN'
    WHEN city = 'Lisbon' THEN 'LISBOA'
    WHEN city = 'Prague' THEN 'PRAHA'
    ELSE UPPER(city)
END;

-- ============================================================
-- 11. Priority Score and Summer LST
-- Compare urban cooling priority with recent surface heat
-- ============================================================

SELECT
    p.city,
    p.priority_score,
    p.priority_rank,
    ROUND(AVG(l.summer_mean_lst_c)::numeric, 2) AS mean_lst_2021_2024_c
FROM s_nedalgubran.smart_cities_cooler_futures_tableau_clean p
JOIN s_nedalgubran.lst_summer l
    ON p.city = l.city
GROUP BY
    p.city,
    p.priority_score,
    p.priority_rank
ORDER BY p.priority_rank;


-- ============================================================
-- 12. Priority Score Sensitivity Analysis
-- How does city ranking change under different weighting scenarios?
-- ============================================================

SELECT
    city,
    equal_rank,
    heat_focused_rank,
    exposure_focused_rank,
    cooling_focused_rank,
    best_rank,
    worst_rank,
    rank_range
FROM s_nedalgubran.priority_sensitivity_analysis
ORDER BY equal_rank;

-- ============================================================
-- 13. Priority Rank Stability
-- Which cities are most sensitive to weighting assumptions?
-- ============================================================

SELECT
    city,
    best_rank,
    worst_rank,
    rank_range
FROM s_nedalgubran.priority_sensitivity_analysis
ORDER BY rank_range DESC, equal_rank;

ALTER TABLE s_nedalgubran.smart_cities_cooler_futures_tableau_clean
ADD COLUMN green_space_gap_pct NUMERIC,
ADD COLUMN street_tree_gap_pct NUMERIC;

UPDATE s_nedalgubran.smart_cities_cooler_futures_tableau_clean
SET
    green_space_gap_pct = CASE city
        WHEN 'ATHINA' THEN 0.000000
        WHEN 'MILANO' THEN 22.515454
        WHEN 'AMSTERDAM' THEN 24.253391
        WHEN 'BARCELONA' THEN 0.000000
        WHEN 'MADRID' THEN 0.000000
        WHEN 'BUDAPEST' THEN 8.168642
        WHEN 'WIEN' THEN 8.853880
        WHEN 'LISBOA' THEN 0.000000
        WHEN 'PRAHA' THEN 4.072255
        WHEN 'BERLIN' THEN 0.000000
    END,
    street_tree_gap_pct = CASE city
        WHEN 'ATHINA' THEN 0.358227
        WHEN 'MILANO' THEN 0.000000
        WHEN 'AMSTERDAM' THEN 0.000000
        WHEN 'BARCELONA' THEN 0.000000
        WHEN 'MADRID' THEN 1.521226
        WHEN 'BUDAPEST' THEN 0.000000
        WHEN 'WIEN' THEN 1.683141
        WHEN 'LISBOA' THEN 1.766533
        WHEN 'PRAHA' THEN 0.204840
        WHEN 'BERLIN' THEN 0.000000
    END;

-- ============================================================
-- 14. Intervention Gap Analysis
-- Quantify city-specific green-space and street-tree gaps
-- ============================================================

SELECT
    city,
    ROUND(green_space_gap_pct, 2) AS green_space_gap_pct,
    ROUND(street_tree_gap_pct, 2) AS street_tree_gap_pct,
    recommended_intervention
FROM s_nedalgubran.smart_cities_cooler_futures_tableau_clean
ORDER BY priority_rank;