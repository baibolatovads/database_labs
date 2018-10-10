CREATE TABLE Warehouses(
	code SERIAL,
	location VARCHAR(255),
	capacity INT
);

CREATE TABLE Boxes(
	code CHAR(4),
	contents VARCHAR(255),
	value REAL,
	warehouse INT
);
SELECT * FROM Warehouses;

SELECT * FROM Warehouses;
SELECT * FROM Boxes WHERE value > 150;
SELECT DISTINCT ON(contents) * FROM Boxes;
SELECT code, sum(capacity) FROM Warehouses GROUP BY code;
INSERT INTO Warehouses VALUES(1, 'Chicago', 3),
(1, 'Almaty', 5),
(2, 'New York', 6);
SELECT code, sum(capacity) FROM Warehouses GROUP BY code HAVING sum(capacity) > 2;
INSERT INTO Warehouses VALUES (DEFAULT, 'New York', 3);
INSERT INTO Boxes VALUES('H5RT', 'Papers', 200, 2);
UPDATE Boxes SET value = value - 0.15 WHERE warehouse = (SELECT code FROM Warehouses ORDER BY capacity DESC LIMIT 1 OFFSET 2);
DELETE FROM Boxes WHERE value < 150;
DELETE FROM Boxes WHERE warehouse IN (SELECT code FROM Warehouses WHERE location = 'New York') RETURNING *;
