## LC 602
# MSSQL Server

WITH temp AS (
    SELECT
        x.ids,
        COUNT(*) AS num
    FROM (
            SELECT requester_id as ids from request_accepted
            UNION ALL
            SELECT accepter_id as ids from request_accepted) x
    GROUP BY x.ids
)
SELECT
    t.ids AS id,
    t.num
FROM
    temp t
WHERE
    t.num >= ALL (
        SELECT
            num
        FROM
            temp
    )
