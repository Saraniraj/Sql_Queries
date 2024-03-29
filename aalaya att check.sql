/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Comp_Code]
      ,[Location_Code]
      ,[Fid]
      ,[sdate]
      ,[stime]
      ,[inout1]
      ,[inout]
      ,[mcid]
      ,[Sdatetime]
      ,[Empcode]
      ,[ID]
      ,[STATUS]
      ,[IDTXT]
      ,[fkey]
      ,[unit]
  FROM [PowerERP_AALAYAA].[dbo].[Bio_Attnlog]
  where sdate='2023-05-23 00:00:00.000'
  and empcode='H0097'

  select   b.shiftid,InStartPDay,PunchStartFrom,StartTime
  ,'2023-05-23'+ ' '+PunchStartFrom  as PunchStartFrom
  ,dateadd(hh,1,'2023-05-23'+ ' '+PunchStartto) as PunchStartto
   from HRD_EmpShiftMatch a,Shift_Master b where a.id=b.shiftcode and a.empcode='H0097'                                                                
and '2023-05-23 07:52:11.000' between case when InStartPDay='true' then dateadd(d,-1,'2023-05-23')+ ' '+PunchStartFrom else  '2023-05-23'+ ' '+PunchStartFrom  end                  
and case when StartNDay='true' then dateadd(hh,1,dateadd(d,1,'2023-05-23')+ ' '+PunchStartto) else  dateadd(hh,1,'2023-05-23'+ ' '+PunchStartto)  end                                                                 

select * from Shift_Master



  select  b.shiftid
, a.ID,a.empcode
from HRD_EmpShiftMatch a,Shift_Master b where b.shiftcode=a.id   
and a.empcode='H0097'   



select * from TransAttendance
where  sdate='2023-05-23 00:00:00.000' and  empcode='H0097'  