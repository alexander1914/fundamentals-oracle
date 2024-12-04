--- VARIABLES ---
-- & --
-- && --
-- UNDEFINE --
SELECT * FROM employee E
WHERE E.department_id = 1;

SELECT * FROM employee E
WHERE E.job_id = '&JOB';

SELECT * FROM employee E
WHERE E.hire_date >= DATE '&DATE';

SELECT * FROM employee E
WHERE E.salary = '&&SAL'
OR E.salary = '&SAL' * 2;

UNDEFINE SAL;