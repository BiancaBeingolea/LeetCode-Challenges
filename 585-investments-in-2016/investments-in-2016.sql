with same_tiv_2015_and_city as (
    select
        pid,
        count(*) over (partition by tiv_2015) as tiv_enum,
        count(*) over (partition by lat, lon) as city_enum,
        tiv_2016
    from insurance
)
select
    round(sum(tiv_2016), 2) as tiv_2016
from same_tiv_2015_and_city
where tiv_enum > 1 and city_enum = 1;