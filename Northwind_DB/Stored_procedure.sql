-- tao stored procedure lay thong tin khach hang dua tren ten
CREATE PROCEDURE GetProductByName(
	@ProductName NVARCHAR(100)
)
AS
BEGIN
	SELECT *
	FROM Products
	WHERE ProductName = @ProductName
END
-- su dung
EXEC GetProductByName @ProductName = 'Chai';
EXEC GetProductByName @ProductName = 'Chang';

-- Procedure tinh tong doanh thu ban hang cua nv dua tren EmployeeID
CREATE PROCEDURE GetEmployeeSalesTotal(
	@EmployeeId INT
)
AS
BEGIN
	SELECT SUM(UnitPrice * Quantity) AS TotalSales
	FROM Orders o
	JOIN [Order Details] od
	ON o.OrderID = od.OrderID
	WHERE o.EmployeeID = @EmployeeId
END

-- su dung
EXEC GetEmployeeSalesTotal @EmployeeId = 1;

-- Stored Procedure them moi vao bang customer
CREATE PROCEDURE AddCustomer(
	@CustomerID NVARCHAR(5)
	, @CompanyName NVARCHAR(40)
	, @ContactName NVARCHAR(30)
	, @ContactTitle NVARCHAR(30)
)
AS
BEGIN
	INSERT INTO Customers(
		CustomerID
		, CompanyName
		, ContactName
		, ContactTitle
	)
	VALUES (
		@CustomerID
		, UPPER(@CompanyName)
		, @ContactName
		, @ContactTitle
	)
END

-- tinh them gia tang cho moi ma sp
CREATE PROCEDURE IncreasePrice
	@ProductId INT,
	@PriceIncrease DECIMAL(10,2)
AS
BEGIN
	UPDATE Products
	SET UnitPrice = UnitPrice + @PriceIncrease
	WHERE ProductID = @ProductId
END

EXEC IncreasePrice @ProductId=1, @PriceIncrease=100;

--BT1
CREATE PROCEDURE OrdersList
	@CustomerID NVARCHAR (5)
AS
BEGIN
	SELECT 
		[CustomerID]
		, [OrderID]
		, [OrderDate]
	FROM Orders
	WHERE @CustomerID = CustomerID
END;

EXEC OrdersList @CustomerID='VINET';
--BT2
CREATE PROCEDURE QuanityUpdate
	@ProductID INT,
	@QuantityPerUnit NVARCHAR(20)
AS
BEGIN 
	UPDATE [dbo].[Products]
	SET [QuantityPerUnit] = @QuantityPerUnit
	WHERE @ProductID=[ProductID]
END;
EXEC QuanityUpdate  @ProductID=1, @QuantityPerUnit=200;
--BT3
CREATE PROCEDURE Productslist
@CategoryID INT,
@Limit INT
AS
BEGIN 
	SELECT Top(@Limit) 
		[CategoryID]
		,[ProductID]
		,[ProductName]
		,[UnitPrice]
		,[UnitsInStock]
	FROM [dbo].[Products]
	WHERE @CategoryID = [CategoryID]
END
---
EXEC Productslist  @CategoryID=1, @Limit=40;
----BT4
CREATE PROCEDURE CustomersbyRegions
	@Region NVARCHAR(15)=Null,
	@Country Nvarchar(15)=Null
AS
BEGIN 
	IF @Region IS NOT NULL
		Begin
			SELECT *
			FROM [dbo].[Customers]
			WHERE @Region=[Region] 
		END
	ELSE
		Begin
			SELECT *
			FROM [dbo].[Customers]
			WHERE @Country=[Country] 
		END
END
---
EXEC CustomersbyRegions @Country=USA;

