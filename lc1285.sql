## LC 1285
# MSSQL Server

WITH temp AS (
    SELECT
        l1.log_id AS id1,
        l2.log_id AS id2,
        l3.log_id AS id3
    FROM
        Logs l1
    RIGHT JOIN
        Logs l2
    ON
        l1.log_id = l2.log_id - 1
    LEFT JOIN
        Logs l3
    ON
        l3.log_id = l2.log_id + 1
)
SELECT
    x.start_id,
    y.end_id
FROM
(
    SELECT
        temp.id2 AS start_id,
        ROW_NUMBER() OVER (
            ORDER BY temp.id2
        ) AS rid
    FROM
        temp
    WHERE
        temp.id1 IS NULL
) x,
(
    SELECT
        temp.id2 AS end_id,
        ROW_NUMBER() OVER (
            ORDER BY temp.id2
        ) AS rid
    FROM
        temp
    WHERE
        temp.id3 IS NULL
) y
WHERE
    x.rid = y.rid
