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