-- 🌟 STEP 1: Create the database
CREATE DATABASE IF NOT EXISTS internship_db;
USE internship_db;

-- 🌟 STEP 2: Create a sample table
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

-- 🌟 STEP 3: Insert sample data
INSERT INTO employees (name, department, salary) VALUES
('Amit Sharma', 'Sales', 50000),
('Rita Paul', 'HR', 45000),
('Suresh Kumar', 'IT', 60000),
('Neha Yadav', 'Sales', 52000),
('Rahul Das', 'IT', 58000);

-- 🌟 STEP 4: Create a stored procedure to get employees by department
DELIMITER //
CREATE PROCEDURE GetEmployeesByDept(IN dept_name VARCHAR(50))
BEGIN
    SELECT * FROM employees WHERE department = dept_name;
END;
//
DELIMITER ;

-- 🌟 STEP 5: Call the stored procedure
CALL GetEmployeesByDept('Sales');

-- 🌟 STEP 6: Create a function to calculate bonus (10% of salary)
DELIMITER //
CREATE FUNCTION CalculateBonus(sal DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN sal * 0.10;
END;
//
DELIMITER ;

-- 🌟 STEP 7: Use the function
SELECT name, salary, CalculateBonus(salary) AS bonus FROM employees;

-- 🌟 STEP 8: Optional - Drop if rerunning
-- DROP PROCEDURE IF EXISTS GetEmployeesByDept;
-- DROP FUNCTION IF EXISTS CalculateBonus;
