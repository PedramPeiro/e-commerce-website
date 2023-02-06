SELECT TOP (5) Category, SUM(QuantityOnHand*UnitPricing) AS InventoryValue
FROM INVENTORY
GROUP BY Category
ORDER BY InventoryValue DESC