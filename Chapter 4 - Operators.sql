USE EXAMPLE;

SELECT last_name, salary
FROM employees
WHERE salary < 5000 OR salary > 12000;

SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;

SELECT last_name, department_id
FROM employees
WHERE department_id = 20 OR department_id = 50;

SELECT last_name, department_id
FROM employees
WHERE department_id IN(20, 50);

SELECT last_name, job_id
FROM employees
WHERE manager_id IS NULL;

SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT last_name
FROM employees
WHERE last_name LIKE '__a%';

SELECT last_name
FROM employees
WHERE last_name LIKE '%a%k%' OR last_name LIKE '%k%a%';

SELECT employee_id,first_name,last_name
FROM employees
WHERE first_name LIKE '%e';

SELECT employee_id,first_name,last_name
FROM employees
WHERE first_name REGEXP 'e$';

SELECT last_name,job_id
FROM employees
#where department_id in (80,90,100);
WHERE department_id BETWEEN 80 AND 100;

SELECT last_name,salary,manager_id
FROM employees
WHERE manager_id IN (100,101,110);


