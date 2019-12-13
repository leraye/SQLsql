## LC 1164
# MySQL

SELECT
	DISTINCT y.product_id,
	y.price
FROM
	(
	  SELECT
		q.product_id,
		CASE
		     WHEN q.change_date = x.last_day THEN q.new_price
		     WHEN x.last_day IS NULL THEN 10
		     ELSE NULL
		END as price
	  FROM
		Products q
	  LEFT JOIN
	        (
		  SELECT
			p.product_id,
			max(p.change_date) as last_day
                  FROM
			Products p
                  WHERE
			DATEDIFF(p.change_date, CONVERT("2019-08-16", DATE)) <= 0
                  GROUP BY p.product_id
		) x
	  ON
		q.product_id = x.product_id
	) y
WHERE
	y.price IS NOT NULL
