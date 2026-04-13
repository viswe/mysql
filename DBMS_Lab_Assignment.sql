-- ==========================================
-- DBMS Lab Assignment: SQL Join Operations
-- ==========================================

-- 1. Create Tables
-- ------------------------------------------

CREATE TABLE IF NOT EXISTS EMPLOYEE (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    supervisor_id INT
);

CREATE TABLE IF NOT EXISTS DEPARTMENT (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    manager_id INT
);

CREATE TABLE IF NOT EXISTS DEPT_LOCATIONS (
    department_id INT,
    location VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS PROJECT (
    project_number INT PRIMARY KEY,
    department_num INT,
    location VARCHAR(50)
);

-- 2. Insert Sample Data
-- ------------------------------------------

-- Note: Inserting data where department manager exists
INSERT INTO DEPARTMENT (department_id, department_name, manager_id) VALUES 
(1, 'HR', 1),
(2, 'Finance', 3);

-- Inserting Employees (including supervisors and managers)
INSERT INTO EMPLOYEE (employee_id, first_name, last_name, department_id, supervisor_id) VALUES 
(1, 'John', 'Smith', 1, NULL),
(2, 'Jane', 'Doe', 1, 1),
(3, 'Alice', 'Johnson', 2, NULL),
(4, 'Bob', 'Brown', 2, 3),
(5, 'Charlie', 'Davis', NULL, NULL);

INSERT INTO DEPT_LOCATIONS (department_id, location) VALUES 
(1, 'New York'),
(2, 'Stafford');

INSERT INTO PROJECT (project_number, department_num, location) VALUES 
(101, 1, 'Chicago'),
(102, 2, 'Stafford');

-- ==========================================
-- 3. Queries for Part 1: Join Operations
-- ==========================================

-- Q1: Retrieve the first name, last name, and department name of all employees who work for a department.
SELECT 
    e.first_name, 
    e.last_name, 
    d.department_name
FROM 
    EMPLOYEE e
JOIN 
    DEPARTMENT d ON e.department_id = d.department_id;

-- Q2: List all employees' last names and the names of the departments they manage. Include employees who do not manage any department.
SELECT 
    e.last_name, 
    d.department_name
FROM 
    EMPLOYEE e
LEFT JOIN 
    DEPARTMENT d ON e.employee_id = d.manager_id;

-- Q3: Combine each department with its locations using a natural join.
SELECT * 
FROM 
    DEPARTMENT 
NATURAL JOIN 
    DEPT_LOCATIONS;

-- Q4: For each employee, retrieve their first name and the first name of their immediate supervisor.
SELECT 
    e.first_name AS Employee_First_Name, 
    s.first_name AS Supervisor_First_Name
FROM 
    EMPLOYEE e
LEFT JOIN 
    EMPLOYEE s ON e.supervisor_id = s.employee_id;

-- Q5: For every project located in 'Stafford', list the project number, the controlling department number, and the department manager’s last name.
SELECT 
    p.project_number, 
    p.department_num, 
    e.last_name AS Manager_Last_Name
FROM 
    PROJECT p
JOIN 
    DEPARTMENT d ON p.department_num = d.department_id
JOIN 
    EMPLOYEE e ON d.manager_id = e.employee_id
WHERE 
    p.location = 'Stafford';
