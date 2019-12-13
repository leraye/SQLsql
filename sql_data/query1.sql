# MySQL
WITH tbl AS (
  SELECT
    user_id,
    unix_timestamp,
    RANK() OVER (
      PARTITION BY user_id
      ORDER BY unix_timestamp DESC
    ) AS rk
  FROM
    sqldb.user_action
)
SELECT
  t1.user_id,
  CASE
    WHEN t2.unix_timestamp IS NULL THEN NULL
    ELSE t1.unix_timestamp - t2.unix_timestamp
  END AS delta
FROM
  tbl t1
LEFT JOIN
  tbl t2
ON
  t1.user_id = t2.user_id
AND
  t1.rk + 1 = t2.rk
WHERE
  t1.rk = 1
ORDER BY
  t1.user_id
