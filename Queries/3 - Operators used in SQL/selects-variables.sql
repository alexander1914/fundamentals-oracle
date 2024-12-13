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
SELECT 
    p.product_id as id, 
    p.product_name as name, 
    p.price,
    p.category,  
    p.discount
FROM products p
WHERE (p.price > 50 AND p.category IN ('Electronics', 'Appliances'))
    --- LIKE letter% inicial and LIKE %letter final
    AND (p.product_name like 'S%' OR p.product_name like '%X')
    AND coalesce(discount, 0) < 10
ORDER BY 
    p.price DESC,
    p.product_name;