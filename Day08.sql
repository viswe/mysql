CREATE DATABASE library_db;
USE library_db;

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    phone VARCHAR(15)
) ENGINE=InnoDB;

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50),
    price DECIMAL(7,2),
    available_copies INT
) ENGINE=InnoDB;

CREATE TABLE Issue (
    issue_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    CONSTRAINT fk_issue_member
        FOREIGN KEY (member_id) REFERENCES Members(member_id),
    CONSTRAINT fk_issue_book
        FOREIGN KEY (book_id) REFERENCES Books(book_id)
) ENGINE=InnoDB;

INSERT INTO Members VALUES
(1,'Amit','amit@gmail.com','9876543210'),
(2,'Neha','neha@gmail.com','9123456780'),
(3,'Rahul','rahul@gmail.com','9012345678');

INSERT INTO Books VALUES
(101,'DBMS Concepts','Korth',450.00,5),
(102,'Operating System','Galvin',550.00,3),
(103,'Computer Networks','Tanenbaum',600.00,4);

INSERT INTO Issue VALUES
(1,1,101,'2026-02-01','2026-02-10'),
(2,2,102,'2026-02-03','2026-02-12'),
(3,3,103,'2026-02-05',NULL);
-- Query to find all books issued by member with member_id = 2

SELECT * FROM Members;
SELECT * FROM Books;
SELECT * FROM Issue;

SELECT 
    m.member_name,
    b.title,
    i.issue_date,
    i.return_date
FROM Issue i
JOIN Members m ON i.member_id = m.member_id
JOIN Books b ON i.book_id = b.book_id;


CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(50) NOT NULL,
    country VARCHAR(30)
) ENGINE=InnoDB;


CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(50),
    city VARCHAR(30)
) ENGINE=InnoDB;

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(30)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE Books;

SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    price DECIMAL(7,2),
    available_copies INT,
    author_id INT,
    publisher_id INT,
    category_id INT,
    CONSTRAINT fk_book_author FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    CONSTRAINT fk_book_publisher FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id),
    CONSTRAINT fk_book_category FOREIGN KEY (category_id) REFERENCES Categories(category_id)
) ENGINE=InnoDB;

CREATE TABLE Librarians (
    librarian_id INT PRIMARY KEY,
    librarian_name VARCHAR(50),
    shift VARCHAR(20)
) ENGINE=InnoDB;


CREATE TABLE Issue (
    issue_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    librarian_id INT,
    issue_date DATE,
    return_date DATE,
    CONSTRAINT fk_issue_member FOREIGN KEY (member_id) REFERENCES Members(member_id),
    CONSTRAINT fk_issue_book FOREIGN KEY (book_id) REFERENCES Books(book_id),
    CONSTRAINT fk_issue_librarian FOREIGN KEY (librarian_id) REFERENCES Librarians(librarian_id)
) ENGINE=InnoDB;

INSERT INTO Authors VALUES
(1,'Korth','USA'),
(2,'Tanenbaum','Netherlands');

INSERT INTO Publishers VALUES
(1,'Pearson','Delhi'),
(2,'McGraw Hill','Mumbai');

INSERT INTO Categories VALUES
(1,'DBMS'),
(2,'Networking');

INSERT INTO Librarians VALUES
(1,'Ravi','Morning'),
(2,'Sneha','Evening');


INSERT INTO Books VALUES
(101,'DBMS Concepts',450,5,1,1,1),
(102,'Computer Networks',600,4,2,2,2);

SELECT
    m.member_name,
    b.title,
    a.author_name,
    p.publisher_name,
    c.category_name,
    l.librarian_name,
    i.issue_date,
    i.return_date
FROM Issue i
JOIN Members m ON i.member_id = m.member_id
JOIN Books b ON i.book_id = b.book_id
JOIN Authors a ON b.author_id = a.author_id
JOIN Publishers p ON b.publisher_id = p.publisher_id
JOIN Categories c ON b.category_id = c.category_id
JOIN Librarians l ON i.librarian_id = l.librarian_id;


SELECT
    m.member_name,
    b.title,
    l.librarian_name,
    i.issue_date,
    i.return_date
FROM Issue i
JOIN Members m ON i.member_id = m.member_id
JOIN Books b ON i.book_id = b.book_id
JOIN Librarians l ON i.librarian_id = l.librarian_id;

SELECT
    m.member_name,
    b.title,
    a.author_name,
    p.publisher_name,
    c.category_name,
    l.librarian_name,
    i.issue_date,
    i.return_date
FROM Issue i
JOIN Members m ON i.member_id = m.member_id
JOIN Books b ON i.book_id = b.book_id
JOIN Authors a ON b.author_id = a.author_id
JOIN Publishers p ON b.publisher_id = p.publisher_id
