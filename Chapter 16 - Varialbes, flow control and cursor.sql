-- Variables
CREATE DATABASE test16_var_cur;
USE test16_var_cur;

CREATE TABLE employees
AS
SELECT * FROM atguigudb.`employees`;

CREATE TABLE departments
AS
SELECT * FROM atguigudb.`departments`;

DELIMITER //
CREATE FUNCTION get_count() RETURNS INT
	BEGIN
		DECLARE c INT DEFAULT 0;
		SELECT COUNT(*) INTO c
		FROM employees;
		RETURN c;
	END //
DELIMITER ;

SELECT get_count();

DELIMITER //
CREATE FUNCTION ename_salary(emp_name VARCHAR(15))
RETURNS DOUBLE
	BEGIN
		SET @sal=0;
		SELECT salary INTO @sal
		FROM employees
		WHERE last_name = emp_name;
		RETURN @sal;
	END //
DELIMITER ;

SELECT ename_salary('Abel');

DELIMITER //
CREATE FUNCTION dept_sal(dept_name VARCHAR(15))
RETURNS DOUBLE
	BEGIN
		DECLARE avg_sal DOUBLE;
		SELECT AVG(salary) INTO avg_sal
		FROM employees e
		JOIN departments d ON e.department_id = d.department_id
		WHERE d.department_name=dept_name;
		RETURN avg_sal;
	END //
DELIMITER ;

SELECT dept_sal('Marketing');

DELIMITER //
CREATE FUNCTION add_float(value1 FLOAT,value2 FLOAT)
RETURNS FLOAT
	BEGIN
		DECLARE SUM FLOAT;
		SET SUM=value1+value2;
		RETURN SUM;
	END //
DELIMITER ;

SET @v1 := 12.2;
SET @v2 = 2.3;
SELECT add_float(@v1,@v2);

-- Flow control
CREATE TABLE ADMIN(
	id INT PRIMARY KEY AUTO_INCREMENT,
	user_name VARCHAR(25) NOT NULL,
	user_pwd VARCHAR(35) NOT NULL
);

SELECT * FROM ADMIN;
DELIMITER //
CREATE FUNCTION test_if_case1(score DOUBLE)
RETURNS CHAR
	BEGIN
		DECLARE ch CHAR;
		IF score>90
		THEN SET ch='A';
		ELSEIF score>80
		THEN SET ch='B';
		ELSEIF score>60
		THEN SET ch='C';
		ELSE SET ch='D';
		END IF;
		RETURN ch;
	END //
DELIMITER ;

SELECT test_if_case1(87);

DELIMITER //
CREATE FUNCTION test_if_case2(score DOUBLE)
RETURNS CHAR
	BEGIN
		DECLARE ch CHAR;
		CASE
		WHEN score>90 THEN SET ch='A';
		WHEN score>80 THEN SET ch='B';
		WHEN score>60 THEN SET ch='C';
		ELSE SET ch='D';
		END CASE;
		RETURN ch;
	END //
DELIMITER ;

SELECT test_if_case2(67);

DELIMITER //
CREATE PROCEDURE test_if_pro(IN sal DOUBLE)
	BEGIN
		IF sal<3000
		THEN DELETE FROM employees WHERE salary = sal;
		ELSEIF sal <= 5000
		THEN UPDATE employees SET salary = salary+1000 WHERE salary = sal;
		ELSE
		UPDATE employees SET salary = salary+500 WHERE salary = sal;
	END IF;
END //

DELIMITER ;
SELECT * FROM employees;

CALL test_if_pro(3100);

-- Cursor
DELIMITER //
CREATE PROCEDURE update_salary(IN dept_id INT,IN change_sal_count INT)
BEGIN

DECLARE int_count INT DEFAULT 0;
DECLARE salary_rate DOUBLE DEFAULT 0.0;
DECLARE emp_id INT;
DECLARE emp_hire_date DATE;

DECLARE emp_cursor CURSOR FOR SELECT employee_id,hire_date FROM employees
WHERE department_id = dept_id ORDER BY salary ;

OPEN emp_cursor;
WHILE int_count < change_sal_count DO

FETCH emp_cursor INTO emp_id,emp_hire_date;
IF(YEAR(emp_hire_date) < 1995)
THEN SET salary_rate = 1.2;
ELSEIF(YEAR(emp_hire_date) <= 1998)
THEN SET salary_rate = 1.15;
ELSEIF(YEAR(emp_hire_date) <= 2001)
THEN SET salary_rate = 1.10;
ELSE SET salary_rate = 1.05;
END IF;

UPDATE employees SET salary = salary * salary_rate
WHERE employee_id = emp_id;

SET int_count = int_count + 1;
END WHILE;

CLOSE emp_cursor;
END //
DELIMITER ;

CALL update_salary(50,2);