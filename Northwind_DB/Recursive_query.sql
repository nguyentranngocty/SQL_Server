-- Fibonacci
WITH Fibo(prev_n, n) AS(
	-- Khoi tao
	SELECT
		0 AS prev_n
		, 1 AS n
	-- Ket noi
	UNION ALL
	-- De quy
	SELECT 
		n AS prev_n
		, prev_n + n AS n
	FROM Fibo
)
SELECT * 
FROM Fibo
OPTION (MAXRECURSION 5);

-- Giai thua
WITH Factorial(stt, n) AS(
	-- Khoi tao
	SELECT
		1 AS stt
		, 1 AS n
	-- Ket noi
	UNION ALL
	-- De quy
	SELECT 
		stt + 1 AS stt
		, (stt + 1) * n AS n
	FROM Factorial
)
SELECT TOP 10 * 
FROM Factorial;
 
--Sử dụng truy vấn đệ quy để tạo một cây cấu trúc quản lý của nhân viên trong bảng "Employees“.
--Trong đó “ReportsTo” chí là mã của người quản lý.
DECLARE @EmployeeID INT
SET @EmployeeID = 2;
WITH Position AS(
	-- khoi tao
	SELECT
		e.EmployeeID
		, e.FirstName + ' ' + e.LastName AS Name
		, e.ReportsTo AS ManagedID
		, 0 AS Level
	FROM Employees e
	WHERE e.EmployeeID = @EmployeeID
	-- ket noi
	UNION ALL
	-- de quy
	SELECT
		e1.EmployeeID
		, e1.FirstName + ' ' + e1.LastName AS Name
		, e1.ReportsTo AS ManagedID
		, Level + 1 AS Level
	FROM Employees e1
	JOIN Position p
	ON e1.ReportsTo = p.EmployeeID  
)
SELECT TOP 10 *
FROM Position;