USE EXAMPLE;

-- Q1
-- Find the names and salaries of employees who work at the same department as 'Zlotkey'
SELECT first_name, last_name, salary
FROM employees
WHERE department_id IN (
			SELECT department_id
			FROM employees
			WHERE last_name = 'Zlotkey'
			);

-- Q2
-- Find the employee_id, names and salaries of employees whose salaries are higher than the average salary of the compnany.
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > (
		SELECT AVG(salary)
		FROM employees
		);

-- Q3
-- Find the last_name, job_id, and salaries of employees whose salaries are higher than those of employees whose job_id = 'SA_MAN'
SELECT last_name, job_id, salary
FROM employees
WHERE salary > ALL (
		SELECT salary
		FROM employees
		WHERE job_id = 'SA_MAN'
		);

-- Q4
-- Find the employee_id, last_name of employees who work at the same department as employees whose last names include 'u'
SELECT employee_id, last_name
FROM employees
WHERE department_id IN (
			SELECT DISTINCT department_id
			FROM employees
			WHERE last_name LIKE '%u%'
			);

-- Q5
-- Find the employee_id of employees who work at the department with the location_id at 1700
SELECT employee_id
FROM employees
WHERE department_id IN (
			SELECT DISTINCT department_id
			FROM departments
			WHERE location_id = 1700
			);

-- Q6
-- Find the names, salaries of employees whose manager if 'King'
SELECT last_name, salary
FROM employees
WHERE manager_id IN (
	SELECT employee_id
	FROM employees
	WHERE last_name = 'King'
);

-- Q7
-- Find the last_name and salaries of employees with the lowest salary
SELECT last_name, salary
FROM employees
WHERE salary = (
		SELECT MIN(salary)
		FROM employees
		);

-- Q8
-- Find the department info of the department with the lowest average salary among all departments
-- SELECT *
-- FROM departments
-- WHERE department_id in (
-- 			SELECT department_id
-- 			FROM employees
-- 			GROUP BY department_id
-- 			having AVG(salary) = (
-- 						SELECT MIN(avg_salary)
-- 						FROM (
-- 							SELECT AVG(salary) avg_salary
-- 							FROM employees
-- 							GROUP BY department_id
-- 							) t_dept_avg_sal
-- 						)
-- 			);
SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN (
 			SELECT DEPARTMENT_ID
 			FROM EMPLOYEES
 			GROUP BY DEPARTMENT_ID
 			HAVING AVG(SALARY) <= ALL (
						SELECT AVG(SALARY) AVG_SALARY
						FROM EMPLOYEES
						GROUP BY DEPARTMENT_ID
						)
			);
