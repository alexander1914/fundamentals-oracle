SELECT *
FROM products P
WHERE P.price < 10;

--- DATE is function to work with dates

SELECT *
FROM products P
WHERE P.expiration_date > DATE '2016-06-01';

--- WHERE is condition to create your select
--- AND is condition to create your select

SELECT E.name, E.phone, E.birthdate
FROM employee E
WHERE E.birthdate > DATE '1990-01-01';

--- WHERE is condition to create your select
--- AND is condition to create your select
SELECT *
FROM PRODUCTS P
WHERE P.PRICE < 10
AND P.EXPIRATION_DATE > DATE '2025-12-31';

--- OR is condition to create your select
SELECT *
FROM PRODUCTS P
WHERE P.PRICE < 10
OR P.EXPIRATION_DATE > DATE '2025-12-31';

SELECT *
FROM PRODUCTS P
WHERE P.EXPIRATION_DATE > DATE '2025-12-31'
AND (P.PRICE = 5.00
OR P.PRICE = 25.00);

-- Exercise
SELECT E.ID, E.NAME, E.BIRTHDATE, E.PHONE, E.SALARY, E.DEPARTMENT_ID, E.HIRE_DATE, E.JOB_ID, E.EMAIL
FROM EMPLOYEE E
WHERE (E.DEPARTMENT_ID = 1 OR E.DEPARTMENT_ID = 2)
AND (E.SALARY < 3000 OR E.BIRTHDATE < DATE '1985-12-31');

-- DISTINCT is a function to remove duplicates your QUERY
SELECT DISTINCT E.JOB_ID
FROM EMPLOYEE E;

-- UNIQUE is a function to remove duplicates your QUERY for two columns
SELECT UNIQUE E.JOB_ID
FROM EMPLOYEE E;

SELECT UNIQUE E.JOB_ID, E.NAME
FROM EMPLOYEE E;

--- JOINS is function to relationship between the tables t1 and t2 for keys
--- ON is to associate the tables by keys
SELECT E.NAME, D.NAME
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D
ON D.ID = E.DEPARTMENT_ID;

