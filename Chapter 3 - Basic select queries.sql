USE EXAMPLE;

SELECT employee_id , last_name,salary * 12 "ANNUAL SALARY"
FROM employees;

SELECT employee_id,last_name,salary * 12 * (1 + IFNULL(commission_pct,0)) "ANNUAL SALARY"
FROM employees;

SELECT DISTINCT job_id
FROM employees;

SELECT last_name, salary
FROM employees
WHERE salary > 12000;

SELECT last_name, department_id
FROM employees
WHERE employee_id = 176;

DESC departments;
SELECT * FROM departments;
