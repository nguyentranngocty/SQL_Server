-- khach orders > 20, sx theo sum orders giam dan
SELECT 
	CustomerID
	, COUNT(OrderID) AS TotalOrders 
FROM Orders
GROUP BY CustomerID  
HAVING COUNT(OrderID) > 20
ORDER BY SUM(OrderID) DESC;

-- Suppliers co sum UnitsInStock > 30 va avg UnitPrice < 50
SELECT 
	SupplierID
	, SUM(UnitsInStock) AS "Total Stock"
	, AVG(UnitPrice) AS "Avg Price"
FROM Products
GROUP BY SupplierID
HAVING SUM(UnitsInStock) > 30 AND AVG(UnitPrice) < 50;

-- sum tien van chuyen hang > 1000 thang nua nam sau 1996, sx theo thang tang dan
SELECT 
	MONTH(ShippedDate) AS "Month"
	, SUM(Freight) AS "Total"
FROM Orders
WHERE ShippedDate BETWEEN '1996-07-01' AND '1996-12-31'
GROUP BY MONTH(ShippedDate)
HAVING SUM(Freight) > 1000 --SUM, AVG, COUNT, MIN, MAX
ORDER BY MONTH(ShippedDate)

-- TP co orders > 16 va sx theo sum so luong giam dan
SELECT 
	ShipCity
	, COUNT(OrderID) AS "Num of Orders" 
FROM Orders
GROUP BY ShipCity
HAVING COUNT(OrderID) > 16
ORDER BY SUM(OrderID) DESC;