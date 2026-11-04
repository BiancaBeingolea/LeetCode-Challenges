select
    case
        when id = (select max(id) from seat) and (id % 2 = 1) then id # last row is even--no change
        when id % 2 = 1 then id + 1 # id is in odd row--swap
        else id - 1 # id is in even row --swap
    end as id,
    student
from seat
order by id asc;