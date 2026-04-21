use AdventureWorks2019

CREATE NONCLUSTERED INDEX IX_SalesOrderHeader_Customer_Date
ON Sales.SalesOrderHeader (CustomerID, OrderDate)
INCLUDE (SalesOrderID);