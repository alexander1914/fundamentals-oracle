--- NVL() is a function to replace a field null new text
SELECT E.ID, E.NAME, NVL(E.PHONE, '*** NO PHONE ***')
FROM EMPLOYEE E
ORDER BY E.ID;

SELECT *
FROM EMPLOYEE E
WHERE E.SALARY > 4000
AND NVL(E.PHONE, '*') != '1.234.567.8901';

SELECT 'PHONE:' || E.PHONE FROM EMPLOYEE E;

--- COALESCE is a function to replace the fields to new message for example
SELECT E.NAME, COALESCE(E.PHONE, E.EMAIL, 'NO CONTACT INFO; ')
FROM EMPLOYEE E;

--- NVL2() is a function to replace a field null new text
SELECT E.ID, NVL2(E.PHONE, E.NAME, E.JOB_ID)
FROM EMPLOYEE E;

-- NULLIF() is a function return the fields are null
SELECT E.ID, E.NAME, NULLIF(E.ID, E.DEPARTMENT_ID)
FROM EMPLOYEE E;

--- LNNVL() is a function return a boolean similar an if
SELECT *
FROM EMPLOYEE E
WHERE E.SALARY > 4000
AND LNNVL(E.PHONE = '1.234.567.8901');