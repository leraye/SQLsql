WITH tbl AS (
  SELECT
    country,
    created_at,
    user_id,
    RANK() OVER (
      PARTITION BY country
      ORDER BY created_at
    ) AS forward_rank,
    RANK() OVER (
      PARTITION BY country
      ORDER BY created_at DESC
    ) AS backward_rank
  FROM
    sqldb.users
)
SELECT
  country,
  created_at,
  user_id
FROM
  tbl
WHERE
  forward_rank = 1
OR
  backward_rank = 1
