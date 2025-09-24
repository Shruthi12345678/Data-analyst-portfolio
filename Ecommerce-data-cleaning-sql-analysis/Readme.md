# Amazon Product Sales Analysis 📦

## Introduction 📝

This project provides a comprehensive analysis of an Amazon product dataset. The primary goal is to clean and preprocess the raw data using Python with the `pandas` library, and then perform an in-depth analysis using SQL queries to uncover insights about product categories, ratings, pricing, and user reviews.

---

## 📊 Dataset

The dataset used is `Amazon.csv`, which contains information about various products available on Amazon.

* **Shape**: The dataset consists of 1465 rows and 16 columns.
* **Columns include**: `product_id`, `product_name`, `category`, `discounted_price`, `actual_price`, `discount_percentage`, `rating`, `rating_count`, and user review data.

---

## 🧹 Data Cleaning & Preprocessing (Python)

Before analysis, the dataset required significant cleaning and preprocessing. The following steps were performed using Python and the `pandas` library:

1.  **Data Type Conversion**:
    * The `discounted_price` and `actual_price` columns were converted from `object` to `float64` after removing currency symbols ('₹') and commas.
    * The `discount_percentage` column was converted to `float64` after removing the '%' symbol and dividing by 100 to represent it as a decimal.
    * The `rating_count` was converted to `float64` after removing commas.

2.  **Handling Missing & Incorrect Values**:
    * An erroneous '|' value in the `rating` column was identified and replaced with the column's **median** rating.
    * The `rating_count` column had two missing values, which were imputed using the column's **median** value.

3.  **Duplicate Check**: The dataset was checked for any duplicate rows, and none were found.


---

## 🔍 SQL Analysis

After cleaning the data, SQL queries were run using the `pandasql` library to answer key business questions.

### Key Questions & Findings:

**Q1: What is the average rating for each product category?**
* Calculated the average `rating` for each unique `category` to understand performance across different segments.

**Q2: What are the top categories by rating count?**
* Identified the categories with the highest number of ratings to find the most-reviewed product types. The **Electronics|HomeTheater,TV&Video|Accessories|Cables&Adapters|HDMI Cables** category had the highest rating count at **426,973**.

**Q3: What are the Top 5 categories with the highest ratings?**
* Found the top 5 categories based on average ratings. Categories like **Electronics|Mobiles&Accessories|MobileAccessories|Chargers|PowerBanks** and **Computers&Accessories|Tablets** topped the list with a rating of **4.6**.

**Q4: Which products generate the most revenue?**
* Aggregated the `discounted_price` to determine the total revenue for each product. High-value electronics like the **Sony Bravia 164 cm (65 inches) 4K Ultra HD Smart LED Google TV** generated the most revenue.

**Q5: Which categories bring the highest average revenue per product?**
* Calculated the average revenue per product for each category. **Home&Kitchen|Heating,Cooling&AirQuality|AirConditioners** had the highest average revenue per product at **₹42,990**.

**Q6: Which products have the highest discount percentage?**
* Identified products with the highest discount percentages, with some products having discounts as high as **94%**.

**Q7: Which user wrote the most reviews?**
* Found the `user_id` that appeared most frequently, identifying the most active reviewer in the dataset.

**Q8: Which products have high sales but low ratings?**
* Identified products with high total sales (`discounted_price`) but a very low number of ratings (less than 3), highlighting popular products that lack sufficient customer feedback.

**Q9: Find products with high ratings but very few reviews.**
* Found products with excellent ratings (greater than 4.5) but fewer than three reviews. These are potentially high-quality "hidden gems" that are not yet widely reviewed.

---

## 🛠️ Tools & Libraries Used

* **Python**
* **Pandas** (for data manipulation and cleaning)
* **Matplotlib & Seaborn** (for data visualization)
* **Pandasql** (for running SQL queries on DataFrames)
* **Jupyter Notebook** (as the development environment)
