## LC 1193
# MySQL

SELECT
	DATE_FORMAT(t.trans_date, '%Y-%m') as month,
	t.country as country,
	COUNT(id) as trans_count,
	SUM(case when state = "approved" then 1 else 0 end) as approved_count,
	SUM(t.amount) as trans_total_amount,
	SUM(case when state = "approved" then t.amount else 0 end) as approved_total_amount
FROM
	Transactions t
GROUP BY
	DATE_FORMAT(t.trans_date, '%Y-%m'), t.country
