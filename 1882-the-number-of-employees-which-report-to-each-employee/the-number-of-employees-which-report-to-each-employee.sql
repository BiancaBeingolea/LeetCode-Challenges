select
    a.employee_id,
    a.name,
    count(b.employee_id) as reports_count,
    round(avg(b.age)) as average_age
from employees as a join employees as b on a.employee_id = b.reports_to # get managers
group by a.employee_id, a.name # aggregating by manager
order by a.employee_id;