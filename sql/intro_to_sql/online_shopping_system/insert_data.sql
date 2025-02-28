INSERT INTO Customers (Name, Email, PhoneNumber, Address)
VALUES
('John Doe', 'john.doe@example.com', '123-456-7890', '123 Main St, Springfield'),
('Jane Smith', 'jane.smith@example.com', '987-654-3210', '456 Elm St, Metropolis');

INSERT INTO Orders (TotalAmount, Status, CustomerID)
VALUES
(150.75, 'Pending', 1),
(299.99, 'Shipped', 2);

INSERT INTO Products (Name, Category, Description, Price)
VALUES
('Laptop', 'Electronics', '15-inch laptop with high performance', 1200.00),
('Smartphone', 'Electronics', 'Latest model with AI camera', 799.99);

INSERT INTO Suppliers (Name, ContactInfo)
VALUES
('Tech Supplies Inc.', 'techsupplies@example.com'),
('Gadget World', 'contact@gadgetworld.com');

INSERT INTO OrderDetails (Quantity, Price, OrderID, ProductID)
VALUES
(2, 1200.00, 1, 1),
(1, 799.99, 2, 2);

INSERT INTO Orders_Products (OrderID, ProductID)
VALUES
(1, 1),
(2, 2);

INSERT INTO Products_Suppliers (SupplierID, ProductID)
VALUES
(1, 1),
(2, 2);