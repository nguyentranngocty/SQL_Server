-- moi khach hang co bao nhieu don hang
SELECT 
	CustomerID
	, COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY CustomerID;

-- don gia trung binh cua moi nha cung cap sp
SELECT 
	SupplierID
	, AVG(UnitPrice) AS "AvgPrice"
FROM Products
GROUP BY SupplierID;

-- moi the loai co bao nhieu sp trong kho
SELECT 
	CategoryID
	, SUM(UnitsInStock) AS "Number of product"
FROM Products
GROUP BY CategoryID;

-- don hang co gia thap nhat va cao nhat o moi tp va dat nuoc khac nhau
SELECT 
	ShipCountry
	, ShipCity
	, MIN(Freight) AS "MinFreight"
	, MAX(Freight) AS "MaxFreight"
FROM Orders
GROUP BY ShipCountry, ShipCity
ORDER BY ShipCountry, ShipCity;

-- DAY, MONTH, YEAR
-- so luong orders vao nam 1997 cua tung khach hang
SELECT 
	CustomerID
	, COUNT(OrderID) AS "Total Orders"
	, YEAR(OrderDate) AS "Year"
FROM Orders
WHERE YEAR(OrderDate) = '1997'
GROUP BY CustomerID, YEAR(OrderDate);

-- cac orders vao thang 5 nam 1997
SELECT *
FROM Orders
WHERE 
	MONTH(OrderDate) = '5' AND YEAR(OrderDate) = '1997';

-- ds dat hang nam 1998 va so don hang moi thang sx thang tang dan
SELECT *
	, COUNT(OrderID) AS "Total Order"
	, MONTH(OrderDate)
	, YEAR(OrderDate) AS "Year"
FROM Orders
WHERE YEAR(OrderDate) = '1998'
GROUP BY MONTH(OrderDate)
ORDER BY MONTH(OrderDate);
