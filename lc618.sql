## LC 618
# MSSQL Server

select
	America,
	Asia,
	Europe
from
   (
	select
		name,
		continent,
 		row_number() over(partition by continent order by name) as id
from student
    ) as src
pivot
(
	min(name)
    	for continent in ([America], [Asia], [Europe])
) as pvt
