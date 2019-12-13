## LC 1158
# MySQL

SELECT
	u.user_id as buyer_id,
	u.join_date, 
       	COUNT(x.buyer_id) orders_in_2019
FROM
	Users u
LEFT JOIN
	(
	  SELECT
		o.buyer_id
          FROM
		Orders o
          WHERE
		EXTRACT(year from o.order_date) = 2019
	) x
ON
	u.user_id = x.buyer_id
GROUP BY
	u.user_id
