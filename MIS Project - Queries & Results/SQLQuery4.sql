SELECT  TOP(5) s.SupplierName , SUM(o.Quantity) as NumQuantity
FROM WAREHOUSE w LEFT JOIN [ORDER] o ON w.ItemID=o.ItemID
LEFT JOIN SUPPLIER s ON w.SupplierID=s.SupplierID
GROUP BY s.SupplierName, w.SupplierID