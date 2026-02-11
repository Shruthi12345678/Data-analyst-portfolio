# Amazon Review Sentiment & Customer Insights Dashboard

## Project Overview
This project builds an end-to-end Natural Language Processing (NLP) pipeline to analyze Amazon product reviews and transform customer feedback into actionable business insights.

The goal is to automatically understand **how customers feel**, **why they feel that way**, and **what products can improve** using Machine Learning and Power BI.

This project covers the full data workflow:
- Data cleaning & NLP preprocessing
- Sentiment classification model
- Keyword extraction
- Interactive Power BI dashboard

---

## Business Problem
E-commerce companies receive thousands of customer reviews daily.  
Manually reading them is impossible.

Businesses need to quickly understand:
- Are customers satisfied or unhappy?
- What are customers complaining about?
- What product features drive positive feedback?
- How do ratings relate to real sentiment?

This project solves that problem using NLP and analytics.

---

## Dataset
Amazon Reviews Dataset from Kaggle.

Key fields used:
- Review Text
- Review Score (1–5)
- Sentiment (Negative / Neutral / Positive)
- Review Length

---

## Project Pipeline

### 1. Data Preparation
Steps performed:
- Removed missing values
- Text cleaning (lowercasing, punctuation removal)
- Tokenization
- Stopword removal
- Lemmatization

Tools:
- Python
- Pandas
- NLTK

---

### 2. Exploratory Data Analysis
Key questions explored:
- Distribution of positive, neutral and negative reviews
- Relationship between ratings and sentiment
- Review length differences by sentiment
- Most common words in reviews

Key insight:
Negative reviews tend to be longer and more detailed than positive reviews.

---

### 3. Feature Engineering
Text converted into numerical format using:
- TF-IDF Vectorization

---

### 4. Machine Learning Model
Task: **Multiclass Sentiment Classification**

Models tested:
- Logistic Regression
- Multinomial Naive Bayes
- Random Forest

Best model accuracy:
**82%**

This performance is strong for a classical NLP pipeline.

---

### 5. Keyword & Topic Analysis
Extracted most frequent words from:
- Positive reviews (customer satisfaction drivers)
- Negative reviews (customer pain points)

Examples:
- Positive drivers: *great, love, easy, sound*
- Negative drivers: *work, stopped, charge, battery*

---

## Power BI Dashboard

The insights were visualized in a 3-page interactive dashboard.

### Page 1 — Overview
- Total Reviews
- Average Rating
- Sentiment distribution
- Review count by rating

### Page 2 — Sentiment Analysis
- Sentiment vs rating comparison
- Average review length by sentiment
- Interactive filters

### Page 3 — Keyword Insights
- Top positive keywords
- Top negative keywords
- Voice of customer analysis


## Dashboard Preview

### Overview Page
![Overview Dashboard](images/dashboard_overview.png)

### Sentiment Analysis Page
![Sentiment Dashboard](images/dashboard_sentiment.png)

### Keyword Insights Page
![Keyword Dashboard](images/dashboard_keywords.png)


---

## Tools & Technologies

**Programming & NLP**
- Python
- Pandas
- NLTK
- Scikit-learn

**Visualization**
- Power BI

**Machine Learning**
- TF-IDF Vectorization
- Logistic Regression
- Naive Bayes
- Random Forest

---

## Key Insights

- 54.8% of reviews are positive while only 8.8% are negative.
- Negative reviews are significantly longer, indicating detailed complaints.
- Product reliability and battery issues are major customer pain points.
- Usability and value for money drive positive sentiment.

---

## Future Improvements
- Deploy model using Streamlit web app
- Try Transformer models (BERT) for higher accuracy
- Add time-series sentiment tracking

---

