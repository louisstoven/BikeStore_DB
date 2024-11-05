-- Select all customers from the Customers table
SELECT * FROM Customers;

-- Count the total number of products in the Products table
SELECT COUNT(*) AS TotalProducts FROM Products;

-- Find all purchases made by a specific customer (CustomerID = 23)
SELECT * FROM Purchases WHERE CustomerID = 23;

-- Get the details of all products with a price greater than $10
SELECT * FROM Products WHERE Price > 10;

-- Retrieve the names and addresses of all customers from New York
SELECT FirstName, LastName, Address FROM Customers WHERE City = 'New York';

-- List all products along with their stock quantity that are out of stock
SELECT Name, StockQuantity FROM Products WHERE StockQuantity = 0;

-- Join Purchases and PurchaseDetails to get detailed information about purchases
SELECT p.PurchaseID, pd.ProductID, pd.Quantity 
FROM Purchases p
JOIN PurchaseDetails pd ON p.PurchaseID = pd.PurchaseID;

-- Calculate the total sales amount from all purchases
SELECT SUM(TotalAmount) AS TotalSales FROM Purchases;

-- Find all repairs that cost more than $50
SELECT * FROM Repairs WHERE Cost > 50;

-- Get the average price of all products in the database
SELECT AVG(Price) AS AveragePrice FROM Products;

-- List all deliveries scheduled for a specific date (e.g., '2024--0')
SELECT * FROM delivery WHERE DeliveryDate LIKE '2024%';

-- Retrieve all suppliers that supply a specific product category (e.g., 'Bicycles')
SELECT * FROM Products WHERE Category = 'Bicycles';

-- Count how many repairs have been made for each product
SELECT p.Name, SUM(pd.Quantity) AS TotalSold
FROM PurchaseDetails pd
JOIN Products p ON pd.ProductID = p.ProductID
GROUP BY p.ProductID;


-- Find the most expensive product in the Products table
SELECT * FROM Products ORDER BY Price DESC;

-- Get all purchases made within the last 30 days
SELECT * FROM Purchases WHERE PurchaseDate >= NOW() - INTERVAL 30 DAY;

-- Find the total number of each product sold
SELECT ProductID, SUM(Quantity) AS TotalSold 
FROM PurchaseDetails 
GROUP BY ProductID;

-- List all products that have a stock quantity below 3 items
SELECT Name FROM Products WHERE StockQuantity < 3;

-- Find the customer with the highest number of purchases
SELECT CustomerID, COUNT(*) AS PurchaseCount 
FROM Purchases 
GROUP BY CustomerID 
ORDER BY PurchaseCount DESC;

-- Get a summary of the number of products in each category
SELECT Category, COUNT(*) AS ProductCount 
FROM Products 
GROUP BY Category;

-- Retrieve all repairs along with the corresponding customer information
SELECT r.*, c.FirstName, c.LastName 
FROM Repairs r
JOIN Customers c ON r.CustomerID = c.CustomerID;