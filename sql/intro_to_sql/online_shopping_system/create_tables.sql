CREATE DATABASE OnlineShoppingSystem;
USE OnlineShoppingSystem;

CREATE TABLE Customers (
	CustomerID INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL, 
	Email VARCHAR(50) UNIQUE NOT NULL,
	PhoneNumber VARCHAR(50) UNIQUE NOT NULL,
	Address VARCHAR(100) NOT NULL
);

CREATE TABLE Orders (
	OrderID INT IDENTITY PRIMARY KEY,
	TotalAmount DECIMAL(10, 2) NOT NULL,
	OrderDate DATETIME DEFAULT GETUTCDATE() NOT NULL,
	Status VARCHAR(50) 
			CHECK (Status IN ('Pending', 'Shipped', 'Delivered')) 
			DEFAULT 'Pending'
			NOT NULL,
	CustomerID INT NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Products (
	ProductID INT IDENTITY PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	Category VARCHAR(50) NOT NULL,
	Description VARCHAR(MAX) NOT NULL,
	Price DECIMAL(10, 2) NOT NULL,
);

CREATE TABLE Suppliers (
	SupplierID INT IDENTITY PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	ContactInfo VARCHAR(100) NOT NULL,
);

-- many-to-many include relationship
CREATE TABLE Orders_Products (
	OrderID INT NOT NULL,
	ProductID INT NOT NULL,
	PRIMARY KEY (OrderID, ProductID),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- many-to-many supply relationship
CREATE TABLE Products_Suppliers (
	SupplierID INT NOT NULL,
	ProductID INT NOT NULL,
	PRIMARY KEY (SupplierID, ProductID),
	FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- a better way to represent the associated relationship
-- is by putting OrderID and ProductID in the OrderDetails table
-- and it's better because we don't create an extra table :3
CREATE TABLE OrderDetails (
	OrderDetailsID INT IDENTITY PRIMARY KEY,
	Quantity INT NOT NULL,
	Price DECIMAL(10, 2) NOT NULL,
	OrderID INT NOT NULL,
	ProductID INT NOT NULL,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Or if we follow the ERD
/*
CREATE TABLE OrderDetails (
	OrderDetailsID INT IDENTITY PRIMARY KEY,
	Quantity INT NOT NULL,
	Price DECIMAL(10, 2) NOT NULL,
);
CREATE TABLE Orders_Products_OrderDetails (
	OrderDetailsID INT NOT NULL,
	OrderID INT NOT NULL,
	ProductID INT NOT NULL,
	PRIMARY KEY (OrderID, ProductID, OrderDetailsID),
	FOREIGN KEY (OrderDetailsID) REFERENCES OrderDetails(OrderDetailsID),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
*/