with salary_ranked as (
    select
        salary,
        dense_rank() over (order by salary desc) as salary_rank
    from employee
)
select max(salary) as SecondHighestSalary # max will return null if no rows meet condition
from salary_ranked
where salary_rank = 2;