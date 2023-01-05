/****** Script for SelectTopNRows command from SSMS  ******/
use DB_HRMS 
go

SELECT empcode,sdate,Present ,WeeklyOff ,PaidDays 
,basic,AttnEarning ,HRAAmount1 ,HRAAmount ,WashAmount1,washamount
,daamount1,daamount
,OT_Hours ,OT_SALARY ,Nightshft_ALW ,Monthly_inc ,Holiday_wages 
,PFSource ,ESISource ,TotalEarnings , *

  FROM [DB_HRMS].[dbo].[SalStoreTable] where  Tokenno ='22'



SELECT empcode,round(((HRAAmount1 / [SalaryDay1]) *Paid_Days) ,2) ,HRAAmount 
,HRAAmount1 ,round(((HRAAmount1 / [SalaryDay1]) *Paid_Days) ,2) as hr

 FROM [DB_HRMS].[dbo].TmpSalProcess where  Tokenno ='22'

--SELECT empoldcode ,Catcode ,*  FROM [DB_HRMS].[dbo].Emp_Master  where     empoldcode ='22'


--SELECT *  FROM [DB_HRMS].[dbo].Category_Master
select * FROM [DB_HRMS].[dbo].[SalStoreTable] where  Tokenno ='22'