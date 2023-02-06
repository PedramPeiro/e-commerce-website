SELECT s.SupplierName, SUM(o.Quantity) AS TotalPending
FROM [ORDER] o LEFT JOIN WAREHOUSE w ON o.ItemID=w.ItemID
LEFT JOIN Supplier s ON w.SupplierID = s.SupplierID
WHERE o.ShippingStatus='Pending-Shippment'
GROUP BY s.SupplierName
HAVING SUM(o.Quantity)>30
ORDER BY TotalPending Desc