📊 Chocolate Sales Data Analysis – Project Questions
🔹 KPIs

1.“Total Sales” (All Years)
SELECT 
    ROUND(SUM(revenue), 2) AS total_sales
FROM
    sales;
-- Answer: 
-- Total Sales = 2,548,362.15 (≈ 2.55 Million)

-- Insight:
-- The business generated strong overall revenue, indicating consistent demand across all years.
    
2.Total Profit (All Years)
   SELECT 
    ROUND(SUM(profit), 2) AS total_profit
FROM
    sales;
-- Answer:
-- Total Profit = 1,019,538.80 (≈ 1.02 Million)

-- Insight:
--  The business generated approximately 1.02 million in profit, indicating strong profitability and effective cost management.
--   
3.Total Cost (All Years)
SELECT 
    ROUND(SUM(cost), 2) as total_cost
FROM
    sales;
-- Answer:
-- Total Cost = 1,528,823.33 (≈ 1.53 Million)

-- Insight:
--  The business incurred approximately 1.53 million in total cost, highlighting the overall operational expenses involved in generating revenue.

4.Total Weight of Chocolates Sold in all years.
 SELECT 
    ROUND(SUM(s.quantity * p.weight_g) / 1000.0, 2) AS total_weight_in_kg
FROM
    sales s
        JOIN
    products p ON s.product_id = p.product_id;
-- Answer:
-- Total Weight = 31,848.19 grams (≈ 31.85 kg)

-- Insight:
-- The business sold approximately 31.85 kg of chocolate, indicating consistent product demand across all years.

5.Total Number of Sales Days in all years
 SELECT 
    COUNT(DISTINCT order_date) AS total_days_Sales
FROM
    sales;
-- Answer:
-- Total Sales Days = 731 days
-- Insight:
-- The business recorded sales on 731 days over 6 years, indicating consistent sales activity and regular customer engagement.
 
6.What is the overall profit margin percentage across all years?
     SELECT 
    CONCAT(ROUND((SUM(profit) / SUM(revenue)) * 100.0, 2),
            '%') AS total_profit_margin
FROM
    sales;
-- Answer:
-- Total Profit Margin = 40.01%
-- Insight:
-- The business maintains a 40.01% profit margin, indicating strong profitability and efficient cost management.

🔹 Business Questions

7.How many stores are there in each city? Display the results in descending order.
 SELECT 
    city, COUNT(*) AS total_no_of_store
FROM
    stores
GROUP BY city
ORDER BY total_no_of_store DESC

-- Answer:
-- Toronto – 18 stores
-- Paris – 16 stores
-- London – 16 stores
-- New York – 15 stores
-- Sydney – 13 stores
-- Melbourne – 12 stores
-- Berlin – 10 stores
--  Insight:
-- .Toronto has the highest number of stores, making it the most dominant market.
-- .Paris and London also show strong presence with equal store count.
-- . The business is well-distributed across major global cities, indicating a strong international footprint.

8.Which country has the highest number of chocolate stores?

SELECT 
    country, 
    COUNT(*) AS total_no_of_store
FROM 
    stores
GROUP BY 
    country
HAVING 
    COUNT(*) = (
        SELECT MAX(store_count)
        FROM (
            SELECT COUNT(*) AS store_count
            FROM stores
            GROUP BY country
        ) t
    ); 
-- Answer:
-- Canada has the highest number of stores with 20 stores.
--  Insight:
--  .Canada is the primary market for the business, showing the strongest presence.
--  .This indicates higher demand and better business expansion in this country.
 9.Categorize customers based on age groups:18–25 → Teenagers
26–30 → Young Adults  31–35 → Adults  36–45 → Mid-age Adults 46–55 → Senior Adults 55+ → Seniors
 
 SELECT 
    *,
    CASE 
        WHEN age >= 55 THEN 'Seniors'
        WHEN age BETWEEN 46 AND 55 THEN 'Senior_Adults'
        WHEN age BETWEEN 36 AND 45 THEN 'Mid_age_Adults'
        WHEN age BETWEEN 31 AND 35 THEN 'Adults'
        WHEN age BETWEEN 26 AND 30 THEN 'Young_Adults'
        WHEN age BETWEEN 18 AND 25 THEN 'Teenagers'
        ELSE 'Unknown'
    END AS age_category
FROM 
    customers2;
-- Answer:
-- Customers are categorized into the following age groups:

-- 18–25 → Teenagers
-- 26–30 → Young Adults
-- 31–35 → Adults
-- 36–45 → Mid-age Adults
-- 46–55 → Senior Adults
-- 55+ → Seniors
-- Insight:
--  .This segmentation helps in understanding customer demographics and their purchasing behavior.
--  .It enables the business to design targeted marketing campaigns for different age groups.

10.“Which product generated the highest total revenue?”
with cte1 as (
SELECT 
    p.product_name, ROUND(SUM(s.revenue), 2) AS total_sales
FROM
    products p
        JOIN
    sales s ON p.product_id = s.product_id
GROUP BY product_name )
SELECT * FROM cte1 
where total_sales=(SELECT max(total_Sales) FROM cte1)
-- Answer:
--  Dark Chocolate 50% generated the highest revenue of 180,725.76 (≈ 0.18 Million)
--  Insight:
--  .Dark Chocolate 50% is the top-performing product, indicating high customer preference for this variant.
--  .This product can be promoted further to maximize revenue.

11.Which brand has the highest demand?
WITH cte1 AS (
    SELECT 
        p.brand, 
        SUM(s.quantity) AS total_order_quant 
    FROM 
        sales s
    JOIN 
        products p 
    ON 
        s.product_id = p.product_id
    GROUP BY 
        p.brand 
)
SELECT 
    * 
FROM 
    cte1 
WHERE 
    total_order_quant = (SELECT MAX(total_order_quant) FROM cte1);

12.In which month do customers place the most orders?
WITH cte1 AS (
SELECT  month_name, count(*) AS total_orders FROM 
 (SELECT  order_id ,monthname(order_date) AS month_name FROM sales) AS t
GROUP BY  month_name
  )
  SELECT * FROM  cte1
  WHERE total_orders=(SELECT max( total_orders) FROM cte1);
  
  -- Answer:
--    July has the highest number of orders with 8,671 orders.
--   Insight:
--    .Customers place the most orders in July, indicating a peak sales period.
--    .This could be due to seasonal demand, promotions, or customer buying patterns.
   
13.Which store_type generates the highest revenue?
 WITH cte1 AS(
 SELECT 
    store_type, ROUND(SUM(revenue), 2) AS total_revenue
FROM
    STORES ST
        JOIN
    SALES SA ON st.STORE_id = sa.store_id
GROUP BY store_type)
 SELECT * FROM cte1 
 WHERE  total_revenue =(SELECT max(total_revenue) FROM cte1)
 -- Answer:
--   Airport store type generated the highest revenue of 758,017.85 (≈ 0.76 Million)
-- Insight:
--  .Airport stores are the top-performing store type, indicating high customer traffic and strong sales in travel locations.
--  .This suggests that locations with heavy footfall contribute significantly to revenue. 
 
 14.Which customer_id generated the highest revenue?
 
 WITH cte1 AS (
    SELECT 
        c2.customer_id,
        ROUND(SUM(s.revenue), 2) AS total_revenue
    FROM 
        customers2 c2
    JOIN 
        sales s
    ON 
        c2.customer_id = s.customer_id
    GROUP BY 
        c2.customer_id
)
SELECT *
FROM cte1
WHERE total_revenue = (SELECT MAX(total_revenue) FROM cte1);
-- Answer:
-- Customer_ID = C031537 generated the highest revenue of 348.92
--  Insight:
-- . This customer is the highest value customer, contributing the most revenue.
-- . The business can target such customers with loyalty programs and personalized offers.

15.Which day of the week has the highest sales in each year?
WITH cte AS (
    SELECT 
        YEAR(order_date) AS year,
        DAYNAME(order_date) AS day_name,
        ROUND(SUM(revenue), 2) AS total_revenue
    FROM sales
    GROUP BY YEAR(order_date), DAYNAME(order_date)
)
SELECT *
FROM cte
WHERE total_revenue = (
    SELECT MAX(total_revenue)
    FROM cte AS t2
    WHERE t2.year = cte.year
)
ORDER BY year;
limit 1
Answer:
2023 → Friday generated the highest sales of 187,905.91
2024 → Saturday generated the highest sales of 184,528.74
 Insight:
    .In 2023, sales peaked on Fridays, while in 2024, Saturdays performed best.
    .This indicates a shift in customer buying behavior towards weekends.















