drop database if exists newdb2;
create database newdb2;

use newdb2;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);

INSERT INTO Customers VALUES
(101, 'Alice', 'New York'),
(102, 'Bob', 'Chicago'),
(103, 'Charlie', 'Dallas'),
(104, 'David', 'Seattle'),
(105, 'Emma', 'Boston'),
(106, 'Frank', 'Chicago'),
(107, 'Grace', 'Dallas'),
(108, 'Henry', 'Miami');



CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(20)
);


INSERT INTO Orders VALUES
(1001, 101, '2025-01-05', 1200, 'Delivered'),
(1002, 101, '2025-02-15', 800, 'Cancelled'),
(1003, 102, '2025-01-20', 3500, 'Delivered'),
(1004, 102, '2025-03-10', 600, 'Pending'),
(1005, 103, '2025-02-18', 900, 'Delivered'),
(1006, 104, '2025-03-05', 4500, 'Delivered'),
(1007, 104, '2025-04-01', 700, 'Pending'),
(1008, 105, '2025-01-11', 1500, 'Cancelled'),
(1009, 105, '2025-04-12', 2200, 'Delivered'),
(1010, 107, '2025-05-01', 1800, 'Pending');

-- Exist and in
 Select * from customers where customer_id in
 ( select customer_id from orders);
 
 select * from customers where exists 
 (select 1 from orders where orders.customer_id=customers.customer_id);
 
 -- find customer who have never placed an order.
 select * from customers where not exists
 (select 1 from orders where orders.customer_id=customers.customer_id);
 
 -- find customers who have at least one delivered order.
 select c.customer_id,
		c.customer_name
from customers c
where Exists (
               select 1
               from Orders o
               where o.customer_id = c.customer_id
               And o.status = "delivered"
);

-- find customers who have at least one delivered order and pending order.
 select c.customer_id,
		c.customer_name
from customers c
where Exists (
               select 1
               from Orders o
               where o.customer_id = c.customer_id
               And o.status = "delivered"
)
and exists
(select 1
       from orders o
       where o.customer_id = c.customer_id
       And o.status = "pending"
);