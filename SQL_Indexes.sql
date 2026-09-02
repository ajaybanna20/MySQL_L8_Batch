-- Indexes 
-- Indexes is an object in your database which is used to improve the data retrival process 
-- object is a named data structure used to store, manage, manipulate,
     -- or reference data within a Relational Database Management System (RDBMS)
     
use newdb2;
drop table test18;

Create table test18 (id int , name varchar(20));

insert into test18 value(1, 'a'), (3, 'b'), (2, 'c'), (5, 'd'), (4, 'e');

explain select * from test18 where id=3;

-- Btree (binary tree) Structure 
-- cluseter index --> primary key --> phalysicalay shorte data
-- Non cluster index

select * from test18;

alter table test18 add primary key(id);

desc test18;

explain select * from test18 where id=3;

explain select * from test18 where name='a';
select * from test18;

create index name_index on test18(name);
show indexes from test18;
explain select * from test18 where name='d';



