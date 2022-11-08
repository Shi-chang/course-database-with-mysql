CREATE DATABASE IF NOT EXISTS dbtest11 CHARACTER SET 'utf8';

USE dbtest11;
CREATE TABLE my_employees(
	id INT(10),
	first_name VARCHAR(10),
	last_name VARCHAR(10),
	userid VARCHAR(10),
	salary DOUBLE(10,2)
);

CREATE TABLE users(
	id INT,
	userid VARCHAR(10),
	department_id INT
);

DESC my_employees;

INSERT INTO my_employees
VALUES
	(1,'patel','Ralph','Rpatel',895),
	(2,'Dancs','Betty','Bdancs',860),
	(3,'Biri','Ben','Bbiri',1100),
	(4,'Newman','Chad','Cnewman',750),
	(5,'Ropeburn','Audrey','Aropebur',1550);
	
INSERT INTO users VALUES
	(1,'Rpatel',10),
	(2,'Bdancs',10),
	(3,'Bbiri',20),
	(4,'Cnewman',30),
	(5,'Aropebur',40)

UPDATE my_employees 
SET last_name='smith' 
WHERE id = 3;

UPDATE my_employees 
SET salary=1000 
WHERE salary<900;

DELETE FROM my_employees
WHERE userid = 'Bbiri';

DELETE DROM users
WHERE userid = 'Bbiri';

DELETE FROM my_employees;
DELETE FROM users;

SELECT * FROM my_employees;
SELECT * FROM users;

TRUNCATE TABLE my_employees;
