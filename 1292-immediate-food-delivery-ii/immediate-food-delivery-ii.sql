with earliest_order as (
    select 
        customer_id,
        min(order_date) as first_order_date
    from delivery
    group by customer_id
)
select
    round(count(if(b.customer_pref_delivery_date = a.first_order_date, 1, null)) / count(b.delivery_id) * 100, 2) as immediate_percentage
from earliest_order as a 
    join delivery as b on a.customer_id = b.customer_id
        and a.first_order_date = b.order_date