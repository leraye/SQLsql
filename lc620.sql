## LC 620
# MySQL

SELECT *
FROM cinema c
WHERE mod(c.id, 2) = 1
AND c.description <> 'boring'
ORDER BY rating DESC
