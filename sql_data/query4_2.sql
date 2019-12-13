# MySQL
WITH tbl AS (
  SELECT
    user_id,
    date,
    transaction_amount
  FROM
    sqldb.april
  UNION ALL
  SELECT
    user_id,
    date,
    transaction_amount
  FROM
    sqldb.march
)
SELECT
  user_id,
  date,
  SUM(transaction_amount) OVER (
    PARTITION BY user_id
    ORDER BY date
  )
FROM
  tbl
ORDER BY
  user_id
