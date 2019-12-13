## LC 1179
# MSSQL Server

SELECT
    id,
    Jan AS Jan_Revenue,
    Feb AS Feb_Revenue,
    Mar AS Mar_Revenue,
    Apr AS Apr_Revenue,
    May AS May_Revenue,
    Jun AS Jun_Revenue,
    Jul AS Jul_Revenue,
    Aug AS Aug_Revenue,
    Sep AS Sep_Revenue,
    Oct AS Oct_Revenue,
    Nov AS Nov_Revenue,
    Dec AS Dec_Revenue
FROM
    Department AS src
PIVOT
    (
        MIN(revenue)
        FOR month in ([Jan], [Feb], [Mar], [Apr], [May], [Jun], [Jul], [Aug], [Sep], [Oct], [Nov], [Dec])
    ) AS pvt
