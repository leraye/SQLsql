## LC 603
# MySQL

SELECT
	DISTINCT x.seat_id
FROM
	cinema x, cinema y
WHERE
	x.free = 1
AND
	y.free = 1
AND
	((x.seat_id = y.seat_id - 1) OR (y.seat_id = x.seat_id - 1))
ORDER BY
	x.seat_id
