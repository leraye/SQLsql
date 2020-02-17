-- 1327. List the Products Ordered in a Period

-- MySQL

SELECT
    p.product_name,
    x.unit
FROM
    Products p,
    (
        SELECT
            product_id,
            SUM(unit) AS unit
        FROM
            Orders
        WHERE
            DATE_FORMAT(order_date, '%Y-%m') = "2020-02"
        GROUP BY
            product_id
    ) x
WHERE
    p.product_id = x.product_id
AND
    x.unit >= 100
