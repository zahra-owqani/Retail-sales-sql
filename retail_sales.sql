/*Project Structure
1. Database Setup
Database Creation: The project starts by creating a database named p1_retail_db.
Table Creation: A table named retail_sales is created to store the sales data.
The table structure includes columns for:
 transaction ID,
 sale date,
 sale time,
 customer ID,
 gender,
 age,
 product category,
 quantity sold,
 price per unit,
 cost of goods sold (COGS),
 and total sale amount.*/


CREATE DATABASE p1_retail_db;
USE p1_retail_db;
CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);

-- 2. Data Exploration & Cleaning
 
 -- Record Count: Determine the total number of records in the dataset.
SELECT COUNT(*) FROM retail_sales;

 -- Customer Count: Find out how many unique customers are in the dataset.
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;

-- Category Count: Identify all unique product categories in the dataset.
SELECT DISTINCT category FROM retail_sales;

-- Null Value Check: Check for any null values in the dataset and delete records with missing data.
SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
    
-- 3. Data Analysis & Findings
-- The following SQL queries were developed to answer specific business questions:

-- 1.Write a SQL query to retrieve all columns for sales made on '2022-11-05:
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

-- 2.Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4:
SELECT *
FROM retail_sales
WHERE 
    category = 'Clothing'
    AND 
    quantity >= 4
    
-- 3.Write a SQL query to calculate the total sales (total_sale) for each category.:
SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY Category

-- 4.Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
SELECT
    ROUND(AVG(age), 2) as avg_age
FROM retail_sales
WHERE category = 'Beauty'

-- 5.Write a SQL query to find all transactions where the total_sale is greater than 1000.:
SELECT * FROM retail_sales
WHERE total_sale > 1000

-- 6.Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
SELECT 
    category,
    gender,
    COUNT(*) as total_trans
FROM retail_sales
GROUP 
    BY 
    category,
    gender
ORDER BY 1

-- 7.**Write a SQL query to find the top 5 customers based on the highest total sales **:
SELECT 
    customer_id,
    SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

-- 8.Write a SQL query to find the number of unique customers who purchased items from each category.:
SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail_sales
GROUP BY category

/*Findings
 -Customer Demographics: The dataset includes customers from various age groups, 
  with sales distributed across different categories such as Clothing and Beauty.
 -High-Value Transactions: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
 -Sales Trends: Monthly analysis shows variations in sales, helping identify peak seasons.*/
 
 -Customer Insights: The analysis identifies the top-spending customers and the most popular product categories.
