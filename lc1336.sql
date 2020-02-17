-- 1336. Number of Transactions per Visit

-- MS SQL Server

WITH tree(number) AS
(
select (case when max(x.num) is null then 0 else max(x.num) end) as nr from (
    select
        count(amount) as num
    from
        Transactions
    group by
        user_id,
        transaction_date
) as x
    
UNION all

select number-1 AS nr FROM tree WHERE number > 0
)

select
    x.number as transactions_count,
    count(y.user_id) as visits_count
from
    (
        select
            number
        from
            tree
    ) x
left join
    (
    select
            v.user_id,
            v.visit_date,
            sum(case when amount is null then 0 else 1 end) as num
    from
            Visits v
    left join
            Transactions t
    on
            v.user_id = t.user_id
    and
            v.visit_date = t.transaction_date
    group by
            v.user_id,
            v.visit_date
    ) y
on
    x.number = y.num
group by
    x.number
order by
    x.number

