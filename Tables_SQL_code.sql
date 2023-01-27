
--Cleaned Dim Calender Table (Dimension table)
SELECT 
  [DateKey], 
  [FullDateAlternateKey] AS Date, 
  --[DayNumberOfWeek], 
  [EnglishDayNameOfWeek] AS Day, 
  --[SpanishDayNameOfWeek], 
  --[FrenchDayNameOfWeek], 
  --[DayNumberOfMonth], 
  --[DayNumberOfYear], 
  --[WeekNumberOfYear],
  [EnglishMonthName] AS Month, 
  Left([EnglishMonthName], 3) AS MonthShort,   -- Used for ease in visualization.
  --[SpanishMonthName], 
  --[FrenchMonthName], 
  [MonthNumberOfYear] AS MonthNo, 
  [CalendarQuarter] AS Quarter, 
  [CalendarYear] AS Year --[CalendarSemester], 
  --[FiscalQuarter], 
  --[FiscalYear], 
  --[FiscalSemester] 
FROM 
 [AdventureWorksDW2019].[dbo].[DimDate]
WHERE 
  CalendarYear >= 2021

-- --Cleaned Dim Customer Table (Dimension table)
SELECT 
  c.[CustomerKey] AS CustomerKey, 
  --,[GeographyKey]
  -- ,[CustomerAlternateKey]
  --,[Title]
  c.[FirstName] AS [First Name], 
  --,[MiddleName]
  c.[LastName] AS [Last Name], 
  c.[FirstName] + ' ' + c.[LastName] AS [Full Name], 
  --,[NameStyle]
  --,[BirthDate]
  --,[MaritalStatus]
  --,[Suffix]
  CASE c.[Gender] WHEN 'M' THEN 'Male' 
	ELSE 'Female' END AS Gender, -- Segregating column by gender
  --,[EmailAddress]
  --,[YearlyIncome]
  --,[TotalChildren]
  --,[NumberChildrenAtHome]
  --,[EnglishEducation]
  --,[SpanishEducation]
  --,[FrenchEducation]
  --,[EnglishOccupation]
  --,[SpanishOccupation]
  --,[FrenchOccupation]
  --,[HouseOwnerFlag]
  --,[NumberCarsOwned]
  --,[AddressLine1]
  --[AddressLine2]
  --,[Phone]
  c.[DateFirstPurchase] AS DateFirstPurchase, 
  --,[CommuteDistance]
  g.City AS [Customer City] 
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] AS c 
  LEFT JOIN [AdventureWorksDW2019].[dbo].[DimGeography] AS g ON g.GeographyKey = c.GeographyKey --JOINED customer table with geography table to get the cities
ORDER BY c.CustomerKey ASC

-- Cleaned Dim Product Table (Dimension table)
SELECT 
  p.[ProductKey], 
  p.[ProductAlternateKey] AS ProductItemCode, 
  --,[ProductSubcategoryKey]
  --,[WeightUnitMeasureCode]
  --,[SizeUnitMeasureCode]
  p.[EnglishProductName] AS [Product Name], 
  s.[EnglishProductSubcategoryName] AS [Prodcut sub category], 
  --  The product subcategory table is first joined with the product table
  c.[EnglishProductCategoryName] AS [Product category], 
  -- Then the product category table is joined with them
  --,[SpanishProductName]
  --,[FrenchProductName]
  --,[StandardCost]
  --,[FinishedGoodsFlag]
  p.[Color] AS [Product Colour], 
  --,[SafetyStockLevel]
  --,[ReorderPoint]
  --,[ListPrice]
  p.[Size] AS [Product Size], 
  --,[SizeRange]
  --,[Weight]
  --,[DaysToManufacture]
  p.[ProductLine] AS [Product Line], 
  --,[DealerPrice]
  --,[Class]
  --,[Style]
  p.[ModelName] AS [Product Model Name], 
  --,[LargePhoto]
  p.[EnglishDescription] AS [Product Description], 
  --,[FrenchDescription]
  --,[ChineseDescription]
  --,[ArabicDescription]
  --,[HebrewDescription]
  --,[ThaiDescription]
  --,[GermanDescription]
  --,[JapaneseDescription]
  --,[TurkishDescription]
  --,[StartDate]
  --,[EndDate]
  ISNULL ([Status], 'Outdated') AS [Product Status] -- To remove null  valeus from the Product status  column
FROM 
  [AdventureWorksDW2019].[dbo].[DimProduct] AS p 
  LEFT JOIN [AdventureWorksDW2019].[dbo].[DimProductSubcategory] AS s ON p.ProductSubcategoryKey = s.ProductSubcategoryKey 
  LEFT JOIN [AdventureWorksDW2019].[dbo].[DimProductCategory] AS c ON s.ProductCategoryKey = c.ProductCategoryKey 
ORDER BY 
  p.ProductKey ASC


-- Internet sales Table. This is the main Fact table used for visualization. 
SELECT [ProductKey],
      [OrderDateKey],
      [DueDateKey],
      [ShipDateKey],
      [CustomerKey],
      --[PromotionKey]
      --,[CurrencyKey]
      --,[SalesTerritoryKey]
      [SalesOrderNumber],
      --[SalesOrderLineNumber]
      --,[RevisionNumber]
      --,[OrderQuantity]
      --,[UnitPrice]
      --,[ExtendedAmount]
      --,[UnitPriceDiscountPct]
      --,[DiscountAmount]
      --,[ProductStandardCost]
      --,[TotalProductCost]
      [SalesAmount]
     -- ,[TaxAmt]
      --,[Freight]
      --,[CarrierTrackingNumber]
      --,[CustomerPONumber]
      --,[OrderDate]
      --,[DueDate]
      --,[ShipDate]
  FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]
  WHERE LEFT(OrderDateKey,4) >= YEAR(GETDATE())-2 -- To get the data for the past two years
  ORDER BY OrderDateKey ASC
  