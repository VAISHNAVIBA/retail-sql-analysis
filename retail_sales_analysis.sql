
-- Drop tables if they exist
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

-- Create tables
CREATE TABLE Customers (
  CustomerID INTEGER PRIMARY KEY,
  Name TEXT,
  Email TEXT,
  Country TEXT
);

CREATE TABLE Products (
  ProductID INTEGER PRIMARY KEY,
  ProductName TEXT,
  Price REAL
);

CREATE TABLE Orders (
  OrderID INTEGER PRIMARY KEY,
  OrderDate TEXT,
  CustomerID INTEGER,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
  OrderDetailID INTEGER PRIMARY KEY,
  OrderID INTEGER,
  ProductID INTEGER,
  Quantity INTEGER,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert data
INSERT INTO Customers VALUES
(1, 'John Doe', 'john@example.com', 'USA'),
(2, 'Priya Singh', 'priya@example.com', 'India');

INSERT INTO Products VALUES
(101, 'Laptop', 700.00),
(102, 'Mouse', 20.00);

INSERT INTO Orders VALUES
(1001, '2025-06-01', 1),
(1002, '2025-06-05', 2);

INSERT INTO OrderDetails VALUES
(1, 1001, 101, 1),
(2, 1001, 102, 2),
(3, 1002, 102, 3);
