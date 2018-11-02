CREATE DATABASE lab8; --1
--2
CREATE TABLE salesman(
	salesman_id INT PRIMARY KEY,
	name VARCHAR(255),
	city VARCHAR(255),
	comission DOUBLE PRECISION
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
	purch_amt DOUBLE PRECISION,
	ord_date Date,
	customer_id INT REFERENCES customers,
	salesman_id INT REFERENCES salesman
);

--3
CREATE ROLE junior_dev LOGIN;

--4
CREATE VIEW salesman_from_NY AS 
	SELECT name from salesman WHERE city = 'New York';
SELECT * FROM salesman_from_NY;

-5
CREATE VIEW customer_salesman_names AS
	SELECT s.name, c.cust_name FROM salesman AS s, customers AS c, orders AS o 
	WHERE o.customer_id = c.customer_id AND o.salesman_id = s.salesman_id; 
SELECT * FROM customer_salesman_names;
GRANT ALL PRIVILEGES ON customer_salesman_names TO junior_dev;

--6
CREATE VIEW highest_grade AS
	SELECT cust_name FROM customers WHERE grade = (SELECT grade FROM customers ORDER BY grade DESC LIMIT 1);
SELECT * FROM highest_grade;
GRANT SELECT ON highest_grade TO junior_dev;

--7
CREATE VIEW each_city_salesman AS
	SELECT count(salesman_id) FROM salesman GROUP BY city;

--8
CREATE VIEW cust_salesman AS
	SELECT name FROM salesman WHERE salesman_id IN 
	(SELECT salesman_id FROM customers AS c GROUP BY(c.salesman_id) HAVING (count(cust_name) > 1))

--9
CREATE ROLE intern;
GRANT intern to junior_dev;
																			
