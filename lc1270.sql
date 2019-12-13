## LC 1270
# MSSQL Server

WITH tbl AS
(
    SELECT
        e1.employee_id AS eid1,
        e2.employee_id AS eid2,
        e3.employee_id AS eid3
    FROM
        Employees e1
    RIGHT JOIN
        Employees e2
    ON
        e1.manager_id = e2.employee_id
    RIGHT JOIN
        Employees e3
    ON
        e2.manager_id = e3.employee_id
    WHERE
        e3.manager_id = 1
)
(
    (
    SELECT
        eid3 AS employee_id
    FROM
        tbl
    WHERE
        eid3 <> 1
)
UNION
(
    SELECT
        eid2 AS employee_id
    FROM
        tbl
    WHERE
        eid2 IS NOT NULL
    AND
        eid2 <> 1
)
)
UNION
(
    SELECT
        eid1 AS employee_id
    FROM
        tbl
    WHERE
        eid1 IS NOT NULL
    AND
        eid1 <> 1
)
