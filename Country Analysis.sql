#COUNTRY ANALYSIS



#Revenue by Country
SELECT 
    Country,
    SUM(TotalPrice) AS Revenue
FROM online_retail_clean
GROUP BY Country
ORDER BY Revenue DESC;

#Top Countries by Order Count
SELECT 
    Country,
    COUNT(DISTINCT Invoice) AS Orders
FROM online_retail_clean
GROUP BY Country
ORDER BY Orders DESC;

