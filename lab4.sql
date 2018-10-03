CREATE DATABASE lab5;
CREATE TABLE customers(
	customer_id SERIAL PRIMARY KEY,
	cust_name VARCHAR(255),
	city VARCHAR(255),
	grade INT,
	salesman_id INT
);

SELECT cust_name FROM customers WHERE grade > 100;
SELECT cust_name FROM customers WHERE city = 'New York' AND grade > 100;
SELECT cust_name FROM customers WHERE city = 'New York' OR grade > 100;
SELECT * FROM customers WHERE city = 'Paris' OR city = 'Rome';
SELECT cust_name FROM customers WHERE cust_name LIKE 'B%';

CREATE TABLE orders(
	order_id SERIAL PRIMARY KEY,
	customer_id INT,
	description VARCHAR(255),
	purch_amt INT
);

SELECT order_id FROM orders WHERE customer_id IN (SELECT customer_id FROM customers WHERE city = 'New York');
SELECT * FROM customers WHERE customer_id IN (SELECT customer_id FROM orders GROUP BY customer_id HAVING count(order_id) > 10);
SELECT sum(purch_amt) FROM orders;
SELECT order_id, avg(purch_amt) FROM orders GROUP BY order_id;
SELECT cust_name FROM customers WHERE cust_name IS NOT NULL;
SELECT order_id, max(purch_amt) FROM orders GROUP BY order_id;