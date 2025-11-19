#BASIC SALES ANALYSIS 


#Total Revenue
SELECT SUM(TotalPrice) AS Total_Revenue
FROM online_retail_clean;

#Total Orders
SELECT COUNT(DISTINCT Invoice) AS Total_Orders
FROM online_retail_clean;

#Total Customers
SELECT COUNT(DISTINCT CustomerID) AS Total_Customers
FROM online_retail_clean;

#Total Quantity Sold
SELECT SUM(Quantity) AS Total_Quantity_Sold
FROM online_retail_clean;
