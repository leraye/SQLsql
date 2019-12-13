## LC 262
# MySQL

SELECT
	t.Request_at AS Day,
    	ROUND(SUM(CASE WHEN t.Status <> 'completed' THEN 1 ELSE 0 END)/COUNT(t.Id), 2) AS 'Cancellation Rate'
FROM
	Trips t,
	Users u1,
	Users u2
WHERE
	t.Client_Id = u1.Users_Id
AND
	u1.Role = 'client'
AND
	t.Driver_Id = u2.Users_Id
AND
	u2.Role = 'driver'
AND
	u1.Banned = 'No'
AND
	u2.Banned = 'No'
AND
	t.Request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY
	t.Request_at
