## LC 569
# MSSQL Server

WITH temp AS (
    SELECT
        Id,
        Company,
        Salary,
        ROW_NUMBER() OVER (
            PARTITION BY Company
            ORDER BY Salary, Id
        ) AS r1,
        ROW_NUMBER() OVER (
            PARTITION BY Company
            ORDER BY Salary DESC, Id DESC
        ) AS r2
    FROM
        Employee
)
SELECT
    Id,
    Company,
    Salary
FROM
    temp
WHERE
    r1 BETWEEN r2 - 1 AND r2 + 1
