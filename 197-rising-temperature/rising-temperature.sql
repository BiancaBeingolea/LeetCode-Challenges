select 
    w1.id
from weather as w1 join weather as w2 on w2.recordDate = date_sub(w1.recordDate, interval 1 day)
where w1.temperature > w2.temperature