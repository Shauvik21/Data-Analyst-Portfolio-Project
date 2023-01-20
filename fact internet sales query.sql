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
