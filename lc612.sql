## LC 612
# MySQL

SELECT
	ROUND(SQRT(POW(p.x - q.x, 2) + POW(p.y - q.y, 2)), 2) AS shortest
FROM
	point_2d p, point_2d q
WHERE
	concat(p.x, p.y) != concat(q.x, q.y)
ORDER BY
	POW(p.x - q.x, 2) + POW(p.y - q.y, 2)
LIMIT 1
