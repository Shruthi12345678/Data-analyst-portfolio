# 📊 Customer Churn Risk & Retention Analysis

This project investigates why customers churn in a subscription-based streaming platform and builds a **customer risk segmentation model** to help businesses proactively retain customers.

The project combines:
- Python (Ad-hoc Analysis)
- Power BI (Executive Dashboard)

---

# 🎯 Business Problem

A subscription streaming company observed rising churn.  
While dashboards showed *what* was happening, leadership needed to understand:

**Why are customers leaving and how can we prevent it?**

The goal of this project was to identify key churn drivers and create a **customer risk segmentation framework** for targeted retention strategies.

---

# 🧠 Project Workflow

This project follows a real-world analytics lifecycle:

1. Business problem framing  
2. Hypothesis-driven analysis  
3. Data cleaning & feature engineering  
4. Churn driver investigation  
5. Customer risk segmentation  
6. Executive dashboard creation  

---

# 📂 Dataset Overview

The dataset contains **5,000 customers** with:

- Demographics → Age, Gender, Region  
- Engagement → Last Activity  
- Experience → Satisfaction Score, Support Tickets  
- Pricing → Monthly Spend, Discounts  
- Subscription Lifecycle → Tenure  
- Target Variable → Churned  

---

# 🔎 Key Insights

## 1️⃣ Dormant customers are the biggest churn risk
Customers inactive for long periods show **~80% churn**.  
Churn spikes once customers become fully disengaged.

---

## 2️⃣ Low satisfaction strongly predicts churn
Low-satisfaction customers churn **3.5× more** than satisfied users.

---

## 3️⃣ Low-spend customers are highly volatile
Low spend users churn **~79%**, while high spend users churn only **~22%**.

---

## 4️⃣ Frequent support issues increase churn
Customers raising multiple support tickets churn **~50%**.

---

## 5️⃣ Demographics & billing are NOT churn drivers
Age, gender, region, tenure, and payment method showed **minimal impact** on churn.

---

# ⚠️ Customer Risk Segmentation

Customers were segmented using key churn signals.

| Segment | Churn Rate |
|--------|------------|
| 🔴 High Risk | **85%** |
| 🟠 Medium Risk | **65%** |
| 🔵 Low Risk | **24%** |

This segmentation enables proactive retention campaigns.

---

# 💡 Business Recommendations

| Problem | Recommended Action |
|---|---|
| Dormant users | Launch re-engagement campaigns before dormancy |
| Low satisfaction | Trigger proactive support & feedback surveys |
| Low spend churn | Introduce upgrade incentives & bundles |
| Many support issues | Provide priority support |
| High-risk customers | Target retention campaigns |

---

# 📈 Power BI Dashboard

An executive dashboard was built to monitor:

- Churn by risk segment  
- Key churn drivers  
- Customer distribution  
- Interactive filtering  

📁 File: **Customer_Segmentation_Report.pbix**

---

# 🛠️ Tools & Technologies

- Python (Pandas, NumPy, Matplotlib)
- Jupyter Notebook
- Power BI
- DAX

---

# 📁 Project Files

| File | Description |
|---|---|
| Report.ipynb | Full analysis workflow |
| Customer_Segmentation_Report.pbix | Interactive dashboard |
| README.md | Project documentation |

---

# 🚀 Project Outcome

This project demonstrates:
- End-to-end analytics workflow  
- Hypothesis-driven analysis  
- Business storytelling  
- Dashboard design & visualization
