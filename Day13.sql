CREATE TABLE account (
    id INT PRIMARY KEY,
    balance INT
);

INSERT INTO account (id, balance) VALUES (1, 100);

START TRANSACTION;

SELECT balance FROM account WHERE id = 1;  -- read(a)

UPDATE account 
SET balance = balance - 40 
WHERE id = 1;  -- write(a) = 60

COMMIT;

START TRANSACTION;

SELECT balance FROM account WHERE id = 1;

UPDATE account 
SET balance = balance - 40 
WHERE id = 1;  -- write(a) = 20

COMMIT;


START TRANSACTION;

SELECT balance FROM account WHERE id = 1;

UPDATE account 
SET balance = balance - 20 
WHERE id = 1;  -- write(a) = 0

COMMIT;

SELECT * FROM account;

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SELECT * FROM account WHERE balance > 100;

SELECT id, balance FROM account;