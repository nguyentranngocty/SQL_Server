-- Lay ra ProductName
SELECT ProductName AS Products
FROM Products;

-- Lay ra ProductName, UnitPrice, UnitQuantity
SELECT 
	ProductName AS Products
	, UnitPrice AS Price
	, QuantityPerUnit AS Quantity 
FROM Products;

-- Lay ra ContactName, Country
SELECT 
	ContactName
	, Country
FROM Customers;

-- Lay du lieu tren bang Customer va Product
SELECT * 
FROM Customers;
SELECT * 
FROM Products;

-- Lay ra Country - Customers khac nhau
SELECT Country 
FROM Customers; -- bi lap
SELECT DISTINCT Country 
FROM Customers; -- ko bi lap

-- Lay PostalCode - Suppliers khac nhau
SELECT DISTINCT PostalCode 
FROM Suppliers;

-- Lay 5 dong dau tien trong bang Customers
SELECT TOP 5 *
FROM Customers;

SELECT TOP 10 
	ContactName AS Name
	, CompanyName AS Company
FROM Customers;

-- Lay 30% Employees
SELECT TOP 30 PERCENT * 
FROM Employees;

SELECT TOP 30 PERCENT 
	LastName AS Name
	, BirthDate AS Birthday
	, City
	, Country 
FROM Employees;

-- Lay top 5 Orders du lieu ko trung lap 
SELECT DISTINCT TOP 5 CustomerID
FROM Orders;

-- Bi danh Alias
SELECT 
	ContactName AS Tên
	, CompanyName AS [Tên công ty]
	, PostalCode AS "Mã bưu điện"
	, City "Công ty"
FROM Customers;

SELECT TOP 15 o.* -- thay ten bang Orders thanh o 
FROM Orders AS o;

