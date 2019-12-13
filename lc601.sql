## LC 601
# MySQL

SELECT
	DISTINCT x.*
FROM
	stadium x,
	stadium y,
	stadium z
WHERE
	x.people >= 100
AND
	y.people >= 100
AND
	z.people >= 100
AND
	((x.id - y.id = -1 AND y.id - z.id = -1) OR (y.id - x.id = -1 AND x.id - z.id = -1) OR (z.id - y.id = -1 AND y.id - x.id = -1))
ORDER BY
	x.id
