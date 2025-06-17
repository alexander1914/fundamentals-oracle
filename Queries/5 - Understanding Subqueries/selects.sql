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
-- AVG is function to calcule 
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

-- WITH: is a word reserved in sql to combine beetewen queries
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

-- The FETCH: is a word reserved in sql that retrieves rows of data from the result set of a multi-row query. 
-- You can fetch rows one at a time, several at a time, or all at once

-- FIRST: is a word reserved in sql Both are aggregate and analytic functions that operate on a set of values from a set of rows that,
-- rank as the FIRST or LAST with respect to a given sorting specification

SELECT * FROM employee e
ORDER BY e.salary DESC
FETCH FIRST 5 ROWS ONLY;

-- ONLY: is a word reserved in sql limiting results in SQL queries and defining read-only modes for databases and Oracle homes
SELECT * FROM employee e
ORDER BY e.salary DESC
FETCH NEXT 5 ROWS ONLY;

-- PERCENT: is a word reserved in sql to specify the percentage of the total number of selected rows to return. 
-- percent must be a number or an expression that evaluates to a numeric value
SELECT * FROM employee e
ORDER BY e.salary DESC
FETCH FIRST 5 PERCENT ROWS ONLY;

-- TIES: is a word reserved in sql to return additional rows with the same sort key as the last row fetched. 
-- If you specify WITH TIES, then you must specify the order_by_clause

SELECT * FROM employee e
ORDER BY e.salary DESC
FETCH FIRST 3 ROWS WITH TIES;

-- OFFSET: is a word reserved in sql clause is used to specify a number N of initial query results that should be skipped (not returned to the application).
SELECT * FROM employee e
ORDER BY e.salary DESC
OFFSET 4 ROWS FETCH FIRST 3 ROWS WITH TIES;

-- Practice Challenge: Subquery Factoring
SELECT *
FROM employee
ORDER BY salary, id
OFFSET (&page - 1) * 4 ROWS FETCH FIRST 4 ROWS ONLY;

-- Coding Exercise: Subqueries
SELECT category, COUNT(*) AS book_count
FROM books
WHERE price > (
        SELECT AVG(price)
        FROM books
    )
    AND author IS NOT NULL
GROUP BY category
HAVING COUNT(*) > 1;

-- Coding Exercise: Subqueries Part 2
SELECT *
FROM books
WHERE category IN (SELECT category
                    FROM books
                    WHERE price > (
                            SELECT AVG(price)
                            FROM books
                        )
                        AND author IS NOT NULL
                    GROUP BY category
                    HAVING COUNT(*) > 1)
ORDER BY price DESC, author;