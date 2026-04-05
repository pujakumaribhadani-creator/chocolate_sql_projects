# 🍫 Chocolate Sales Data Analysis (SQL Project)

## 📌 Project Summary

This project analyzes chocolate sales data using SQL to extract key performance indicators (KPIs) and generate meaningful business insights.

The objective of this project is to understand:

* Sales performance
* Customer behavior
* Product demand
* Store performance

All queries are written in SQL, and the dataset is structured into multiple relational tables.

---

## 📊 Key Business Questions & Analysis

1. **Total Sales (All Years)** – Calculated using sum of revenue
2. **Total Profit (All Years)** – Calculated using sum of profit
3. **Total Cost (All Years)** – Calculated using sum of cost
4. **Total Weight of Chocolates Sold (kg)** – Quantity × product weight
5. **Total Number of Sales Days** – Count of distinct order dates
6. **Gender-wise Ratio of Loyalty Members** – Male vs Female comparison
7. **Number of Stores in Each City** – Store distribution by city
8. **Country with Highest Number of Stores** – Maximum store count by country
9. **Customer Age Categories** – Segmentation (Teenagers to Seniors)
10. **Product with Highest Total Sales** – Based on revenue
11. **Brand with Highest Demand** – Based on quantity sold
12. **Month with Most Orders** – Identifying peak order month
13. **Store Type with Highest Revenue** – Revenue by store type
14. **Customer with Highest Revenue Contribution** – Top customer identification
15. **Day of the Week with Highest Sales (Year-wise)** – Peak sales day per year

---

## 🗂️ Dataset Structure

### 1. Sales (Fact Table)

Contains transaction-level data.

* `order_id` – Unique order identifier
* `order_date` – Date of purchase
* `product_id` – Product identifier
* `store_id` – Store identifier
* `customer_id` – Customer identifier
* `quantity` – Number of items sold
* `unit_price` – Price per unit
* `discount` – Discount applied
* `revenue` – Total revenue after discount
* `cost` – Product cost
* `profit` – Profit per transaction

---

### 2. Products

Details about chocolate products.

* `product_id`
* `product_name`
* `brand`
* `category`
* `cocoa_percent`
* `weight_g`

---

### 3. Stores

Information about store locations.

* `store_id`
* `store_name`
* `city`
* `country`
* `store_type`

---

### 4. Customers

Customer demographic details.

* `customer_id`
* `age`
* `gender`
* `loyalty_member`
* `join_date`

---

### 5. Calendar

Used for time-based analysis.

* `date`
* `year`
* `month`
* `day`
* `week`
* `day_of_week`

---

## 📈 Key Insights

* The business shows strong overall sales and profitability.
* Certain products and brands contribute significantly to revenue.
* Customer behavior varies by age group and time period.
* Specific months and days generate higher sales, indicating seasonal trends.
* Store performance differs by location and type, highlighting expansion opportunities.

---

## 🚀 Conclusion

This project demonstrates how SQL can be used to analyze structured data and generate actionable business insights.
It helps in understanding sales trends, customer segmentation, and operational performance, which can support data-driven decision-making.

---
