CREATE TABLE Empoyees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    department VARCHAR(255) NOT NULL 
);

INSERT INTO Empoyees (name, department) VALUES 
('Alice', 'HR'),
('Bob', 'Engineering'),
('Charlie', 'Marketing');

SELECT * FROM Empoyees;

DROP TABLE IF EXISTS Empoyees;