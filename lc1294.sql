## 1294. Weather Type in Each Country
# MySQL

SELECT
    c.country_name,
    CASE
        WHEN x.weather_state <= 15 THEN 'Cold'
        WHEN x.weather_state >= 25 THEN 'Hot'
        ELSE 'Warm'
    END AS weather_type
FROM
(
    SELECT
        country_id,
        AVG(weather_state) AS weather_state
    FROM
        Weather
    WHERE
        DATE_FORMAT(day, '%Y-%m') = '2019-11'
    GROUP BY
        country_id
) x,
Countries c
WHERE
    x.country_id = c.country_id
