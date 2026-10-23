-- CREATE AND SELECT DATABASE

CREATE DATABASE IF NOT EXISTS bank_churn_analysis;

USE bank_churn_analysis;


-- CREATE TABLE

DROP TABLE IF EXISTS bank_churn;

CREATE TABLE bank_churn (
    RowNumber INT,
    CustomerId BIGINT,
    Surname VARCHAR(100),
    CreditScore INT,
    Geography VARCHAR(50),
    Gender VARCHAR(20),
    Age INT,
    Tenure INT,
    Balance DECIMAL(15,2),
    NumOfProducts INT,
    HasCrCard TINYINT,
    IsActiveMember TINYINT,
    EstimatedSalary DECIMAL(15,2),
    Exited TINYINT
);


-- IMPORT CLEANED CSV DATA

LOAD DATA LOCAL INFILE
'/Users/supreethamjagabathina/GitHub/Retail Bank Customer Churn/cleaned_churn_data.csv'
INTO TABLE bank_churn
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    RowNumber,
    CustomerId,
    Surname,
    CreditScore,
    Geography,
    Gender,
    Age,
    Tenure,
    Balance,
    NumOfProducts,
    HasCrCard,
    IsActiveMember,
    EstimatedSalary,
    Exited
);


-- BASIC DATA VALIDATION

-- Check total number of records
SELECT COUNT(*) AS total_records
FROM bank_churn;

-- Check for duplicate customer IDs
SELECT
    CustomerId,
    COUNT(*) AS record_count
FROM bank_churn
GROUP BY CustomerId
HAVING COUNT(*) > 1;


-- QURIES

-- How do average account balances compare between customers who churned and customers who stayed?
select
    Exited,
    COUNT(*) AS total_customers,
    ROUND(AVG(Balance), 2) AS average_balance
FROM bank_churn
GROUP BY Exited;


-- How do average estimated salaries compare between customers who churned and customers who stayed?

SELECT
    Exited,
    COUNT(*) AS total_customers,
    ROUND(AVG(EstimatedSalary), 2) AS average_salary
FROM bank_churn
GROUP BY Exited;



-- How many churned customers have a credit card compared with those who do not have one?

SELECT
    HasCrCard,
    COUNT(*) AS churned_customers
FROM bank_churn
WHERE Exited = 1
GROUP BY HasCrCard;



 
-- How does churn vary across customer tenure groups?
SELECT
    CASE
        WHEN Tenure BETWEEN 0 AND 2 THEN '0-2 Years'
        WHEN Tenure BETWEEN 3 AND 5 THEN '3-5 Years'
        WHEN Tenure BETWEEN 6 AND 8 THEN '6-8 Years'
        ELSE '9-10 Years'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate
FROM bank_churn
GROUP BY
    CASE
        WHEN Tenure BETWEEN 0 AND 2 THEN '0-2 Years'
        WHEN Tenure BETWEEN 3 AND 5 THEN '3-5 Years'
        WHEN Tenure BETWEEN 6 AND 8 THEN '6-8 Years'
        ELSE '9-10 Years'
    END
ORDER BY MIN(Tenure);
