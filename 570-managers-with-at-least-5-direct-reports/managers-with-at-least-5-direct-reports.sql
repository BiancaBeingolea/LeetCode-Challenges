select
    a.name
from employee as a join employee as b on a.id = b.managerId
group by a.name, a.id
having count(b.managerId) >= 5;