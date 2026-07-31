use corr_db;

create table orders1( order_id int, name varchar(20), amount int);

insert into orders1 value(1, 'a', 100), (2, 'a', 200), (3, 'a', 300), (4, 'b', 400),
(5, 'b', 300), (6, 'c', 400) , (7, 'c', 600);

select * from orders1;

select order_id, name, amount 
from orders1 
where name='a' and amount = (select max(amount) from orders1 where name='a');

select order_id, name, amount 
from orders1 as o_outer 
where amount = (select max(amount) from orders1
where name=o_outer.name);w

