DROP DATABASE IF EXISTS dz3;
CREATE DATABASE dz3;

USE dz3;
DROP TABLE IF EXISTS task;
CREATE TABLE task
(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(20) NOT NULL,
lastname VARCHAR(20) NOT NULL,
post VARCHAR(20) NOT NULL,
seniority VARCHAR(20) NOT NULL,
salary INT DEFAULT '0',
age int NOT NULL
);

INSERT INTO task(firstname, lastname, post, seniority,salary, age)
VALUES
 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
 ('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
 ('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
 ('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
 ('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

# 1 Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастани
SELECT * 
FROM task
ORDER BY salary;

SELECT * 
FROM task
ORDER BY salary DESC;

# 2 Выведите 5 максимальных заработных плат (saraly)
SELECT *
FROM task
ORDER BY salary DESC
LIMIT 5;

# 3 Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT post,
SUM(salary) AS sum_salary
FROM task
GROUP BY post;

/* 4 Найдите кол-во сотрудников с специальностью (post) «Рабочий» 
в возрасте от 24 до 49 лет включительно. */
SELECT COUNT(*)
FROM task
WHERE post = "Рабочий"
AND age 
BETWEEN 24 AND 49;

# 5 Найдите количество специальностей
SELECT post, COUNT(*)
FROM task
GROUP BY post;

# 6 Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT post
FROM task
GROUP BY post
HAVING AVG(age) <=30;
