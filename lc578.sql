## LC 578
# MySQL

SELECT
	question_id AS 'survey_log'
FROM
	survey_log
GROUP BY
	question_id
ORDER BY
	sum(IF(action = 'answer', 1, 0)) / sum(IF(action = 'show', 1, 0)) DESC
LIMIT 1
