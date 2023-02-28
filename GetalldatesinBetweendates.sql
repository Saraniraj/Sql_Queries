USE [eSales]
GO
/****** Object:  UserDefinedFunction [dbo].[GetalldatesinBetweendates]    Script Date: 24-Jan-2023 10:11:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		K.Rajkumar
-- Create date: 04-06-2020
-- Description:	<Description,,>
-- =============================================


--  select * from GetalldatesinBetweendates ( '2022-01-01','2022-03-30')  

ALTER FUNCTION  [dbo].[GetalldatesinBetweendates] (
 @Fromdate as datetime
,@Todate as datetime

) 
returns Table  
return  
(  
--Declare @year int = year(@Fromdate), @month int = 10;
 
  
WITH Dates (DateNo) AS (  
SELECT DATEADD(DAY, DATEDIFF(DAY, 0, @ToDate) - DATEDIFF(DAY, @FromDate, @ToDate), 0)  
UNION ALL SELECT DATEADD(DAY, 1, DateNo)  
FROM Dates  
WHERE DATEADD(DAY, 1, DateNo) <=@ToDate)   
  
SELECT DateNo as [Date],DATENAME(month, DateNo) as [Month Name],DATENAME(DW, DateNo) as [Day Name]  
FROM Dates   
--option (maxrecursion 365); 
 )