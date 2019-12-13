## LC 185
# MSSQL Server

with rank_table as (
    select
	d.Name as Department,
        e.Name as Employee,
        e.Salary,
        dense_rank() over (
            partition by e.DepartmentId
            order by e.Salary desc
        ) as salary_rank
    from
	Employee e, Department d
    where
	e.DepartmentId = d.Id
)
select
	Department,
	Employee,
	Salary
from
	rank_table
where
	salary_rank <= 3
