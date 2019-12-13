## LC 1126
# MSSQL Server

WITH temp AS (
    SELECT
        event_type,
        AVG(occurences) AS occurences
    FROM
        Events
    GROUP BY
        event_type
)

SELECT
    e.business_id
FROM
    Events e,
    temp t
WHERE
    e.event_type = t.event_type
AND
    e.occurences > t.occurences
GROUP BY
    e.business_id
HAVING
    COUNT(e.event_type) > 1
