SELECT c.State, SUM(c.CustomerID) AS TotalCustomers, SUM(o.Quantity*o.UnitPrice) as TotalProfit
FROM [ORDER] o LEFT JOIN CUSTOMER c ON o.CustomerID=c.CustomerID
WHERE c.State IN ('NY' , 'TX','CA')
GROUP BY c.State
ORDER BY TotalProfit ASC