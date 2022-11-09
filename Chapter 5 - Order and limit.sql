USE EXAMPLE;

SELECT last_name,department_id,salary * 12 annual_sal
FROM employees
ORDER BY annual_sal DESC,last_name ASC;

SELECT last_name,salary
FROM employees
WHERE salary NOT BETWEEN 8000 AND 17000
ORDER BY salary DESC
LIMIT 20,20;

SELECT last_name,email,department_id
FROM employees
#where email like '%e%'
WHERE email REGEXP '[e]'
ORDER BY LENGTH(email) DESC,department_id ASC;

