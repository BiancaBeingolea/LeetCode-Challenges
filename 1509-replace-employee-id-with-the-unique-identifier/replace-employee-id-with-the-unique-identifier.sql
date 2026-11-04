select
    b.unique_id,
    a.name
from employees as a left join employeeUNI as b on a.id = b.id;
