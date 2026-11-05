with salary_ranking as (
    select
        departmentId,
        name as Employee, 
        salary as Salary,
        dense_rank() over (partition by departmentId order by salary desc) as salary_rank
    from employee
    order by salary_rank desc
)
select 
    d.name as Department,
    r.Employee,
    r.Salary
from salary_ranking as r join department as d on r.departmentId = d.id
where salary_rank <= 3