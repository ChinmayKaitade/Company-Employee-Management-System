-- > COMPANY EMPLOYEE MANAGEMENT SYSTEM < -- 

-- Create Database
CREATE DATABASE Company;

USE Company;

-- Create Table Using PK and FK
CREATE TABLE Department(
	dept_id INT PRIMARY KEY,			-- Primary Key
    dept_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Employee(
	emp_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) CHECK (salary>0),
    doj DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)		-- Foreign Key
);

-- > INSERT Data (CREATE)
INSERT INTO Department (dept_id, dept_name)
VALUES
(1, "HR"),
(2, "Engineering"),
(3, "Sales");

INSERT INTO Employee (emp_id, name, salary, doj, dept_id)
VALUES
(101, "Aman", 60000, "2020-01-10", 2),
(102, "Amit", 50000, "2021-03-10", 1),
(103, "Priya", 70000, "2019-04-10", 2),
(104, "Rohit", 40000, "2018-07-10", 3),
(105, "Sumit", 30000, "2020-03-10", 1),
(106, "Dipak", 40000, "2021-09-10", 2),
(107, "Ankit", 27000, "2021-09-10", 3);

-- > READ Data (SELECT)
-- 1. Basic Select
SELECT * FROM Department;

-- 2. Select with WHERE and ORDER BY
SELECT name, salary FROM Employee WHERE salary > 50000 ORDER BY salary DESC;

-- > UPDATE Data
-- Update Salary
UPDATE Employee
SET salary = 65000
WHERE emp_id = 104;

-- > DELETE Data
-- Delete an Employee
DELETE FROM Employee WHERE emp_id = 107;

-- > Aggregate Functions
-- Total salary per department
SELECT dept_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY dept_id;

-- Average salary with HAVING clause
SELECT dept_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY dept_id
HAVING AVG(salary) > 50000;

-- > JOIN (Show employee with department name)
SELECT 
  e.emp_id, 
  e.name AS employee_name, 
  e.salary, 
  d.dept_name AS department_name
FROM Employee AS e
JOIN Department d ON e.dept_id = d.dept_id;






