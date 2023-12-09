
SELECT
    incident_zip,
    COUNT(*) AS num_complaints
FROM
    complaints
GROUP BY
    incident_zip
ORDER BY
    num_complaints DESC;
