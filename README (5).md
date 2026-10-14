# HR Attrition & Employee Risk Analytics

An end-to-end HR analytics project that identifies why employees leave a company and flags high-risk employee segments — built using **MySQL** for data querying/analysis and **Power BI** for interactive visualization.


## 📌 Project Overview

Employee attrition is costly — every departure means lost productivity, hiring costs, and training investment. This project analyzes the IBM HR Employee Attrition dataset to answer:

- What percentage of employees are leaving, and why?
- Which departments and job roles are most affected?
- What employee characteristics predict a higher risk of attrition?
- Who are the high-risk employees HR should prioritize for retention?

## 🛠️ Tools Used

- **MySQL** — data cleaning, exploratory analysis, and 50+ SQL queries (aggregations, subqueries, window functions, views)
- **Power BI** — interactive single-page dashboard with KPIs, charts, slicers, and a decomposition tree

## 🔑 Key Insights

- **Overall Attrition Rate:** 16.12% (237 of 1,470 employees left)
- **Highest Attrition Department:** Sales — 20.63%
- **Highest Attrition Job Role:** Sales Representative — 39.76%
- **OverTime Impact:** Employees working overtime attrite at ~30.5% vs ~10.4% for those who don't — the single strongest driver of attrition
- **Tenure Risk:** Attrition peaks in the 0-2 year tenure bracket (29.82%) and drops sharply as tenure increases
- **Compensation Gap:** Employees who left earned ₹4.79K/month on average vs ₹6.83K/month for employees who stayed
- **High-Risk Segment:** Employees who work overtime AND have low job satisfaction AND poor work-life balance show a **41.03% attrition rate — 2.5x the company average**



## 📊 Dashboard Features

- **KPI Cards:** Total Employees, Attrition Count, Attrition Rate, Avg Income (Left vs Stayed), High Risk Count, High Risk Attrition Rate
- **Charts:** Attrition by Department, JobRole, Tenure, OverTime, and JobSatisfaction
- **Decomposition Tree:** Drill-down by Gender → Department → JobRole
- **Slicers:** Department, JobRole, Gender for interactive filtering
- **Insight Panel:** Summarized key findings directly on the report page

## 🧠 SQL Techniques Demonstrated

- Aggregate functions with `CASE WHEN` for conditional counting
- Correlated and non-correlated subqueries (`EXISTS`, `ALL`, `ANY`)
- Window functions: `RANK()`, `DENSE_RANK()`, `PERCENT_RANK()`, `NTILE()`, moving averages
- Views for reusable, Power BI-ready datasets (`vw_high_risk_employees`)


## 📈 Business Recommendations

- Review overtime policies — workload appears to be the top attrition driver
- Prioritize retention efforts within the first 2 years of employment
- Conduct satisfaction check-ins for employees flagged as "High Risk"
- Investigate pay equity in high-attrition departments (Sales, HR)
