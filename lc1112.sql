## LC 1112
# MySQL

WITH x AS (
    SELECT
        student_id,
        course_id,
        grade,
        ROW_NUMBER() OVER (
            PARTITION BY student_id
            ORDER BY grade DESC, course_id ASC
        ) AS rank
    FROM
        Enrollments
)
SELECT
    x.student_id,
    x.course_id,
    x.grade
FROM
    x
WHERE
    x.rank = 1
