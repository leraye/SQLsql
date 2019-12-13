## LC 1132
# MySQL

WITH x AS (
    SELECT
        DISTINCT
        post_id,
        action_date
    FROM
        Actions
    WHERE
        extra = 'spam'
)
SELECT
    ROUND(AVG(removal), 2) AS 'average_daily_percent'
FROM (
   SELECT
        x.action_date,
        100.0 * SUM(CASE WHEN r.post_id IS NULL THEN 0 ELSE 1 END) / COUNT(x.post_id) as removal
    FROM
        x
    LEFT JOIN
        Removals r
    ON
        x.post_id = r.post_id
    GROUP BY
        x.action_date 
) y
