## LC 1082
# MySQL

SELECT x.seller_id
FROM Sales x
GROUP BY x.seller_id
HAVING sum(x.price) >= ALL (SELECT sum(s.price)
                            FROM Sales s
                            GROUP BY s.seller_id)
