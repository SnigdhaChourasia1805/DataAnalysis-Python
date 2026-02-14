CREATE DATABASE school_db;
USE school_db;

-- Create Employee Table   --                                   
CREATE TABLE employees (                           
    emp_id INT PRIMARY KEY, 
    emp_name VARCHAR(50), 
    salary INT, 
    department_id INT 
); 
 
-- Create Department Table  -- 
CREATE TABLE departments ( 
    department_id INT PRIMARY KEY, 
    department_name VARCHAR(50), 
    location VARCHAR(50) 
); 
 
-- Create Projects Table  
CREATE TABLE projects ( 
    project_id INT PRIMARY KEY, 
    project_name VARCHAR(50), 
    emp_id INT 
); 

-- Insert data 
-- Department  
INSERT INTO departments VALUES 
(1, 'HR', 'Mumbai'), 
(2, 'IT', 'Delhi'), 
(3, 'Finance', 'Chennai'); 
 
-- EMployee
INSERT INTO employees VALUES 
(101, 'Rahul', 60000, 2), 
(102, 'Priya', 50000, 1), 
(103, 'Amit', 75000, 2), 
(104, 'Sneha', 65000, 3), 
(105, 'Karan', 40000, 1);  
 
-- Project  
INSERT INTO projects VALUES 
(1001, 'Website', 101), 
(1002, 'App Development', 103), 
(1003, 'Recruitment Drive', 102), 
(1004, 'Audit', 104), 
(1005, 'Payroll System', 101); 

-- 1. Show employee name with department name 
SELECT emp_name, department_name
FROM employees
JOIN departments
ON employees.department_id = departments.department_id;

-- 2. Show all employees with department location 
SELECT emp_name, location
FROM employees
JOIN departments
ON employees.department_id = departments.department_id;

-- 3. Show employees working in IT department 
SELECT emp_name
FROM employees
JOIN departments
ON employees.department_id = departments.department_id
WHERE department_name = 'IT';

-- 4. Show all projects with employee names
 SELECT project_name, emp_name
FROM projects
JOIN employees
ON projects.emp_id = employees.emp_id;

-- 5. Show employees who are not assigned to any project 
SELECT emp_name
FROM employees
LEFT JOIN projects
ON employees.emp_id = projects.emp_id
WHERE projects.emp_id IS NULL;

-- 6. Count total employees 
SELECT COUNT(*) FROM employees;

-- 7. Count employees per department 
SELECT department_name, COUNT(emp_id) AS total_employees
FROM employees
JOIN departments
ON employees.department_id = departments.department_id
GROUP BY department_name;

-- 8. Find average salary 
SELECT AVG(salary) FROM employee;

-- 9. Find highest salary 
SELECT MAX(salary) FROM employees;

-- 10. Find lowest salary 
SELECT MIN(salary) FROM employees;

-- 11. Total salary paid per department 
SELECT department_name, SUM(salary) AS total_salary
FROM employees
JOIN departments
ON employees.department_id = departments.department_id
GROUP BY department_name;

-- 12. Average salary per department 
SELECT department_name, AVG(salary) AS avg_salary
FROM employees
JOIN departments
ON employees.department_id = departments.department_id
GROUP BY department_name;

-- 13. Department with highest average salary 
SELECT department_name, AVG(salary) AS avg_salary
FROM employees
JOIN departments
ON employees.department_id = departments.department_id
GROUP BY department_name
ORDER BY avg_salary DESC
LIMIT 1;

-- 14. Count employees in each location
 SELECT location, COUNT(emp_id) AS total_employees
FROM employees
JOIN departments
ON employees.department_id = departments.department_id
GROUP BY location;
 
-- 15. Total number of projects 
SELECT COUNT(*) FROM projects;

-- 16. Count projects per employee 
SELECT emp_name, COUNT(project_id) AS total_projects
FROM employees
LEFT JOIN projects
ON employees.emp_id = projects.emp_id
GROUP BY emp_name;

-- 17. Employee with maximum projects 
SELECT emp_name, COUNT(project_id) AS total_projects
FROM employees
JOIN projects
ON employees.emp_id = projects.emp_id
GROUP BY emp_name
ORDER BY total_projects DESC
LIMIT 1;

-- 18. Department with maximum employees 
SELECT department_name, COUNT(emp_id) AS total_employees
FROM employees
JOIN departments
ON employees.department_id = departments.department_id
GROUP BY department_name
ORDER BY total_employees DESC
LIMIT 1;

-- 19. Department generating highest salary expense 
SELECT department_name, SUM(salary) AS total_salary
FROM employees
JOIN departments
ON employees.department_id = departments.department_id
GROUP BY department_name
ORDER BY total_salary DESC
LIMIT 1;

-- 20. Average salary of employees working on projects 
SELECT AVG(salary)
FROM employees
JOIN projects
ON employees.emp_id = projects.emp_id;

-- 21. Employees earning more than department average
 SELECT emp_name, salary
FROM employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);

-- 22. Departments having more than 1 employee 
SELECT department_name, COUNT(emp_id) AS total
FROM employees
JOIN departments
ON employees.department_id = departments.department_id
GROUP BY department_name
HAVING COUNT(emp_id) > 1;

-- 23. Employees working on more than 1 project 
SELECT emp_name, COUNT(project_id) AS total_projects
FROM employees
JOIN projects
ON employees.emp_id = projects.emp_id
GROUP BY emp_name
HAVING COUNT(project_id) > 1;

-- 24. Total salary of employees working in Delhi location 
SELECT SUM(salary)
FROM employees
JOIN departments
ON employees.department_id = departments.department_id
WHERE location = 'Delhi';

-- 25. Project count per department 
SELECT department_name, COUNT(project_id) AS total_projects
FROM departments
JOIN employees
ON departments.department_id = employees.department_id
JOIN projects
ON employees.emp_id = projects.emp_id
GROUP BY department_name;

-- 26. Employee with highest salary in each department 
SELECT department_name, MAX(salary) AS highest_salary
FROM employees
JOIN departments
ON employees.department_id = departments.department_id
GROUP BY department_name;

-- 27. Department with no employees 
SELECT department_name
FROM departments
LEFT JOIN employees
ON departments.department_id = employees.department_id
WHERE employees.emp_id IS NULL;

-- 28. Employees who don’t belong to any department 
SELECT emp_name
FROM employees
WHERE department_id IS NULL;

-- 29. Projects handled by IT department employees 
SELECT project_name
FROM projects
JOIN employees
ON projects.emp_id = employees.emp_id
JOIN departments
ON employees.department_id = departments.department_id
WHERE department_name = 'IT';

-- 30. Location with highest total salary payout -- 
SELECT location, SUM(salary) AS total_salary
FROM employees
JOIN departments
ON employees.department_id = departments.department_id
GROUP BY location
ORDER BY total_salary DESC
LIMIT 1;