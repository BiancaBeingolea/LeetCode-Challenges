# get name and bonus for employees with bonus = 0 or < 1000
select
    a.name,
    b.bonus
from employee as a left join bonus as b on a.empId = b.empId
where bonus is null or bonus < 1000;

