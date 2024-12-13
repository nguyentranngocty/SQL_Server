-- tao view so luong don hang hang thang
CREATE VIEW MonthlyOrder AS
SELECT 
	YEAR(OrderDate) AS "Year"
	, MONTH(OrderDate) AS "Month"
	, COUNT(OrderID) AS "SumOrder"
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate);

-- View tuong tu nhu SubQuery nhung tien hon vi co the truy xuat tu View
SELECT *
FROM MonthlyOrder;

SELECT *
FROM (
	SELECT 
		YEAR(OrderDate) AS "Year"
		, MONTH(OrderDate) AS "Month"
		, COUNT(OrderID) AS "SumOrder"
	FROM Orders
	GROUP BY YEAR(OrderDate), MONTH(OrderDate)
) AS Temp;

CREATE VIEW Sales AS
SELECT 
	o.OrderID
	, O.CustomerID
	, o.OrderDate
	, SUM(od.Quantity * (od.UnitPrice - (od.UnitPrice * od.Discount))) AS "TotalOrder"
FROM Orders o
JOIN [Order Details] od
ON o.OrderID = od.OrderID
GROUP BY o.OrderID, O.CustomerID, o.OrderDate;