CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO Employee VALUES
(1, 'Amit', 'HR', 25000),
(2, 'Neha', 'IT', 40000),
(3, 'Rahul', 'Finance', 35000),
(4, 'Priya', 'IT', 45000),
(5, 'Karan', 'HR', 30000);


SELECT MIN(salary) AS Minimum_Salary FROM Employee;
SELECT MAX(salary) AS Maximum_Salary FROM Employee;

SELECT COUNT(*) AS Total_Employees FROM Employee;
SELECT SUM(salary) AS Total_Salary FROM Employee;

SELECT * FROM Employee
ORDER BY salary ASC;


SELECT * FROM Employee
ORDER BY salary DESC;

SELECT * FROM Employee
ORDER BY emp_name ASC;
