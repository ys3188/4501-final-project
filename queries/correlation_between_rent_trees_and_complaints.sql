
WITH RentData AS (
    SELECT
        r."RegionName" AS zip_code,
        CAST(AVG(r."Rent") AS NUMERIC(10, 2)) AS average_rent
    FROM
        rents r
    WHERE
        r."Date" BETWEEN '2023-01-01' AND '2023-01-31'
    GROUP BY
        r."RegionName"
),
TreeData AS (
    SELECT
        t.zipcode::NUMERIC,  -- Cast to NUMERIC to match the data type in RentData
        COUNT(t.tree_id) AS tree_count
    FROM
        trees t
    GROUP BY
        t.zipcode::NUMERIC  -- Cast to NUMERIC
),
ComplaintData AS (
    SELECT
        c.incident_zip::NUMERIC,  -- Cast to NUMERIC to match the data type in RentData
        COUNT(c.unique_key) AS complaint_count
    FROM
        complaints c
    WHERE
        c.created_date BETWEEN '2023-01-01' AND '2023-01-31'
    GROUP BY
        c.incident_zip::NUMERIC  -- Cast to NUMERIC
),
CombinedData AS (
    SELECT
        rd.zip_code,
        rd.average_rent,
        COALESCE(td.tree_count, 0) AS tree_count,
        COALESCE(cd.complaint_count, 0) AS complaint_count
    FROM
        RentData rd
    LEFT JOIN
        TreeData td ON rd.zip_code::NUMERIC = td.zipcode
    LEFT JOIN
        ComplaintData cd ON rd.zip_code::NUMERIC = cd.incident_zip
)

(SELECT * FROM CombinedData ORDER BY average_rent DESC LIMIT 5)
UNION ALL
(SELECT * FROM CombinedData ORDER BY average_rent LIMIT 5);
