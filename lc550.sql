## LC 550
# MSSQL Server

WITH temp AS (
    SELECT
        player_id,
        MIN(event_date) AS install_date
    FROM
        Activity
    GROUP BY
        player_id
)
SELECT
	ROUND(SUM(CASE WHEN a.player_id IS NULL THEN 0.0 ELSE 1.0 END) / COUNT(tbl.player_id), 2) AS fraction
FROM
	temp
LEFT JOIN
	Activity a
ON
	temp.player_id = a.player_id
AND
	DATEADD(day, 1, temp.install_date) = a.event_date
