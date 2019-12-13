## LC 1212
# MSSQL Server

WITH temp AS (
    SELECT
        host_team,
        guest_team,
        CASE
            WHEN host_goals > guest_goals THEN 3
            WHEN host_goals = guest_goals THEN 1
            ELSE 0
        END AS host_score,
        CASE
            WHEN host_goals > guest_goals THEN 0
            WHEN host_goals = guest_goals THEN 1
            ELSE 3
        END AS guest_score
FROM
    Matches
)
SELECT
    t.team_id,
    t.team_name,
    SUM(CASE WHEN x.score IS NULL THEN 0 ELSE x.score END) AS num_points
FROM
    Teams t
LEFT JOIN
    (
        SELECT
            host_team AS team,
            host_score AS score
        FROM
            temp
        UNION ALL
        SELECT
            guest_team AS team,
            guest_score AS score
        FROM
            temp
    ) x
ON
    x.team = t.team_id
GROUP BY
    t.team_id,
    t.team_name
ORDER BY
    num_points DESC,
    t.team_id
