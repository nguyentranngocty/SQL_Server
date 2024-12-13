--Sử dụng INNER JOIN
--Từ bảng Products và Categories, hãy in ra các thông tin sau đây:
--Mã thể loại
--Tên thể loại
--Mã sản phẩm
--Tên sản phẩm
SELECT 
	c.CategoryID
	, c.CategoryName
	, p.ProductID
	, p.ProductName
FROM Categories c
JOIN Products p
ON c.CategoryID = p.CategoryID;

--Sử dụng INNER JOIN
--Từ bảng Products và Categories, hãy đưa ra các thông tin sau đây:
--Mã thể loại
--Tên thể loại
--Số lượng sản phẩm
SELECT 
	c.CategoryID
	, c.CategoryName
	, COUNT(p.ProductID) AS "Total products"
FROM Categories c
INNER JOIN Products p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName;

--Sử dụng LEFT JOIN
--Từ bảng Products và Categories, hãy đưa ra các thông tin sau đây:
--Mã thể loại
--Tên thể loại
--Tên sản phẩm
SELECT 
	c.CategoryID
	, c.CategoryName
	, p.ProductName
FROM Categories c
LEFT JOIN Products p
ON c.CategoryID = p.CategoryID;

--Sử dụng LEFT JOIN
--Từ bảng Products và Categories, hãy đưa ra các thông tin sau đây:
--Mã thể loại
--Tên thể loại
--Số lượng sản phẩm
SELECT 
	c.CategoryID
	, c.CategoryName
	, COUNT(p.ProductID) AS "Total products"
FROM Categories c
LEFT JOIN Products p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName;

--Sử dụng RIGHT JOIN, hãy in ra các thông tin sau đây:
--Mã đơn hàng
--Tên công ty khách hàng
SELECT 
	o.OrderID
	, c.CompanyName
FROM Orders o
RIGHT JOIN Customers c
ON o.CustomerID = c.CustomerID;

SELECT 
	c.CompanyName
	, COUNT(o.OrderID) AS "Total Orders" 
FROM Orders o
RIGHT JOIN Customers c
ON o.CustomerID = c.CustomerID
GROUP BY c.CompanyName;

--Sử dụng FULL OUTER JOIN
--Từ bảng Products và Categories, hãy in ra các thông tin sau đây:
--Mã thể loại
--Tên thể loại
--Mã sản phẩm
--Tên sản phẩm
SELECT 
	c.CategoryID
	, c.CategoryName
	, p.ProductID
	, p.ProductName
FROM Categories c
FULL JOIN Products p
ON c.CategoryID = p.CategoryID;

-- BT1:
SELECT
	E.LastName
	, E.FirstName
	, C.ContactName
FROM Orders AS O
INNER JOIN Employees AS E
ON O.EmployeeID = E.EmployeeID
INNER JOIN Customers AS C
ON O.CustomerID = C.CustomerID;

-- BT2:
SELECT 
	P.SupplierID
	, P.ProductName
FROM Products  AS P
LEFT JOIN Suppliers AS S
ON P.SupplierID = S.SupplierID;

-- BT3:
SELECT 
	C.ContactName
	, O.OrderID
FROM Orders AS O
RIGHT JOIN Customers AS C
ON O.CustomerID = C.CustomerID;

-- BT4:
SELECT 
	C.CategoryName
	, S.ContactName
FROM Products AS P
FULL OUTER JOIN Categories AS C
ON P.CategoryID = C.CategoryID
FULL OUTER JOIN Suppliers AS S
ON P.SupplierID = S.SupplierID;

-- p1
SELECT DISTINCT
	od.ProductID
	, p.ProductName
	, s.ContactName
	, s.CompanyName
FROM [Order Details] od
JOIN Products p
ON od.ProductID = p.ProductID
JOIN Suppliers s
ON p.SupplierID = s.SupplierID;

--p2
SELECT 
	o.OrderID
	, c.ContactName
	, e.FirstName
	, e.LastName
FROM Orders o
LEFT JOIN Customers c
ON c.CustomerID = o.CustomerID
LEFT JOIN Employees e
ON o.EmployeeID = e.EmployeeID;

--p5
SELECT DISTINCT 
	od.OrderID
	, o.CustomerID
	, c.ContactName
FROM Orders AS o
INNER JOIN [Order Details] AS od
ON o.OrderID = od.OrderID
INNER JOIN Customers AS c
ON o.CustomerID =c.CustomerID;

--p6
SELECT 
	o.OrderID
	, e.FirstName
	, e.LastName
	, c.ContactName
FROM Orders AS o
FULL JOIN Employees AS e
ON o.EmployeeID = e.EmployeeID
FULL JOIN Customers AS c
ON o.CustomerID = c.CustomerID;