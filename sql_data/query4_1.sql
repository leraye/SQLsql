# MySQL
WITH tbl AS (
  SELECT
    user_id,
    transaction_amount
  FROM
    sqldb.april
  UNION ALL
  SELECT
    user_id,
    transaction_amount
  FROM
    sqldb.march
)
SELECT
  user_id,
  SUM(transaction_amount) AS money_spent
FROM
  tbl
GROUP BY
  user_id
ORDER BY
  user_id
