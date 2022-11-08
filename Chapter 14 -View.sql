USE EXAMPLE;

CREATE OR REPLACE VIEW employee_vu
AS
SELECT last_name,employee_id,department_id
FROM employees;

DESC employee_vu;

SELECT * FROM employee_vu;

CREATE OR REPLACE VIEW employee_vu
AS
SELECT last_name,employee_id,department_id
FROM employees
WHERE department_id = 80;

CREATE TABLE emps
AS
SELECT * FROM atguigudb.employees;

CREATE TABLE emps
AS
SELECT * FROM atguigudb.employees;


CREATE OR REPLACE VIEW emp_v1
AS
SELECT last_name,salary,email
FROM emps
WHERE phone_number LIKE '011%';
SELECT *
FROM emp_v1;


CREATE OR REPLACE VIEW emp_v1
AS
SELECT last_name,salary,email,phone_number
FROM emps
WHERE phone_number LIKE '011%'
AND email LIKE '%e%';

DESC emps;
DESC emp_v1;
INSERT INTO emp_v1(last_name,salary,email,phone_number)
VALUES('Tom',2300,'tom@126.com','1322321312');

UPDATE emp_v1
SET salary = salary + 1000;

DELETE FROM emp_v1
WHERE last_name = 'Olsen';

CREATE OR REPLACE VIEW emp_v2
AS
SELECT department_id,MAX(salary) max_sal
FROM emps
GROUP BY department_id
HAVING MAX(salary)>12000;

SELECT *
FROM emp_v2;

INSERT INTO emp_v2
VALUES(400,18000);

DROP VIEW IF EXISTS emp_v1,emp_v2;
