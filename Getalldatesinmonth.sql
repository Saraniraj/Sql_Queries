USE [eSales]
GO
/****** Object:  UserDefinedFunction [dbo].[Getalldatesinmonth]    Script Date: 24-Jan-2023 10:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		K.Rajkumar
-- Create date: 04-06-2020
-- Description:	<Description,,>
-- =============================================


--  select * from Getalldatesinmonth ( '2022-05-01','2022-05-30')  

ALTER FUNCTION  [dbo].[Getalldatesinmonth] (
 @Fromdate as datetime
,@Todate as datetime

) 
returns Table  
return  
(  
--Declare @year int = year(@Fromdate), @month int = 10;
 WITH numbers
as
(
    Select 1 as value
    UNion ALL
    Select value + 1 from numbers
    where value + 1 <= Day(EOMONTH(datefromparts(year(@Fromdate),MONTH(@fromdate),2)))
)
SELECT datefromparts(year(@Fromdate),MONTH(@fromdate),numbers.value) as  sdate FROM numbers
	--order by p.Prod_Code,p.Prod_Desc  
 )