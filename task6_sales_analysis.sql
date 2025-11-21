
--1. Monthly Revenue & Order Volume
SELECT 
    EXTRACT(YEAR FROM date::date) AS year,
    EXTRACT(MONTH FROM date::date) AS month,
    SUM(total_revenue) AS monthly_revenue,
    COUNT(DISTINCT transaction_id) AS order_volume
FROM orders
GROUP BY year, month
ORDER BY year, month;

--Daily Revenue Trend
SELECT 
    date::date AS order_date,
    SUM(total_revenue) AS daily_revenue
FROM orders
GROUP BY order_date
ORDER BY order_date;

--Total Revenue
SELECT 
    SUM(total_revenue) AS total_sales
FROM orders;

--Revenue by Product Category
SELECT 
    product_category,
    SUM(total_revenue) AS category_revenue
FROM orders
GROUP BY product_category
ORDER BY category_revenue DESC;

--Top 10 Best-Selling Products
SELECT 
    product_name,
    SUM(units_sold) AS total_units_sold,
    SUM(total_revenue) AS revenue_generated
FROM orders
GROUP BY product_name
ORDER BY revenue_generated DESC
LIMIT 10;

--Region-Wise Revenue
SELECT 
    region,
    SUM(total_revenue) AS region_revenue
FROM orders
GROUP BY region
ORDER BY region_revenue DESC;

--Average Order Value (AOV)

SELECT
    AVG(total_revenue) AS avg_order_value
FROM orders;

--Highest Revenue Day
SELECT 
    date::date AS order_date,
    SUM(total_revenue) AS revenue
FROM orders
GROUP BY order_date
ORDER BY revenue DESC
LIMIT 1;
--Top 3 Revenue Months
SELECT 
    EXTRACT(YEAR FROM date::date) AS year,
    EXTRACT(MONTH FROM date::date) AS month,
    SUM(total_revenue) AS monthly_revenue
FROM orders
GROUP BY year, month
ORDER BY monthly_revenue DESC
LIMIT 3;




