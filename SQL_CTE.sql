-- CTE
-- common Tabel Expression 
-- CTE store the result of the sql query on a temperory basis
-- CTE are only availabe during till the  execution of a sql query ( SQL Query over CTE Over)
-- CTE improves readibilty
-- You can use CTE to run your logic multiple times

-- CTE
use viewdb1;
-- CTAS. -> create table as select statement

create table city_t2 as select * from world.city;

select * from City_t2;

select * from city_t2 as c
where population =( select max(population) from city_t2
                     where district =c.district);
				
with district_max as(
select district , max(population) as d_population
from city_t2
group by district)

select * from district_max as dm join city_t2 as c
on c.district=dm.district and c.population=dm.d_population;

-- which city has the 3rd highest population from city table

with cte as (
select max(population) from city_t2
where population < 
( select max(population) from city_t2))

,cte2 as(
select max(population) from city_t2 where population < (select * from cte))

select * from city_t2 where population=(select * from cte2);

