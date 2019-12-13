## LC 181
# MySQL

SELECT
	x.Name AS Employee
FROM
	Employee x,
	Employee y
WHERE
	x.ManagerId = y.Id
AND
	x.Salary > y.Salary
