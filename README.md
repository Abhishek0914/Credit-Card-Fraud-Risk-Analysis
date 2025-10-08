💳 Credit Card Fraud Risk Monitoring Dashboard

Advanced Exploratory Data Analysis (EDA) & Strategic Risk Analytics Project

🧠 Overview

This project provides an end-to-end risk analysis of credit card transactions using Excel, SQL, and Power BI to identify and monitor fraudulent activities.
The dashboard enables real-time visibility into critical fraud indicators, transaction anomalies, and state-wise risk patterns — supporting strategic decision-making and fraud prevention frameworks.

🎯 Objectives

Detect and analyze fraudulent transactions from a large dataset.

Identify high-risk zones, transaction categories, and fraud patterns.

Compute Key Performance Indicators (KPIs) and Key Risk Indicators (KRIs) for fraud analytics.

Design a Power BI dashboard providing interactive and actionable risk insights.

🧩 Tools & Technologies

Microsoft Excel – Data cleaning and preprocessing.

MySQL Workbench – Running advanced analytical queries on cleaned data.

Microsoft Power BI – KPI visualization and dashboard creation.

Microsoft Word – Documentation and insight reporting.

🗂️ Dataset Description
Field Name	Description
TransactionID	Unique identifier for each transaction
Customer_Name	Name of the customer
Merchant_Name	Merchant involved in the transaction
Transaction_Date	Date of transaction
Transaction_Amount (INR)	Value of transaction
Fraud_Risk	Categorized as High, Medium, or Low
Fraud_Type	Nature of fraudulent activity
State	State where the transaction occurred
Card_Type	Credit/Debit/Virtual card
Bank	Issuing bank
IsFraud	Binary indicator (1 = Fraudulent, 0 = Genuine)
Fraud_Score	Risk score assigned to the transaction
Transaction_Category	Type of expenditure (E-commerce, Food, Apparel, etc.)
Merchant_Location	Location of the merchant
⚙️ Methodology

Data Cleaning (Excel):

Removed missing merchant names and duplicates.

Standardized categorical values and formatted currency data.

Exploratory Data Analysis (SQL):

Queried fraud patterns, transaction trends, and average fraud scores.

Segmented risks across fraud types, banks, and states.

Visualization (Power BI):

Built an interactive dashboard featuring filters for Fraud Type, Risk Level, and State.

Created KPIs & KRIs for executives to monitor real-time fraud risk.

Documentation & Insights (Word):

Summarized actionable insights and developed data-driven recommendations.

📊 Dashboard Preview

🔹 Key Metrics
🏆 KPIs (Key Performance Indicators)
Metric	SQL Expression
Fraudulent Transaction %	SELECT (SUM(IsFraud)/COUNT(*))*100 AS Fraud_Percentage FROM transactions;
Total Fraud Amount	SELECT SUM(CASE WHEN IsFraud=1 THEN Transaction_Amount ELSE 0 END) AS Total_Fraud_Amount FROM transactions;
⚠️ KRIs (Key Risk Indicators)
Metric	SQL Expression
Average Fraud Score (High Risk)	SELECT AVG(Fraud_Score) AS Avg_Fraud_Score_High FROM transactions WHERE Fraud_Risk='High';
Top Fraud Type Share	SELECT Fraud_Type, COUNT(*)*100.0/SUM(IsFraud) AS Top_Fraud_Share FROM transactions WHERE IsFraud=1 GROUP BY Fraud_Type ORDER BY COUNT(*) DESC LIMIT 1;
💡 Insights

Over 28% of total transactions are fraudulent, highlighting significant exposure in card-not-present categories.

High-risk frauds account for ~19% of all transactions, majorly in e-commerce and electronic categories.

Critical risk transactions (≈10%) involve high-value spending in select states.

Card-not-present frauds dominate the risk landscape, requiring two-step verification controls.

State-level analysis shows Maharashtra and Karnataka leading in total fraudulent cases.

🧭 Recommendations

Integrate real-time fraud scoring models for monitoring and flagging anomalies.

Implement geo-based and category-based fraud thresholds.

Collaborate with issuing banks for joint risk detection systems.

Introduce customer alerts and transaction verification systems for critical transactions.

Develop monthly fraud intelligence dashboards to guide management reporting.

🧩 Project Type

Exploratory Data Analysis (EDA) with Strategic Risk Analytics and Fraud Monitoring Dashboarding

🚀 Future Enhancements

Add Machine Learning model for predictive fraud detection.

Automate alerts using Power Automate or Python scripts.

Integrate a real-time risk scoring API with dashboards.

🧑‍💻 Author

Abhishek Bohra
Data Analyst | Strategic Risk & Fraud Analytics | SQL | Power BI | Excel | Data Storytelling
