-- 1355. Activity Participants
-- MS SQL Server
WITH temp AS (
    SELECT
        a.name,
        COUNT(f.id) AS num
    FROM
        Friends f,
        Activities a
    WHERE
        f.activity = a.name
    GROUP BY
        a.id, a.name
)
SELECT
    name AS ACTIVITY
FROM
    Activities
WHERE
    name NOT IN (
        SELECT
            name
        FROM
            temp
        WHERE
            num >= ALL (
                SELECT
                    num
                FROM
                    temp
            )
    )
AND
    name NOT IN (
        SELECT
            name
        FROM
            temp
        WHERE
            num <= ALL (
                SELECT
                    num
                FROM
                    temp
            )
    )
