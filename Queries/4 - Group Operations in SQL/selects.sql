-- MIN() is a function to show min
-- MAX() is a function to show max

SELECT MIN(P.price), MAX(P.price)
FROM products P;

SELECT MIN(P.price), MAX(P.price), SUM(P.PRICE)
FROM products P
WHERE P.PRICE < 25;

-- COUNT() is a function to count a data

SELECT COUNT(P.product_id), SUM(P.price), COUNT(*)
FROM products P;

SELECT COUNT(1) FROM products; -- it's more less performance
SELECT COUNT(*) FROM products; -- it's more faster performance

SELECT COUNT(DISTINCT E.salary)
FROM employee E;

--- Practice Challenge: Aggregate Functions
SELECT COUNT(E.id) AS EMPLOYEES, SUM(E.salary) AS TOTAL_SALARIES, AVG(E.salary) AS AVERAGE_SALARIES
FROM employee E
WHERE E.department_id = 1;
SELECT * FROM department; --- I checked the ACCOUNTING departament 