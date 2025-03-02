CREATE DATABASE OnlineShoppingSystem;
USE OnlineShoppingSystem;

CREATE TABLE Customers (
    CustomerID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNum INT NOT NULL, 
	Address NVARCHAR(100) NOT NULL,
);

CREATE TABLE Orders (
    OrderID INT IDENTITY PRIMARY KEY,
	CustomerID INT,
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
    OrderDate DATETIME DEFAULT GETUTCDATE(),
	TotalAmount DECIMAL(8,2),
	Status NVARCHAR(100) CHECK (Status IN ('pending', 'shipped', 'Delivered')), 
);

CREATE TABLE OrderDetails (
    OrderDetailID INT IDENTITY PRIMARY KEY,
    Quantity INT NOT NULL ,
    Price DECIMAL(10,2) NOT NULL,
);

CREATE TABLE Products (
    ProductID INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Category NVARCHAR(100) NOT NULL,
	Discription NVARCHAR(100) NOT NULL,
);

CREATE TABLE Suppliers (
    SupplierID INT IDENTITY PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(200)  NOT NULL,
);

CREATE TABLE Product_Supplier (
    ProductID INT,
	SupplierID INT,
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY(SupplierID) REFERENCES Suppliers(SupplierID),
    PRIMARY KEY (ProductID, SupplierID),
);

CREATE TABLE Order_Product (
    OrderID INT,
	ProductID INT,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    PRIMARY KEY (OrderID, ProductID),
);

CREATE TABLE Associated (
    OrderID INT,
	ProductID INT,
	 OrderDetailID INT,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
	FOREIGN KEY (OrderDetailID) REFERENCES OrderDetails(OrderDetailID),
    PRIMARY KEY (OrderID, ProductID),
);

INSERT INTO Products (ProductName, Price, Category, Discription)
VALUES
('Laptop', 33000.00, 'Electronics', 'High-performance laptop');

INSERT INTO Customers (Name, Email, PhoneNum, Address)
VALUES
('menna', 'menna@gmail.com', 1234567890, '123 Main St, NY');
