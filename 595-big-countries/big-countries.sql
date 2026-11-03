# return name, population and area of big countries
select
    name,
    population,
    area
from world
where area >= 3000000 or population >= 25000000;