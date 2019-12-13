## LC 1070
# MySQL

SELECT x.product_id, t.fyear AS first_year, x.quantity, x.price
FROM Sales x, (SELECT s.product_id AS pid, min(s.year) AS fyear
               FROM Sales s
               GROUP BY s.product_id) t
WHERE x.product_id = t.pid
AND x.year = t.fyear
