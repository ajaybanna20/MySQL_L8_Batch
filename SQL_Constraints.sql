drop database if exists foreigndb;
create database foreigndb;

use foreigndb;


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

INSERT INTO customers VALUES
(101,'John'),
(102,'Alice'),
(103,'David'),
(108,'Ajay');


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

INSERT INTO products VALUES
(1,'Laptop'),
(2,'Mouse'),
(3,'Keyboard');



CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT, -- FORIGN KEY
    product_id INT,
    quantity INT,
    
    CONSTRAINT CUSTOMER_ID_FK FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS (CUSTOMER_ID) ON DELETE cascade,
    
    CONSTRAINT PRODUCT_ID_FK FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS (PRODUCT_ID)
);

INSERT INTO orders
VALUES
(10001,101,2,9);

INSERT INTO orders
VALUES
(10002,108,2,5);

INSERT INTO orders
VALUES
(10003,101,7,2);



-- we do join. [Wrong name]
SELECT *
FROM orders o
LEFT JOIN customers c
ON o.customer_id=c.customer_id;

SELECT *
FROM orders o
LEFT JOIN product p
ON o.product_id=p.product_id;


-- wrong can't order if the product is not listed
SELECT *
FROM orders o
LEFT JOIN products p
ON o.product_id=p.product_id;




-- ----------- $$$$$$$$ ------

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

select * from products;

select * from orders;

select * from customers;
-- DML (INSERT)
DELETE FROM CUSTOMERS WHERE CUSTOMER_ID=101; -- PARENT RECORD delete
-- ALSO CHILD RECORD WILL BE DELETE (ORDER TABLE)
SELECT * FROM CUSTOMERS;

-- FOREIGN KEY SYNTAX
CREATE TABLE child_table_name (
    column1 data_type,
    column2 data_type,
    ...
    CONSTRAINT fk_constraint_name 
    FOREIGN KEY (child_column_name) 
    REFERENCES parent_table_name (parent_column_name)
);

