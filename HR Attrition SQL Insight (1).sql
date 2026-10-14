Create database HR_Project;
use Hr_project;

select * from Emp_attrition;

describe Emp_Attrition;
Select * from Emp_attrition;

-- change column Name ------>

Alter Table Emp_attrition 
rename column ï»¿Age to age;

Alter Table Emp_attrition 
rename column EmployeeNumber to Emp_id;

-- Drop Column --->

alter table emp_attrition 
drop column over18;


-- Insight --->

-- 1.Find the total number of employees in the table.

select count(emp_id) as TotalEmp from Emp_Attrition;

-- 2.Count how many employees have Attrition = 'Yes' and how many have 'No'.
select 
attrition ,count(emp_id) as Total_emp
from emp_attrition
group by attrition;

-- 3.List all distinct Departments in the company.
select distinct department from emp_attrition;

-- 4.List all distinct JobRoles along with their count.
select 
distinct jobrole,
count(emp_id) as total_Emp
from emp_attrition
group by jobrole;
 
-- 5.Find the employee(s) with the highest and lowest MonthlyIncome.

-- highest MonthlyIncome

SELECT Emp_id, JobRole, Department, MonthlyIncome
FROM Emp_attrition
WHERE MonthlyIncome = (SELECT MAX(MonthlyIncome) FROM Emp_attrition);

-- Lowest MonthlyIncome

SELECT Emp_id, JobRole, Department, MonthlyIncome
FROM Emp_attrition
WHERE MonthlyIncome = (SELECT min(MonthlyIncome) FROM Emp_attrition);


-- 6.Find the attrition rate (%) for each Department.

select 
department,
count(Emp_id) as Total_emp,
count(case when attrition ='yes' then 1 end) as Emp_left,
round(count(case when attrition ='yes' then 1 end)*100 /count(Emp_id),2) as Attrition_rate
from emp_attrition
group by department;

-- 7.Find the attrition rate (%) for each JobRole.

select
jobrole,
count(Emp_id) as Total_emp,
count(case when attrition ='yes' then 1 end) as Emp_left,
round(count(case when attrition ='yes' then 1 end)*100 /count(Emp_id),2) as Attrition_rate
from emp_attrition
group by jobrole;

-- 8.Compare the attrition rate of employees who work OverTime vs. those who don't.

select 
overtime,
count(emp_id) as Total_emp,
count(case when attrition ='Yes' then 1 end) as emp_left,
round(count(case when attrition ='yes' then 1 end)*100 /count(Emp_id),2) as Attrition_rate
from emp_attrition
group by overtime;

-- 9.Compare the average MonthlyIncome of employees who left vs. those who stayed.
select 
attrition,
avg(monthlyincome) as Avg_MonthlyIncome
from emp_attrition
group by attrition;

-- 10.Find the attrition rate grouped by StockOptionLevel.

Select
StockOptionLevel,
count(emp_id) as Total_emp,
count(case when attrition ='yes' then 1 end ) as emp_left,
round(count(case when attrition ='yes' then 1 end )*100/count(emp_id),2) as Attrition_Rate
from emp_attrition
group by StockOptionLevel
order by StockOptionLevel asc;



-- 11.Find the attrition rate grouped by Gender.

select 
gender,
count(emp_id) as Total_emp,
count(case when attrition ='yes' then 1 end ) as emp_left,
round(count(case when attrition ='yes' then 1 end )*100/count(emp_id),2) as Attrition_Rate
from emp_attrition 
group by gender;



-- 12.Find the attrition rate grouped by MaritalStatus.
select 
maritalstatus,
count(Emp_id) as Total_emp,
count(case when attrition='yes' then 1 end) as emp_left,
round(count(case when attrition='yes' then 1 end)*100/count(emp_id),2) as Allrition_rate
from emp_attrition
group by maritalstatus;


-- 13.Find the attrition rate grouped by BusinessTravel category.
select 
BusinessTravel,
count(Emp_id) as Total_emp,
count(case when attrition='yes' then 1 end) as emp_left,
round(count(case when attrition='yes' then 1 end)*100/count(emp_id),2) as Allrition_rate
from emp_attrition
group by BusinessTravel;

-- 14.Find the attrition rate grouped by JobSatisfaction level (1-4).
select 
JobSatisfaction,
case
	when JobSatisfaction =1 then 'Low'
    when JobSatisfaction =2 then 'Medium'
    when JobSatisfaction =3 then 'high'
    when JobSatisfaction =4 then 'Very High'
end as JobSatisfaction_Level,
count(Emp_id) as Total_emp,
count(case when attrition='yes' then 1 end) as emp_left,
round(count(case when attrition='yes' then 1 end)*100/count(emp_id),2) as Allrition_rate
from emp_attrition
group by JobSatisfaction
order by JobSatisfaction;



-- 15.Find the attrition rate grouped by WorkLifeBalance score.

select 
WorkLifeBalance,
case 
	when WorkLifeBalance =1 then 'Bad'
    when WorkLifeBalance =2 then 'Good'
	when WorkLifeBalance =3 then 'Better'
    when WorkLifeBalance =4 then 'Best'
end as WorkLifeBalance_Level,
count(Emp_id) as Total_emp,
count(case when attrition='yes' then 1 end) as emp_left,
round(count(case when attrition='yes' then 1 end)*100/count(emp_id),2) as Allrition_rate
from emp_attrition
group by WorkLifeBalance
order by WorkLifeBalance;

-- 16.Find the attrition rate grouped by EnvironmentSatisfaction score.
Select
EnvironmentSatisfaction,
case 
	when EnvironmentSatisfaction =1 then 'Bad'
    when EnvironmentSatisfaction =2 then 'Good'
	when EnvironmentSatisfaction =3 then 'Better'
    when EnvironmentSatisfaction =4 then 'Best'
end as EnvironmentSatisfaction_Level,
count(Emp_id) as Total_emp,
count(case when attrition='yes' then 1 end) as emp_left,
round(count(case when attrition='yes' then 1 end)*100/count(emp_id),2) as Allrition_rate
from emp_attrition
group by EnvironmentSatisfaction
order by EnvironmentSatisfaction;


-- 17.Find the attrition rate grouped by Department + Gender combined.

Select 
Gender,
department,
count(Emp_id) as Total_emp,
count(case when attrition='yes' then 1 end) as emp_left,
round(count(case when attrition='yes' then 1 end)*100/count(emp_id),2) as Allrition_rate
from emp_attrition
group by gender,department
order by gender desc;



-- 18.Divide employees into age brackets and find the attrition rate per bracket.
Select 
case
	when age <18 then 'Under 18'
	when age between 18 and 24 then '18-24'
    when age between 25 and 34 then '25-34'
    when age between 35 and 44 then '35-44'
    when age between 45 and 54 then '45-54'
    when age >= 55 then '55+'
end as Age_Group,
count(Emp_id) as Total_emp,
count(case when attrition='yes' then 1 end) as emp_left,
round(count(case when attrition='yes' then 1 end)*100/count(emp_id),2) as Attrition_rate
from emp_attrition
group by Age_group
order by age_group;

-- 19.Divide employees into tenure buckets (0-2, 3-5, 6-10, 10+ years) using YearsAtCompany and find attrition rate per bucket.
select 
	case
		when YearsAtCompany between 0 and 2 then '0-2 years'
        when YearsAtCompany between 3 and 5 then '3-5 years'
        when YearsAtCompany between 6 and 10 then '6-10 years'
		else '10+ Years'
	end as Tenure,
count(emp_id) as Total_emp,
count(case when attrition ='Yes' then 1 end) as Emp_left,
round(Count(case when attrition='yes' then 1 end)*100/count(emp_id),2) as Attrition_rate
from emp_attrition
group by Tenure;

-- 20.Analyze attrition pattern based on YearsSinceLastPromotion (employees who haven't been promoted in a long time).
select 
	case
		when YearsSinceLastPromotion between 0 and 2 then '0-2 years'
        when YearsSinceLastPromotion between 3 and 5 then '3-5 years'
        when YearsSinceLastPromotion between 6 and 10 then '6-10 years'
		else '10+ Years'
	end as lastpromotion,
count(emp_id) as Total_emp,
count(case when attrition ='Yes' then 1 end) as Emp_left,
round(Count(case when attrition='yes' then 1 end)*100/count(emp_id),2) as Attrition_rate
from emp_attrition
group by lastpromotion;

-- 21.Divide TotalWorkingYears into ranges and find the attrition rate for each range.
select 
case
	when TotalWorkingYears between 0 and 10 then '0-10 Years'
    when TotalWorkingYears between 11 and 20 then '11-20 Years'
    when TotalWorkingYears between 21 and 30 then '21-30 Years'
    when TotalWorkingYears between 31 and 40 then '31-40 Years'
end working_year,
count(emp_id) as Total_emp,
count(case when attrition ='yes' then 1 end) as emp_left,
round(count(case when attrition ='yes' then 1 end)*100/count(emp_id),2) as Attrition_rate
from emp_attrition
group by working_year;

    


-- 22.Find the list of employees earning below the company's average MonthlyIncome (using a subquery).
Select
emp_id,
MonthlyIncome
from emp_attrition
where monthlyincome < (select avg(MonthlyIncome) from emp_attrition);

-- 23.Find employees with low JobSatisfaction (<=2) AND OverTime = 'Yes' — a high-risk group.
select 
emp_id,
JobSatisfaction,
overtime
from emp_attrition
where JobSatisfaction <=2 and overtime='Yes';


-- 24.Find the average MonthlyIncome per Department and rank departments by their average income.


select 
*,
rank() over(order by Avg_income) as dept_rank
from
(select 
department,
avg(monthlyincome) as Avg_income
from emp_attrition
group by department) as New_table;


-- 25.Find the attrition rate grouped by NumCompaniesWorked (do job-hoppers show higher attrition?).

select 
case
	when NumCompaniesWorked between 0 and 2 then '0-2 companies'
    when NumCompaniesWorked between 3 and 6 then '3-6 companies'
    when NumCompaniesWorked between 7 and 10 then '7-10 companies'
    else '10+ companies'
end companieswork,
count(emp_id) as Total_emp,
count(case when attrition='yes' then 1 end ) as emp_left,
round(count(case when attrition='yes' then 1 end )*100/count(emp_id),2) as attrition_rate
from emp_attrition
group by companieswork
order by companieswork;

-- 26.Create a "High Risk" flag column (using CASE WHEN) where OverTime='Yes' AND JobSatisfaction<=2 AND WorkLifeBalance<=2, and count how many employees fall into this category.
select
    Emp_id,
    OverTime,
    JobSatisfaction,
    WorkLifeBalance,
    Attrition,
    CASE 
        WHEN OverTime = 'Yes' AND JobSatisfaction <= 2 AND WorkLifeBalance <= 2 
        THEN 'High Risk'
        ELSE 'Normal'
    END AS Risk_Flag
FROM emp_attrition;

-- 27.Find the top 10 employees by MonthlyIncome in descending order (using LIMIT or a window function).
select 
emp_id,
MonthlyIncome,
dense_rank() over(order by MonthlyIncome desc) as Income_rank
from emp_attrition
limit 10;

-- 28.Compare the average TotalWorkingYears of employees who left vs. stayed, within each JobRole.
Select 
jobrole,
attrition,
avg(TotalWorkingYears) as Avg_working_year
from emp_attrition
group by jobrole, attrition
order by jobrole;



-- 29.Create a VIEW (vw_high_risk_employees) containing only high-risk employees, so it can be directly connected to Power BI.

Create view VW_high_risk_employees as
select 
Emp_id,
gender,
Department,
Jobrole,
age,
JobSatisfaction,
MonthlyIncome,
Overtime,
WorkLifeBalance,
Attrition
from emp_attrition
where overtime='Yes'
and JobSatisfaction <=2
and worklifebalance <=2;


select * from VW_high_risk_employees;


-- 30.Find employees whose DistanceFromHome is more than double the average DistanceFromHome of the company.
Select emp_id,DistanceFromHome
from emp_attrition
where DistanceFromHome >2*(Select Avg(DistanceFromHome) from emp_attrition);


                    
-- 31.Find employees who have more TotalWorkingYears than the average TotalWorkingYears of employees who have Attrition = 'No'.

select emp_id , totalworkingyears from emp_attrition
where totalworkingyears > (select avg(totalworkingyears) as Avg_totalworkingyears from emp_attrition
							where attrition ='No');

-- 32.Find departments where the number of employees who left is more than the number of employees who left in the Sales department.
select department, 
count(case when attrition ='yes' then 1 end) as emp_left
from emp_attrition
group by department
having emp_left > (select count(case when attrition ='yes' then 1 end) as emp_left_1 from emp_attrition
					where department ='sales'
                    group by department);

-- 33.Find employees whose PercentSalaryHike is below the average PercentSalaryHike of their own JobLevel.

select 
emp_id,
joblevel,
PercentSalaryHike
from emp_attrition as EA
where PercentSalaryHike <(select avg(PercentSalaryHike) as Avg_PercentSalaryHike from emp_attrition
						where joblevel=EA.joblevel);
                        

-- 34.Find the EducationField(s) where attrition rate is above the company-wide average attrition rate.
Select 
educationfield , 
Count(Emp_id) as Total_emp,
Count(Case when attrition ='Yes' then 1 end ) as Emp_left,
round(Count(Case when attrition ='Yes' then 1 end )*100/Count(Emp_id),2 ) as Attrition_rate
from emp_attrition 
group by educationfield
having Attrition_rate > ( Select round(Count(Case when attrition ='Yes' then 1 end )*100/Count(Emp_id),2 ) as Att_rate from emp_attrition);

-- 35.Find employees whose YearsWithCurrManager is less than the average YearsWithCurrManager of employees in the same Department.
Select 
Emp_id,
department,
YearsWithCurrManager
from emp_attrition as EA
where YearsWithCurrManager <(select avg(YearsWithCurrManager)  from emp_attrition
							where department=ea.department)
order by department;



-- 36.Find employees whose MonthlyIncome is higher than every employee in the Human Resources department.

select emp_id, monthlyincome from emp_attrition
where monthlyincome > all (select monthlyincome from emp_attrition
							where department ='Human Resources');

-- 37.Find employees whose MonthlyIncome is higher than at least one employee in the Sales department.

select Emp_id,MonthlyIncome from emp_attrition
where MonthlyIncome > Any (Select MonthlyIncome from emp_attrition 
							where department ='Sales');

-- 38.Find departments where every single employee has Attrition = 'No' (using NOT EXISTS — a department with zero attrition).
SELECT DISTINCT department
FROM emp_attrition e1
WHERE NOT EXISTS (
    SELECT 1
    FROM emp_attrition e2
    WHERE e2.department = e1.department
      AND e2.attrition = 'Yes'
);

-- 39.Find employees who earn the highest MonthlyIncome within their own JobRole.

select Emp_id,jobrole, MonthlyIncome from emp_attrition
where MonthlyIncome in (select max(MonthlyIncome) as highest_income from emp_attrition
group by jobrole);

-- 40.Find employees who left the company but whose MonthlyIncome was still above their department's average (unexpected/risky cases — high earners who still left).
select Emp_id from emp_attrition e1
where attrition ='yes' 
and monthlyincome > (select avg(MonthlyIncome) as highest_income from emp_attrition e2
					where e2.department=e1.department);

-- 41.Find the JobRole with the second highest attrition rate.(using subquery)

select Jobrole , Attrition_Rate 
from (Select Jobrole,
		round(count(case when attrition= 'yes' then 1 end)*100/count(emp_id),2) as  Attrition_Rate
		from emp_attrition
		group by jobrole) as Role_Summary
order by Attrition_Rate desc
limit 1 offset 1;


        


-- 42.Find employees who have NumCompaniesWorked greater than the average NumCompaniesWorked of employees in their same Department AND same JobRole.
select emp_id , department , jobrole , NumCompaniesWorked
from emp_attrition e1
where NumCompaniesWorked > (Select Avg(NumCompaniesWorked) from emp_attrition e2
							where e2.department =e1.department
                            and e2.jobrole =e1.jobrole);


-- 43.Find employees whose MonthlyIncome lies between the minimum and maximum MonthlyIncome of employees who have Attrition = 'Yes' (subquery inside BETWEEN).
Select Emp_id, MonthlyIncome from emp_attrition
where MonthlyIncome between (Select min(MonthlyIncome) from emp_attrition where Attrition ='Yes') 
and (Select max(MonthlyIncome) from emp_attrition where Attrition ='Yes')
order by MonthlyIncome desc ;

-- 44.Find the employee(s) with the closest MonthlyIncome to the overall company average (using ABS() with a subquery, ordered by smallest difference).
select emp_id,
department,
jobrole,
MonthlyIncome,
(Select Avg(MonthlyIncome) from emp_attrition) as Company_Avg,
abs(MonthlyIncome-(Select Avg(MonthlyIncome) from emp_attrition)) as closest_MonthlyIncome
from emp_attrition
order by closest_MonthlyIncome asc
limit 1;


-- 45.Find employees who joined "later" in terms of experience — i.e., their TotalWorkingYears is less than the minimum TotalWorkingYears found among Managers (JobRole = 'Manager') (cross-role subquery comparison).

Select Emp_id,
department,
Jobrole, 
TotalWorkingYears 
from emp_attrition
where TotalWorkingYears < (select min(TotalWorkingYears) from emp_attrition where jobrole ='Manager')
order by TotalWorkingYears asc;


-- 46.Using a correlated subquery, find for each employee how many other employees in the same department earn less than them (like a manual ranking, without using window functions — good contrast to show you understand both approaches).
select emp_id,
department,
jobrole,
monthlyincome,
(select count(*) from emp_attrition e2
where e2.department=e1.department
and e2.monthlyincome < e1.monthlyincome) as employees_earning_less
from emp_attrition e1
order by department, employees_earning_less desc;

-- 47.Find departments where the difference between the highest-paid and lowest-paid employee (MAX - MIN of MonthlyIncome) is greater than the company-wide average MonthlyIncome (a subquery-based pay-gap analysis).
select department,
max(MonthlyIncome) as Max_MonthlyIncome,
min(MonthlyIncome) as Min_MonthlyIncome,
(max(MonthlyIncome)-min(MonthlyIncome)) as diff_MonthlyIncome
 from emp_attrition
 group by department
Having diff_MonthlyIncome > (select avg(MonthlyIncome) from emp_attrition);


-- 48.For each Department, find each employee's MonthlyIncome rank compared to others in the same JobRole (nested partition: PARTITION BY Department, JobRole).
Select emp_id, MonthlyIncome,
dense_rank() over(partition by Department, JobRole order by MonthlyIncome desc) as MonthlyIncome_Rank
from emp_attrition;


-- 49.Calculate a 3-row moving average of MonthlyIncome ordered by EmployeeNumber using AVG() OVER(ORDER BY EmployeeNumber ROWS BETWEEN 2 PRECEDING AND CURRENT ROW).
SELECT 
    Emp_id,
    MonthlyIncome,
    ROUND(
        AVG(MonthlyIncome) OVER (
            ORDER BY Emp_id
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ), 2
    ) AS moving_avg_3row
FROM emp_attrition
ORDER BY Emp_id;


SELECT DISTINCT
    JobRole,
    COUNT(*) OVER(PARTITION BY JobRole) AS Role_Count,
    COUNT(*) OVER() AS Total_Company_Headcount,
    ROUND(
        COUNT(*) OVER(PARTITION BY JobRole) * 100.0 / COUNT(*) OVER(),2) AS Percentage_Contribution
FROM emp_attrition
ORDER BY Percentage_Contribution DESC;

-- 51.For each employee, calculate the gap between their MonthlyIncome and the highest MonthlyIncome in their Department using MAX() OVER(PARTITION BY Department).
select emp_id,
MonthlyIncome,
(Max(MonthlyIncome) over(partition by department) -MonthlyIncome) as Diff_MonthlyIncome
from emp_attrition;

-- 52.Assign each employee a percentile rank based on MonthlyIncome using PERCENT_RANK().
select emp_id,
percent_rank() over(order by MonthlyIncome) as percent_rank_MonthlyIncome
from emp_attrition;


-- 56.Find the cumulative attrition count over increasing tenure (YearsAtCompany) using SUM() OVER(ORDER BY YearsAtCompany).

Select Emp_id,
YearsAtCompany,
attrition,
sum(case when attrition ='yes' then 1 end) over(order by YearsAtCompany) AS Cumulative_Attrition
from emp_attrition;

