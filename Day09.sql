CREATE TABLE Brand (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(40) NOT NULL,
    country VARCHAR(30)
) ENGINE=InnoDB;

CREATE TABLE TV (
    tv_id INT PRIMARY KEY,
    model VARCHAR(50),
    screen_size INT,          -- inches
    resolution VARCHAR(20),
    price DECIMAL(10,2),
    brand_id INT,
    CONSTRAINT fk_tv_brand
        FOREIGN KEY (brand_id) REFERENCES Brand(brand_id)
) ENGINE=InnoDB;

CREATE TABLE Laptop (
    laptop_id INT PRIMARY KEY,
    model VARCHAR(50),
    processor VARCHAR(40),
    ram_gb INT,
    storage_gb INT,
    price DECIMAL(10,2),
    brand_id INT,
    CONSTRAINT fk_laptop_brand
        FOREIGN KEY (brand_id) REFERENCES Brand(brand_id)
) ENGINE=InnoDB;

INSERT INTO Brand VALUES
(1,'Samsung','South Korea'),
(2,'LG','South Korea'),
(3,'Dell','USA'),
(4,'HP','USA');

INSERT INTO TV VALUES
(101,'Crystal 4K',55,'4K',55000,1),
(102,'OLED CX',65,'4K',135000,2);


INSERT INTO Laptop VALUES
(201,'Inspiron 15','Intel i5',16,512,72000,3),
(202,'Pavilion','Ryzen 7',16,1024,85000,4);



SELECT
    b.brand_name,
    t.model AS tv_model,
    l.model AS laptop_model
FROM Brand b
LEFT JOIN TV t ON b.brand_id = t.brand_id
LEFT JOIN Laptop l ON b.brand_id = l.brand_id;


SELECT
    b.brand_name,
    t.model AS tv_model,
    l.model AS laptop_model
FROM Brand b
LEFT JOIN TV t ON b.brand_id = t.brand_id
LEFT JOIN Laptop l ON b.brand_id = l.brand_id;


CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15),
    city VARCHAR(30)
) ENGINE=InnoDB;
