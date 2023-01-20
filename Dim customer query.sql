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

