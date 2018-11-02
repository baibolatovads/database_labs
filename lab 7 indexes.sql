CREATE TABLE salesman(
	salesman_id INT PRIMARY KEY,
	name VARCHAR(255),
	city VARCHAR(255),
	commission NUMERIC
);

CREATE TABLE customers(
	customer_id INT PRIMARY KEY,
	cust_name VARCHAR(255),
	city VARCHAR(255),
	grade INT,
	salesman_id INT REFERENCES salesman
);

CREATE TABLE orders(
	ord_no INT PRIMARY KEY,
	purch_amt NUMERIC,
	ord_date DATE,
	customer_id INT REFERENCES customers,
	salesman_id INT REFERENCES salesman
);

--1 
CREATE ROLE junior_dev LOGIN;

--2
CREATE VIEW new_york_salesmen AS 
	SELECT * FROM salesman WHERE city = 'New York';
--3
CREATE VIEW customer_salesman AS
	SELECT 