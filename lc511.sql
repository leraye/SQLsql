## LC 511
# MySQL

SELECT
	a.player_id,
	min(a.event_date) AS first_login
FROM
	Activity a
GROUP BY
	a.player_id
