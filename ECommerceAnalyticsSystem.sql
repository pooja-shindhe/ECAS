create database ECommerceAnalyticsSystem;

use ECommerceAnalyticsSystem

show tables;
CREATE TABLE customers(
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    State VARCHAR(50),
    RegistrationDate DATE
);

CREATE TABLE categories(
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(100)
);

CREATE TABLE brands(
    BrandID INT PRIMARY KEY AUTO_INCREMENT,
    BrandName VARCHAR(100)
);

CREATE TABLE products(
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    CategoryID INT,
    BrandID INT,
    Price DECIMAL(10,2),
    StockQuantity INT,

    FOREIGN KEY(CategoryID)
    REFERENCES categories(CategoryID),

    FOREIGN KEY(BrandID)
    REFERENCES brands(BrandID)
);

CREATE TABLE sellers(
    SellerID INT PRIMARY KEY AUTO_INCREMENT,
    SellerName VARCHAR(100),
    City VARCHAR(50),
    Rating DECIMAL(2,1)
);

CREATE TABLE orders(
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    OrderStatus VARCHAR(30),

    FOREIGN KEY(CustomerID)
    REFERENCES customers(CustomerID)
);

CREATE TABLE orderdetails(
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),

    FOREIGN KEY(OrderID)
    REFERENCES orders(OrderID),

    FOREIGN KEY(ProductID)
    REFERENCES products(ProductID)
);


CREATE TABLE payments(
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    AmountPaid DECIMAL(10,2),
    PaymentMethod VARCHAR(30),
    PaymentDate DATE,

    FOREIGN KEY(OrderID)
    REFERENCES orders(OrderID)
);

CREATE TABLE shipping(
    ShippingID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    CourierName VARCHAR(50),
    ShippingStatus VARCHAR(30),
    DeliveryDate DATE,

    FOREIGN KEY(OrderID)
    REFERENCES orders(OrderID)
);

CREATE TABLE reviews(
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    ProductID INT,
    Rating INT,
    ReviewText TEXT,

    FOREIGN KEY(CustomerID)
    REFERENCES customers(CustomerID),

    FOREIGN KEY(ProductID)
    REFERENCES products(ProductID)
);

CREATE TABLE returns(
    ReturnID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ReturnReason TEXT,
    ReturnDate DATE,

    FOREIGN KEY(OrderID)
    REFERENCES orders(OrderID)
);

CREATE TABLE warehouses(
    WarehouseID INT PRIMARY KEY AUTO_INCREMENT,
    WarehouseName VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE inventory(
    InventoryID INT PRIMARY KEY AUTO_INCREMENT,
    WarehouseID INT,
    ProductID INT,
    Stock INT,

    FOREIGN KEY(WarehouseID)
    REFERENCES warehouses(WarehouseID),

    FOREIGN KEY(ProductID)
    REFERENCES products(ProductID)
);

CREATE TABLE coupons(
    CouponID INT PRIMARY KEY AUTO_INCREMENT,
    CouponCode VARCHAR(50),
    DiscountPercent INT
);

CREATE TABLE employees(
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);




-- insert queries


INSERT INTO categories(CategoryName) VALUES
('Electronics'),
('Fashion'),
('Home Appliances'),
('Books'),
('Sports'),
('Beauty'),
('Furniture'),
('Toys'),
('Groceries'),
('Automotive');


INSERT INTO brands(BrandName) VALUES
('Samsung'),
('Apple'),
('Nike'),
('Adidas'),
('LG'),
('Sony'),
('Puma'),
('Dell'),
('HP'),
('Lenovo'),
('Boat'),
('OnePlus'),
('Philips'),
('Bajaj'),
('Godrej'),
('Whirlpool'),
('Canon'),
('Casio'),
('Reebok'),
('Titan');


INSERT INTO sellers(SellerName,City,Rating) VALUES
('TechWorld','Chennai',4.5),
('FashionHub','Mumbai',4.2),
('HomeStore','Delhi',4.7),
('BookMart','Bangalore',4.1),
('SportZone','Hyderabad',4.6),
('ElectroMax','Pune',4.3),
('GadgetPoint','Kolkata',4.4),
('StyleStreet','Ahmedabad',4.5),
('MegaStore','Jaipur',4.2),
('TrendyKart','Lucknow',4.0),
('QuickBuy','Chennai',4.8),
('UrbanShop','Mumbai',4.1),
('SmartDeals','Delhi',4.3),
('BestChoice','Bangalore',4.5),
('PrimeSeller','Hyderabad',4.7),
('ShopEasy','Pune',4.2),
('BuyMore','Kolkata',4.4),
('MarketKing','Ahmedabad',4.6),
('RetailHub','Jaipur',4.3),
('ValueMart','Lucknow',4.5);


INSERT INTO warehouses(WarehouseName,Location) VALUES
('North Warehouse','Delhi'),
('South Warehouse','Chennai'),
('West Warehouse','Mumbai'),
('East Warehouse','Kolkata'),
('Central Warehouse','Hyderabad'),
('Pune Warehouse','Pune'),
('Bangalore Warehouse','Bangalore'),
('Jaipur Warehouse','Jaipur'),
('Ahmedabad Warehouse','Ahmedabad'),
('Lucknow Warehouse','Lucknow');


INSERT INTO coupons(CouponCode,DiscountPercent) VALUES
('SAVE10',10),
('SAVE15',15),
('SAVE20',20),
('SAVE25',25),
('WELCOME10',10),
('WELCOME20',20),
('NEWUSER15',15),
('FESTIVE10',10),
('FESTIVE20',20),
('FESTIVE30',30),
('SUMMER15',15),
('WINTER20',20),
('BIGSALE25',25),
('FLASH10',10),
('MEGA30',30);


INSERT INTO employees(EmployeeName,Department,Salary) VALUES
('Amit Kumar','Sales',55000),
('Neha Sharma','Support',50000),
('Rahul Singh','Logistics',60000),
('Priya Verma','Finance',65000),
('Arjun Rao','HR',52000),
('Sneha Patel','Sales',56000),
('Vikram Gupta','Support',51000),
('Pooja Nair','Finance',68000),
('Karan Mehta','Logistics',59000),
('Rohit Jain','HR',53000),
('Anjali Shah','Sales',57000),
('Deepak Roy','Support',50000),
('Sanjay Das','Finance',70000),
('Nisha Reddy','HR',54000),
('Manoj Kumar','Logistics',61000),
('Asha Devi','Sales',55000),
('Rakesh Sharma','Support',52000),
('Kavya Iyer','Finance',67000),
('Harish Patel','HR',56000),
('Vivek Singh','Logistics',62000),
('Meena Rao','Sales',58000),
('Gopal Verma','Support',51000),
('Suresh Nair','Finance',69000),
('Divya Sharma','HR',55000),
('Ajay Kumar','Logistics',63000);


SELECT COUNT(*) FROM categories;
SELECT COUNT(*) FROM brands;
SELECT COUNT(*) FROM sellers;
SELECT COUNT(*) FROM warehouses;
SELECT COUNT(*) FROM coupons;
SELECT COUNT(*) FROM employees;

show tables;
SELECT * FROM categories;
SELECT * FROM brands;
SELECT * FROM sellers;
SELECT * FROM warehouses;
SELECT * FROM coupons;
SELECT * FROM employees;


-- SELECT VERSION();

-- INSERTION USING STORED PROCEDURE
DELIMITER //

CREATE PROCEDURE GenerateCustomers()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 20000 DO

        INSERT INTO customers
        (
            CustomerName,
            Gender,
            Age,
            Email,
            Phone,
            City,
            State,
            RegistrationDate
        )
        VALUES
        (
            CONCAT('Customer_',i),
            IF(MOD(i,2)=0,'Male','Female'),
            FLOOR(18 + RAND()*50),
            CONCAT('customer',i,'@gmail.com'),
            CONCAT('98',LPAD(i,8,'0')),
            ELT(1+MOD(i,5),
                'Chennai',
                'Mumbai',
                'Delhi',
                'Bangalore',
                'Hyderabad'),
            ELT(1+MOD(i,5),
                'Tamil Nadu',
                'Maharashtra',
                'Delhi',
                'Karnataka',
                'Telangana'),
            DATE_ADD('2024-01-01',
            INTERVAL FLOOR(RAND()*700) DAY)
        );

        SET i = i + 1;

    END WHILE;
END//

DELIMITER ;

CALL GenerateCustomers();

-- DROP PROCEDURE IF EXISTS GenerateCustomers; 


DELIMITER //

CREATE PROCEDURE GenerateProducts()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE i <= 5000 DO

        INSERT INTO products
        (
            ProductName,
            CategoryID,
            BrandID,
            Price,
            StockQuantity
        )
        VALUES
        (
            CONCAT('Product_',i),
            FLOOR(1 + RAND()*10),
            FLOOR(1 + RAND()*20),
            ROUND(500 + RAND()*100000,2),
            FLOOR(50 + RAND()*500)
        );

        SET i = i + 1;

    END WHILE;

END//


DELIMITER ;

call GenerateProducts()

DELIMITER //

CREATE PROCEDURE GenerateOrders()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE i <= 100000 DO

        INSERT INTO orders
        (
            CustomerID,
            OrderDate,
            OrderStatus
        )
        VALUES
        (
            FLOOR(1 + RAND()*20000),
            DATE_ADD('2024-01-01',
            INTERVAL FLOOR(RAND()*700) DAY),
            ELT(
                FLOOR(1 + RAND()*4),
                'Delivered',
                'Pending',
                'Shipped',
                'Cancelled'
            )
        );

        SET i = i + 1;

    END WHILE;

END//

DELIMITER ;


CALL GenerateOrders();


DELIMITER //

CREATE PROCEDURE GenerateOrderDetails()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE i <= 300000 DO

        INSERT INTO orderdetails
        (
            OrderID,
            ProductID,
            Quantity,
            UnitPrice
        )
        VALUES
        (
            FLOOR(1 + RAND()*100000),
            FLOOR(1 + RAND()*5000),
            FLOOR(1 + RAND()*5)+1,
            ROUND(500 + RAND()*100000,2)
        );

        SET i = i + 1;

    END WHILE;

END//

DELIMITER ;

CALL GenerateOrderDetails();

DELIMITER //

CREATE PROCEDURE GeneratePayments()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE i <= 100000 DO

        INSERT INTO payments
        (
            OrderID,
            AmountPaid,
            PaymentMethod,
            PaymentDate
        )
        VALUES
        (
            i,
            ROUND(1000 + RAND()*150000,2),
            ELT(
                FLOOR(1 + RAND()*4),
                'UPI',
                'Credit Card',
                'Debit Card',
                'Net Banking'
            ),
            DATE_ADD('2024-01-01',
            INTERVAL FLOOR(RAND()*700) DAY)
        );

        SET i = i + 1;

    END WHILE;

END//

DELIMITER ;

CALL GeneratePayments();



DELIMITER //

CREATE PROCEDURE GenerateShipping()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE i <= 100000 DO

        INSERT INTO shipping
        (
            OrderID,
            CourierName,
            ShippingStatus,
            DeliveryDate
        )
        VALUES
        (
            i,
            ELT(
                FLOOR(1 + RAND()*5),
                'BlueDart',
                'DTDC',
                'Delhivery',
                'Ecom Express',
                'XpressBees'
            ),
            ELT(
                FLOOR(1 + RAND()*4),
                'Delivered',
                'In Transit',
                'Pending',
                'Cancelled'
            ),
            DATE_ADD('2024-01-01',
            INTERVAL FLOOR(RAND()*700) DAY)
        );

        SET i = i + 1;

    END WHILE;

END//

DELIMITER ;


CALL GenerateShipping();



DELIMITER //

CREATE PROCEDURE GenerateReviews()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE i <= 50000 DO

        INSERT INTO reviews
        (
            CustomerID,
            ProductID,
            Rating,
            ReviewText
        )
        VALUES
        (
            FLOOR(1 + RAND()*20000),
            FLOOR(1 + RAND()*5000),
            FLOOR(1 + RAND()*5),
            CONCAT('Review_',i)
        );

        SET i = i + 1;

    END WHILE;

END//

DELIMITER ;


CALL GenerateReviews();




DELIMITER //

CREATE PROCEDURE GenerateReturns()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE i <= 20000 DO

        INSERT INTO returns
        (
            OrderID,
            ReturnReason,
            ReturnDate
        )
        VALUES
        (
            FLOOR(1 + RAND()*100000),
            ELT(
                FLOOR(1 + RAND()*5),
                'Damaged Product',
                'Wrong Item',
                'Late Delivery',
                'Poor Quality',
                'Customer Cancelled'
            ),
            DATE_ADD('2024-01-01',
            INTERVAL FLOOR(RAND()*700) DAY)
        );

        SET i = i + 1;

    END WHILE;

END//

DELIMITER ;

CALL GenerateReturns();




DELIMITER //

CREATE PROCEDURE GenerateInventory()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE i <= 10000 DO

        INSERT INTO inventory
        (
            WarehouseID,
            ProductID,
            Stock
        )
        VALUES
        (
            FLOOR(1 + RAND()*10),
            FLOOR(1 + RAND()*5000),
            FLOOR(10 + RAND()*1000)
        );

        SET i = i + 1;

    END WHILE;

END//

DELIMITER ;

CALL GenerateInventory();

-- show tables;
-- SELECT * FROM categories;
-- SELECT * FROM brands;
-- SELECT * FROM sellers;
-- SELECT * FROM warehouses;
-- SELECT * FROM coupons;
-- SELECT * FROM employees;

SELECT COUNT(*) FROM categories;
SELECT COUNT(*) FROM brands;
SELECT COUNT(*) FROM sellers;
SELECT COUNT(*) FROM warehouses;
SELECT COUNT(*) FROM coupons;
SELECT COUNT(*) FROM employees;

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM orderdetails;
SELECT COUNT(*) FROM payments;
SELECT COUNT(*) FROM shipping;
SELECT COUNT(*) FROM reviews;
SELECT COUNT(*) FROM returns;
SELECT COUNT(*) FROM inventory;




-- -----------------------------------------------------------------------------------------------------------------------
-- BASIC LEVEL

-- 1. Find customers above age 60.

 
SELECT *
FROM customers
WHERE Age > 60;
        

-- 2. Retrieve all orders placed today.

 
SELECT *
FROM orders
WHERE OrderDate = CURDATE();
        

-- 3. Find total customers available in each city.

 
SELECT City, COUNT(*) TotalCustomers
FROM customers
GROUP BY City;
        

-- 4. Display products with stock quantity below 100.

 
SELECT *
FROM products
WHERE StockQuantity < 100;
        

-- 5. Find total orders placed by each customer.

 
SELECT CustomerID,
COUNT(*) TotalOrders
FROM orders
GROUP BY CustomerID;
        

-- 6. Retrieve customers who never placed an order.

 
SELECT *
FROM customers
WHERE CustomerID NOT IN
(
    SELECT CustomerID
    FROM orders
);
        

-- 7. Find products priced above ₹50,000.

 
SELECT *
FROM products
WHERE Price > 50000;
        

-- 8. Display top 10 highest-priced products.

 
SELECT *
FROM products
ORDER BY Price DESC
LIMIT 10;
        

-- 9. Find total inventory stock warehouse-wise.

 
SELECT WarehouseID,
SUM(Stock) TotalStock
FROM inventory
GROUP BY WarehouseID;
        

-- 10. Find total revenue generated through payments.

 
SELECT SUM(AmountPaid) TotalRevenue
FROM payments;
        

-- -------------------------------------------------------

-- INTERMEDIATE LEVEL


-- 11. Top 5 customers by spending.

 
SELECT c.CustomerID,
c.CustomerName,
SUM(p.AmountPaid) TotalSpent
FROM customers c
JOIN orders o
ON c.CustomerID=o.CustomerID
JOIN payments p
ON o.OrderID=p.OrderID
GROUP BY c.CustomerID,c.CustomerName
ORDER BY TotalSpent DESC
LIMIT 5;
        

-- 12. Top 10 products by sales revenue.

 
SELECT ProductID,
SUM(Quantity*UnitPrice) Revenue
FROM orderdetails
GROUP BY ProductID
ORDER BY Revenue DESC
LIMIT 10;
        

-- 13. Category generating maximum revenue.

 
SELECT c.CategoryName,
SUM(od.Quantity*od.UnitPrice) Revenue
FROM categories c
JOIN products p
ON c.CategoryID=p.CategoryID
JOIN orderdetails od
ON p.ProductID=od.ProductID
GROUP BY c.CategoryName
ORDER BY Revenue DESC
LIMIT 1;
        

-- 14. Most reviewed product.

 
SELECT ProductID,
COUNT(*) ReviewCount
FROM reviews
GROUP BY ProductID
ORDER BY ReviewCount DESC
LIMIT 1;
        

-- 15. Customers ordering from multiple categories.

 
SELECT o.CustomerID
FROM orders o
JOIN orderdetails od
ON o.OrderID=od.OrderID
JOIN products p
ON od.ProductID=p.ProductID
GROUP BY o.CustomerID
HAVING COUNT(DISTINCT p.CategoryID)>1;
        

-- 16. Top 10 cities generating maximum revenue.

 
SELECT c.City,
SUM(p.AmountPaid) Revenue
FROM customers c
JOIN orders o
ON c.CustomerID=o.CustomerID
JOIN payments p
ON o.OrderID=p.OrderID
GROUP BY c.City
ORDER BY Revenue DESC
LIMIT 10;
        

-- 17. Products never sold.

 
SELECT p.*
FROM products p
LEFT JOIN orderdetails od
ON p.ProductID=od.ProductID
WHERE od.ProductID IS NULL;
        

-- 18. Most frequently used payment method.

 
SELECT PaymentMethod,
COUNT(*) UsageCount
FROM payments
GROUP BY PaymentMethod
ORDER BY UsageCount DESC
LIMIT 1;
        






-- 19. Repeat customers.

 
SELECT CustomerID,
COUNT(*) OrderCount
FROM orders
GROUP BY CustomerID
HAVING COUNT(*)>1;
        

-- 20. Monthly sales trend.

 
SELECT YEAR(PaymentDate),
MONTH(PaymentDate),
SUM(AmountPaid)
FROM payments
GROUP BY YEAR(PaymentDate),
MONTH(PaymentDate);
        


 
-- -----------------------------------------

-- ADVANCED SQL (STORED PROCEDURE, TRIGGERS)


-- 21. Find the Second Highest Spending Customer

 
SELECT *
FROM
(
    SELECT
        c.CustomerID,
        c.CustomerName,
        SUM(p.AmountPaid) TotalSpent,
        DENSE_RANK() OVER(
            ORDER BY SUM(p.AmountPaid) DESC
        ) AS rn
    FROM customers c
    JOIN orders o
        ON c.CustomerID=o.CustomerID
    JOIN payments p
        ON o.OrderID=p.OrderID
    GROUP BY c.CustomerID,c.CustomerName
) x
WHERE rn=2;
        

        

-- 22. Product Revenue Ranking

 
SELECT
    ProductID,
    SUM(Quantity*UnitPrice) Revenue,
    RANK() OVER(
        ORDER BY SUM(Quantity*UnitPrice) DESC
    ) ProductRank
FROM orderdetails
GROUP BY ProductID;
        

        

-- 23. Customer Lifetime Value (CLV)

 
SELECT
    c.CustomerID,
    c.CustomerName,
    SUM(p.AmountPaid) LifetimeValue
FROM customers c
JOIN orders o
    ON c.CustomerID=o.CustomerID
JOIN payments p
    ON o.OrderID=p.OrderID
GROUP BY c.CustomerID,c.CustomerName
ORDER BY LifetimeValue DESC;
        

        

-- 24. Detect Suspicious Payments

 
SELECT
    o.OrderID,
    SUM(od.Quantity*od.UnitPrice) OrderValue,
    SUM(p.AmountPaid) PaidValue
FROM orders o
JOIN orderdetails od
    ON o.OrderID=od.OrderID
JOIN payments p
    ON o.OrderID=p.OrderID
GROUP BY o.OrderID
HAVING PaidValue > OrderValue;
        

        

-- 25. Top 10 Customers using CTE

 
WITH CustomerRevenue AS
(
    SELECT
        c.CustomerID,
        c.CustomerName,
        SUM(p.AmountPaid) Revenue
    FROM customers c
    JOIN orders o
        ON c.CustomerID=o.CustomerID
    JOIN payments p
        ON o.OrderID=p.OrderID
    GROUP BY c.CustomerID,c.CustomerName
)
SELECT *
FROM CustomerRevenue
ORDER BY Revenue DESC
LIMIT 10;
        


-- 26. Running Revenue Month-over-Month

 
SELECT
    YEAR(PaymentDate) YearNo,
    MONTH(PaymentDate) MonthNo,
    SUM(AmountPaid) Revenue,
    SUM(SUM(AmountPaid))
    OVER(
        ORDER BY YEAR(PaymentDate),
        MONTH(PaymentDate)
    ) RunningRevenue
FROM payments
GROUP BY
    YEAR(PaymentDate),
    MONTH(PaymentDate);
        

        

-- 27. Category Revenue Contribution %

 
SELECT
    c.CategoryName,
    ROUND(
        SUM(od.Quantity*od.UnitPrice)*100/
        (
            SELECT SUM(Quantity*UnitPrice)
            FROM orderdetails
        ),
        2
    ) ContributionPercent
FROM categories c
JOIN products p
    ON c.CategoryID=p.CategoryID
JOIN orderdetails od
    ON p.ProductID=od.ProductID
GROUP BY c.CategoryName;
        

        

-- 28. Customers Spending Above Average

 
SELECT *
FROM
(
    SELECT
        c.CustomerID,
        c.CustomerName,
        SUM(p.AmountPaid) TotalSpent
    FROM customers c
    JOIN orders o
        ON c.CustomerID=o.CustomerID
    JOIN payments p
        ON o.OrderID=p.OrderID
    GROUP BY c.CustomerID,c.CustomerName
) x
WHERE TotalSpent >
(
    SELECT AVG(CustomerSpend)
    FROM
    (
        SELECT
            SUM(p.AmountPaid) CustomerSpend
        FROM customers c
        JOIN orders o
            ON c.CustomerID=o.CustomerID
        JOIN payments p
            ON o.OrderID=p.OrderID
        GROUP BY c.CustomerID
    ) y
);
        




-- 29.Customers Spending Above Their City's Average


SELECT
    c.CustomerID,
    c.CustomerName,
    c.City,
    SUM(p.AmountPaid) TotalSpent
FROM customers c
JOIN orders o
    ON c.CustomerID = o.CustomerID
JOIN payments p
    ON o.OrderID = p.OrderID
GROUP BY
    c.CustomerID,
    c.CustomerName,
    c.City
HAVING SUM(p.AmountPaid) >
(
    SELECT AVG(CustomerRevenue)
    FROM
    (
        SELECT
            c2.CustomerID,
            SUM(p2.AmountPaid) CustomerRevenue
        FROM customers c2
        JOIN orders o2
            ON c2.CustomerID = o2.CustomerID
        JOIN payments p2
            ON o2.OrderID = p2.OrderID
        WHERE c2.City = c.City
        GROUP BY c2.CustomerID
    ) CityCustomers
);




-- 30. Find Customers Who Have Placed Orders

SELECT *
FROM customers c
WHERE EXISTS
(
    SELECT 1
    FROM orders o
    WHERE o.CustomerID=c.CustomerID
);



-- 31. Find Customers Who Never Placed Orders

SELECT *
FROM customers c
WHERE NOT EXISTS
(
    SELECT 1
    FROM orders o
    WHERE o.CustomerID=c.CustomerID
);
       

        

-- 32.Frequently Purchased Together Products


SELECT
    od1.ProductID ProductA,
    od2.ProductID ProductB,
    COUNT(*) Frequency
FROM orderdetails od1
JOIN orderdetails od2
ON od1.OrderID=od2.OrderID
AND od1.ProductID < od2.ProductID
GROUP BY
od1.ProductID,
od2.ProductID;


-- 33.Rank Products Within Each Category

SELECT
    p.CategoryID,
    p.ProductID,
    SUM(od.Quantity*od.UnitPrice) Revenue,
    RANK() OVER
    (
        PARTITION BY p.CategoryID
        ORDER BY SUM(od.Quantity*od.UnitPrice) DESC
    ) CategoryRank
FROM products p
JOIN orderdetails od
ON p.ProductID=od.ProductID
GROUP BY
p.CategoryID,
p.ProductID;



-- 34. Month-over-Month Growth %
WITH MonthlySales AS
(
    SELECT
        YEAR(PaymentDate) AS Yr,
        MONTH(PaymentDate) AS Mn,
        SUM(AmountPaid) AS Revenue
    FROM payments
    GROUP BY
        YEAR(PaymentDate),
        MONTH(PaymentDate)
)
SELECT
    Yr,
    Mn,
    Revenue,
    LAG(Revenue) OVER(ORDER BY Yr, Mn) AS PreviousMonthRevenue,
    ROUND(
        (
            Revenue -
            LAG(Revenue) OVER(ORDER BY Yr, Mn)
        ) * 100.0 /
        LAG(Revenue) OVER(ORDER BY Yr, Mn),
        2
    ) AS GrowthPercent
FROM MonthlySales;



-- 35. Customer Segmentation
CASE
WHEN Revenue > 100000 THEN 'Platinum'
WHEN Revenue > 50000 THEN 'Gold'
WHEN Revenue > 20000 THEN 'Silver'
ELSE 'Bronze'
END


-- 36. Create Customer Revenue View
CREATE VIEW vw_customer_revenue AS
SELECT
c.CustomerID,
c.CustomerName,
SUM(p.AmountPaid) Revenue
FROM customers c
JOIN orders o
ON c.CustomerID=o.CustomerID
JOIN payments p
ON o.OrderID=p.OrderID
GROUP BY
c.CustomerID,
c.CustomerName;



-- 37. Create Product Sales View
CREATE VIEW vw_product_sales AS
SELECT
p.ProductID,
p.ProductName,
SUM(od.Quantity*od.UnitPrice) Revenue
FROM products p
JOIN orderdetails od
ON p.ProductID=od.ProductID
GROUP BY
p.ProductID,
p.ProductName;




-- 38.Get Customer Orders by Customer ID

DROP PROCEDURE IF EXISTS GetCustomerOrders;

DELIMITER //

CREATE PROCEDURE GetCustomerOrders
(
    IN p_customerid INT
)
BEGIN

    SELECT
        OrderID,
        CustomerID,
        OrderDate,
        OrderStatus
    FROM orders
    WHERE CustomerID = p_customerid;

END //

DELIMITER ;

CALL GetCustomerOrders(101);





-- 39. Monthly Sales Report



DROP PROCEDURE IF EXISTS MonthlySalesReport;

DELIMITER //

CREATE PROCEDURE MonthlySalesReport()
BEGIN

    SELECT
        YEAR(PaymentDate) AS YearNo,
        MONTH(PaymentDate) AS MonthNo,
        SUM(AmountPaid) AS Revenue
    FROM payments
    GROUP BY
        YEAR(PaymentDate),
        MONTH(PaymentDate)
    ORDER BY
        YearNo,
        MonthNo;

END //

DELIMITER ;


CALL MonthlySalesReport();




-- 40.Top Customer Report

DROP PROCEDURE IF EXISTS TopCustomers;

DELIMITER //

CREATE PROCEDURE TopCustomers()
BEGIN

    SELECT
        c.CustomerID,
        c.CustomerName,
        SUM(p.AmountPaid) AS Revenue
    FROM customers c
    JOIN orders o
        ON c.CustomerID = o.CustomerID
    JOIN payments p
        ON o.OrderID = p.OrderID
    GROUP BY
        c.CustomerID,
        c.CustomerName
    ORDER BY Revenue DESC
    LIMIT 10;

END //

DELIMITER ;


CALL TopCustomers();

-- ----------------------------------------------------------------------------------------------------
-- ADVANCED SQL OBJECTS
-- Trigger 1: Inventory Automation


DELIMITER //

CREATE TRIGGER InventoryAutomation
AFTER INSERT ON orderdetails
FOR EACH ROW
BEGIN

    UPDATE inventory
    SET Stock = Stock - NEW.Quantity
    WHERE ProductID = NEW.ProductID;

END //

DELIMITER ;


Trigger 2: Payment Status Automation

Add a new column:

ALTER TABLE orders
ADD PaymentStatus VARCHAR(20) DEFAULT 'Pending';

Trigger:

DELIMITER //

CREATE TRIGGER PaymentAutomation
AFTER INSERT ON payments
FOR EACH ROW
BEGIN

    UPDATE orders
    SET PaymentStatus='Paid'
    WHERE OrderID=NEW.OrderID;

END //

DELIMITER ;


-- Procedure 1: Prevent Out-of-Stock Orders

DROP PROCEDURE IF EXISTS CheckStock;

DELIMITER //

CREATE PROCEDURE CheckStock
(
    IN p_ProductID INT,
    IN p_Quantity INT
)
BEGIN

    DECLARE availableStock INT;

    SELECT Stock
    INTO availableStock
    FROM inventory
    WHERE ProductID=p_ProductID
    LIMIT 1;

    IF availableStock < p_Quantity THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Insufficient Stock';

    END IF;

END //

DELIMITER ;

Example:

CALL CheckStock(100,500);


-- Procedure 2: Monthly Sales Report

DROP PROCEDURE IF EXISTS MonthlySalesReport;

DELIMITER //

CREATE PROCEDURE MonthlySalesReport()
BEGIN

    SELECT
        YEAR(PaymentDate) YearNo,
        MONTH(PaymentDate) MonthNo,
        SUM(AmountPaid) Revenue
    FROM payments
    GROUP BY
        YEAR(PaymentDate),
        MONTH(PaymentDate)
    ORDER BY
        YearNo,
        MonthNo;

END //

DELIMITER ;

Example:

CALL MonthlySalesReport();


-- Procedure 3: Top Customer Report

DROP PROCEDURE IF EXISTS TopCustomers;

DELIMITER //

CREATE PROCEDURE TopCustomers()
BEGIN

    SELECT
        c.CustomerID,
        c.CustomerName,
        SUM(p.AmountPaid) Revenue
    FROM customers c
    JOIN orders o
        ON c.CustomerID=o.CustomerID
    JOIN payments p
        ON o.OrderID=p.OrderID
    GROUP BY
        c.CustomerID,
        c.CustomerName
    ORDER BY Revenue DESC
    LIMIT 10;

END //

DELIMITER ;



-- Procedure 4: Suspicious Payment Detection

DROP PROCEDURE IF EXISTS SuspiciousPayments;

DELIMITER //

CREATE PROCEDURE SuspiciousPayments()
BEGIN

    SELECT
        o.OrderID,
        SUM(od.Quantity*od.UnitPrice) OrderValue,
        SUM(p.AmountPaid) PaidValue
    FROM orders o
    JOIN orderdetails od
        ON o.OrderID=od.OrderID
    JOIN payments p
        ON o.OrderID=p.OrderID
    GROUP BY o.OrderID
    HAVING PaidValue > OrderValue;

END //

DELIMITER ;




-- Procedure 5: Category Revenue Report

DROP PROCEDURE IF EXISTS CategoryRevenue;

DELIMITER //

CREATE PROCEDURE CategoryRevenue()
BEGIN

    SELECT
        c.CategoryName,
        SUM(od.Quantity*od.UnitPrice) Revenue
    FROM categories c
    JOIN products p
        ON c.CategoryID=p.CategoryID
    JOIN orderdetails od
        ON p.ProductID=od.ProductID
    GROUP BY c.CategoryName
    ORDER BY Revenue DESC;

END //

DELIMITER ;









