# MONTHLY ANALYSIS


#Monthly Revenue
SELECT 
    DATE_FORMAT(InvoiceDate_clean, '%Y-%m') AS Month,
    SUM(TotalPrice) AS Revenue
FROM online_retail_clean
GROUP BY Month
ORDER BY Month;

#Monthly Orders
SELECT 
    DATE_FORMAT(InvoiceDate_clean, '%Y-%m') AS Month,
    COUNT(DISTINCT Invoice) AS Orders
FROM online_retail_clean
GROUP BY Month
ORDER BY Month;