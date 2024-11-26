--- IS NULL is reserved word in sql to filter just set null
SELECT *
FROM EMPLOYEE E
WHERE E.PHONE != '1';

SELECT *
FROM EMPLOYEE E
WHERE E.PHONE IS NULL;

--- IS NOT NULL is reserved word in sql to filter just set null
SELECT *
FROM EMPLOYEE E
WHERE E.PHONE IS NOT NULL;

-- my exercise
SELECT *
FROM EMPLOYEE E
WHERE E.SALARY > 4000
AND E.PHONE != '1.234.567.8901';

--- NULLS FIRSTS is reserved word in sql to filter first null
SELECT *
FROM EMPLOYEE E
ORDER BY E.PHONE NULLS FIRST;

--- NULLS FIRSTS is reserved word in sql to filter last null
SELECT *
FROM EMPLOYEE E
ORDER BY E.PHONE DESC NULLS LAST;
