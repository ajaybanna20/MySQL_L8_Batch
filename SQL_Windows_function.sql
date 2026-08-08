-- WINDOWS FUCNTION

-- windows fucntion are the function which are used to perform the calculation on set of rows
-- this calculation are done in relation to the current row
-- windows fuction do not collaps the data like group by

create database windows10db;

use windows10db;

create table employees(id int,name varchar(20), dept varchar(20), salary int);

insert into employees values(1, 'a', 'hr', 100), (2, 'b', 'hr', 200), (3, 'c', 'marketing', 300), (4, 'd', 'marketing' , 400),
(5, 'e', 'hr', 500);

select dept,sum(salary) from employees group by dept; -- total salary by dept
select dept,name, sum(salary) from employees group by dept; -- name is not in group

select dept,name, sum(salary) from employees group by dept,name;-- name is not in group by

select *,(select sum(salary) from employees) from employees;

select *,(select sum(salary) from employees where employees.dept=e.dept) from employeed as e;


select *,sum(salary) over(), sum(salary) over()-salary as difference from employees;

select *,sum(salary) over(), sum(salary) over(partition by dept) from employees; 


CREATE TABLE employee_sales (
    sale_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    sale_date DATE,
    sales_amount DECIMAL(10,2)
);



INSERT INTO employee_sales
    (sale_id, employee_name, department, sale_date, sales_amount)
VALUES
    (1,  'Alice', 'Electronics', '2026-01-05', 1200.00),
    (2,  'Bob',   'Electronics', '2026-01-08', 1800.00),
    (3,  'Alice', 'Electronics', '2026-01-15', 1500.00),
    (4,  'Charlie','Electronics','2026-01-20', 1800.00),
    (5,  'Bob',   'Electronics', '2026-01-25', 2200.00),

    (6,  'David', 'Furniture',   '2026-01-03', 2500.00),
    (7,  'Emma',  'Furniture',   '2026-01-10', 1800.00),
    (8,  'David', 'Furniture',   '2026-01-18', 3000.00),
    (9,  'Frank', 'Furniture',   '2026-01-22', 1800.00),
    (10, 'Emma',  'Furniture',   '2026-01-28', 3200.00),

    (11, 'George','Clothing',    '2026-01-04', 900.00),
    (12, 'Helen', 'Clothing',    '2026-01-09', 1400.00),
    (13, 'George','Clothing',    '2026-01-16', 1100.00),
    (14, 'Helen', 'Clothing',    '2026-01-21', 1400.00),
    (15, 'Ian',   'Clothing',    '2026-01-27', 2000.00);
    
    select *,sum(sales_amount) over( partition by department) from employee_sales;
    
	select employee_name, department, sales_amount,
    sum(sales_amount) over( partition by department) from employee_sales;
    
    select employee_name, department, sales_amount,
    sum(sales_amount) over(partition by employee_name) from employee_sales;
    
    select employee_name, department, sales_amount, 
    avg(sales_amount) over(partition by department) as dept_averge,
    sales_amount-avg(sales_amount) over(partition by department) from employee_sales;
    
    