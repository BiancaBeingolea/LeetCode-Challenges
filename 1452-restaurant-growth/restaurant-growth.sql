# aggregate multiple customer transactions into a single total per date
with daily_totals as (
    select 
        visited_on,
        sum(amount) as daily_amount
    from customer
    group by visited_on
),
# calculate the 7-day rolling sum and get the average
rolling_stats as (
    select
        visited_on,
        sum(daily_amount) over (order by visited_on rows between 6 preceding and current row) as amount, # total 7-day amount
        round(avg(daily_amount) over (order by visited_on rows between 6 preceding and current row), 2) as average_amount # average 7-day amount
    from daily_totals
)
# filter out the first 6 days so only complete 7-day periods are returned
select
    visited_on,
    amount,
    average_amount
from rolling_stats
where visited_on >= (
    select date_add(min(visited_on), interval 6 day) # min start date + 6 days marks the first valid 7-day window
    from customer
)
order by visited_on;
