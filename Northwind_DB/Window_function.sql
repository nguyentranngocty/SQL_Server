﻿-- Xep hang san pham theo gia giam dan tren toan bo table
SELECT
	ProductID
	, ProductName
	, UnitPrice
	, RANK() OVER (
		ORDER BY UnitPrice DESC
	) AS Ranking
FROM Products;

﻿-- Xep hang san pham theo gia giam dan tren CategoryID
SELECT
	ProductID
	, CategoryID
	, ProductName
	, UnitPrice
	, RANK() OVER (
		PARTITION BY CategoryID
		ORDER BY UnitPrice DESC
	) AS Ranking
FROM Products;

-- Chúng ta sẽ sử dụng hàm LAG() lấy thông tin về đơn đặt hàng 
-- và ngày đặt hàng của đơn đặt hàng trước đó cho mỗi khách hàng.
SELECT
	OrderID
	, CustomerID
	, OrderDate
	, LAG(OrderDate) OVER(
		PARTITION BY CustomerID
		ORDER BY OrderDate
	) AS "Previous order date"
FROM Orders;

-- Tính tổng doanh số bán hàng mỗi năm cho mỗi KH và xếp hạng KH dự trên doanh số bán hàng.
WITH sales AS (
	SELECT 
		od.OrderID
		, SUM(od.Quantity * od.UnitPrice) AS "TotalPrice"
	FROM [Order Details] od
	GROUP BY od.OrderID
)
SELECT 
	o.CustomerID
	, c.ContactName
	, s.TotalPrice
	, RANK() OVER(
		PARTITION BY YEAR(o.OrderDate)
		ORDER BY s.TotalPrice DESC
	) AS Ranking
FROM Orders o
JOIN Customers c
ON c.CustomerID = o.CustomerID
JOIN sales s
ON o.OrderID = s.OrderID;