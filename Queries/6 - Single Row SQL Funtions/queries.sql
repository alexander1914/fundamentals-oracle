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