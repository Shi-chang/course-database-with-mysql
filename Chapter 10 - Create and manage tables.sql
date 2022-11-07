-- Q1
-- Create a database named test01_office and use 'utf8' character set
CREATE DATABASE IF NOT EXISTS test01_office CHARACTER SET 'utf8';

USE test01_office;

-- Q2
-- Create a table named dept01
CREATE TABLE IF NOT EXISTS dept01(
	id INT(7),
	`name` VARCHAR(25)
);

-- Q3
-- Create a table named dept02 and make it a copy of the 'departments' table from the 'example' database
CREATE TABLE IF NOT EXISTS dept02
AS
SELECT *
FROM example.departments;

SELECT * FROM dept02;

-- Q4
-- Create a table named emp01 with the following fields
-- id INT(7)
-- first_name VARCHAR(25)
-- last_name VARCHAR(25)
-- dept_id INT(7)
CREATE TABLE IF NOT EXISTS emp01(
id INT(7),
first_name VARCHAR(25),
last_name VARCHAR(25),
dept_id INT(7)
);

-- Q5
-- Change the char length of last_name in the emp01 table to be 50
DESC emp01;

ALTER TABLE emp01
MODIFY last_name VARCHAR(50)

DESC emp01;

-- Q6
-- Create a table named emp02 and make it a copy of the 'employees' table from the 'example' database
CREATE TABLE emp02
AS
SELECT *
FROM example.employees

-- Q7
-- Drop table emp01
DROP TABLE IF EXISTS emp01;

-- Q8
-- Rename the table emp02 to be emp01
-- ALTER TABLE IF EXISTS emp02 RENAME TO emp01;
RENAME TABLE emp02 TO emp01;

-- Q9
-- Add a new column named 'test_column' to dept02 and emp01
DESC dept02;
ALTER TABLE dept02
ADD test_column VARCHAR(20);

ALTER TABLE emp01
ADD test_column VARCHAR(20);

-- Q10
-- Delete the column 'department_id' from table emp01
DESC emp01;
ALTER TABLE emp01
DROP COLUMN department_id;
