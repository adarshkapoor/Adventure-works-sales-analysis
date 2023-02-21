# Adventure works Sales Analysis
The main purpose of this project was to present a sales report for the Adevnture works bike sales from 2021-2023. The data was cleaned up using Microsoft SQL Server and four tables were obtained. They were loaded into Power BI and modelled to form a  star schema and three different reports were generated- Sales Report, CustomerAnalysis and Product Details. 

## Stakeholders and User Stories-
The main stakeholders were-
1. Sales Manager
2. Sales Representative
3. Customer

## Potential Use cases-
1. Present a report of the overall internet sales that can show which customers and products are in demand and are selling the most. This can be done using visualizations and charts in Power BI. The report alos shows the sales vs budget over time. 
2. A report containing the detailed customer data breakdown and sales information which canbe done using Power BI.
3. A detailed overview of Internet Sales per porduct as requested by the sales representative. 

## Data cleaning and transformation-
The data was loaded into Microsoft SQL management studio and was cleaned using SQL to make three dimension tables namely- DIM_Cstomer, DIM_Product and DIM_Calender and a fact table  FACT_InternetSales. 

## Data Modelling-
As discussed earlier the Fact table and the three dimension tables are linked to each other to form a star schema as shown below-
![image](https://user-images.githubusercontent.com/30018086/220396346-ddf8c300-d029-449a-9646-a2d1093f95f1.png)

## Overview-
There are three reports. The frist one is the sales overview report which has the overall internet sales vs the budget and details about the products and customers.The second report is about Customer Analysis containg the customer information in detail. The third one is the Product overview having details about the best selling products and sub-products. The first report has two buttons on the top-left which can be used to access the other two pages. 

Sales Report-

![image](https://user-images.githubusercontent.com/30018086/220401378-14818c47-8f3f-4ff7-93c1-1aea3a2432ee.png)

Customer Analysis-

![image](https://user-images.githubusercontent.com/30018086/220398550-d4cfc679-f9cb-4878-80af-27aaaec08da1.png)

Product Details-

![image](https://user-images.githubusercontent.com/30018086/220398773-c560e708-6b17-42f3-bd3c-cc9e5a6a8e8a.png)

## Key Takeaways-
1. For the year 2022, the sales were consistently higher than the budget except for the months of July and September.
2. London and Paris were the cities with the biggest share of sales.
3. Out of the three categories bikes was the most selling one.
4. mRoad bikes and mountain bikes and were the most selling bikes. 

## Data Source
https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=ssms
