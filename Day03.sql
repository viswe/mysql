CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    major VARCHAR(255) NOT NULL 
);

INSERT INTO Students (student_name, major) VALUES 
('David', 'Computer Science'),
('Eva', 'Biology'),
('Frank', 'History');

SELECT * FROM Students;

SELECT student_name, major FROM Students WHERE major = 'Biology';