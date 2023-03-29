USE [Powersoft_YASOTHA]
GO
/****** Object:  UserDefinedFunction [dbo].[Fun_YourAttn1]    Script Date: 25/03/2023 21:51:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---select * from Fun_Ins_JobcardIncentive()
create function [dbo].[Fun_Ins_JobcardIncentive] (

)  
returns Table  
return  
(  
--declare @Fdate as datetime  
--declare @Tdate as datetime  
--set @Fdate='2014-05-01'  
--set @Tdate ='2014-05-31'  
SELECT   sum(FS) AS FS
 ,sum(PS ) PS
,sum(GS ) GS
,sum(MJ ) MJ
,sum(AW ) AW
,sum(PDI ) PDI_ins
,sum(FIT ) FIT_ins
,sum(WS ) ws_ins
,sum(DEMO ) DEMO_ins
,sum(LABOUR ) LABOUR_ins
,sum(SPARES ) SPARES_ins
 FROM (SELECT
      CASE WHEN JOB_NAME='FS'  THEN Incentive_Amount ELSE 0 END AS FS
 ,CASE WHEN JOB_NAME='PS' THEN Incentive_Amount ELSE 0 END AS PS
,CASE WHEN JOB_NAME='GS' THEN Incentive_Amount ELSE 0 END AS GS
,CASE WHEN JOB_NAME='MJ' THEN Incentive_Amount ELSE 0 END AS MJ
,CASE WHEN JOB_NAME='AW' THEN Incentive_Amount ELSE 0 END AS AW
,CASE WHEN JOB_NAME='PDI' THEN Incentive_Amount ELSE 0 END AS PDI
,CASE WHEN JOB_NAME='FIT' THEN Incentive_Amount ELSE 0 END AS FIT
,CASE WHEN JOB_NAME='W/S' THEN Incentive_Amount ELSE 0 END AS ws
,CASE WHEN JOB_NAME='DEMO' THEN Incentive_Amount ELSE 0 END AS DEMO
,CASE WHEN JOB_NAME='LABOUR' THEN Incentive_Amount ELSE 0 END AS LABOUR
,CASE WHEN JOB_NAME='SPARES' THEN Incentive_Amount ELSE 0 END AS SPARES
FROM [Powersoft_YASOTHA].[dbo].[Ins_JobcardIncentive_Master]) AS P
)
 