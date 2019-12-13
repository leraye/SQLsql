## LC 1148
# MySQL

SELECT
	DISTINCT v.viewer_id AS id
FROM
	Views v
WHERE
	v.author_id = v.viewer_id
ORDER BY
	v.viewer_id
