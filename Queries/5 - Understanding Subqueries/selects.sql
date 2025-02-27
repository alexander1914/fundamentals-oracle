--- Subqueries --
SELECT E.* 
FROM employee E
WHERE E.salary = (
    SELECT MAX(salary)
    FROM employee
);

SELECT *
FROM employee E
WHERE E.department_id IN (
    SELECT D.id
    FROM department D
    WHERE D.monthly_budget > 20000
);

SELECT *
FROM department D
WHERE 3 < (
    SELECT COUNT(*)
    FROM employee E
    WHERE e.department_id = D.id
);

SELECT *
FROM employee E
WHERE E.department_id IN (
    SELECT E.department_id
    FROM department D
    WHERE D.monthly_budget > 25000
);

SELECT * 
FROM department
WHERE (id, last_employee_id)
IN (
    SELECT department.id, id
    FROM employee
    WHERE salary = (
        SELECT MAX(salary)
        FROM employee
    )
);

-- Pratice tried
SELECT D.name, AVG(E.salary) as AVAGERE_SALARY, 
E.birthdate as OLDEST_EMP_BIRTHDATE 
FROM department D
WHERE D.id 
IN (
    SELECT D.id, E.department_id
    FROM employee E
    WHERE E.department_id = D.id
);

-- AS is alias to create your colunm
SELECT * 
FROM (
    SELECT department_id, AVG(salary) AS average_salary
    FROM employee
    GROUP BY department_id
)
e
WHERE E.average_salary > 4000;

-- Pratice Challenge Inline Views
SELECT * 
FROM (
    SELECT department_id, MIN(salary) AS MIN_SALARY, MAX(salary) AS MAX_SALARY,
    AVG(salary) AS average_salary
    FROM employee
    GROUP BY department_id
)
E
WHERE E.max_salary > E.min_salary;

-- WITH is a word reserved in sql to combine beetewen queries
SELECT * 
FROM 
(SELECT department_id, AVG(salary) AS average_salary
    FROM employee
    GROUP BY department_id
) E
WHERE E.average_salary > 4000;

WITH EMP AS (
    SELECT department_id, AVG(salary) AS average_salary
    FROM employee
    GROUP BY 
        department_id 
)
SELECT * FROM EMP E
WHERE E.average_salary > 4000;

-- Practice Challenge: Subquery Factoring
SELECT * 
FROM 
(SELECT department_id, MIN(salary) AS MIN_SALARY, 
    MAX(salary) AS MAX_SALARY,AVG(salary) AS average_salary
    FROM employee
    GROUP BY department_id
) E
WHERE E.max_salary > E.min_salary;

WITH EMP AS (
    SELECT department_id, MIN(salary) AS MIN_SALARY, 
    MAX(salary) AS MAX_SALARY,AVG(salary) AS average_salary
    FROM employee
    GROUP BY 
        department_id 
)
SELECT * FROM EMP E
WHERE E.max_salary > E.min_salary;