-- Employees o London 
-- text dung '', ten bang dung [], ""
SELECT * 
FROM Employees
WHERE City = 'London';

-- Employees o London va co LastName theo A->Z
SELECT * 
FROM Employees
WHERE City = 'London'
ORDER BY LastName;

-- Orders bi giao hang muon ShippedDate > RequiredDate
SELECT 
	OrderID
	, OrderDate
	, ShippedDate FROM Orders
WHERE ShippedDate > OrderDate;

-- UnitStock < 50 or > 100
SELECT 
	ProductID
	, ProductName FROM Products
WHERE 
	UnitsInStock < 50 OR UnitsInStock > 100;

-- Hang bi giao muon tu Brazil
SELECT * 
FROM Orders
WHERE 
	ShipCountry = 'Brazil' AND ShippedDate > RequiredDate;

-- Gia Product between 10 and 20
SELECT 
	ProductID
	, ProductName
	, UnitPrice FROM Products
WHERE 
	UnitPrice BETWEEN 10 AND 20;

-- Sum orders tu 1996-07-01 den 1996-07-31
SELECT SUM(Freight) AS TotalJulyFreight
FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

-- LIKE _ %
SELECT * 
FROM Orders
WHERE ShipCountry LIKE 'U%';

SELECT * 
FROM Orders
WHERE ShipCountry LIKE 'U_';

SELECT * 
FROM Orders
WHERE ShipCity LIKE '%a%';

-- Wildcart
SELECT * 
FROM Suppliers
WHERE CompanyName LIKE 'A%[^B]%';

-- IN chon 1 trong cac gia tri
SELECT 
	ProductID
	, ProductName
	, UnitPrice 
FROM Products
WHERE UnitPrice IN(10, 20);

SELECT * 
FROM Customers
WHERE City IN('Berlin', 'London', 'Warszawa');

SELECT * 
FROM Employees
WHERE TitleOfCourtesy NOT IN('Ms.', 'Mrs.');

-- IS NULL, IS NOT NULL
SELECT COUNT(*) 
FROM Orders
WHERE ShippedDate IS NULL;

SELECT * 
FROM Orders
WHERE ShippedDate IS NULL AND ShipRegion IS NOT NULL; -- hang chua duoc giao