-- 1322. Ads Performance

-- MS SQL Server

WITH cte AS (
    SELECT
        ad_id,
        SUM(
            CASE
                WHEN action = 'Ignored' THEN 0
                ELSE 1
            END
        ) AS total
    FROM
        Ads
    GROUP BY
        ad_id
)
SELECT
    Ads.ad_id,
    CAST(100.0 * SUM(CASE WHEN action='Clicked' THEN 1 ELSE 0 END) / (CASE WHEN AVG(total) = 0 THEN 1 ELSE AVG(total) END) AS DECIMAL(5, 2)) AS ctr
FROM
    Ads,
    cte
WHERE
    Ads.ad_id = cte.ad_id
GROUP BY
    Ads.ad_id
ORDER BY
    ctr DESC, Ads.ad_id
