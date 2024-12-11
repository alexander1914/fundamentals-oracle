--- VARIABLES ---
-- & --
-- && --
-- UNDEFINE --
SELECT * 
FROM employee E
WHERE E.department_id = 1;

SELECT * 
FROM employee E
WHERE E.job_id = '&JOB';

SELECT * 
FROM employee E
WHERE E.hire_date >= DATE '&DATE';

SELECT * 
FROM employee E
WHERE E.salary = '&&SAL'
OR E.salary = '&SAL' * 2;

UNDEFINE SAL;

--- Exercise this module ---
SELECT p.product_id as id, p.product_name as name, p.category,  p.discount
FROM products p
WHERE p.price > 50
AND p.category = 'Electronics' 
OR p.category = 'Appliances'
AND (p.product_name like '%S'
OR p.product_name like 'X%')
AND (p.discount < 10 
OR p.discount is null)
ORDER BY p.product_name desc