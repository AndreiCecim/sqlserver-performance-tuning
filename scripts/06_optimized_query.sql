use AdventureWorks2019

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT 
    SOH.SalesOrderID,
    SOH.CustomerID,
    SOH.OrderDate,
    SOD.ProductID,
    SOD.OrderQty
FROM Sales.SalesOrderHeader SOH
JOIN Sales.SalesOrderDetail SOD 
    ON SOH.SalesOrderID = SOD.SalesOrderID
WHERE 
    SOH.OrderDate >= '2013-01-01'
    AND SOH.OrderDate < '2014-01-01'
    AND SOH.CustomerID = 11000

OPTION (MAXDOP 1);