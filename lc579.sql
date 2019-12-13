## LC 579
# MSSQL Server

SELECT
	id,
	month,
	Salary
FROM
   (
	SELECT
		id, 
        	month,
-- Every 3 months. ROWS 2 PRECEDING indicates the number of rows or values to precede the current row (1 + 2)
   	   	SUM(salary) OVER(PARTITION BY id  ORDER BY month ROWS 2 PRECEDING) as Salary,
		DENSE_RANK() OVER(PARTITION BY id ORDER by month DESC) month_no
	FROM
		Employee
    )src
--  exclude the most recent month
WHERE
	month_no > 1
ORDER BY
	id,
	month desc
