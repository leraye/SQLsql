# MySQL

WITH tbl AS (
  SELECT
    user_id,
    date,
    ROW_NUMBER() OVER (
      PARTITION BY user_id
      ORDER BY date
    ) AS rk
  FROM
    sqldb.transactions
)
SELECT
  user_id,
  date
FROM
  tbl
WHERE
  rk = 10
