-- tao bang moi voi sp co gia > 50
SELECT *
INTO HighValueProduct
FROM Products
WHERE UnitPrice > 50;

-- Tạo ra bảng mới với các đơn hàng được giao đến USA
SELECT *
INTO USAOrders
FROM [dbo].[Orders]
WHERE [ShipCountry] LIKE 'USA';

-- Tao bang moi HighValueOrder co thong tin don hang co tong gia tri dat hang > 1000
WITH TotalOrder AS(
	SELECT 
		OrderID
		, SUM(Quantity * UnitPrice) AS "Total Price"
	FROM [Order Details]
	GROUP BY OrderID
)
SELECT 
	o.OrderID
	, o.CustomerID
	, ot.[Total Price] 
INTO HighValueOrders
FROM Orders o
JOIN TotalOrder ot
ON o.OrderID = ot.OrderID
WHERE ot.[Total Price] > 1000;