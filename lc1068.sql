## LC 1068
# MySQL

SELECT y.product_name, x.year, x.price
FROM Sales x, Product y
WHERE x.product_id = y.product_id
