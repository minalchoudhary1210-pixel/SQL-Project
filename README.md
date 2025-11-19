# SQL-Project

# **E-Commerce Retail Sales Analysis Using SQL**

This project showcases a complete, end-to-end SQL workflow built on a real-world e-commerce retail dataset containing **500,000+ transactions**. It demonstrates data cleaning, transformation, analytics, and advanced SQL engineering techniques to extract meaningful business insights from raw transactional data.

---

## ** Project Overview**

The analysis uses invoice-level online retail data containing customer information, product descriptions, quantities, timestamps, and country details.
The project focuses on:

* Cleaning raw transactional data
* Structuring SQL tables for analysis
* Building calculated fields and engineered metrics
* Performing in-depth analysis across sales, product, customer, and market dimensions
* Generating actionable business insights
* Applying advanced SQL concepts such as CTEs, window functions, views, and stored procedures

---

## ** Objectives**

* Build a robust SQL database for raw and cleaned datasets
* Perform complete data cleaning (duplicates, missing entries, invalid formats)
* Engineer required fields including **TotalPrice** and cleaned date formats
* Analyze sales performance, product trends, customer behavior, and market dynamics
* Identify patterns and derive insights to support e-commerce decision-making
* Demonstrate strong SQL problem-solving through optimized queries and modular analysis

---

## ** Dataset Description**

The dataset contains real e-commerce retail transactions. Key fields:

| Field           | Description                                        |
| --------------- | -------------------------------------------------- |
| **Invoice**     | Unique order number (cancellations begin with “C”) |
| **StockCode**   | Product ID                                         |
| **Description** | Product name                                       |
| **Quantity**    | Units purchased (negative = returns)               |
| **InvoiceDate** | Timestamp of purchase                              |
| **Price**       | Unit price                                         |
| **CustomerID**  | Unique customer identifier                         |
| **Country**     | Customer location                                  |

Includes both valid and cancelled orders; returns were handled separately during cleaning.

---

## ** SQL Data Cleaning Workflow**

**Step 1:** Remove exact duplicate rows
**Step 2:** Drop missing product descriptions and invalid/non-positive prices
**Step 3:** Isolate returned transactions (`Quantity < 0`)
**Step 4:** Convert `InvoiceDate` to proper `DATETIME` format
**Step 5:** Flag cancelled invoices (`Invoice LIKE 'C%'`)
**Step 6:** Create a final cleaned table with new field:

```
TotalPrice = Quantity * Price
```

---

## ** SQL Analysis Performed**

### **Sales Metrics**

* Total revenue, total quantity sold
* Unique invoice count
* Monthly/seasonal revenue trends

### **Product Analysis**

* Best-selling products
* Items generating highest revenue
* Most returned items

### **Customer Analysis**

* Highest revenue customers
* Purchase frequency and retention patterns
* Average Order Value (AOV)

### **Market Insights**

* Country-wise revenue distribution
* Comparison of UK vs international markets

### **Advanced SQL Used**

* Window functions (RANK, ROW_NUMBER, cumulative sums)
* CTEs for modular logic
* Views for reusable reporting
* Aggregations across time windows

---

## ** Key SQL Queries**

### **1. Total Revenue**

```sql
SELECT SUM(TotalPrice)
FROM online_retail_clean;
```

### **2. Monthly Sales Trend**

```sql
SELECT DATE_FORMAT(InvoiceDate_clean, '%Y-%m') AS Month, 
       SUM(TotalPrice) AS Revenue
FROM online_retail_clean
GROUP BY Month
ORDER BY Month;
```

### **3. Top Revenue-Generating Products**

```sql
SELECT Description, SUM(TotalPrice) AS Revenue
FROM online_retail_clean
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 10;
```

### **4. Customer Ranking by Revenue**

```sql
SELECT 
    CustomerID, 
    SUM(TotalPrice) AS Revenue,
    RANK() OVER (ORDER BY SUM(TotalPrice) DESC) AS Rank
FROM online_retail_clean
GROUP BY CustomerID;
```

---

## ** Business Insights**

### **Sales**

* **UK** generates most revenue, dominating the market
* Significant **seasonal spikes in November–December** due to holiday sales
* Customers tend to buy **multiple low-cost items per order**

### **Customers**

* Top 5–10% customers contribute disproportionately to revenue
* High number of one-time buyers → **retention strategy needed**

### **Products**

* Gift and novelty items dominate sales volume
* Certain stock items show **high return rates** → possible quality issues

### **Operational**

* Cancelled and return transactions form a notable portion of total activity
* Returns (negative quantities) must be excluded from revenue calculations

---

## ** Conclusion**

This project demonstrates a fully SQL-driven workflow for handling, transforming, and analyzing real-world retail transactional data. It highlights strong capabilities in:

* SQL data engineering
* Data quality handling
* Business analysis
* Insight generation
* Advanced SQL concepts

The results provide clear visibility into customer behavior, product performance, seasonal dynamics, and global market distribution—supporting data-driven decisions in an e-commerce environment.
