--- CONDITIONS ---
--- AND, OR, NOT are cpnditions in sql

--- NOT is the word reserved 
SELECT * 
FROM products P
WHERE NOT P.price > 10;

SELECT * 
FROM products P
WHERE NOT P.product_name LIKE '%llin';

SELECT * 
FROM products P
WHERE NOT P.price < 10
AND P.product_id > 1;