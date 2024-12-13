-- tu Order Details liet ke orders co Unit Price tu 100 den 200.
-- I - 22
SELECT od.OrderID
FROM [dbo].[Order Details] od
WHERE od.UnitPrice BETWEEN 100 AND 200;

-- orders co Quantity 10 or 20
-- II - 433
SELECT od.*
FROM [dbo].[Order Details] od
WHERE od.Quantity IN (10, 20);

-- tu Order Details liet ke orders Unit Price tu 100 den 200 VA orders có Quantity 10 or 20
--- III = I AND II = 7 rows
SELECT od.OrderID
FROM [dbo].[Order Details] od
WHERE (od.UnitPrice BETWEEN 100 AND 200)
		AND (od.Quantity IN (10, 20));


-- tu Order Details liet ke orders co Unit Price nam tu 100 den 200 HOAC orders co Quantity 10 hoac 20
--- IV = I OR II = 448 rows
SELECT od.OrderID
FROM [dbo].[Order Details] od
WHERE (od.UnitPrice BETWEEN 100 AND 200)
		OR (od.Quantity IN (10, 20));

-- tu Order Details liet ke orders Unit Price 100 den 200 HOAC orders co Quantity 10 hoac 20 DISTINCT
--- V = IV + DISTINCT = 360
SELECT DISTINCT od.OrderID
FROM [dbo].[Order Details] od
WHERE (od.UnitPrice BETWEEN 100 AND 200)
		OR (od.Quantity IN (10, 20));


-- UNION
-- V = I OR II = 360 rows
SELECT od.OrderID FROM [dbo].[Order Details] od WHERE od.UnitPrice BETWEEN 100 AND 200
UNION 
SELECT od.OrderID FROM [dbo].[Order Details] od WHERE od.Quantity IN (10, 20);


-- IV (ko co distinct) = I OR II = 455 rows = 448 + 7 = 455 rows
SELECT od.OrderID FROM [dbo].[Order Details] od WHERE od.UnitPrice BETWEEN 100 AND 200
UNION ALL
SELECT od.OrderID FROM [dbo].[Order Details] od WHERE od.Quantity IN (10, 20);

-- Lay tat ca quoc gia tu 2 table Suppliers va Customers
SELECT DISTINCT country
FROM Suppliers;
SELECT DISTINCT country
FROM Customers;

--UNION lay ko trung
SELECT DISTINCT country
FROM Suppliers
UNION
SELECT DISTINCT country
FROM Customers;

-- UNION ALL lay co trung
SELECT DISTINCT country
FROM Suppliers
UNION ALL
SELECT DISTINCT country
FROM Customers;