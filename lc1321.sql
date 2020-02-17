# 1321. Restaurant Growth
WITH temp AS (
    SELECT
        visited_on,
        SUM(amount) AS amount
    FROM
        Customer
    GROUP BY
        visited_on
)
SELECT
    visited_on,
    SUM(amount) OVER (
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS amount,
    CAST(AVG(amount * 1.0) OVER (
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS DECIMAL(5, 2)) AS average_amount
FROM
    temp
ORDER BY
    visited_on
OFFSET
    6 rows
