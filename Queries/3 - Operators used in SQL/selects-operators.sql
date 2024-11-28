--- COMPARISON OPERATIONS ---
-- = EQUAL TO
-- > LESS THEN
-- < GREATER THAN
-- ANY, ALL

SELECT * FROM PRODUCTS P
WHERE P.PRICE >= 5 AND P.PRICE <= 10;

--- ANY is a function operator to filter any
SELECT * FROM EMPLOYEE E
WHERE E.SALARY > ANY(800, 1000, 5000);

--- ALL is a function operator to filter ALL
SELECT * FROM EMPLOYEE E
WHERE E.SALARY > ALL(800, 1000, 5000);

-- LIKE is a reserved word in sql to filter by character 'a%' FIRST AND '%A' OR '_n%' LAST
SELECT * FROM PRODUCTS P
WHERE P.PRODUCT_NAME LIKE 'A%';

SELECT * FROM PRODUCTS P
WHERE P.PRODUCT_NAME LIKE '%o%n%';

SELECT * FROM PRODUCTS P
WHERE P.PRODUCT_NAME LIKE '_n%';

---- IN is a reserved word in sql to put a list de parameters
SELECT * FROM PRODUCTS P
WHERE P.PRICE IN (5, 10, 25);

--- BETWEEN is a reserved word in sql you'll put a rating
SELECT * FROM PRODUCTS P
WHERE P.PRICE BETWEEN  5 AND 10;
