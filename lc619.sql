## LC 619
# MySQL

SELECT
	IFNULL(
		(
			SELECT x.num
			FROM my_numbers x
			GROUP BY x.num
			HAVING count(*) = 1
			ORDER BY x. num DESC
			LIMIT 1)
	, NULL) as num
