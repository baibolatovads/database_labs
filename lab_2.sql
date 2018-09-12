CREATE DATABASE lab_2;
CREATE TABLE countries(
	country_id SERIAL CONSTRAINT const_pkey_id PRIMARY KEY,
	country_name VARCHAR(50),
	region_id INT,
	population INT
);

INSERT INTO countries (country_id, country_name, region_id, population) VALUES (DEFAULT, 'Kazakhstan', 9, 17000000);

INSERT INTO countries (country_id, country_name) VALUES (DEFAULT, 'Russia');

INSERT INTO countries (region_id) VALUES (NULL);

INSERT INTO countries (country_id, country_name, region_id, population) VALUES
(DEFAULT, 'Norway', 15, 1000000),
(DEFAULT, 'New Zealand', 24, 15000000),
(DEFAULT, 'Australia', 18, 500000);

ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries (country_name) VALUES (DEFAULT);

INSERT INTO countries DEFAULT VALUES;

CREATE TABLE countries_new(
	LIKE countries
);

INSERT INTO countries_new SELECT * FROM countries;

UPDATE countries SET region_id = 1 WHERE region_id IS NULL;

UPDATE countries SET population = population + 1.10
RETURNING country_name, population AS "New Population";

DELETE FROM countries WHERE population < 100000
RETURNING population;

DELETE FROM countries_new AS cn
USING countries  AS c 
WHERE cn.country_id = c.country_id
RETURNING *;

DELETE FROM countries 
RETURNING *;
