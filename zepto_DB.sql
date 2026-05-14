-- Create Database
CREATE DATABASE zepto_db;
USE zepto_db;

-- View Dataset
SELECT * 
FROM zepto_new;

-- Check Table Structure
DESCRIBE zepto_new;

SHOW COLUMNS 
FROM zepto_new;

-- Total Records
SELECT COUNT(*) AS total_records
FROM zepto_new;

-- Total Purchase Amount by Gender
SELECT 
    `Gender`,
    SUM(`Purchase Amount (USD)`) AS total_purchase
FROM zepto_new
GROUP BY `Gender`;

-- Check Missing Values
SELECT *
FROM zepto_new
WHERE `ï»¿Customer ID` IS NULL
   OR `Age` IS NULL
   OR `Gender` IS NULL
   OR `Item Purchased` IS NULL
   OR `Category` IS NULL
   OR `Purchase Amount (USD)` IS NULL
   OR `Location` IS NULL
   OR `Size` IS NULL
   OR `Color` IS NULL
   OR `Season` IS NULL
   OR `Review Rating` IS NULL
   OR `Subscription Status` IS NULL
   OR `Shipping Type` IS NULL
   OR `Discount Applied` IS NULL
   OR `Promo Code Used` IS NULL
   OR `Previous Purchases` IS NULL
   OR `Payment Method` IS NULL
   OR `Frequency of Purchases` IS NULL;

-- Different Product Categories
SELECT DISTINCT `Category`
FROM zepto_new
ORDER BY `Category`;

-- Gender-wise Customer Count
SELECT 
    `Gender`,
    COUNT(*) AS total_customers
FROM zepto_new
GROUP BY `Gender`;

-- Most Frequently Purchased Items
SELECT 
    `Item Purchased`,
    COUNT(*) AS purchase_count
FROM zepto_new
GROUP BY `Item Purchased`
HAVING COUNT(*) > 1
ORDER BY purchase_count DESC;

-- Records with Purchase Amount = 0
SELECT *
FROM zepto_new
WHERE `Purchase Amount (USD)` = 0;

-- Remove Invalid Purchase Amount Records
DELETE FROM zepto_new
WHERE `Purchase Amount (USD)` = 0;

-- Convert USD to INR (1 USD = 83 INR)
UPDATE zepto_new
SET `Purchase Amount (USD)` = `Purchase Amount (USD)` * 83;

-- Top 10 Highest Purchase Amounts
SELECT DISTINCT
    `Item Purchased`,
    `Purchase Amount (USD)`,
    `Review Rating`
FROM zepto_new
ORDER BY `Purchase Amount (USD)` DESC
LIMIT 10;

-- High Purchase Customers with Subscription
SELECT 
    `ï»¿Customer ID`,
    `Item Purchased`,
    `Purchase Amount (USD)`
FROM zepto_new
WHERE `Subscription Status` = 'Yes'
  AND `Purchase Amount (USD)` > 5000
ORDER BY `Purchase Amount (USD)` DESC;

-- Total Revenue by Category
SELECT 
    `Category`,
    SUM(`Purchase Amount (USD)`) AS total_revenue
FROM zepto_new
GROUP BY `Category`
ORDER BY total_revenue DESC;

-- High Purchase Amount with Low Ratings
SELECT DISTINCT
    `Item Purchased`,
    `Purchase Amount (USD)`,
    `Review Rating`
FROM zepto_new
WHERE `Purchase Amount (USD)` > 5000
  AND `Review Rating` < 3
ORDER BY `Purchase Amount (USD)` DESC;

-- Top 5 Categories by Average Rating
SELECT 
    `Category`,
    ROUND(AVG(`Review Rating`), 2) AS avg_rating
FROM zepto_new
GROUP BY `Category`
ORDER BY avg_rating DESC
LIMIT 5;

-- Average Purchase Amount by Purchase Frequency
SELECT 
    `Frequency of Purchases`,
    ROUND(AVG(`Purchase Amount (USD)`), 2) AS avg_purchase
FROM zepto_new
GROUP BY `Frequency of Purchases`
ORDER BY avg_purchase DESC;

-- Customer Age Categories
SELECT 
    `ï»¿Customer ID`,
    `Age`,
    CASE
        WHEN `Age` < 25 THEN 'Young'
        WHEN `Age` < 50 THEN 'Adult'
        ELSE 'Senior'
    END AS age_category
FROM zepto_new;

-- Total Purchase by Gender
SELECT 
    `Gender`,
    SUM(`Purchase Amount (USD)`) AS total_purchase
FROM zepto_new
GROUP BY `Gender`
ORDER BY total_purchase DESC;