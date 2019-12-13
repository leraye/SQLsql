## LC 1225
# MSSQL Server

WITH temp AS (
    (
        SELECT
            fail_date AS date,
            'failed' AS state
        FROM
            Failed
        WHERE
            fail_date BETWEEN '2019-01-01' AND '2019-12-31'
    )
    UNION ALL
    (
        SELECT
            success_date AS date,
            'succeeded' AS state
        FROM
            Succeeded
        WHERE
            success_date BETWEEN '2019-01-01' AND '2019-12-31'
    )
)
SELECT
    x.period_state,
    x.start_date,
    y.end_date
FROM
(
    SELECT
        t2.date AS start_date,
        t2.state AS period_state,
        ROW_NUMBER() OVER (
            ORDER BY t2.date
        ) AS rid
    FROM
        temp t1
    RIGHT JOIN
        temp t2
    ON
        DATEDIFF(day, t1.date, t2.date) = 1
    AND
        t1.state = t2.state
    WHERE
        t1.date IS NULL
) x,
(
    SELECT
        t2.date AS end_date,
        t2.state AS period_state,
        ROW_NUMBER() OVER (
            ORDER BY t2.date
        ) AS rid
    FROM
        temp t2
    LEFT JOIN
        temp t3
    ON
        DATEDIFF(day, t2.date, t3.date) = 1
    AND
        t3.state = t2.state
    WHERE
        t3.date IS NULL
) y
WHERE
    x.rid = y.rid
