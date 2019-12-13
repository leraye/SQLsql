## LC 1211
# MySQL

SELECT
	query_name,
	ROUND(avg(rating / position),2) as quality,
	ROUND(100 * sum(case when rating < 3 then 1 else 0 end) / COUNT(result),2) as poor_query_percentage
FROM
	Queries
GROUP BY
	query_name
