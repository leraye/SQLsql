## LC 580
# MySQL

SELECT
	d.dept_name,
	count(s.student_id) as student_number
FROM
	department d
LEFT OUTER JOIN
     	student s
ON
	s.dept_id = d.dept_id
GROUP BY
	d.dept_id
ORDER BY
	count(s.student_id) DESC, d.dept_name
