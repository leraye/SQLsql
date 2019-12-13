## LC 1280
# MSSQL Server

WITH temp AS (
    SELECT
        *
    FROM
        Students,
        Subjects
)
SELECT
    DISTINCT
    temp.student_id,
    temp.student_name,
    temp.subject_name,
    (CASE WHEN x.student_id IS NULL THEN 0 ELSE x.attended_exams END) AS attended_exams
FROM
    temp
LEFT JOIN
    (
        SELECT
            student_id,
            subject_name,
            COUNT(*) AS attended_exams
        FROM
            Examinations
        GROUP BY
            student_id,
            subject_name
    ) x
ON
    temp.student_id = x.student_id
AND
    temp.subject_name = x.subject_name
