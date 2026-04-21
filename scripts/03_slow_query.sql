use AdventureWorks2019

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
    YEAR(SOH.OrderDate) = 2013 -- 💣 anti-pattern (quebra índice)
    AND SOH.CustomerID = 11000;

