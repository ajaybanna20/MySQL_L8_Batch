/*
Group by
Joins
Subquery
Windows Functions complete (NTILE) (learn by your selft NTILE)
Functions

Mocks 
Test written and mocks

DDL, DML, DCL, TCL, DQL, [80% complete]

*/

-- DDL (Data defination Langauge)
-- Data ka structure
-- Create

Create Database Testdb6;

use Testdb6;

-- table Structure
create table testdb6.employee1(id int);

select * from testdb6.employee1;

drop table testdb6.employee1; -- drop the table[data is remove and also its structure]
select * from testdb6.employee1;

-- Second time
create table testdb6.employee1(id int);
select * from testdb6.employee1;

-- DDL [ALTER] commands
alter table testdb6.employee1 add column name varchar(20); -- added a column
alter table testdb6.employee1 drop column id; -- dropped a specific column

select * from testdb6.employee1;

desc testdb6.employee1;
alter table testdb6.employee1 modify column name int; -- change the data type

desc testdb6.employee1; -- desc  means describe 

alter table testdb6.employee1 add column empid int; -- add a column
desc testdb6.employee1;

-- to add constraints
alter table testdb6.employee1 add constraint unique(name); -- uniqe constraint
desc testdb6.employee1;

alter table testdb6.employee1 modify column empid int not null; -- not null on table coulumn
desc testdb6.employee1;

alter table testdb6.employee1 add constraint primary key(empid); -- Primary key
desc testdb6.employee1;

-- rename columns and table
alter table testdb6.employee1 rename column empid to id; -- column rename
desc testdb6.employee1;

alter table testdb6.employee1 rename to employee2; --  table rename
desc testdb6.employee2;

-- Truncate
select * from testdb6.employee2;
Insert into testdb6.employee2 value(100,80);
select * from testdb6.employee2;

truncate testdb6.employee2; -- first it drop the table then recreate the table again(it does not delete the data in table , it recrate the table again)
select * from testdb6.employee2;

-- DDL Commands 
-- Create ( create the structure of data)
-- drop  ( it remove of delete the structure of data
-- alter  ( rename of modify the structure of data) 
-- truncate ( it recreate the structure of data)

-- Update command
desc testdb6.employee2;
alter table testdb6.employee2 drop constraint name; -- remove unique constraint

select * from testdb6.employee2;
SET SQL_SAFE_UPDATEs = 0;

insert into testdb6.employee2 value (10,99) ,(13,200) ,(11,899),(12,5789),(10,10910);
update testdb6.employee2 set name= '899'; -- will make changes to every row

update testdb6.employee2 set name='7123' where id=199;
select * from testdb6.employee2;

-- delete command
delete from testdb6.employee2 where name=10;

select * from testdb6.employee2;

