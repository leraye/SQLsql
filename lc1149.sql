## LC 1149
# MySQL

SELECT
	DISTINCT v.viewer_id AS id
FROM
	Views v
GROUP BY
	v.viewer_id, v.view_date
HAVING
	COUNT(DISTINCT v.article_id) > 1
ORDER BY
	v.viewer_id
