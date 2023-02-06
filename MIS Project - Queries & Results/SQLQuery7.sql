SELECT c.CustomerID,c.FirstName, c.LastName, COUNT(o.OrderID) AS TotalPending
FROM [ORDER] o LEFT JOIN CUSTOMER c ON o.CustomerID=c.CustomerID
WHERE o.PaymentInfo='Pending' AND c.State IN 
	(
	SELECT TOP (3) c.State
	FROM CUSTOMER c
	GROUP BY c.State
	ORDER BY COUNT(c.CustomerID) DESC 
	)
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(o.OrderID)>5
ORDER BY TotalPending DESC