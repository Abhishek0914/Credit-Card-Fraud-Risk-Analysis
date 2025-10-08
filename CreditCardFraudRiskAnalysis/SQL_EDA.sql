Create schema Risk_Analysis;

use risk_analysis;

CREATE TABLE credit_card_fraud_data (
    TransactionID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Merchant_Name VARCHAR(100),
    Transaction_Date DATE,
    Transaction_Amount INT,
    Fraud_Risk VARCHAR(20),
    Fraud_Type VARCHAR(50),
    State VARCHAR(50),
    Card_Type VARCHAR(20),
    Bank VARCHAR(50),
    IsFraud INT,
    Fraud_Score INT,
    Transaction_Category VARCHAR(50),
    Merchant_Location VARCHAR(100)
);

--Data was imported using data import wizard in the left schema column

select * from credit_card_fraud_data limit 10;

**Basic Summary**
SELECT COUNT(*) AS Total_Transactions,
       SUM(IsFraud) AS Total_Frauds,
       ROUND(100.0 * SUM(IsFraud) / COUNT(*), 2) AS Fraud_Percentage
FROM credit_card_fraud_data;

--Unique counts
SELECT COUNT(DISTINCT Customer_Name) AS Unique_Customers,
       COUNT(DISTINCT Merchant_Name) AS Unique_Merchants
FROM credit_card_fraud_data;

--Transaction Amount Overview
SELECT MIN(Transaction_Amount) AS Min_Amt,
       MAX(Transaction_Amount) AS Max_Amt,
       AVG(Transaction_Amount) AS Avg_Amt
FROM credit_card_fraud_data;

**Fraud Pattern Analysis**
--Top 10 Merchants with Highest Fraud Transactions
select Merchant_Name, COUNT(*) as Fraud_Count from credit_card_fraud_data 
where IsFraud=1 
group by Merchant_Name 
order by Fraud_Count 
desc LIMIT 10;

--Fraud Percentage per Bank
select Bank, ROUND(100.0 * SUM(IsFraud) / COUNT(*), 2) AS Fraud_Percentage from credit_card_fraud_data 
group by bank 
order by Fraud_Percentage 
LIMIT 10;

--Fraud Distribution by Card Type
select Card_Type, ROUND(100.0 * SUM(IsFraud)/COUNT(*),2) AS Fraud_Rate from credit_card_fraud_data
group by Card_Type
order by Fraud_Rate
LIMIT 10;

**Risk Scoring & Segmentation**
--Average Fraud Score by Fraud Risk
SELECT Fraud_Risk,
       AVG(Fraud_Score) AS Avg_Fraud_Score
FROM credit_card_fraud_data
GROUP BY Fraud_Risk
ORDER BY Avg_Fraud_Score DESC;

--Top 5 States by Fraud Score
SELECT State,ROUND(AVG(Fraud_Score),2) AS Avg_Score FROM credit_card_fraud_data
WHERE IsFraud = 1
GROUP BY State
ORDER BY Avg_Score DESC
LIMIT 5;

--High-Risk Transaction Detection (Threshold Example)
SELECT *
FROM credit_card_fraud_data
WHERE Fraud_Score > 80
ORDER BY Fraud_Score DESC;

**Time-Based Fraud Analysis**
SELECT DATE_FORMAT(Transaction_Date, '%Y-%m') AS Month,
       COUNT(*) AS Total_Transactions,
       SUM(IsFraud) AS Fraud_Transactions,
       ROUND(100.0 * SUM(IsFraud)/COUNT(*),2) AS Fraud_Percentage
FROM credit_card_fraud_data
GROUP BY DATE_FORMAT(Transaction_Date, '%Y-%m')
ORDER BY Month;

**Correlation-Type & Anomaly Checks**
--Unusually High Transaction Amounts (Above 95th Percentile)
SELECT *
FROM credit_card_fraud_data
WHERE Transaction_Amount > (
    SELECT PERCENTILE_CONT(0.95) 
    ORDER BY Transaction_Amount
    FROM Transactions
);

--Merchants Showing Repeated Fraud Types
SELECT Merchant_Name,
       COUNT(DISTINCT Fraud_Type) AS Distinct_Fraud_Types
FROM credit_card_fraud_data
WHERE IsFraud = 1
GROUP BY Merchant_Name
HAVING COUNT(DISTINCT Fraud_Type) > 1;

**KPI 1 – Fraudulent Transaction %**
SELECT 
    ROUND((SUM(CASE WHEN IsFraud = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS Fraudulent_Transaction_Percentage
FROM credit_card_fraud_data;

**KPI 2 – Total Fraud Amount**
SELECT 
    ROUND(SUM(CASE WHEN IsFraud = 1 THEN Transaction_Amount ELSE 0 END), 2) AS Total_Fraud_Amount_INR
FROM credit_card_fraud_data;

**KRI 1 – Average Fraud Score for High-Risk Transactions**
SELECT 
    ROUND(AVG(CASE WHEN Fraud_Risk = 'High' THEN Fraud_Score ELSE NULL END), 2) AS Avg_Fraud_Score_High_Risk
FROM credit_card_fraud_data;

**KRI 2 – Top Fraud Type Share**
SELECT 
    Fraud_Type,
    COUNT(*) AS Fraud_Count,
    ROUND((COUNT(*) / (SELECT COUNT(*) FROM credit_card_fraud_data WHERE IsFraud = 1)) * 100, 2) AS Fraud_Type_Share_Percent
FROM credit_card_fraud_data
WHERE IsFraud = 1
GROUP BY Fraud_Type
ORDER BY Fraud_Count DESC
LIMIT 1;






