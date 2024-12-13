SELECT *
FROM Sales.SalesOrderDetail;

-- Bat thong ke IO
SET STATISTICS IO ON;

SELECT *
FROM Sales.SalesOrderDetail
WHERE CarrierTrackingNumber = '1B2B-492F-A9';

-- Tat thong ke IO
SET STATISTICS IO OFF;

-- Tao Index
CREATE INDEX idx_CarrierTrackingNumber
ON Sales.SalesOrderDetail(CarrierTrackingNumber);