CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(30),
    price DECIMAL(6,2)
) ENGINE=InnoDB;



CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(8,2),
    CONSTRAINT fk_order_customer
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
) ENGINE=InnoDB;



CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(8,2),
    CONSTRAINT fk_order_customer
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
) ENGINE=InnoDB;



CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(8,2),
    CONSTRAINT fk_od_order
        FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    CONSTRAINT fk_od_product
        FOREIGN KEY (product_id) REFERENCES Products(product_id)
) ENGINE=InnoDB;


INSERT INTO Customers VALUES
(1,'Amit','9876543210','Delhi'),
(2,'Neha','9123456780','Mumbai'),
(3,'Rahul','9012345678','Pune');



INSERT INTO Products VALUES
(101,'Cappuccino','Coffee',120.00),
(102,'Latte','Coffee',140.00),
(103,'Veg Sandwich','Snacks',90.00),
(104,'Brownie','Dessert',80.00);




INSERT INTO Orders VALUES
(1001,1,'2026-02-10',210.00),
(1002,2,'2026-02-11',140.00),
(1003,3,'2026-02-12',200.00);



INSERT INTO OrderDetails VALUES
(1,1001,101,1,120.00),
(2,1001,103,1,90.00),
(3,1002,102,1,140.00),
(4,1003,101,1,120.00),
(5,1003,104,1,80.00);




SELECT
    c.customer_name,
    p.product_name,
    o.order_date,
    od.quantity,
    od.subtotal
FROM OrderDetails od
JOIN Orders o ON od.order_id = o.order_id
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON od.product_id = p.product_id;


SELECT
    p.product_name,
    SUM(od.quantity) AS total_sold,
    SUM(od.subtotal) AS total_revenue
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_name;

-- Streak commit for today
