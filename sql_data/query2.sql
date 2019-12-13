# MySQL

WITH tbl AS (
  SELECT
    user_id,
    'mobile' AS type
  FROM
    sqldb.mobile
  UNION ALL
  SELECT
    user_id,
    'web' AS type
  FROM
    sqldb.web
)
SELECT
  100 * ROUND(x.only_web / z.total, 2) AS web_only,
  100 * ROUND(y.only_mobile / z.total, 2) AS mobile_only,
  100 * ROUND((z.total - x.only_web - y.only_mobile) / z.total, 2) AS both
FROM
(
  SELECT
    COUNT(DISTINCT user_id) AS only_web
  FROM
    tbl
  WHERE
    type = 'web'
  AND
    user_id NOT IN (SELECT user_id FROM sqldb.mobile)
) x,
(
  SELECT
    COUNT(DISTINCT user_id) AS only_mobile
  FROM
    tbl
  WHERE
    type = 'mobile'
  AND
    user_id NOT IN (SELECT user_id FROM sqldb.web)
) y,
(
  SELECT
    COUNT(DISTINCT user_id) AS total
  FROM
    tbl
) z
