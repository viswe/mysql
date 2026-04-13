CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO Department VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing');

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    age INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

INSERT INTO Employee VALUES
(201, 'Suresh', 30, 1),
(202, 'Priya', 28, 2),
(203, 'Vikram', 35, 3);

SELECT e.employee_name, e.age, d.department_name

Select * FROM Employee

FROM Employee e
JOIN Department d ON e.department_id = d.department_id;

DROP TABLE Employee;
SELECT * FROM Employee;

UPDATE Employee
SET age = age + 1
WHERE employee_id = 202;
SELECT * FROM Employee;
SELECT * FROM Employee;
SELECT e.employee_id, e.employee_name, e.age,
       d.department_name

Select * FROM Department AS d
FROM Employee e
INNER JOIN Department d
ON e.department_id = d.department_id;
ON e.department_id = d.department_id;