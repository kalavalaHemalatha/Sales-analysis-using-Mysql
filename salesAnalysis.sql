create database company;
use company;
select *from sales;

-- Find all orders shipped via 'Economy' mode with a total amount greater than 25000
select Order_ID from sales 
where Ship_Mode='Economy' and Total_Amount>25000;

-- Retrive all sales data for 'Techonology' category in 'Ireland' made after 2020-01-01
select *from sales 
where Category='Technology' and Country='Ireland' and Order_Date>'2020-01-01';

-- List the top 10 most profitable sales transcations in descending order 
select *from sales order by Unit_Profit desc limit 10;

-- For the records from 11 to 30
select *from sales order by Unit_Profit desc limit 10,20;

-- Find all customers whose name starts with 'J' and ends with 'n'
select Order_ID,Customer_Name from sales where Customer_Name like 'J%n';

-- Retrive all product names that contain Acco anywhere in the name
select Product_Name from sales where Product_Name like '%Acco%';

-- Get the top 5 cities with the highest total sales amount
select City,sum(Total_Amount) as Total_Sales from sales group by city order by Total_Sales desc limit 5;

-- Display the second set 10 records from sales - customer name,total amount in decreasing order
select Customer_Name,Total_Amount from sales order by Total_Amount desc limit 10,10;

-- find the total revenue,average unit cost and total no of orders
select sum(Total_Amount) as `Total Revenue`,avg(Unit_Cost) as Per_unit,count(Order_ID) as Total_orders from sales;

-- select the unique number of region
select count(distinct Region) as unique_Reg from sales;

-- find no of orders placed by each customer
select Customer_Name,count(Order_ID) as Order_count from sales group by Customer_Name order by Order_count;

-- rank 5 products based on total sales using RANK()
select Product_Name,sum(Total_Amount) as Total_sales,rank() over (order by sum(Total_Amount) desc) as sales_Rank from sales
group by Product_Name limit 5;
