## LC 1241
# MySQL

SELECT
    p.post_id,
    COUNT(DISTINCT s.sub_id) AS number_of_comments
FROM
    (
        SELECT
            DISTINCT sub_id as post_id
        FROM
            Submissions
        WHERE
            parent_id IS NULL
    ) p LEFT JOIN
    Submissions s
    ON p.post_id = s.parent_id
GROUP BY
    p.post_id
