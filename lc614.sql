## LC 614
# MySQL Server

SELECT
    DISTINCT
    x.follower,
    y.num
FROM
    follow x,
(SELECT
    followee,
    COUNT(DISTINCT follower) AS num
FROM
    follow
GROUP BY
    followee) y
WHERE
    x.follower = y.followee
ORDER BY
    x.follower
