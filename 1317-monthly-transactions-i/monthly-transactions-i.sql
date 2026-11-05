select
    date_format(trans_date, '%Y-%m') as month,
    country,
    count(id) as trans_count,
    count(case when state = 'approved' then 1 end) as approved_count,
    sum(amount) as trans_total_amount,
    sum(if(state = 'approved', amount, 0)) as approved_total_amount
from transactions
group by month, country