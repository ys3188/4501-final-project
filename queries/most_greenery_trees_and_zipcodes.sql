
WITH TreeZipcodeCounts AS (
    SELECT
        zipcodes."ZIPCODE" AS zip_code,
        COUNT(trees.tree_id) AS tree_count
    FROM
        zipcodes
    LEFT JOIN
        trees ON ST_Within(trees.geometry, zipcodes.geometry) and trees."zipcode" = zipcodes."ZIPCODE"
    GROUP BY
        zipcodes."ZIPCODE"
    ORDER BY
        tree_count DESC
    LIMIT 10
)

SELECT
    tzc.zip_code,
    tzc.tree_count
FROM
    TreeZipcodeCounts tzc
ORDER BY
    tzc.tree_count DESC;
