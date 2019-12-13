## LC 1069
# MySQL

SELECT x.product_id, sum(x.quantity) AS total_quantity
FROM Sales x, Product y
WHERE x.product_id = y.product_id
GROUP BY x.product_id
