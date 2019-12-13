## LC 1194
# MSSQL Server

SELECT
    y.group_id,
    y.pid AS player_id
FROM
(
SELECT
    p.group_id,
    x.pid,
    ROW_NUMBER() OVER (
        PARTITION BY p.group_id
        ORDER BY x.total_score DESC, x.pid ASC
    ) AS rank
FROM
    (
    SELECT
        tbl.pid,
        SUM(tbl.score) AS total_score
    FROM
        (
            (
                SELECT
                    first_player AS pid,
                    first_score AS score
                FROM
                    Matches
            )
            UNION ALL
            (
                SELECT
                    second_player AS pid,
                    second_score AS score
                FROM
                    Matches
            )
        ) tbl
    GROUP BY
        tbl.pid
    ) x, Players p
WHERE
    x.pid = p.player_id
) y
WHERE
    y.rank = 1
