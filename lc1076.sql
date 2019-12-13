## LC 1076
# MySQL

SELECT p2.project_id
FROM Project p2
GROUP BY p2.project_id
HAVING count(p2.employee_id) >= ALL (SELECT count(p1.employee_id)
                                     FROM Project p1
                                     GROUP BY p1.project_id)
