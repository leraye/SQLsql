## LC 1173
# MySQL

SELECT
	ROUND(100 * COUNT(x.delivery_id) / y.total, 2) as immediate_percentage
FROM
	Delivery x,
	(
	  SELECT COUNT(d.delivery_id) as total
          FROM Delivery d
	) y
WHERE
	x.order_date = x.customer_pref_delivery_date
