## LC 1045
# MySQL

SELECT x.customer_id
FROM Customer x
GROUP BY x.customer_id
HAVING count(DISTINCT x.product_key) = (SELECT count(p.product_key)
                                        FROM Product p)
