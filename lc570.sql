## LC 570
# MSSQL Server

SELECT
    y.Name
FROM
    Employee x,
    Employee y
WHERE
    x.ManagerId = y.Id
GROUP BY
    x.ManagerId, y.Name
HAVING
    COUNT(x.Id) >= 5
