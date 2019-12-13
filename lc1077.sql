## LC 1077
# MySQL

WITH tbl AS (SELECT
    p.project_id,
    p.employee_id,
    DENSE_RANK() OVER (
        PARTITION BY p.project_id
        ORDER BY e.experience_years DESC
    ) AS rank
FROM
    Project p,
    Employee e
WHERE
    p.employee_id = e.employee_id
)
SELECT
    tbl.project_id,
    tbl.employee_id
FROM
    tbl
WHERE
    tbl.rank = 1
