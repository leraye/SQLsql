## LC 586
# MySQL
SELECT
	y.customer_number
FROM
	orders y
GROUP BY
	y.customer_number
HAVING
	count(y.order_number) >= ALL (
					SELECT count(x.order_number)
                                   	FROM orders x
                                   	GROUP BY x.customer_number
				     )
