-- Lấy thông tin về các sản phẩm (Products) có cùng thể loại với một sản phẩm cụ thể
WITH ProductCategory AS(
	SELECT 
		ProductName
		,CategoryID
	FROM Products
	WHERE ProductName = 'Chai'
)
SELECT 
	P.ProductName
	, P.CategoryID
FROM Products AS P
JOIN ProductCategory AS PC 
ON P.CategoryID=PC.CategoryID;

-- Lay thong tin ve don hang voi tong gia tri don hang va ty le giua tong gia tri va phi don hang
-- Sub query -> hieu nang cham
SELECT
	o.OrderID
	, o.ShippedDate
	, (
		SELECT SUM(od.UnitPrice * od.Quantity) AS Price
		FROM [Order Details] od
		WHERE od.OrderID = o.OrderID
	) AS "Total Price"
	, (
		SELECT SUM(od.UnitPrice * od.Quantity) AS Price
		FROM [Order Details] od
		WHERE od.OrderID = o.OrderID
	) / o.Freight AS Ratio
FROM Orders o;

-- CTE
WITH TotalOrder AS (
	SELECT
		OrderID
		, SUM(Quantity * UnitPrice) AS "Total Price" 
	FROM [Order Details]
	GROUP BY OrderID
)
SELECT
	o.OrderID
	, o.ShippedDate
	, ot.[Total Price]
	, ot.[Total Price] / o.Freight AS Ratio
FROM Orders o
JOIN TotalOrder ot
ON o.OrderID = ot.OrderID

-- p1
WITH TotalPrice AS(
	SELECT
		ProductID
		, SUM(UnitPrice * Quantity) AS "Price"
	FROM [Order Details]
	GROUP BY ProductID
)
SELECT
	p.ProductID
	, p.ProductName
	, tp.Price AS Revenue
FROM Products p
JOIN TotalPrice tp
ON p.ProductID = tp.ProductID
ORDER BY tp.Price;

--p2
WITH TotalPrice AS(
	SELECT
		OrderID
		, SUM(UnitPrice * Quantity) AS "Price"
	FROM [Order Details]
	GROUP BY OrderID
)
SELECT
	c.CustomerID
	, c.ContactName
	, tp.Price AS Revenue
FROM Customers c
JOIN Orders o
ON o.CustomerID = c.CustomerID
JOIN TotalPrice tp
ON o.OrderID = tp.OrderID
ORDER BY tp.Price DESC;

-- p3
WITH Sales AS(
	SELECT 
		OrderID
		, SUM(Quantity * UnitPrice) AS "Total"
	FROM [Order Details] 
	GROUP BY OrderID
)
SELECT
	YEAR(o.OrderDate) AS "Year"
	, SUM(s.Total) AS "Revenue"
FROM Orders o
JOIN Sales s
ON o.OrderID = s.OrderID
GROUP BY YEAR(o.OrderDate)
ORDER BY SUM(s.Total) DESC;

