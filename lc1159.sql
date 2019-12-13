## LC 1159
# MSSQL Server

WITH x AS (
    SELECT
        o.seller_id,
        i.item_brand,
        ROW_NUMBER() OVER (
            PARTITION BY o.seller_id
            ORDER BY o.order_date ASC
        ) AS rank
    FROM
        Orders o,
        Items i
    WHERE
        o.item_id = i.item_id
)
SELECT
    u.user_id AS seller_id,
    (CASE
        WHEN x.seller_id IS NULL THEN 'no'
        WHEN x.item_brand = u.favorite_brand THEN 'yes'
        ELSE 'no'
    END) AS '2nd_item_fav_brand'
FROM
    Users u
LEFT JOIN
    x
ON
    u.user_id = x.seller_id
AND
    x.rank = 2
