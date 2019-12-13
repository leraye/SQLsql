## LC 1113
# MySQL

SELECT x.extra AS report_reason, count(DISTINCT x.post_id) AS report_count
FROM Actions x
WHERE x.action = 'report'
AND x.action_date = '2019-07-04'
GROUP BY x.extra
