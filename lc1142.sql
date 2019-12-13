## LC 1142
# MySQL

SELECT
	round(IFNULL(avg(x.nsession), 0), 2) AS average_sessions_per_user
FROM
	(
		SELECT
			count(DISTINCT a.session_id) AS nsession
		FROM
			Activity a
		WHERE
			DATEDIFF(a.activity_date, CAST("2019-07-27" AS DATE)) > -30
		GROUP BY
			a.user_id
	) x
