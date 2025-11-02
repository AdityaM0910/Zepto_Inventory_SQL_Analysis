# 🛒 Zepto Inventory SQL Analysis

An end-to-end *SQL project* built using *PostgreSQL* to analyze and derive business insights from Zepto’s product inventory dataset.  
This project focuses on *data cleaning, **data exploration, and **business analysis* to uncover patterns in pricing, stock availability, and discount efficiency.

---

## 🎯 Objective

To perform detailed SQL-based data analysis on Zepto’s inventory dataset to:
- Understand product and category distribution.  
- Identify pricing and discount trends.  
- Derive actionable business insights for decision-making.  
- Measure revenue losses and stock efficiency.

---

## 🧰 Tools & Technologies
- *PostgreSQL* — SQL database for analysis  
- *PgAdmin 4* — Query execution interface  
- *Excel / CSV* — For initial data preparation and verification  

---

## 🧹 Data Cleaning Steps
To ensure data consistency and correctness:
- Removed products with *MRP = 0*.  
- Converted *MRP values from paise to rupees*.  
- Checked for *missing values* and *duplicates*.  
- Verified data types for numerical and categorical columns.

---

## 🔍 Data Exploration (15 Queries)
Exploratory SQL analysis was performed to understand the dataset structure and patterns:

| # | Query Objective |
|---|------------------|
| 1 | Checked total number of rows and columns |
| 2 | Inspected sample records from inventory data |
| 3 | Checked for null or missing values |
| 4 | Found total number of distinct product categories |
| 5 | Compared products in stock vs out of stock |
| 6 | Identified products appearing multiple times |
| 7 | Calculated average, minimum, and maximum MRP of all products |
| 8 | Computed average discount percentage |
| 9 | Found category with the highest discount |
| 10 | Identified category with the most products |
| 11 | Calculated total available stock per category |
| 12 | Computed inventory value for each product |
| 13 | Estimated total potential revenue loss due to discounts |
| 14 | Identified categories with maximum out-of-stock items |
| 15 | Calculated discount efficiency across categories |

---

## 💼 Business Insights (8 Queries)
Using advanced SQL queries and subqueries, the following insights were discovered:

| # | Insight | Key Finding |
|---|----------|--------------|
| 1 | *Highest average discount* | Fruits & Vegetables category had the highest average discount of *15.46%* |
| 2 | *Category with most unique products* | Munchies and Cooking Essentials each have *478 products* |
| 3 | *Product causing maximum loss* | Borges Extra Light Olive Oil Bottle (Cooking Essentials) caused *₹7176* loss in revenue |
| 4 | *Average product MRP* | ₹156.84 |
| 5 | *Minimum MRP* | ₹10 |
| 6 | *Maximum MRP* | ₹2600 |
| 7 | *Distinct categories* | 14 total |
| 8 | *Out-of-stock ratio* | 453 out of 3732 products (≈12%) are out of stock |

---

## 💡 Key Takeaways
- *Fruits & Vegetables* have the most aggressive discounts but may affect margins.  
- *Munchies and Cooking Essentials* dominate product variety.  
- Identified products with *high revenue loss* due to over-discounting.  
- Overall *average MRP* is ₹156.84, suggesting Zepto’s product range is mid-priced.  
- Around *12% products are out of stock*, indicating potential inventory management gaps.

---

## 🧱 Folder Structure
Zepto_Inventory_SQL_Project/
  |--Zepto_Inventory_Queries.sql
  |--data/sample_data.csv
  |--Screenshots/
  |     |--inventory_value_of_each_category.png
  |     |--product_causing_maximum_revenue_loss_due_to_discounts.png
  |     |--total_available_stock_in_each_category.png
  |--README.md

----------------------------------------------------------------------------------------------------------------------------------------------------------------

## AUTHOR
**ADITYA MISHRA**
B.Tech CSE(AI)
ABESIT, GHAZIABAD
