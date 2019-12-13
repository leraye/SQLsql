## LC 1075
# MySQL

SELECT p.project_id, round(avg(e.experience_years), 2) as average_years
FROM Project p, Employee e
WHERE p.employee_id = e.employee_id
GROUP by p.project_id
