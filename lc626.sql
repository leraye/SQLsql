## LC 626
# MySQL

SELECT
    s.id,
    (CASE 
        WHEN mod(s.id, 2) = 1 THEN IFNULL(y.student, s.student)
        WHEN mod(s.id, 2) = 0 THEN x.student
    END) AS student
FROM
    seat x
RIGHT JOIN
    seat s
ON
    s.id = x.id + 1
LEFT JOIN
    seat y
ON
    y.id = s.id + 1
