## LC 1098
# MSSQL Server

WITH tbl AS (
    SELECT
        book_id,
        name
    FROM
        Books
    WHERE
        DATEDIFF(day, available_from, CAST('2019-06-23' AS datetime)) >= 31
)
SELECT
    tbl.book_id,
    tbl.name
--    SUM(o.quantity)
FROM
    tbl
LEFT JOIN
    Orders o
ON
    tbl.book_id = o.book_id
AND
    DATEDIFF(day, o.dispatch_date, CAST('2019-06-23' AS datetime)) <= 365
GROUP BY
    tbl.book_id,
    tbl.name
HAVING
    SUM(CASE WHEN o.quantity IS NULL THEN 0 ELSE o.quantity END) < 10
