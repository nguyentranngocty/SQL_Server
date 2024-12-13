-- Trigger khi insert sẽ chuyển productName về viết hoa toàn bộ:
CREATE TRIGGER MakeProductNameUpperCase
ON [dbo].[Products]
AFTER INSERT
AS
BEGIN
	UPDATE Products
	SET ProductName = UPPER(i.ProductName)
	FROM inserted i -- dong vua them vao
	WHERE Products.ProductID = i.ProductID
END

INSERT [dbo].[Products]([ProductName], [SupplierID], [CategoryID])
VALUES ('test name', 1, 1)

-- Viết một trigger trong cơ sở dữ liệu Northwind để đảm bảo 
-- rằng mỗi khi có một chi tiết đơn hàng mới được thêm vào, số lượng tồn kho phải được giảm đi
CREATE TRIGGER UpdateProductInventory
ON [dbo].[Order Details]
AFTER INSERT
AS
BEGIN
	UPDATE [dbo].[Products]
	SET [UnitsInStock] = [UnitsInStock]-(
		SELECT [Quantity] 
		FROM inserted 
		WHERE [dbo].[Products].ProductID = inserted.ProductID
	)
	WHERE [dbo].[Products].[ProductID] IN (
		SELECT [ProductID] 
		FROM inserted
	)
END

INSERT INTO [dbo].[Order Details]([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount])
VALUES (10248, 78, 10, 50, 0);

-- viet trigger bao loi
CREATE TRIGGER PreventNegativeQuantity
ON [Order Details]
FOR UPDATE
AS
BEGIN
	IF EXISTS(
		SELECT 1
		FROM inserted
		WHERE Quantity < 0
	)
	BEGIN
		ROLLBACK;
		RAISERROR('Quantity is invalid', 16, 1);
	END
END

UPDATE [Order Details]
SET Quantity = -1
WHERE ProductID = 11;

--BT1: viết Trigger khi insert hay Update tự cập nhật ngày giờ thay đổi
ALTER TABLE dbo.Products
ADD LastModified DateTime

--Viết Trigger
CREATE TRIGGER tg_UpdateLastModifiedWhenChangeProduct
ON dbo.Products
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE dbo.Products 
	SET LastModified = GETDATE()
	FROM dbo.Products p
	INNER JOIN Inserted i 
	ON i.ProductID = p.ProductID
END

--BT2
CREATE TRIGGER InteadOfDeleteCustomer
ON dbo.Customers
INSTEAD OF DELETE
AS
BEGIN
	SET NOCOUNT ON
    IF EXISTS (
		SELECT 1 
		FROM Deleted d 
		INNER JOIN dbo.Orders o 
		ON o.CustomerID = d.CustomerID
	)
	BEGIN
	    RAISERROR(N'Không thể xóa khách hàng có đơn hàng liên quan.',16, 1)
	END
	ELSE
	BEGIN
	    --Nếu k có đơn hàng liên quan thì thực hiện xóa khách hàng
		DELETE FROM dbo.Customers 
		WHERE CustomerID IN(SELECT CustomerID FROM Deleted) 
	END
END

--BT3
CREATE TRIGGER BanInsertOrderThanInStock
ON dbo.[Order Details]
FOR INSERT 
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT 1
        FROM Inserted i 
        INNER JOIN dbo.[Order Details] od 
		ON od.OrderID = i.OrderID
        INNER JOIN dbo.Products p 
		ON p.ProductID = od.ProductID
        WHERE p.UnitsInStock < od.Quantity
    )
    BEGIN
        ROLLBACK;
        RAISERROR(N'Số lượng đặt hàng lớn hơn số lượng trong kho.', 16, 1);
    END
END;

