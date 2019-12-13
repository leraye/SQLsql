## LC 596
# MySQL

SELECT
	x.class
FROM
	courses x
GROUP BY
	x.class
HAVING
	count(DISTINCT x.student) >= 5
