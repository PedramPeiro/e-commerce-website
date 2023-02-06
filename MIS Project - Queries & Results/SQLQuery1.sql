SELECT s.State AS States, COUNT(o.OrderID) AS NumOrders, SUM(o.Quantity) AS NumQuantity, SUM(o.Quantity*o.UnitPrice) AS SumPrice
FROM CUSTOMER c LEFT JOIN STATEFEES s ON c.State =s.State
LEFT JOIN [ORDER] o ON c.CustomerID = o.CustomerID
GROUP BY s.State
ORDER BY SumPrice DESC