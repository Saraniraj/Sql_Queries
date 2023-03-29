
USE [LS_HRD_B]
GO
/****** Object:  UserDefinedFunction [dbo].[Fun_EmpMonthlyAttn]    Script Date: 28-Mar-23 12:09:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================================        
-- Author  : RAJKUMAR.K        
-- Create date : 03/04/2017        
--mODIFIED dATE :22-11-2018
-- Description : Get Employee Monthly Attendance Details       
-- =============================================================        
-- Grant Execute On sp_GetEmployeeMaster_Details To Public        
---select *  from Fun_AttMatrixMonthly ('2022-01-01','2022-01-31') where empcode='br620'  


alter function [dbo].[Fun_AttMatrixMonthly] (@Fdate as datetime,@Tdate as datetime)  returns Table
 
return    
(    







select  
left(datename(WEEKDAY,a.sdate),3) WkDay
,a.EmpCode,b.Empname ,b.sex,b.Empid 
,c.catname,d.Deptname,e.DesgnName
 ,a.status,g.statusname
 ,a.sdate
 ,case when a.intime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.INTIME  AS TIME),100) else '-' end  InTime,    
case when a.outtime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.outtime  AS TIME),100) else '-' end OutTime 
,case when a.intime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.INTIME  AS TIME),108) else '-' end  RailInTime 

, day(a.sdate) day2

--,case when  left(datename(WEEKDAY,a.sdate),3) ='Mon' then   case when a.intime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.INTIME  AS TIME),100) else '-' end  else '' end as MON_IN   
--,case when  left(datename(WEEKDAY,a.sdate),3) ='Mon' then   case when a.outtime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.outtime  AS TIME),100) else '-' end  else '' end as MON_OUT   
--,case when  left(datename(WEEKDAY,a.sdate),3) ='Tue' then   case when a.intime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.INTIME  AS TIME),100) else '-' end  else '' end as TUE_IN   
--,case when  left(datename(WEEKDAY,a.sdate),3) ='Tue' then   case when a.outtime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.outtime  AS TIME),100) else '-' end  else '' end as TUE_OUT 

--,case when  left(datename(WEEKDAY,a.sdate),3) ='Wed' then   case when a.intime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.INTIME  AS TIME),100) else '-' end  else '' end as WED_IN   
--,case when  left(datename(WEEKDAY,a.sdate),3) ='Wed' then   case when a.outtime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.outtime  AS TIME),100) else '-' end  else '' end as WED_OUT 

--,case when  left(datename(WEEKDAY,a.sdate),3) ='Thu' then   case when a.intime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.INTIME  AS TIME),100) else '-' end  else '' end as THU_IN   
--,case when  left(datename(WEEKDAY,a.sdate),3) ='Thu' then   case when a.outtime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.outtime  AS TIME),100) else '-' end  else '' end as THU_OUT 

 

--,case when  left(datename(WEEKDAY,a.sdate),3) ='Fri' then   case when a.intime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.INTIME  AS TIME),100) else '-' end  else '' end as FRI_IN   
--,case when  left(datename(WEEKDAY,a.sdate),3) ='Fri' then   case when a.outtime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.outtime  AS TIME),100) else '-' end  else '' end as FRI_OUT 

--,case when  left(datename(WEEKDAY,a.sdate),3) ='Sat' then   case when a.intime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.INTIME  AS TIME),100) else '-' end  else '' end as SAT_IN   
--,case when  left(datename(WEEKDAY,a.sdate),3) ='Sat' then   case when a.outtime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.outtime  AS TIME),100) else '-' end  else '' end as SAT_OUT 


--,case when  left(datename(WEEKDAY,a.sdate),3) ='Sun' then   case when a.intime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.INTIME  AS TIME),100) else '-' end  else '' end as SUN_IN   
--,case when  left(datename(WEEKDAY,a.sdate),3) ='Sun' then   case when a.outtime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.outtime  AS TIME),100) else '-' end  else '' end as SUN_OUT 
  
  
  
--,case when left(datename(WEEKDAY,a.sdate),3) ='Fri'  then   sum(a.dayvalue) else 0 end as FRI   
--,case when left(datename(WEEKDAY,a.sdate),3) ='Sat'  then   sum(a.dayvalue) else 0 end as SAT  
--,case when left(datename(WEEKDAY,a.sdate),3) ='Sun'  then   sum(a.dayvalue) else 0 end as SUN  
 ,sum(a.dayvalue) as Total
, DateName( weekday , sdate ) as Day_Name_From_Date
from TRANSAttendance a
left  join Emp_Master b on b.EmpCode =a.EmpCode 
left join category_master as c on c.CatCode  =b.CatCode 
left join Deptmaster as d on d.DeptCode =b.Deptcode  
left join designation as e on e.DesgnCode  =b.DesgnCode
left join shift_master as f on f.shiftid  =a.shiftid 
left join statusMaster as g on g.code  =a.Status 
 

  
where a.SDate between @Fdate and @Tdate    
 and b.EmpName  <> 'NONE'
and g.STATUSNAME<>'' 
 
  and ( b.ResignDate ='1900-01-01' or (b.ResignDate<>'1900-01-01'   and b.ResignDate >= @Fdate ))
  and b.DOJ<=@Tdate 
 
   
group by 
 
sdate,a.EmpCode,b.Empname,b.sex,b.Empid,f.shift
,c.catname,d.Deptname,e.DesgnName
,intime,outtime ,a.status,g.statusname


)