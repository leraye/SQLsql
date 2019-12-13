## LC 607
# MySQL

SELECT
    name
FROM
    salesperson
WHERE
    sales_id NOT IN (
			SELECT
				o.sales_id
			FROM
				orders o,
    				company c
			WHERE
				o.com_id = c.com_id
			AND
				c.name = "RED"
		     )
