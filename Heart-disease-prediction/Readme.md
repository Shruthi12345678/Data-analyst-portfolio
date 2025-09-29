# Heart Disease Prediction using Machine Learning

## 📌 Project Overview
This project predicts the likelihood of heart disease in patients based on medical attributes.  
I applied **Logistic Regression, Random Forest, and XGBoost** to classify patients, and achieved an accuracy of **82%**.

The project demonstrates:
- Data preprocessing and feature engineering
- Handling imbalanced datasets with **SMOTE**
- Model training and evaluation
- Hyperparameter tuning for performance improvement

---

## 📊 Dataset
The dataset contains patient medical information such as:
- **Age**
- **Sex**
- **Chest Pain Type (cp)**
- **Resting Blood Pressure (trestbps)**
- **Serum Cholesterol (chol)**
- **Fasting Blood Sugar (fbs)**
- **Resting ECG Results (restecg)**
- **Maximum Heart Rate Achieved (thalach)**
- **Exercise Induced Angina (exang)**
- **Oldpeak**
- **Slope**
- **Number of Major Vessels (ca)**
- **Thalassemia (thal)**
- **Target (Heart Disease: 1 = Yes, 0 = No)**


---

## 🛠️ Technologies Used
- Python 🐍
- Pandas, NumPy
- Matplotlib, Seaborn
- Scikit-learn
- Imbalanced-learn (SMOTE)

---

## 🚀 Steps in the Project
1. **Exploratory Data Analysis (EDA)**  
   - Data visualization with boxplots, histograms, correlation heatmaps
   - Handling missing values & outliers  
   
2. **Feature Engineering**  
   - Binning ages into categories  
   - One-hot encoding categorical variables  

3. **Data Preprocessing**  
   - Train-test split  
   - Standardization (StandardScaler)  
   - Balancing classes with **SMOTE**  

4. **Modeling**  
   - Logistic Regression  
   - Random Forest    

5. **Evaluation**  
   - Accuracy, Precision, Recall, F1-score  
   - Classification Report  
   - Confusion Matrix  

6. **Hyperparameter Tuning**  
   - GridSearchCV for Logistic Regression & Random Forest    

---

## 📈 Results
- **Best Model:** Logistic Regression  
- **Accuracy:** ~82%  
- Good balance of **Precision & Recall** across both classes.

---

