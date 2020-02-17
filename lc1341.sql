-- 1341. Movie Rating

-- MySQL

SELECT
    *
FROM
(
    SELECT
        u.name AS results
    FROM
        (
            SELECT
                Users.name,
                COUNT(*) as num_ratings
            FROM
                Movie_Rating,
                Users
            WHERE
                Movie_Rating.user_id = Users.user_id
            GROUP BY
                Users.user_id,
                Users.name
            ORDER BY
                num_ratings DESC,
                Users.name ASC
            LIMIT 1
        ) u
) t1
UNION
(
    SELECT
        m.title AS results
    FROM
        (
            SELECT
                Movies.movie_id,
                Movies.title,
                AVG(rating) AS avg_ratings
            FROM
                Movies,
                Movie_Rating
            WHERE
                Movies.movie_id = Movie_Rating.movie_id
            AND
                DATE_FORMAT(Movie_Rating.created_at, '%Y-%m') = "2020-02"
            GROUP BY
                Movies.movie_id,
                Movies.title
            ORDER BY
                avg_ratings DESC,
                Movies.title ASC
            LIMIT 1
        ) m
)
