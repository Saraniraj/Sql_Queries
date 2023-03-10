USE [SqlFunctions]
GO
/****** Object:  UserDefinedFunction [dbo].[Getalldatesinmonth]    Script Date: 13/02/2023 21:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		K.Rajkumar
-- Create date: 04-06-2020
-- Description:	<Description,,>
-- =============================================


--  select * from GetMonthList ( '2010-05-01','2022-05-30')  option (maxrecursion 0); 

alter FUNCTION  [dbo].[GetMonthList] (
 @Fromdate as datetime
,@Todate as datetime

) 
returns Table  
return  
(  
--declare @start DATE = '2014-05-01'
--declare @end DATE = getdate()

with months (date)
AS
(
    SELECT @Fromdate
    UNION ALL
    SELECT DATEADD(month, 1, date)
    from months
    where DATEADD(month, 1, date) < @Todate
)
select     [MonthName]    = DATENAME(mm, date),
           [MonthNumber]  = DATEPART(mm, date),  
           [LastDayOfMonth]  = DATEPART(dd, EOMONTH(date)),
           [MonthYear]    = DATEPART(yy, date),

      smonth    = FORMAT (date, 'MMM-yyyy')

from months
--option (maxrecursion 0); 
	--order by p.Prod_Code,p.Prod_Desc  
 )