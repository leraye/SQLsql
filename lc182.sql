## LC 182
# MySQL

select
	Email
from
	Person
group by
	Email
having
	count(Id) > 1
