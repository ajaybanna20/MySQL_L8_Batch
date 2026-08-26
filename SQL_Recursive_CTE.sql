-- Recursive CTE
-- Set operation  -> used to combined rows from multiple quereies


use newdb2;

create table city3 as select id , name , population from world.city limit 3;

create table city2 as select id , name , population from world.city limit 2;

-- UNION , UNION ALL , INTERSECT, EXCEPT
select * from city3
union                 -- Merges two result sets vertically while removing all duplicate rows.
select * from city2;

select * from city3
union all             -- Merges two result sets vertically while keeping all duplicate rows for faster performance.
select * from city2;

select * from city3
intersect             -- Returns only the distinct rows that exist in both result sets.
select * from city2;

select * from city3
except                -- Returns distinct rows from the first result set that do not exist in the second.
select * from city2;

-- Recursive CTE

with recursive cte as
( select 10 as num
union 
select num+1 from cte
where num<14
)
select * from cte;


use newdb2;
Create table employees (
     emp_id INT,
     emp_name VARCHAR (100),
     manager_id INT
);

Insert Into employees (emp_id, emp_name ,manager_id)
values
	(1, 'John', Null),
    (2, 'Alice', 1),
    (3, 'Devid', 1),
    (4, 'Bob', 2),
    (5, 'Sarah', 2),
    (6, 'Mike', 3),
    (7, 'Tom', 4);
    
--  using normal CTE

with tempcte as
( select *, emp_name as hireachy from employees where manager_id is Null )

select * from tempcte
union 

select e.emp_id , e.emp_name, e.manager_id, concat(e.emp_name, '->', tempcte.hireachy) as hireachy
from employees as e join tempcte
on e.manager_id=tempcte.emp_id where e.emp_id=2;


-- Using  recursive CTE
with recursive tempcte as
( select *, emp_name as hireachy from employees where manager_id is Null 

union 

select e.emp_id , e.emp_name, e.manager_id, concat(e.emp_name, '->', tempcte.hireachy) as hireachy
from employees as e join tempcte
on e.manager_id=tempcte.emp_id )

select * from tempcte;

-- Using  recursive CTE through level
with recursive tempcte as
( select *, 1 as level from employees where manager_id is Null 

union 

select e.emp_id , e.emp_name, e.manager_id, level+1 as level
from employees as e join tempcte
on e.manager_id=tempcte.emp_id )

select * from tempcte; 

