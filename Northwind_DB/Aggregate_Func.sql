-- MIN, MAX
SELECT MIN(UnitPrice) AS "Min price" 
FROM Products; -- gia nho nhat
SELECT MAX(OrderDate) AS "Date" 
FROM Orders; -- ngay moi nhat
SELECT MIN(BirthDate) AS Birthday 
FROM Employees;
SELECT MAX(UnitsInStock) AS "Max Stock" 
FROM Products;

-- COUNT, SUM, AVG
SELECT COUNT(*) AS "Number of customer" 
FROM Customers;
SELECT COUNT(CustomerID) AS "Number of customer" 
FROM Customers;

SELECT SUM(Freight) AS "Total" 
FROM Orders;

SELECT AVG(Quantity) AS "Average" 
FROM "Order Details";

SELECT 
	COUNT(*) AS "Number of products"
	, SUM(UnitsInStock) AS "Sum of products in stock"
	, AVG(UnitPrice) AS "Average price" 
FROM Products;