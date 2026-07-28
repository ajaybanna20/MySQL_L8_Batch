use joinsdb;
CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50)
);
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance'),
(104, 'Marketing');
CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(50),
DepartmentID INT
);
INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID)
VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 105), -- No matching department
(4, 'David', NULL), -- No department assigned
(5, 'Eva', 101);

select * from departments;
select * from emplayees; -- department_id -> match with departmentid of department

select e.emplayeeid, e.employeename, e.departmentid,
d.departmentid, d.departmentname from employees as e 
join departments as d
where e.departmentid=d.departmentid;

--  new syntax
select e.employeeid, e.employeename, e.departmentid,
d.departmentid, d.departmentname
from employees as e join departments as d
on e.departmentid=d.departmentid;

-- left new syntax
select e.employeeid, e.employeename, e.departmentid,
d.departmentid, d.departmentname from employees as e
join departments as d left join employees as e
on e.departmentid=d.departmentid;

-- primary key is a key is used to identify each row from a coloum
-- foregin key is key is used to make a connection/ relation between two or more tables