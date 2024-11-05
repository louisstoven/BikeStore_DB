DROP DATABASE IF EXISTS BikeShop;

-- Create a new database
CREATE DATABASE BikeShop;

-- Use the newly created database
USE BikeShop;

-- Drop existing tables if they exist
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS purchases;
DROP TABLE IF EXISTS purchaseDetails;
DROP TABLE IF EXISTS delivery;
DROP TABLE IF EXISTS storage;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS supplies;
DROP TABLE IF EXISTS repairs;

-- Table for storing customer information
CREATE TABLE customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for storing product information
CREATE TABLE products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT DEFAULT 0,
    Category VARCHAR(50),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Table for recording purchases with Status column
CREATE TABLE purchases (
    PurchaseID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    PurchaseDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(20) NOT NULL,  -- Added Status column
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);

-- Table for storing purchase details
CREATE TABLE purchaseDetails (
    PurchaseDetailID INT AUTO_INCREMENT PRIMARY KEY,
    PurchaseID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (PurchaseID) REFERENCES purchases(PurchaseID),
    FOREIGN KEY (ProductID) REFERENCES products(ProductID)
);

-- Table for recording delivery information
CREATE TABLE delivery (
    DeliveryID INT AUTO_INCREMENT PRIMARY KEY,
    PurchaseID INT NOT NULL,
    DeliveryDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') NOT NULL,
    TrackingNumber VARCHAR(100),
    FOREIGN KEY (PurchaseID) REFERENCES Purchases(PurchaseID)
);

-- Table for storing storage information
CREATE TABLE storage (
    StorageID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT NOT NULL,
    QuantityInStock INT NOT NULL,
    StorageLocation VARCHAR(100),
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Table for storing supplier information
CREATE TABLE suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactName VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for recording product supply
CREATE TABLE supplies (
    SupplyID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierID INT NOT NULL,
    ProductID INT NOT NULL,
    SupplyDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    QuantitySupplied INT NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Table for recording bicycle repairs
CREATE TABLE repairs (
    RepairID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    RepairDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Description TEXT NOT NULL,
    Cost DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);