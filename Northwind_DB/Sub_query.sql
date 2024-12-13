-- Liet ke ra toan bo san pham
SELECT  
	[ProductID]
	, [ProductName]
	, [UnitPrice]
FROM [dbo].[Products];

-- Tim gia trung binh cua cac san pham
SELECT AVG([UnitPrice])
FROM [dbo].[Products];

-- Loc nhung san pham co gia > gia trung binh
SELECT 
	[ProductID]
	, [ProductName]
	, [UnitPrice]
FROM [dbo].[Products]
WHERE [UnitPrice] > 28.4962;

-- Sub query
SELECT  
	[ProductID]
	, [ProductName]
	, [UnitPrice]
FROM [dbo].[Products]
WHERE [UnitPrice] > (
	SELECT AVG([UnitPrice])
	FROM [dbo].[Products]
);

-- Loc ra nhung khach hang co so don hang > 10
SELECT 
	c.CustomerID
	, c.ContactName
	, COUNT(o.OrderId) AS [Total Orders]
FROM [dbo].[Customers] c
LEFT JOIN [dbo].[Orders] o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.ContactName
HAVING COUNT(o.OrderId) > 10;

-- Sub query
SElECT *
FROM Customers
WHERE CustomerID IN (
	SELECT CustomerID
	FROM Orders
	GROUP BY CustomerID
	HAVING COUNT(OrderID) > 10
);

-- Tinh tong tien cho tung don hang
SELECT 
	o.CustomerID
	, o.OrderID
	, (
	SELECT SUM(od.Quantity * od.UnitPrice)
	FROM [dbo].[Order Details] od
	WHERE o.OrderID = od.OrderID
) AS "Total Order"
FROM Orders o;


-- Loc ra ten san pham va tong so don hang cua san pham
SELECT 
	ProductName
	, [Total Orders]
FROM (
	SELECT 
		p.ProductName
		, (
		SELECT COUNT(od.OrderID)
		FROM [Order Details] od
		WHERE od.ProductID = p.ProductID
	) AS [Total Orders]
	FROM Products p
) AS Temp;

-- Liet ke cac don hang co ngay dat hang gan nhat
SELECT *
FROM Orders
WHERE OrderDate = (
	SELECT MAX(OrderDate)
	FROM Orders
);

-- Liệt kê tất cả các sản phẩm (ProductName)
-- mà không có đơn đặt hàng nào đặt mua chúng.
SELECT *
FROM Products
WHERE ProductID NOT IN (
	SELECT DISTINCT ProductID
	FROM [Order Details]
);

-- Lấy thông tin về các đơn hàng, và tên các sản phẩm 
-- thuộc các đơn hàng chưa được giao cho khách.
SELECT 
	o.OrderID
	, p.ProductName
FROM Orders o
INNER JOIN [Order Details] od
ON o.OrderID = od.OrderID
INNER JOIN Products p
ON od.ProductID = p.ProductID
WHERE o.OrderID IN (
	SELECT OrderID
	FROM Orders
	WHERE ShippedDate IS NULL
);

-- Lấy thông tin về các khách hàng có tổng giá trị đơn hàng lớn nhất
-- C1
SELECT 
	o.OrderID
	, c.CustomerID
	, c.CompanyName
	, SUM(od.Quantity * od.UnitPrice) AS "Sum Order"
FROM Customers c
FULL JOIN Orders o
ON c.CustomerID = o.CustomerID
FULL JOIN [Order Details] od
ON od.OrderID = o.OrderID
GROUP BY 
	o.OrderID
	, c.CompanyName
	, c.CustomerID
HAVING SUM(od.Quantity * od.UnitPrice) = (
	SELECT TOP 1
		SUM(od.Quantity * od.UnitPrice) AS Total
	FROM [Order Details] od
	GROUP BY od.OrderID
	ORDER BY Total DESC
)

--C2
SELECT
	o.OrderID
	, c.CustomerID
	, c.CompanyName
FROM Customers c
FULL JOIN Orders o
ON c.CustomerID = o.CustomerID
Full JOIN [Order Details] od
ON o.OrderID = od.OrderID
WHERE(od.UnitPrice * od.Quantity) = (
	SELECT MAX(UnitPrice * Quantity) AS [TotalOrdersDetails]
	FROM [Order Details]
)

