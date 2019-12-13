## LC 1141
# MySQL

SELECT
	a.activity_date AS day,
	COUNT(DISTINCT a.user_id) AS active_users
FROM
	Activity a
WHERE
	DATEDIFF(day, a.activity_date, CAST('2019-07-27' AS DATE)) < 30
GROUP BY
	a.activity_date
