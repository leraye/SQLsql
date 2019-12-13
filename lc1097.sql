## LC 1097
# MySQL

WITH tbl AS (
    SELECT
        player_id,
        MIN(event_date) AS install_dt
    FROM
        Activity
    GROUP BY
        player_id
)
SELECT
    tbl.install_dt,
    COUNT(tbl.player_id) AS installs,
    ROUND(SUM(CASE WHEN a.player_id IS NULL THEN 0.0 ELSE 1.0 END) / COUNT(tbl.player_id), 2) AS Day1_retention
FROM
    tbl
LEFT JOIN
    Activity a
ON
    tbl.player_id = a.player_id
AND
    DATEADD(day, 1, tbl.install_dt) = a.event_date
GROUP BY
    tbl.install_dt
