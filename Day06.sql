## What is FOREIGN KEY?

Foreign key ek column hota hai jo dusri table ke PRIMARY KEY se linked hota hai.
Iska use data consistency maintain karne ke liye hota hai.


## Basic FOREIGN KEY Syntax

CREATE TABLE Computer (
    computer_id INT PRIMARY KEY,
    computer_name VARCHAR(30)
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(30),
    computer_id INT,
    FOREIGN KEY (computer_id) REFERENCES Computer(computer_id)
);

INSERT INTO Computer VALUES
(1, 'Desktop'),
(2, 'Laptop');

INSERT INTO Student VALUES
(101, 'Amit', 1),
(102, 'Neha', 2);

SELECT * FROM Student;

SELECT s.student_id, s.student_name, c.computer_name
FROM Student s
JOIN Computer c
ON s.computer_id = c.computer_id;

