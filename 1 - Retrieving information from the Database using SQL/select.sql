SELECT P.product_name, P.price 
FROM products P;

SELECT E.id ,E.name, E.phone, E.salary as old_salary, e.salary * 2.0 new_salary
FROM employee E
INNER JOIN department D
ON e.department_id = d.id;