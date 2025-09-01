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

SELECT * 
FROM employee e
WHERE e.hire_date = TO_DATE('01-10-2014', 'DD-MM-YYYY');

SELECT * 
FROM employee e
WHERE e.hire_date = TO_DATE('01-10-2014', 'DD-MM-YYYY', 
'NLS_DATE_LANGUAGE=''portuguese''');

--- DECODE ---
SELECT name, 'DEPT: ' || DECODE(e.department_id,3,'IT',4,'HR','OTHER')
FROM employee e;

SELECT d.name, d.monthly_budget/DECODE(d.id,1,4,5) AS donation
FROM department d;

SELECT e.salary, DECODE(SIGN(e.salary-3000),1,'GREATER THAN 3000', 'NOT GREATER')
FROM employee e;

SELECT e.name,
    CASE e.department_id
        WHEN 3
            THEN 'IT'
        WHEN 4
            THEN 'HR'
        ELSE
            'OTHER'
    END as dept_id        
FROM employee e;

SELECT e.name,
    CASE 
        WHEN e.department_id = 1 AND e.hire_date >= DATE '2015-01-01'      
             THEN 'NEW ACCOUNTANT'
        WHEN e.job_id = 'IT_PROG' AND e.salary < 3000 
            THEN 'LOW PAY PROGRAMMMER'
        ELSE
            'OTHER'
    END as type        
FROM employee e;

SELECT SYSDATE
    ,SYSDATE-365
    ,ADD_MONTHS(SYSDATE,1)-SYSDATE
    ,TO_CHAR(SYSDATE+6/24, 'hh24:mi:ss')
FROM DUAL;

SELECT e.name
    ,TO_CHAR(e.birthdate+5/(24*60*60), 'dd-mm-yyyy hh24:mi:ss')
FROM employee e;

SELECT e.name
    ,TO_CHAR(e.birthdate+5.787037037037037e-5, 'dd-mm-yyyy hh24:mi:ss')
FROM employee e;

--- TEST ---
Select Id,
  initcap(name) AS name,
  Birthdate,
  Replace(Phone,'.','-') As Phone,
  Salary,
  Department_Id,
  Hire_Date,
  Job_Id,
  Lower(Email) || '@gmail.com' As Email,
  bonus,
  Translate(Substr(name,1,instr(name,' ')-1),'XAEIOU','X') As code
FROM employee;

SELECT  Id,
  name,
  Birthdate,
  Phone,
  SUBSTR(phone,INSTR(phone,'.')+1,INSTR(phone,'.',1,2)-INSTR(phone,'.')-1) As Phone_segment,
  Salary,
  Department_Id,
  Hire_Date,
  Job_Id,
  Email,
  bonus
From Employee
WHERE hire_date >= date '2010-01-01'
ORDER BY salary DESC;

WITH emp_data AS
  (
    SELECT Name, Job_Id,Salary, salary / 30 AS daily_salary
    FROM Employee
    WHERE Hire_Date > DATE '2010-12-31'
      OR Department_Id = 3
  )
Select e.*,
Round(Daily_Salary),
Trunc(Daily_Salary),
Ceil(Daily_Salary),
Floor(Daily_Salary)
FROM Emp_Data e
WHERE Daily_Salary = TRUNC(Daily_Salary);

Select Name, Job_Id,Salary, 
  Salary / 30 As Daily_Salary,
  Round(Salary / 30),
  Trunc(Salary / 30),
  Ceil(Salary / 30),
  Floor(Salary / 30)
FROM Employee
WHERE
  (
    Hire_Date > DATE '2010-12-31'
    OR Department_Id = 3
  )
  AND salary / 30 = TRUNC(salary / 30);

SELECT id,name,hire_date,
  TRUNC(MONTHS_BETWEEN(SYSDATE,hire_date)) AS months_worked,
  ADD_MONTHS(hire_date,6) AS raise_earned_date,
  NEXT_DAY(hire_date,'monday') AS induction_date,
  TRUNC(ADD_MONTHS(hire_date,1),'month') AS newsletter_date
FROM employee
WHERE department_id != 3

SELECT name,birthdate,phone,
  TO_CHAR(department_id,'fm0000') AS department_id,
  TO_CHAR(salary,'fmL99,990.00') AS salary,
  TO_DATE(TO_CHAR(birthdate,'DDMMYYYY') DEFAULT NULL ON CONVERSION ERROR,'MMDDYYYY') AS alt_birthdate
FROM employee
WHERE birthdate > DATE '1970-12-31'
  AND phone IS NOT NULL;

  SELECT name,
  TO_CHAR(birthdate,'DD/MM') AS birthdate,
  TO_CHAR(hire_date,'fmMONTH YYYY') AS hire_date,
  TO_CHAR(TO_NUMBER(SUBSTR(phone,-4)),'L9990.00') AS bonus,
  TO_CHAR(TO_DATE(SUBSTR(phone,-1) DEFAULT '12' ON CONVERSION ERROR,'mm'),'month') AS bonus_month
FROM employee
WHERE
  (
    hire_date < DATE '2015-01-01'
    AND salary > 2500
  )
  OR
  (
    TO_CHAR(hire_date,'YYYY') = '2015'
    AND salary < 3000
  );

  SELECT id,name,salary AS current_salary,
  salary + (salary * 
    DECODE(department_id,1,0.10,2,0.15,0.20)
  ) AS new_salary_1,
  salary + (salary *
    CASE department_id
      WHEN 1  -- Accounting
        THEN 0.10
      WHEN 2  -- Marketing
        THEN 0.15
      ELSE 0.20
    END
  ) AS new_salary_2
FROM employee;

SELECT id,name,salary,
  TO_CHAR(hire_date,'YYYY') AS hire_year,
  CASE
    WHEN salary < 2500
      THEN 'A'
    WHEN salary >= 2500 AND salary < 4000
      THEN 'B'
    WHEN salary >= 4000 AND hire_date < DATE '2014-01-01'
      THEN 'C'
    WHEN salary >= 4000 AND TO_CHAR(hire_date,'YYYY') IN ('2014','2015')
      THEN 'D'
  END AS classification
FROM employee
WHERE department_id != 2
  AND phone IS NOT NULL
ORDER BY salary,hire_date;

SELECT id,name,
  birthdate + (2 * 365) AS second_birthday,
  (hire_date - birthdate) * 24 AS hours_old_when_hired
FROM employee
WHERE hire_date >= DATE '1980-01-01'
  AND phone LIKE '1%'
ORDER BY department_id,salary DESC;