WITH tbl AS (
  SELECT
    x.country,
    x.user_count,
    RANK() OVER (
      ORDER BY x.user_count
    ) AS forward_rank,
    RANK() OVER (
      ORDER BY x.user_count DESC
    ) AS backward_rank
  FROM
    (
      SELECT
        country,
        COUNT(user_id) AS user_count
      FROM
        sqldb.users
      GROUP BY
        country
    ) x
)
SELECT
  country,
  user_count
FROM
  tbl
WHERE
  forward_rank = 1
OR
  backward_rank = 1
