#CLEANING


#We only remove rows that are 100% identical (Invoice, StockCode, Description, Quantity, InvoiceDate, Price, CustomerID, Country).
CREATE TABLE retail_step1_dedup AS
SELECT DISTINCT *
FROM online_retail_raw;

#Remove rows with missing Description or invalid Price
CREATE TABLE retail_step2_cleantext AS
SELECT *
FROM retail_step1_dedup
WHERE Description IS NOT NULL
  AND Description <> ''
  AND Price > 0;
  
#Handle returns (negative quantities)  
CREATE TABLE retail_returns AS
SELECT *
FROM retail_step2_cleantext
WHERE Quantity < 0;

#Create sales-only table
CREATE TABLE retail_step3_sales AS
SELECT *
FROM retail_step2_cleantext
WHERE Quantity > 0;

# Convert text InvoiceDate → DATETIME
CREATE TABLE retail_step4_datetime AS
SELECT *,
       STR_TO_DATE(InvoiceDate, '%d-%m-%Y %H:%i') AS InvoiceDate_clean
FROM retail_step3_sales;

#Identify Cancelled Orders
CREATE TABLE retail_step5_cancel_flag AS
SELECT *,
       CASE 
           WHEN Invoice LIKE 'C%' THEN 1
           ELSE 0
       END AS IsCancelled
FROM retail_step4_datetime;

# Create the FINAL CLEAN TABLE and remove cancellations and add a TotalPrice column.
CREATE TABLE online_retail_clean AS
SELECT *,
       (Quantity * Price) AS TotalPrice
FROM retail_step5_cancel_flag
WHERE IsCancelled = 0;