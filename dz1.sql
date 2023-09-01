USE dz1;
SELECT manuffacturer, price
FROM task
Where product_count > 2;

SELECT product_name,manuffacturer
FROM task
WHERE manuffacturer = 'Samsung';
