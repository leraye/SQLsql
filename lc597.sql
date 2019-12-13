## LC 597
# MySQL

SELECT
	IFNULL(round(r.acc / s.tot, 2), 0.0) AS accept_rate
FROM
	(
		SELECT count(DISTINCT concat(y.requester_id, y.accepter_id)) AS acc
      		FROM request_accepted y
	) r,
	(
		SELECT count(DISTINCT concat(x.sender_id, x.send_to_id)) AS tot
      		FROM friend_request x
	) s
