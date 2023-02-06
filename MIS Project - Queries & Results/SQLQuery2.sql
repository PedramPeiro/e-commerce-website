SELECT a.FirstName, a.LastName, SUM(o.UnitPrice*o.Quantity) as Profit, 
(SUM(o.UnitPrice*o.Quantity)*(1+AVG(a.Tax))+AVG(a.ShippingCharges)) AS Cost
FROM [ORDER] o LEFT JOIN ( 
			Select c.CustomerID,c.FirstName, c.LastName, c.State, s.ShippingCharges,s.Tax
			FROM CUSTOMER c LEFT JOIN STATEFEES s ON c.State=s.State
						) AS a
ON o.CustomerID=a.CustomerID
GROUP BY a.CustomerID , a.FirstName,a.LastName
HAVING SUM(o.UnitPrice*o.Quantity)>=4000