# Data-Analyst-Portfolio-Project
---Cleansed Dim Timetable---
SELECT 
  [DateKey], 
  [FullDateAlternateKey] as Date, 
  [EnglishDayNameOfWeek] as Day,
  left([EnglishMonthName], 3) as Month, ------- useful for front end date navigation and front end month 
  [MonthNumberOfYear] as Month_no, 
  [CalendarQuarter] as Quarter, 
  [CalendarYear] as Year 
FROM 
  [AdventureWorksDW2019].[dbo].[DimDate]
  where CalendarYear>=2020
  
  ---Cleansed DimCustomer table---

Select 
  c.customerkey as Customer_Key, 
  c.firstname as First_Name, 
  c.lastname as Last_Name, 
  c.firstname + ' ' + c.lastname as Full_Name, 
  ----- concatenating both the first and last names as a single full name
  case c.gender when 'M' then 'Male' when 'F' then 'Female' End as Gender, 
  c.DateFirstPurchase as Date_of_first_Purchase, 
  g.city as Customer_City 
from 
  [dbo].[DimCustomer] c 
  left join [dbo].[DimGeography] g on c.GeographyKey = g.GeographyKey ----- joining customer table with geography table to get customer city
order by 
  Customer_Key asc ------ordering by customer key in ascending order
  
  --Cleansed DimProduct table--
use AdventureWorksDW2019
Select 
  p.productkey as Product_Key, 
  p.productalternatekey as Product_Item_Code, 
  p.Englishproductname as Product_Name, 
  p.color as Product_Color, 
  pc.englishproductcategoryname as Product_Category, 
  ----- joined from category table
  ps.englishproductsubcategoryname as Product_Sub_Category, 
  ---- joined from subcategory table
  p.size as Product_Size, 
  p.style as Product_Style, 
  p.productline as Product_Line, 
  p.modelname as Product_Model_Name, 
  p.englishdescription as Product_Description, 
  ISNULL (p.status, 'Outdated') as Product_Status ---- if p.status is null then it will be replaced by the term outdated
from 
  [dbo].[DimProduct] p 
  left join [dbo].[DimProductSubcategory] ps on p.ProductSubcategoryKey = ps.ProductSubcategoryKey 
  left join [dbo].[DimProductCategory] pc on ps.ProductCategoryKey = pc.ProductCategoryKey 
order by 
  p.ProductKey asc
  
  ---Cleansed fact internet sales table---
select 
  productkey as Product_Key, 
  orderdatekey as Order_Date_Key, 
  duedatekey as Due_Date_Key, 
  shipdatekey as Ship_Date_Key, 
  customerkey as Customer_Key, 
  salesordernumber as Sales_Order_Number, 
  salesamount as Sales_Amount 
from 
  FactInternetSales 
where 
  LEFT(OrderDateKey, 4) >= YEAR(
    getdate()
  ) -2 
order by 
  OrderDateKey asc
