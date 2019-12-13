## LC 1084
# MySQL

SELECT s.product_id, product_name
FROM Sales s, Product p
WHERE s.product_id = p.product_id
GROUP BY s.product_id
HAVING MIN(sale_date) >= CAST('2019-01-01' AS DATE) AND
       MAX(sale_date) <= CAST('2019-03-31' AS DATE)
