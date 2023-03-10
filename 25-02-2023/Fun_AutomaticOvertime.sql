USE [Powersoft_YASOTHA]
GO
/****** Object:  UserDefinedFunction [dbo].[Fun_AutomaticOvertime]    Script Date: 03-Feb-2023 14:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================        
-- Author  : KRK       
-- Create date :15-11-2022
-- Modified date :15-11-2022   
-- Description : Get Employee Monthly Attendance Details       
-- =============================================================        
-- Grant Execute On sp_GetEmployeeMaster_Details To Public        
---select *  from Fun_AutomaticOvertime ( '100','VADAPUDUPATTI' ,  '2022/12/10' , '2022/12/10')   order by resigndate


ALTER function [dbo].[Fun_AutomaticOvertime] (
@Comp_Code    Varchar(20),   
@Location_code    Varchar(20),  
@Fdate as datetime
,@Tdate as datetime)  returns Table
 
return    
(    
      
select  a.id,a.Sdate
,left(datename(WEEKDAY,a.sdate),3) WkDay
 ,a.EmpCode,b.FingerId ,b.Empname ,b.sex
,c.catname,d.Deptname,e.DesgnName
,d.GroupName ,d.Sudeptgroup 
,c.catcode,d.Deptcode,e.Desgncode
,f.shiftID,f.shiftname
,f.shift,f.ShiftCode,b.SGroup,a.status,g.statusname,a.dayvalue, day(a.sdate) day2 

,a.INTIME as intime1 ,a.outtime as outtime1
,case when a.intime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.INTIME  AS TIME),100) else '-' end  InTime,    
case when a.outtime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.outtime  AS TIME),100) else '-' end OutTime 
,case when a.intime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.INTIME  AS TIME),108) else '-' end  RailInTime   
,case when a.intime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.outtime  AS TIME),108) else '-' end  RailOutTime    
   
 , cast(cast(cast(   a.SDate    as date) as varchar(30))+' '+f.StartTime   as datetime)   as StartTime
 ,cast(cast(cast(   case when EndNxtDay=1 then dateadd(d,1,a.SDate)  else a.SDate end   as date) as varchar(30))+' '+f.EndTime  as datetime) as EndTime
  --,@fdate+ ' '+f.EndTime as EndTime   
  
   
   ,DATEDIFF(MINUTE, 
cast(cast(cast(   a.SDate    as date) as varchar(30))+' '+f.StartTime   as datetime)  
,cast(cast(cast(   case when EndNxtDay=1 then dateadd(d,1,a.SDate)  else a.SDate end   as date) as varchar(30))+' '+f.EndTime  as datetime)  )  as Shift_mts
     
	 
--	  ,DATEDIFF(MINUTE, 
--	  CAST(a.outtime  AS datetime)
----cast(cast(cast(   a.SDate    as date) as varchar(30))+' '+a.OUTTIME    as datetime)  
--,cast(cast(cast(   case when EndNxtDay=1 then dateadd(d,1,a.SDate)  else a.SDate end   as date) as varchar(30))+' '+ f.EndTime  as datetime)  )  as OT_mts

  ,DATEDIFF(MINUTE, 
	  cast(cast(cast(   case when EndNxtDay=1 then dateadd(d,1,a.SDate)  else a.SDate end   as date) as varchar(30))+' '+ f.EndTime  as datetime) 
--cast(cast(cast(   a.SDate    as date) as varchar(30))+' '+a.OUTTIME    as datetime)  
,CAST(a.outtime  AS datetime) )  as OT_mts

   ,DATEDIFF(HOUR , 
   cast(cast(cast(   case when EndNxtDay=1 then dateadd(d,1,a.SDate)  else a.SDate end   as date) as varchar(30))+' '+f.EndTime  as datetime)
   , CAST(a.outtime  AS datetime)
--cast(cast(cast(   a.SDate    as date) as varchar(30))+' '+a.OUTTIME    as datetime)  
  )  as OT_hrs
   
,a.ETYPE
,f.PunchStartTo

  --,CONVERT(VARCHAR(8), GETDATE(), 108) 'hh:mi:ss'
,b.AttendanceStatus 

 ,b.empcodeid ,b.Empid  
,b.doj,b.ResignDate ,b.WeeklyOff
from TRANSAttendance a
left  join Emp_Master b on b.EmpCode =a.EmpCode  and b.Location_Code=a.Location_Code
 left join category_master as c on c.CatCode  =b.CatCode  and c.Location_Code=b.Location_Code
left join Deptmaster as d on d.DeptCode =b.Deptcode    and d.Location_Code=b.Location_Code
left join designation as e on e.DesgnCode  =b.DesgnCode  and e.Location_Code=b.Location_Code
left join shift_master as f on f.shiftid  =a.shiftid   and f.Location_Code=b.Location_Code
left join statusMaster as g on g.code  =a.Status   and g.Location_Code=b.Location_Code
  
where a.SDate between @Fdate and @Tdate    
 and b.EmpName  <> 'NONE'
and g.STATUSNAME<>'' 
and a.Status in ('X','x')
and d.DeptName not in ('SECURITY')
and (a.intime<>'1900-01-01 12:00:00'and a.outtime<>'1900-01-01 12:00:00')
 AND (B.resigndate='1900-01-01' or (b.resigndate<>'1900-01-01' ) and a.SDate<=b.ResignDate)
 and a.location_code=@location_code
  and b.DOJ<@Tdate 
  --and c.CatCode not in (1,2,13)
 
 --and b.ResignDate<@Tdate
--and a.EmpCode =@empcode    
    
    

    
    
)







