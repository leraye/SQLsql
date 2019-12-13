## LC 184
# MSSQL Server

WITH x AS (
    SELECT
        Name,
        Salary,
        DepartmentId,
        DENSE_RANK() OVER (
            PARTITION BY DepartmentId
            ORDER BY Salary DESC
        ) AS rank
    FROM
        Employee
)
SELECT
    d.Name AS Department,
    x.Name AS Employee,
    x.Salary
FROM
    x,
    Department d
WHERE
    x.DepartmentId = d.Id
AND
    x.rank = 1

# MySQL

SELECT
	d.Name AS Department,
	e.Name AS Employee,
	e.Salary AS Salary
FROM
	Employee e,
	Department d
WHERE
	e.DepartmentId = d.Id
AND
	e.Salary >= ALL(
			SELECT
				x.Salary
                   	FROM
				Employee x,
				Department y
                   	WHERE
				x.DepartmentId = y.Id
                   	AND
				y.Id = d.Id
			)
