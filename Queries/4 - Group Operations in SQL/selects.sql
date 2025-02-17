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
SELECT COUNT(E.id) AS EMPLOYEES, SUM(E.salary) AS TOTAL_SALARIES, 
AVG(E.salary) AS AVERAGE_SALARIES, SUM(E.salary) / COUNT(E.salary) AS manual_average_salary
FROM employee E
WHERE E.department_id = 1;

SELECT * FROM department; --- I checked the ACCOUNTING departament 

SELECT E.department_id, COUNT(*) AS QUANTITY
FROM employee E
GROUP BY E.department_id;
--------------------------------------------------------------------------------------------------------

-- GROUP BY is a word reserved in sql to group about colunm

SELECT E.department_id, COUNT(*) AS QUANTITY
FROM employee E
GROUP BY E.department_id;

SELECT E.department_id
FROM employee E
GROUP BY E.department_id;

SELECT DISTINCT E.department_id
FROM employee E;

SELECT MAX(SUM(E.salary)), AVG(SUM(E.salary))
FROM employee E
GROUP BY E.department_id;

SELECT SUM(E.salary),SUM(E.salary)
FROM employee E
GROUP BY E.department_id;


--- Practice Challenge: Grouping Rows
SELECT bonus,
   COUNT(*) AS employees,
   MAX(salary) AS greatest_salary
FROM employee
WHERE birthdate < DATE '1995-01-01'
GROUP BY bonus
ORDER BY bonus;

--- HAVING is a word reserved in sql to verify like if
SELECT E.department_id, COUNT(*) 
FROM employee E
GROUP BY E.department_id
HAVING COUNT(*) > 1;

SELECT E.department_id, COUNT(*) 
FROM employee E
GROUP BY E.department_id
HAVING E.department_id = 3;

SELECT E.department_id, MIN(E.salary) 
FROM employee E
WHERE E.department_id IN (3,4)
GROUP BY E.department_id
HAVING MIN(E.salary) > 2000;

--- Practice Challenge: Grouping Rows
SELECT department_id, MIN(E.salary), MAX(E.salary), AVG(E.bonus)
FROM employee E
WHERE bonus IS NOT NULL
GROUP BY department_id
HAVING MIN(E.salary) < 2000
   OR MAX(E.salary) > 4000
ORDER BY MIN(salary) DESC;

--- Coding Exercise: Group Operations
SELECT 
    customer_id, 
    SUM(quantity) AS total_quantity, 
    AVG(price) AS average_price, 
    COUNT(*) AS order_count
FROM orders
WHERE 
    customer_id IS NOT NULL
    AND (product_name = 'Widget A' OR product_name = 'Widget B')
    AND price < 100
GROUP BY customer_id
HAVING 
    COUNT(order_id) >= 2 
    AND SUM(quantity) > 20;



