## LC 615
# MSSQL Server

WITH temp AS (
     SELECT
	left(pay_date, 7) AS pay_month,
    	e.department_id,
    	AVG(amount) OVER (PARTITION BY left(pay_date, 7)) AS cavg,
    	AVG(amount) OVER (PARTITION BY left(pay_date, 7), e.department_id) AS davg
     FROM
	salary s,
    	employee e
     WHERE
	s.employee_id = e.employee_id
)
SELECT
    DISTINCT t.pay_month,
    t.department_id,
    (CASE
        WHEN t.davg > t.cavg THEN 'higher'
        WHEN t.davg < t.cavg THEN 'lower'
        ELSE 'same'
    END) AS comparison
FROM
    temp t
