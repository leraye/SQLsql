## LC 1174
# MySQL

SELECT
	ROUND(100 * sum(CASE WHEN x.order_date = x.customer_pref_delivery_date THEN 1 ELSE 0 END) / count(DISTINCT x.customer_id), 2) as immediate_percentage
FROM
	Delivery x,
	(
		SELECT
			d.customer_id,
			min(d.order_date) as od
                FROM
			Delivery d
                GROUP BY
			d.customer_id
	) y
WHERE
	x.order_date = y.od
AND
	x.customer_id = y.customer_id
