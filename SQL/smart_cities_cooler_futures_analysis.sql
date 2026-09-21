SELECT
    recommended_intervention,
    COUNT(*) AS hotspot_blocks
FROM s_nedalgubran.smart_cities_hotspots
GROUP BY recommended_intervention
ORDER BY hotspot_blocks DESC;

-- 1. Validate imported datasets

SELECT 
    'hotspots' AS dataset,
    COUNT(*) AS row_count
FROM s_nedalgubran.smart_cities_hotspots

UNION ALL

SELECT 
    'city_summary' AS dataset,
    COUNT(*) AS row_count
FROM s_nedalgubran.smart_cities_city_summary;


-- 2. Hotspot distribution by city

SELECT
    city,
    COUNT(*) AS hotspot_blocks,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS share_of_all_hotspots_pct
FROM s_nedalgubran.smart_cities_hotspots
GROUP BY city
ORDER BY hotspot_blocks DESC;

-- 3. Hotspot characteristics by city

SELECT
    city,
    COUNT(*) AS hotspot_blocks,
    ROUND(AVG(lst)::numeric, 2) AS avg_lst_c,
    ROUND((AVG(green_space_share) * 100)::numeric, 2) AS avg_green_space_pct,
    ROUND((AVG(built_up_share) * 100)::numeric, 2) AS avg_built_up_pct,
    ROUND(AVG(population)::numeric, 0) AS avg_population,
    ROUND(AVG(mean_building_height)::numeric, 2) AS avg_building_height_m
FROM s_nedalgubran.smart_cities_hotspots
GROUP BY city
ORDER BY city;

SELECT column_name
FROM information_schema.columns
WHERE table_schema = 's_nedalgubran'
  AND table_name = 'smart_cities_hotspots'
ORDER BY ordinal_position;

-- 4. Cooling recommendations by city

SELECT
    city,
    recommended_intervention,
    COUNT(*) AS hotspot_blocks,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY city),
        2
    ) AS recommendation_share_pct
FROM s_nedalgubran.smart_cities_hotspots
GROUP BY city, recommended_intervention
ORDER BY city, hotspot_blocks DESC;

SELECT column_name
FROM information_schema.columns
WHERE table_schema = 's_nedalgubran'
  AND table_name = 'smart_cities_city_summary'
ORDER BY ordinal_position;

-- 5. Join hotspot data with city-level summary

SELECT
    h.city,
    COUNT(*) AS hotspot_blocks,
    ROUND(AVG(h.lst)::numeric, 2) AS avg_hotspot_lst_c,
    ROUND((AVG(h.green_space_share) * 100)::numeric, 2) AS avg_green_space_pct,
    ROUND((AVG(h.built_up_share) * 100)::numeric, 2) AS avg_built_up_pct,
    MAX(c.hotspot_share_pct) AS hotspot_share_pct,
    MAX(c.population_exposed_pct) AS population_exposed_pct,
    MAX(c.main_recommendation) AS main_recommendation
FROM s_nedalgubran.smart_cities_hotspots h
JOIN s_nedalgubran.smart_cities_city_summary c
    ON h.city = c.city
GROUP BY h.city
ORDER BY h.city;

-- 6. Intervention profile using a CTE

WITH intervention_profile AS (
    SELECT
        recommended_intervention,
        COUNT(*) AS hotspot_blocks,
        AVG(lst) AS avg_lst,
        AVG(green_space_share) AS avg_green,
        AVG(built_up_share) AS avg_built,
        SUM(population) AS exposed_population
    FROM s_nedalgubran.smart_cities_hotspots
    GROUP BY recommended_intervention
)
SELECT
    recommended_intervention,
    hotspot_blocks,
    ROUND(avg_lst::numeric, 2) AS avg_lst_c,
    ROUND((avg_green * 100)::numeric, 2) AS avg_green_space_pct,
    ROUND((avg_built * 100)::numeric, 2) AS avg_built_up_pct,
    ROUND(exposed_population::numeric, 0) AS exposed_population
FROM intervention_profile
ORDER BY hotspot_blocks DESC;