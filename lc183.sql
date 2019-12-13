## LC 183
# MySQL

SELECT
	C.Name AS Customers
FROM
	Customers C
WHERE
	C.Id NOT IN (
			SELECT
				O.CustomerId
                  	FROM
				Orders O)
