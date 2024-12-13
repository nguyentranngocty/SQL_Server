-- Ten tang dan theo thu tu tu dien
SELECT *
FROM Suppliers
ORDER BY CompanyName ASC;

-- Products giam dan
SELECT *
FROM Products
ORDER BY UnitPrice DESC;

-- Lay 1 san pham co so luong ban cao nhat
SELECT TOP 1 *
FROM "Order Details"
ORDER BY Quantity DESC;

-- Arithmetic Operators + - * / %
SELECT 
	ProductID
	, ProductName
	, UnitsInStock
	, UnitsOnOrder
	, (UnitsInStock - UnitsOnOrder) AS StockRemaining
FROM Products;

SELECT *
	, (UnitPrice * Quantity) AS OtherDetailValue
FROM "Order Details";

SELECT *
	, (UnitPrice - UnitPrice * 0.1) AS "Gia sau khi giam 10%"
FROM Products

SELECT *
	, UnitPrice * 0.9 AS "Gia sau khi giam 10%"
FROM Products

SELECT *
	, (UnitPrice / 100) * 90 AS "Gia sau khi giam 10%"
FROM Products
