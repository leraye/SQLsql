## LC 1251
# MySQL

SELECT
    us.product_id,
    ROUND(SUM(us.units * p.price) / SUM(us.units), 2) AS average_price
FROM
    Prices p,
    UnitsSold us
WHERE
    p.product_id = us.product_id
AND
    us.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY
    us.product_id
