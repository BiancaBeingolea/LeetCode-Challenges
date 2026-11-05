with get_first_login as (
    select
        player_id,
        min(event_date) as first_login,
        date_add(min(event_date), interval 1 day) as day_after
    from activity
    group by player_id
)
select
    round(count(b.event_date) / count(a.player_id), 2) as fraction # event_date only counts players that played the day after the first login
from get_first_login as a 
    left join activity as b on 
        a.player_id = b.player_id and a.day_after = b.event_date # match next-day activity records, leaving non-matches as null