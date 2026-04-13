-- ===============================
-- 1. Departments Table
-- ===============================
CREATE TABLE Departments001 (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- ===============================
-- 2. Students Table
-- ===============================
CREATE TABLE Students001 (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    gpa DECIMAL(3,2),
    dept_id INT,
    CONSTRAINT fk_stud_dept
    FOREIGN KEY (dept_id)
    REFERENCES Departments001(dept_id)
) ENGINE=InnoDB;

-- ===============================
-- 3. Employees Table
-- ===============================
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2),
    experience_years INT,
    dept_id INT,
    CONSTRAINT fk_emp_dept
    FOREIGN KEY (dept_id)
    REFERENCES Departments001(dept_id)
) ENGINE=InnoDB;

-- ===============================
-- 4. Insert Data into Departments
-- ===============================
INSERT INTO Departments001 VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Sales');

-- ===============================
-- 5. Insert Data into Students
-- ===============================
INSERT INTO Students001 VALUES
(1, 'Alice', 20, 3.80, 101),
(2, 'Bob', 22, 3.20, 101),
(3, 'Charlie', 21, 3.90, 102),
(4, 'David', 23, 2.80, 102),
(5, 'Eve', 20, 3.50, 103),
(6, 'Frank', 24, 3.10, 103),
(7, 'Grace', 22, 3.70, 104),
(8, 'Heidi', 21, 3.40, 104),
(9, 'Ivan', 25, 2.90, 101),
(10, 'Judy', 20, 4.00, 102);

-- ===============================
-- 6. Insert Data into Employees
-- ===============================
INSERT INTO Employees VALUES
(501, 'John', 75000.00, 5, 101),
(502, 'Jane', 82000.00, 8, 101),
(503, 'Mike', 60000.00, 3, 103),
(504, 'Sarah', 95000.00, 12, 102),
(505, 'Tom', 55000.00, 2, 104),
(506, 'Lucy', 71000.00, 6, 101),
(507, 'Jake', 68000.00, 4, 103),
(508, 'Amy', 89000.00, 10, 102),
(509, 'Paul', 52000.00, 1, 104),
(510, 'Anna', 77000.00, 7, 103);

-- ===============================
-- 7. View Tables
-- ===============================
SELECT * FROM Students001;
SELECT * FROM Employees;

-- ===============================
-- 8. Student Aggregation
-- ===============================
SELECT
    dept_id,
    COUNT(student_id) AS total_students,
    ROUND(AVG(gpa), 2) AS avg_gpa,
    MAX(gpa) AS max_gpa,
    MIN(age) AS youngest_age,
    SUM(gpa) AS sum_all_gpa
FROM Students
GROUP BY dept_id;

-- ===============================
-- 9. Employee Aggregation
-- ===============================
SELECT
    dept_id,
    COUNT(emp_id) AS staff_count,
    SUM(salary) AS total_payroll,
    ROUND(AVG(salary), 2) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(experience_years) AS max_experience
FROM Employees
GROUP BY dept_id;
