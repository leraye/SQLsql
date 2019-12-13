WITH tbl AS (
  SELECT
    u.user_id,
    u.sign_up_date,
    SUM(t.transaction_amount) AS money_spent,
    ROW_NUMBER() OVER (
      ORDER BY SUM(t.transaction_amount), u.user_id
    ) AS forward_rank,
    ROW_NUMBER() OVER (
      ORDER BY SUM(t.transaction_amount) DESC, u.user_id DESC
    ) AS backward_rank
  FROM
    db2.users u,
    db2.transactions t
  WHERE
    u.sign_up_date = DATE(t.transaction_date)
  AND
    u.user_id = t.user_id
  GROUP BY
    u.user_id,
    u.sign_up_date
)
SELECT
  AVG(money_spent) AS mean,
  (
    SELECT
      AVG(money_spent)
    FROM
      tbl
    WHERE
      ABS(forward_rank - backward_rank) <= 1
  ) AS median
FROM
  tbl
