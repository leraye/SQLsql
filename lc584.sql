## LC 584
# MySQL

SELECT
	c.name
FROM
	customer c
WHERE
	c.referee_id <> 2
OR
	c.referee_id IS NULL
