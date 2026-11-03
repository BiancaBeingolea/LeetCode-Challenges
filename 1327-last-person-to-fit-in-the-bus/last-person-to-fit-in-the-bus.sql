with running_weight as (
    select 
    person_name,
    sum(weight) over (order by turn asc) as total_weight
    from queue
)
select person_name
from running_weight
where total_weight <= 1000
order by total_weight desc
limit 1;