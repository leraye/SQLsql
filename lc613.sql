## LC 613
# MSSQL Server

WITH temp AS (
     SELECT
	x,
    	DENSE_RANK() OVER (ORDER BY x) AS rid
     FROM
	point
)
SELECT
    MIN(t2.x - t1.x) AS "shortest"
FROM
    temp t1,
    temp t2
WHERE
    t1.rid = t2.rid - 1
