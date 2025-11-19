#CUSTOMER ANALYSIS



#Top 10 Customers by Revenue
SELECT 
    CustomerID,
    SUM(TotalPrice) AS Revenue
FROM online_retail_clean
GROUP BY CustomerID
ORDER BY Revenue DESC
LIMIT 10;

#Customer Purchase Frequency
SELECT 
    CustomerID,
    COUNT(DISTINCT Invoice) AS Order_Count
FROM online_retail_clean
GROUP BY CustomerID
ORDER BY Order_Count DESC
LIMIT 10;

#Average Order Value (AOV)
SELECT 
    SUM(TotalPrice) / COUNT(DISTINCT Invoice) AS Average_Order_Value
FROM online_retail_clean;