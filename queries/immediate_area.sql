
SELECT
    t.tree_id AS id,
    t.spc_common AS species,
    t.health,
    t.status,
    ST_AsText(t.geometry) AS coordinate_location
FROM
    trees t
WHERE 
    ST_DWithin(
        t.geometry::geography,
        ST_MakePoint(-73.96253174434912, 40.80737875669467)::geography,
        804.672  -- Distance in meters (½ mile)
    )
