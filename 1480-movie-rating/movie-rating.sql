(
    select
        u.name as results
    from movieRating as mr
        join movies as m on mr.movie_id = m.movie_id
        join users as u on mr.user_id = u.user_id
    group by u.name
    order by count(mr.user_id) desc, u.name asc limit 1
)
union all
(
    select
        m.title as results
    from movieRating as mr
        join movies as m on mr.movie_id = m.movie_id
    where created_at between '2020-02-01' and '2020-02-29'
    group by m.title
    order by avg(rating) desc, m.title asc limit 1
)