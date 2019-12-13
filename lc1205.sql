## LC 1205
# MySQL

select month, country,
    sum(case when type='approved' then 1 else 0 end) as approved_count,
    sum(case when type='approved' then amount else 0 end) as approved_amount,
    sum(case when type='chargeback' then 1 else 0 end) as chargeback_count,
    sum(case when type='chargeback' then amount else 0 end) as chargeback_amount
from (
    (
    select DATE_FORMAT(t.trans_date, '%Y-%m') AS month, t.country, t.amount,'approved' as type
    from Transactions as t
    where t.state='approved'
    ) 
    union all (
    select DATE_FORMAT(Chargebacks.trans_date, '%Y-%m') AS month, country, amount,'chargeback' as type
    from Transactions, Chargebacks
    where Transactions.id = Chargebacks.trans_id
    )
) as new_table
group by month, country
