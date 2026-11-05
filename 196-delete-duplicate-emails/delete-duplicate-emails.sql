delete from person
where id not in (
    select min_id from (
        select 
            min(id) as min_id 
        from person
        group by email
    ) as temp_person
);