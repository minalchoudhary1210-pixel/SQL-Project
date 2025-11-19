CREATE DATABASE online_retail_project;
USE online_retail_project;
CREATE TABLE online_retail_raw (
    Invoice VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate VARCHAR(30),   -- load as text first (we will clean later)
    Price DECIMAL(10,2),
    CustomerID VARCHAR(20),
    Country VARCHAR(50)
);
