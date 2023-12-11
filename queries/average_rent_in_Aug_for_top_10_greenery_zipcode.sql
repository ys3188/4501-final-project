
SELECT
    trees.zipcode,
    AVG(rents."Rent") AS average_rent
FROM
    trees
JOIN
    rents ON trees.zipcode = CAST(rents."RegionName" AS text)
WHERE
    rents."Date" BETWEEN '2023-08-01' AND '2023-08-31'
GROUP BY
    trees.zipcode
ORDER BY
    COUNT(trees.tree_id) DESC
LIMIT 10;
