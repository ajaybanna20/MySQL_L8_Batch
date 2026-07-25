use world;
select name, indepyear, indepyear+100, ifnull(indepyear,0) from country; -- replace null value with any value 

select name, indepyear, lifeexpectancy, coalesce(indepyear, lifeexpectancy, name) from country; -- return first not null value

-- Case Statement

select name, population, indepyear, 
if(indepyear>1947, 'After India',
if(indepyear>1920,'just before india', 'before india indepyear')) from country;

select name,  population, indepyear,
case
    when  indepyear>1947     then  'after 1947'
    when   indepyear>=1919    then  'only after 1919'
    
   else 'else condition'
end
from country;

select name, population,
case
	 when 500000<population      then  'large population'
     when 200000<population<500000 then 'average population'
     
     else 'low population'
end
from country;



select continent , count(name) as total_countries,
case
     when count(name)>=25 then 'large continet'
     when count(name)>=15 then 'average continent'
     
     else 'low continet'
end as continent_column
from country group by continent;


     
     



