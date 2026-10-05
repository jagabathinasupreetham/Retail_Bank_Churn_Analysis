# Retail Bank Churn Analysis

Analysis of 10,000 bank customers to find who leaves and where to focus retention. Built with **MySQL, Python (Pandas) and Tableau**.

![Dashboard](Dashboard.png)

**Live dashboard:** add your Tableau Public link here

## Key findings
- **20.4% churn** (2,037 of 10,000 customers)
- **Germany: 32.4%**, about double France (16.2%) and Spain (16.7%)
- **Inactive members: 26.9%** vs 14.3% for active members
- **Customers aged 50-60 churn most (56.2%)**, and those with 3+ products churn at over 80%

**Recommendation:** focus retention on inactive members, German customers and customers aged 40-60.

## What I did
- Loaded data into MySQL and wrote aggregate queries (`COUNT`, `SUM`, `GROUP BY`)
- Cleaned data in Pandas (no nulls or duplicates, converted `$` text to numbers)
- Built a Tableau dashboard by country, products, activity, gender and age

## Files
`bank_churn_analysis.sql` · `analysed_churn_data.ipynb` · `raw_churn_data.csv` · `cleaned_churn_data.csv` · Tableau workbook

**Author:** Supreetham Jagabathina | [LinkedIn](https://linkedin.com/in/supreetham-data-analyst)
