-- 📚 Basic SQL Queries Guide for QA Professionals

-- ---------------------------------------------
-- 1️⃣ Database Basics
-- ---------------------------------------------

-- List all databases
SHOW DATABASES;

-- Select database
USE my_database;

-- List all tables in the database
SHOW TABLES;

-- Describe table structure
DESCRIBE employees;

-- ---------------------------------------------
-- 2️⃣ Table Creation
-- ---------------------------------------------

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10,2)
);

-- ---------------------------------------------
-- 3️⃣ Data Insertion
-- ---------------------------------------------

INSERT INTO employees (first_name, last_name, email, hire_date, salary)
VALUES ('John', 'Doe', 'john.doe@example.com', '2024-01-15', 50000.00);

-- ---------------------------------------------
-- 4️⃣ Select Queries
-- ---------------------------------------------

-- Select all records
SELECT * FROM employees;

-- Select specific columns
SELECT first_name, last_name, salary FROM employees;

-- ---------------------------------------------
-- 5️⃣ Where Clause
-- ---------------------------------------------

-- Filter with WHERE
SELECT * FROM employees WHERE salary > 40000;

-- Multiple conditions
SELECT * FROM employees WHERE salary > 40000 AND hire_date >= '2023-01-01';

-- Using LIKE
SELECT * FROM employees WHERE email LIKE '%example.com';

-- Using IN
SELECT * FROM employees WHERE first_name IN ('John', 'Jane', 'Alice');

-- ---------------------------------------------
-- 6️⃣ Order By Clause
-- ---------------------------------------------

-- Order by salary ascending
SELECT * FROM employees ORDER BY salary ASC;

-- Order by hire date descending
SELECT * FROM employees ORDER BY hire_date DESC;

-- ---------------------------------------------
-- 7️⃣ Group By and Aggregation
-- ---------------------------------------------

-- Count total employees
SELECT COUNT(*) AS total_employees FROM employees;

-- Average salary
SELECT AVG(salary) AS average_salary FROM employees;

-- Group by hire year
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS total_hired
FROM employees
GROUP BY hire_year
ORDER BY hire_year;

-- ---------------------------------------------
-- 8️⃣ Joins
-- ---------------------------------------------

-- INNER JOIN
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id;

-- LEFT JOIN
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id;

-- RIGHT JOIN
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.id;

-- ---------------------------------------------
-- 9️⃣ Subqueries
-- ---------------------------------------------

-- Employees with salary higher than average
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- ---------------------------------------------
-- 10️⃣ Update and Delete
-- ---------------------------------------------

-- Update
UPDATE employees
SET salary = salary * 1.10
WHERE hire_date < '2020-01-01';

-- Delete
DELETE FROM employees
WHERE hire_date < '2000-01-01';

-- ---------------------------------------------
-- 11️⃣ Useful Functions
-- ---------------------------------------------

-- CURRENT_DATE
SELECT CURRENT_DATE();

-- CONCAT
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;

-- DATE_FORMAT
SELECT DATE_FORMAT(hire_date, '%d-%m-%Y') FROM employees;

-- ROUND salary to 2 decimal places
SELECT ROUND(salary, 2) FROM employees;

-- UPPER / LOWER
SELECT UPPER(first_name), LOWER(last_name) FROM employees;

-- ---------------------------------------------
-- 12️⃣ QA Specific Use Cases
-- ---------------------------------------------

-- Validate duplicate records
SELECT email, COUNT(*) AS count
FROM employees
GROUP BY email
HAVING count > 1;

-- Validate records inserted in last 7 days
SELECT * FROM employees
WHERE hire_date >= CURDATE() - INTERVAL 7 DAY;

-- Validate NULL columns
SELECT * FROM employees
WHERE email IS NULL;

-- Validate total count matches expected count
SELECT COUNT(*) FROM employees;

-- Compare two tables
SELECT * FROM table1
EXCEPT
SELECT * FROM table2;

-- ---------------------------------------------
-- 🎉 End of Basic SQL Queries Guide
-- ---------------------------------------------
