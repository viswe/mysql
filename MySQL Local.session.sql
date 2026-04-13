CREATE TABLE IF NOT EXISTS USERS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL 
);

INSERT INTO USERS (username, email) VALUES 
('john_doe', 'john.doe@example.com'),
('jane_smith', 'jane.smith@example.com'),
('alice_jones', 'alice.jones@example.com');

SELECT * FROM USERS;

DROP TABLE IF EXISTS USERS;

-- End of MySQL Local.session.sql

-- This SQL script creates a USERS table, inserts sample data, retrieves the data, and then drops the table.

CREATE TABLE IF NOT EXISTS PRODUCTS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL 
);

INSERT INTO PRODUCTS (product_name, price) VALUES 
('Laptop', 999.99),
('Smartphone', 499.49),
('Tablet', 299.99);

SELECT * FROM PRODUCTS; ALTER
SELECT * FROM PRODUCTS WHERE price > 300.00;
