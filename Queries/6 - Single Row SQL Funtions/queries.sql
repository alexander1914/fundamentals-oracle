--- SUBSTR is a funtion on oracle to work text ---
SELECT SUBSTR('SEP.PALMEIRAS',0,3),
--- UPPER is a function on oracle to upper a word or text --- 
UPPER('jesus'),
--- LOWER is a function on oracle to lower a word or text --- 
LOWER('WELCOME'),
--- INITCAP is a function on oracle that returns char , with the first letter of each word in uppercase, all other letters in lowercase ---
INITCAP('GOD'),
--- REPLACE is a function on oracle to replace a word other text ---
REPLACE('PALMEIRAS', 'PALESTRA ITÁLIA'),
--- LENGTH is a function on oracle to count the number caracters of word ---
LENGTH('PALESTRA ITÁLIA'),
--- CONCAT is a function on oracle to concat two words ---
CONCAT('SEP', ' PALMEIRAS')
FROM DUAL;

--- EXAMPLE --
SELECT *
FROM employee
WHERE LENGTH(name)- LENGTH(REPLACE(name, 'O')) = 2;

SELECT name, job_id, SUBSTR(job_id, 1, INSTR(job_id, '_') - 1) AS DEPT
FROM employee;

SELECT 
--- TRUNC is a funtion on oracle that returns n1 truncated to n2 decimal places. If n2 is omitted, then n1 is truncated to 0 places. ---
TRUNC(10.998),
TRUNC(10.998,1),
--- ROUND is a function on oracle that rounded to integer places to the right of the decimal point. ---
ROUND(10.999),
ROUND(10.999,1),
ROUND(10.999,-2),
--- FLOOR is a function on oracle that returns the largest integer equal to or less than n. ---
FLOOR(10.999),
--- CEIL is a funtion on oracle that returns the smallest integer that is greater than or equal to n. ---
CEIL(10.999),
--- SIGN is a funtion on oracle that takes as an argument any numeric data type, or any nonnumeric data type that can be implicitly converted to NUMBER. ---
SIGN(-25),
SIGN(0),
SIGN(25),
--- MOD is a funtion on oracle that returns the remainder of n2 divided by n1.
MOD(10,4)
FROM DUAL;

--- EXAMPLE ---
SELECT ROUND(salary/30) FROM employee;

SELECT
--- SYSDATE is a funtion on oracle that returns the current date and time set for the operating system on which the database server resides. ---
SYSDATE,
--- SYSTIMESTAMP is a funtion on oracle that  returns the system date, including fractional seconds and time zone, of the system on which the database resides. ---
SYSTIMESTAMP,
--- ADD_MONTHS is a funtion on oracle that  returns the date date plus integer months. ---
ADD_MONTHS(SYSDATE, 2),
ADD_MONTHS(SYSDATE, -2),
--- MONTHS_BETWEEN is a function on oracle that returns number of months between dates date1 and date2. ---
MONTHS_BETWEEN(SYSDATE, '08/12/2025'),
MONTHS_BETWEEN(SYSDATE, '08/10/2025'),
--- EXTRACT is a funtion on oracle that extracts and returns the value of a specified datetime field from a datetime or interval expression. ---
EXTRACT(YEAR FROM SYSDATE),
EXTRACT(MONTH FROM SYSDATE),
EXTRACT(HOUR FROM SYSTIMESTAMP),
--- NEXT_DAY is a funtion on oracle that returns the date of the first weekday named by char that is later than the date date. ---
NEXT_DAY(SYSDATE, 'FRIDAY'),
--- TRUNC is a funtion on oracle that returns n1 truncated to n2 decimal places. If n2 is omitted, then n1 is truncated to 0 places. ---
TRUNC(SYSDATE),
TRUNC(SYSDATE, 'hh'),
TRUNC(SYSDATE, 'month'),
TRUNC(SYSDATE, 'year')
FROM DUAL;

--- EXAMPLE ---
SELECT * 
FROM DUAL
WHERE SYSDATE BETWEEN DATE '2025-01-01' 
AND TO_DATE('2025-08-14 23:59:59', 'YYYY-MM-DD HH24:MI:SS');

SELECT 
--- TO_CHAR is a function on oracle that (datetime) converts a datetime or interval value of DATE, TIMESTAMP, TIMESTAMP WITH TIME ZONE, 
--- TIMESTAMP WITH LOCAL TIME ZONE, INTERVAL DAY TO SECOND, 
--  or INTERVAL YEAR TO MONTH data type to a value of VARCHAR2 data type in the format specified by the date format fmt. ---
'['||TO_CHAR(325)||']',
'['||TO_CHAR(1325,'9,999.999')||']',
'['||TO_CHAR(1325,'99,999.999')||']',
'['||TO_CHAR(0.25)||']',
'['||TO_CHAR(0.25, '00.99')||']',
'['||TO_CHAR(10.25, '00.99')||']',
'['||TO_CHAR(1325, '999')||']',
'['||TO_CHAR(-1325, '9,999')||']',
'['||TO_CHAR(1325, 'fm9,999')||']',
'['||TO_CHAR(1325, 'fmL9,999', 'NLS_CURRENCY = ''USD''')||']',
'['||TO_CHAR(1325, 'fmL9,999')||']',
--- TO_NUMBER is a function on oracle that onverts expr to a value of NUMBER data type. ---
TO_NUMBER('$.05', 'L.99'),
TO_NUMBER('T5' DEFAULT -l ON CONVERSION ERROR, '99'),
TO_CHAR(SYSDATE, 'day'),
TO_CHAR(SYSDATE, 'month'),
TO_CHAR(SYSDATE, 'mm-dd-yyyy "TIME:" hh24:mi:ss'),
--- TO_DATE is a funtion on oracle that converts char to a value of DATE data type. ---
TO_DATE('jun152019', 'monddyyyy'),
TO_DATE('1990072409', 'yyyyddmmhh24'),
TO_DATE('1990072409' DEFAULT NULL ON CONVERSION ERROR, 'ddmmyyyyhh24'),
--- CAST is a funtion on oracle that convert built-in data types or collection-typed values of one type into another built-in data type or collection type.  ---
CAST('jun16-2000 10:10:20' AS DATE, 'mondd-yyyy hh24:mi:ss'),
CAST(1325 as VARCHAR(50)),
CAST(SYSDATE as VARCHAR(20)),
CAST('Q.05' AS NUMBER, 'L.99', 'NLS_CURRENCY = ''Q'''),
CAST('$.05' AS NUMBER DEFAULT -l ON CONVERSION ERROR, '0.99')
FROM dual;

-- Example --
SELECT D.*, TO_DATE(D.last_employee_id,'mm')
FROM DEPARTMENT D
WHERE VALIDATE_CONVERSION(TO_CHAR(D.last_employee_id) AS DATE, 'mm') = l;
