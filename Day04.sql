CREATE TABLE City (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(50),
    state VARCHAR(50)
);

INSERT INTO City VALUES
(1, 'Delhi', 'Delhi'),
(2, 'Mumbai', 'Maharashtra'),
(3, 'Noida', 'Uttar Pradesh');

CREATE TABLE Person (
    person_id INT PRIMARY KEY,
    person_name VARCHAR(50),
    age INT,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES City(city_id)
);

INSERT INTO Person VALUES
(101, 'Rahul', 22, 1),
(102, 'Anjali', 24, 2),
(103, 'Amit', 21, 3);

SELECT p.person_name, p.age, c.city_name
FROM Person p
JOIN City c ON p.city_id = c.city_id;

SELECT * FROM City;
SELECT * FROM Person;


SELECT p.person_id, p.person_name, p.age,
       c.city_name, c.state
FROM Person p
INNER JOIN City c
ON p.city_id = c.city_id;


SELECT p.person_name, p.age
FROM Person p
JOIN City c
ON p.city_id = c.city_id
WHERE c.city_name = 'Delhi';


SELECT p.person_name, p.age, c.city_name
FROM Person p
JOIN City c
ON p.city_id = c.city_id
WHERE p.age > 22;

SELECT c.city_name, MIN(p.age) AS youngest_age
FROM Person p
JOIN City c
ON p.city_id = c.city_id
GROUP BY c.city_name;



SELECT p.person_name, p.age, c.city_name
FROM Person p
JOIN City c
ON p.city_id = c.city_id
ORDER BY p.age DESC;