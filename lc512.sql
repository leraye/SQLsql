## LC 512
# MySQL

SELECT
	player_id,
	device_id
FROM
	Activity
WHERE
	(player_id, event_date) IN (
				   SELECT
					a.player_id,
                                    	min(a.event_date) AS first_login
                                   FROM
					Activity a
                                   GROUP BY
				   	a.player_id
				   )

# MSSQL Server

WITH temp AS (
    SELECT
        player_id,
        device_id,
        DENSE_RANK() OVER (
            PARTITION BY player_id
            ORDER BY event_date
        ) AS rank
    FROM
        Activity
)
SELECT
    player_id,
    device_id
FROM
    temp
WHERE
    rank = 1
