-- views and Indexes
-- views are the object work as virtual table

-- view are the virtual table that access the data from base table/ underline table
-- view can stored query not data

-- why view
-- view virutal table that centralizze the logic/data
-- view is used to simplifies complex query
-- it help in data security -- we can hide the important data without changing permission of table

create database viewdb1;

use viewdb1;

create table employee(id int, name varchar(20) , salary int);
insert into employee value(1, 'ajay', 10000) ,(2, 'aditiya', 20000);

-- create is used to create view object
-- object data structure

create view emp_view as select id, name from employee; -- simple view

select * from emp_view;
select salary from emp_view; -- will give error

-- new row insert in table
insert into employee value(3, 'rahul' ,30000);

select * from emp_view; -- base table change view also get new data

-- insert row in view
insert into employee value(4, 'rahul' ,30000); -- view insert as per column
select * from emp_view;
select * from employee;

drop table employee;
create table employee(id int, name varchar(20) , salary int);
insert into employee value(1, 'ajay', 10000) ,(2, 'aditiya', 20000);
insert into employee value(3, 'rahul' ,30000);
insert into emp_view value(4, 'ayush' ); -- view insert as per column
select * from emp_view;
select * from employee;

create view emp_view_sum as select sum(salary) from employee; -- complex view
select * from emp_view_sum;
insert into emp_view values(80000); -- view is not insertable


-- updetable and non updateble view
-- if view follow this they called no updateble view
-- distinct
-- group by
-- having
-- union or union all
-- subquery in the select list
-- joins

create table orders (id int, name varchar(20) , orders int);
insert into orders value(1, 'ajay', 5) ,(2, 'aditiya', 2);

create view order_view as select id, name from orders;

select * from orders;
select * from order_view;