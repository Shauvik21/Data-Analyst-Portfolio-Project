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
