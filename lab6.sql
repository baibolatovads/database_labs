CREATE TABLE locations(
	location_id SERIAL PRIMARY KEY,
	street_address VARCHAR(255),
	postal_code VARCHAR(12),
	city VARCHAR(30),
	state_province VARCHAR(12)
);

CREATE TABLE departments(
	department_id SERIAL PRIMARY KEY,
	department_name VARCHAR(50) UNIQUE,
	budget INTEGER,
	location_id INTEGER REFERENCES locations
);

CREATE TABLE employees(
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	phone_number VARCHAR(20),
	salary INTEGER,
	department_id INTEGER REFERENCES departments
);

INSERT INTO departments VALUES (DEFAULT, 'Robotics', 500000, DEFAULT);
INSERT INTO departments VALUES (DEFAULT, 'Microeconomy', 400000, DEFAULT);
INSERT INTO departments VALUES (DEFAULT, 'Info', 500000, DEFAULT);

INSERT INTO employees VALUES (DEFAULT, 'Dariya', 'Baibolatova', 'baibolatovads@gmail.com', '87076500500', 1000000, DEFAULT);
INSERT INTO employees VALUES (DEFAULT, 'Ivan', 'Ivanov', 'something.com',NULL, 500000, DEFAULT);
INSERT INTO employees VALUES (DEFAULT, 'Bob', 'Ivanov', 'something.com',NULL, 500000, DEFAULT);
INSERT INTO employees VALUES (DEFAULT, 'Captain', 'America', 'something.com',NULL, 500000, DEFAULT);
INSERT INTO employees VALUES (DEFAULT, 'Rosomaha', NULL , 'something.com',NULL, 500000, DEFAULT);

SELECT 
	first_name, last_name, 
	d.department_id, department_name 
FROM departments AS d INNER JOIN employees AS e ON d.department_id = e.department_id;

SELECT 
	first_name, last_name, 
	d.department_id, department_name 
FROM departments AS d INNER JOIN employees AS e ON d.department_id = e.department_id AND d.department_id IN (40,80);

SELECT 
	first_name, last_name,
	d.department_id, d.department_name, 
	l.city, l.state_province 
FROM employees AS e INNER JOIN departments AS d ON e.department_id = d.department_id
INNER JOIN locations AS l ON l.location_id = d.location_id;

SELECT 
	first_name, last_name,
	d.department_id, d.department_name
FROM departments AS d LEFT JOIN employees AS e ON d.department_id = e.department_id;

SELECT
	first_name, last_name,
	d.department_id, d.department_name
FROM departments AS d RIGHT JOIN employees AS e ON d.department_id = e.department_id;
