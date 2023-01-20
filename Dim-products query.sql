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
