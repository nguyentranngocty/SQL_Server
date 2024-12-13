-- khach order > 20, sx theo orderID giam
SELECT 
	CustomerID
	, COUNT(OrderID) AS "Number of Orders"
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 20
ORDER BY COUNT(OrderID) DESC;

-- employeeID order > 100, sx orderID giam dan
SELECT
	EmployeeID
	, COUNT(OrderID) AS "Total Orders"
FROM Orders
GROUP BY EmployeeID
HAVING COUNT(OrderID) >= 100
ORDER BY COUNT(OrderID) DESC;

-- CategoryID so product khac nhau > 11
SELECT DISTINCT
	CategoryID
	, COUNT(ProductID) AS "Total products"
FROM Products
GROUP BY CategoryID
HAVING COUNT(ProductID) >= 11;

-- CategoryID co tong UnitsInStock > 350 
SELECT
	CategoryID
	, SUM(UnitsInStock) AS "Sum of UnitsInStock"
FROM Products
GROUP BY CategoryID
HAVING SUM(UnitsInStock) > 350;

-- quoc gia co > 7 don hang
SELECT
	ShipCountry
	, COUNT(OrderID) AS "Orders"
FROM Orders
GROUP BY ShipCountry
HAVING COUNT(OrderID) > 7;

-- ShippedDate > 5 orders, sx ShippedDate tang dan 
SELECT 
	ShippedDate
	, COUNT(OrderID) AS "Number of Orders"
FROM Orders
GROUP BY ShippedDate
HAVING COUNT(OrderID) > 5
ORDER BY ShippedDate;

-- quoc gia bat dau bang 'A' or 'G' va so luong don hang > 29
SELECT 
	ShipCountry
	, COUNT(OrderID) AS "Number of Orders"
FROM Orders
WHERE ShipCountry LIKE 'A%' OR ShipCountry LIKE 'G%'
GROUP BY ShipCOuntry
HAVING COUNT(OrderID) > 29
ORDER BY COUNT(OrderID) DESC;

-- Practice
SELECT
	ShipCity
	,COUNT(*) AS "Total orders"
FROM Orders
WHERE OrderDate BETWEEN '1997-04-01' AND '1997-08-31'
GROUP BY ShipCity
HAVING COUNT(*) NOT IN(1, 2);