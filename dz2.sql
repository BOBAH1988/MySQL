# task 1
DROP DATABASE IF EXISTS dz2;
CREATE DATABASE dz2;
# SHOW DATABASES;

USE dz2;
DROP TABLE IF EXISTS task;
CREATE TABLE task
(
id INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
order_date DATE,
count_product INT DEFAULT '0'
);

INSERT INTO task (order_date, count_product)
VALUES 
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

# task 2
SELECT 
id AS 'id заказа',
IF (count_product < 100, 'Маленький заказ', 
	IF (count_product BETWEEN 100 AND 300, 'Средний заказ', 'Большой заказ')
) AS 'Тип заказа'	
FROM task;

# task 3

USE dz2;
DROP TABLE IF EXISTS task3;
CREATE TABLE task3
(
id INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
employee_id VARCHAR(20) NOT NULL UNIQUE,
amount FLOAT(10,2) NOT NULL,
order_status VARCHAR(15) NOT NULL DEFAULT 'OPEN'
);

INSERT INTO task3 (employee_id, amount, order_status)
VALUES 
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT 
employee_id AS 'Номер заказа',
amount AS 'Сумма заказа',
CASE order_status 
	WHEN 'OPEN' THEN 'Order is in open state'
	WHEN 'CLOSED' THEN 'Order is closed'
	WHEN 'CANCELLED' THEN 'Order is cancelled'
END AS 'full_order_status'	
FROM task3;

# task 4
# 0 - это цифра, null - это пустое значение ячейки