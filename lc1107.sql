## LC 1107
# MySQL

SELECT y.fdate AS login_date, count(DISTINCT x.user_id) AS user_count
FROM Traffic x,
(SELECT t.user_id AS uid, min(t.activity_date) AS fdate
FROM Traffic t
WHERE t.activity = "login"
GROUP BY t.user_id) y
WHERE x.user_id = y.uid
AND x.activity_date = y.fdate
AND DATEDIFF(x.activity_date, CAST("2019-06-30" AS DATE)) >= -90
AND x.activity = "login"
GROUP BY y.fdate
