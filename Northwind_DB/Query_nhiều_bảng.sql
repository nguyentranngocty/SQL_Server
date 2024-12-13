-- tu Category va Products -> CategoryID, CategoryName, ProductID, ProductName
SELECT 
	p.ProductID
	, p.ProductName
	, c.CategoryID
	, c.CategoryName
FROM
	Products AS p
	, Categories AS c
WHERE p.CategoryID = c.CategoryID;

-- tu Employees va Orders -> EmployeeID, FName, LName, So luong don hang da ban
SELECT
	e.EmployeeID
	, e.FirstName
	, e.LastName
	, COUNT(o.OrderID) AS "Total Orders"
FROM
	Employees AS e
	, Orders AS o
WHERE o.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName;

-- tu Orders va Customers -> CustomerID, CompanyName, ContactName, so luong OrderID vs dieu kien quoc gia la UK
SELECT
	c.CustomerID
	, c.CompanyName
	, c.ContactName
	, COUNT(OrderID) AS "Total orders"
FROM
	Orders AS o
	, Customers AS c
WHERE 
	c.CustomerID = o.CustomerID
	AND c.Country = 'UK'
GROUP BY c.CustomerID, c.CompanyName, c.ContactName;

-- tu Orders and Shippers -> ShipperID, CompanyName, Sum Freight, sx Sum Freight giam dan
SELECT 
	s.ShipperID
	, s.CompanyName 
	, SUM(o.Freight) AS "Sum Freight"
FROM 
	Orders AS o
	, Shippers AS s
WHERE o.ShipVia = s.ShipperID
GROUP BY s.ShipperID, s.CompanyName
ORDER BY SUM(o.Freight) DESC;

-- tu Products va Suppliers -> SupplierID, CompanyName, so products khac nhau, in ra top 1 supplier nhieu nhat
SELECT TOP 1
	s.SupplierID
	, s.CompanyName
	, COUNT(p.ProductID) AS "Number of product"
FROM
	Products AS p
	, Suppliers AS s
WHERE p.SupplierID = s.SupplierID
GROUP BY s.SupplierID, s.CompanyName
ORDER BY COUNT(p.ProductID) DESC;

-- tu Orders va Order Details -> OrderID va Sum tien sp
SELECT 
	o.OrderID
	, SUM(od.UnitPrice * od.Quantity) AS "Price"
FROM
	Orders AS o
	, [Order Details] AS od
WHERE o.OrderID = od.OrderID
GROUP BY o.OrderID;

-- practice
-- 0
SELECT 
	o.OrderID
	, e.FirstName
	, e.LastName
	, SUM(od.UnitPrice * od.Quantity) AS "Total Money"
FROM
	Employees AS e
	, Orders AS o
	, [Order Details] AS od
WHERE 
	o.OrderID = od.OrderID
	AND e.EmployeeID = o.EmployeeID
GROUP BY o.OrderID, e.FirstName, e.LastName;

-- 1
SELECT 
	c.CategoryID
	, c.CategoryName
	, p.ProductID
	, p.ProductName
FROM
	Products AS p
	, Categories AS c
WHERE 
	c.CategoryID = p.CategoryID 
	AND c.CategoryName = 'Seafood'; 

-- 2
SELECT 
	s.SupplierID
	, s.Country
	, p.ProductID
	, p.ProductName
FROM 
	Suppliers s
	, Products p
WHERE 
	s.SupplierID = p.SupplierID
	AND s.Country = 'Germany';

-- 3
SELECT 
	o.OrderID
	, c.ContactName
	, s.CompanyName 
FROM 
	Orders o
	, Customers c
	, Shippers s
WHERE 
	o.CustomerID = c.CustomerID
	AND o.ShipVia = s.ShipperID
	AND c.City='London';
