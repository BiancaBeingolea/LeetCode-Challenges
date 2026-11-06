select
    machine_id,
    round(sum(case
        when activity_type = 'start' then -timestamp
        when activity_type = 'end' then timestamp
    end) / count(distinct process_id), 3) as processing_time
from activity as a1 
group by machine_id