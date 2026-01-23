# 🍔 Swiggy Orders SQL Analysis

## 📌 Project Overview
This project analyzes Swiggy food order data using SQL to uncover business insights related to restaurant performance, customer ordering behavior, revenue trends, and data quality.

The project follows a real-world data analyst workflow:
- Understanding business requirements  
- Exploring raw data  
- Validating and cleaning data  
- Performing KPI-driven analysis  
- Delivering actionable insights  

The dataset contains **197,000+ records** covering orders across multiple states and cities in India.

---

## 🎯 Business Objectives

- Perform **data validation and cleaning**
  - Identify NULL values  
  - Detect duplicate records  
  - Validate numeric fields such as price and ratings  

- Answer key business questions:
  - Which restaurants receive the most orders?
  - Which cities and states generate the highest revenue?
  - What are the most popular food categories and dishes?
  - What is the total number of orders and revenue?

- Support business decisions related to:
  - Restaurant performance tracking  
  - Regional sales strategy  
  - Menu optimization  

---

## 🗂️ Dataset Details

| Column Name      | Description                                  |
|------------------|----------------------------------------------|
| State            | State where the order was placed             |
| City             | City of the order                            |
| Order Date       | Date of order                                |
| Restaurant Name  | Name of the restaurant                       |
| Location         | Area within the city                         |
| Category         | Food category                                |
| Dish Name        | Name of the dish                             |
| Price (INR)      | Price of the item                            |
| Rating           | Restaurant rating                            |
| Rating Count     | Number of ratings                            |

---

## 🛠️ Tools & Technologies

- SQL Server Management Studio (SSMS)  
- SQL (Joins, Aggregations, Group By, Order By, Case)  
- CSV Dataset  

---

## 🔄 Workflow

###  Data Exploration
```sql
SELECT * FROM Swiggy_Data;
```

## 🔍 Data Validation

- Check for NULL values in each column  
- Identify duplicate records  
- Validate price and rating ranges  

---

## 🧹 Data Cleaning

- Count missing values column-wise  
- Detect duplicates using key fields  
- Prepare clean base tables for analysis  

---

## 📈 Business Analysis

- Total orders  
- Total revenue  
- Top restaurants by orders  
- City-wise and state-wise performance  
- Category-wise distribution  
- High-value dishes and restaurants  

**Example Query:**
```sql
SELECT TOP 10
    r.Restaurant_Name,
    COUNT(*) AS Total_Orders
FROM fact_swiggy_orders f
JOIN dim_restaurant r
    ON f.restaurant_id = r.restaurant_id
GROUP BY r.Restaurant_Name
ORDER BY Total_Orders DESC;
```

## 📊 Key Insights

- The dataset contains **197401** total orders across all cities and states.
- The total revenue generated is **₹53.00 Million**.
- The top restaurant, **McDonald's**, received **13528** orders — the highest among all restaurants.
- **Bengaluru** recorded the maximum number of orders with **20072** orders.
- **Karnataka** emerged as the highest contributing state with **20072** orders.
- The most popular food category is **Recommended**, maximum number of orders with **24097**.
- The highest priced dish is **Choley Bhature Classic Combo (for 20)** costing **₹8000.00**.
- After data validation:
  - **0** null values were identified and handled.
  - **29** duplicate records were detected and removed.






