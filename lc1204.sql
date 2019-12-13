## LC 1204
# MSSQL Server

WITH temp AS (
    SELECT
        person_id,
        person_name,
        turn,
        SUM(weight) OVER (
            ORDER BY turn
        ) AS wt
    FROM
        Queue
)
SELECT
    t1.person_name
FROM
    temp t1
LEFT JOIN
    temp t2
ON
    t1.turn = t2.turn - 1
WHERE
    t1.wt <= 1000
AND
    (
        t2.wt IS NULL OR t2.wt > 1000
    )
