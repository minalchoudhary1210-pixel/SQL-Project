#PRODUCT ANALYSIS



#Top 10 Best-Selling Products (by Quantity)
SELECT 
    Description,
    SUM(Quantity) AS Total_Quantity
FROM online_retail_clean
GROUP BY Description
ORDER BY Total_Quantity DESC
LIMIT 10;

#Top 10 Products by Revenue
SELECT 
    Description,
    SUM(TotalPrice) AS Revenue
FROM online_retail_clean
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 10;

#Most Returned Products
SELECT 
    Description,
    SUM(ABS(Quantity)) AS Returned_Quantity
FROM retail_returns
GROUP BY Description
ORDER BY Returned_Quantity DESC
LIMIT 10;
