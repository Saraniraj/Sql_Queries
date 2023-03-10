USE [Powersoft_YASOTHA]
GO
/****** Object:  UserDefinedFunction [dbo].[Fun_AttendancenAbstract]    Script Date: 01-Mar-2023 11:20:06 ******/
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
--- select *  from [Fun_AttendancenAbstract]  ('theni','2023-02-01','2023-02-28')    order by empid


ALTER function [dbo].[Fun_AttendancenAbstract] (@Location as varchar(20) ,@Fdate as datetime,@Tdate as datetime)  returns Table
 
return    
(  
 
 
 select    x.empcode,x.catname,x.Deptname,x.DesgnName ,x.Empname,x.sex
   ,sum(Present) as Present
   ,sum(AB) as AB
   ,sum(LV) as LV

   ,sum(woff) as woff
   ,sum(NHFH) as NHFH
   ,sum(Woff_Psent) as Woff_Psent
   ,sum(Present) +sum(AB)+sum(lv) +sum(woff) +sum(NHFH) +sum(Woff_Psent) as Total
,sum(x.LateMins) as LateMins,sum(x.EarlyMins) as EarlyMins,sum(x.OT_Mts) as OT_Mts


   --,sum(Woff_Present) as Woff_Psent
   --,SUM(Woff_nhfh) AS Woff_NHFH
   --,sum(Woff_HDAY) as Woff_HDAY
   ,x.WeeklyOff
   ,x.Months,x.years,x.DEPTCODE,x.doj
   ,X.CatCode
   ,x.Empid ,x.FingerId 
   ,x.wpday
      ,((x.wpday/8)/60) *1.5 as L_Finemins
      ,round(((x.wpday/8)/60)*sum(x.LateMins),2) *1.5 as Late_Fine

      ,round(((x.wpday/8)/60)*sum(x.EarlyMins),2) *1.5 as Early_Fine
	  ,0 as Permission_Mins
      ,round((((x.wpday/8)/60)*0),0)   as Permission_Fins
      ,round(((x.wpday )*sum(Woff_Psent)),0)   as OT_DAYS_INCENTIVE
	        ,round((((x.wpday/8)/60)*sum(x.OT_Mts)),0)   as OT_Hours_INCENTIVE
 

  from
  
   
   (
    
   select  p.empcode,p.Empname,p.catname,p.deptname,p.DesgnName ,p.sex
,case when  p.Status in ('x','/','/L','/CL','/PL','od','p')  then  sum(p.dayvalue) 
else 0
end as  Present
,case when   p. Status in ('A','/')    then  sum(p.dayvalue)   
else 0 end as AB   
,case when   p. Status in ('L','/L','CL','PL','/CL','/PL')    then  sum(p.dayvalue)   
else 0 end as LV   
,case when   p. Status in ('W')    then  sum(p.dayvalue)   
else 0 end as woff 
,case when   p. Status in ('Wx')    then  sum(p.dayvalue)   
else 0 end as Woff_Psent   
,case when   p. Status in ('NH','FH','H')    then  sum(p.dayvalue)   
else 0 end as NHFH  

,sum(p.LateMins) as LateMins,sum(p.EarlyMins) as EarlyMins,sum(p.OT_Mts) as OT_Mts

--,sum(p.Woff_Present) as Woff_Present  ,sum(Woff_HDAY ) as Woff_HDAY,SUM(Woff_nhfh) AS Woff_nhfh

,p.WeeklyOff,p.Months,p.years,p.DEPTCODE  ,p.doj,P.CatCode ,p.SHIFT 
,p.Empid,p.FingerId ,p.wpday

from    (

select  a.id,a.Sdate
,left(datename(WEEKDAY,a.sdate),3) WkDay
 ,a.EmpCode,b.Empname ,b.sex
,c.catname,d.Deptname,e.DesgnName
,f.shift,f.ShiftCode,b.SGroup,a.status,g.statusname,a.dayvalue, day(a.sdate) day2, 
case when a.intime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.INTIME  AS TIME),100) else '-' end  InTime,    
case when a.outtime<>'1900-01-01 12:00:00' then CONVERT(varchar(15),CAST(a.outtime  AS TIME),100) else '-' end OutTime   
,b.AttendanceStatus 

,case when a.status in ('X','x') and LateMins >10   then LateMins else 0 end as LateMins
,case when a.status in ('X','x')    then EarlyMins else 0 end as EarlyMins


,OT_Mts

 ,b.empcodeid ,b.Empid ,b.FingerId 
,b.doj,b.ResignDate,b.WeeklyOff
,month(a.sdate) as Months,year(a.sdate) as years
,b.Deptcode  ,C.CatCode 
 ,b.wpday
--,case when FORMAT(SDate, 'ddd')= WeeklyOff AND Status    IN ('Wx','W' )  then 1 else 0 END AS Woff_HDAY
--,case when FORMAT(SDate, 'ddd')= WeeklyOff AND Status    IN ( 'FH','NH')  then 1 else 0 END AS Woff_nhfh

--,case when FORMAT(SDate, 'ddd')= WeeklyOff AND Status not  IN ('Wx','W','FH','NH')  then 1 else 0 END AS Woff_Present

from TRANSAttendance a
left  join Emp_Master b on b.EmpCode =a.EmpCode 
 left join category_master as c on c.CatCode  =b.CatCode 
left join Deptmaster as d on d.DeptCode =b.Deptcode  
left join designation as e on e.DesgnCode  =b.DesgnCode
left join shift_master as f on f.shiftid  =a.shiftid 
left join statusMaster as g on g.code  =a.Status 


  
where a.SDate between @Fdate and @Tdate      
--and b.Location_Code ='spinning'
 and b.EmpName  <> 'NONE'
and g.STATUSNAME<>'' 
 --and month( a.SDate)<>'4'
--or (ResignDate <>'1900-01-01' and  ResignDate > @fdate))  
 --AND (B.resigndate='1900-01-01' or (b.resigndate<>'1900-01-01' and b.ResignDate<=@Tdate) and a.SDate<=b.ResignDate)
  and ( b.ResignDate ='1900-01-01' or (b.ResignDate<>'1900-01-01'   and b.ResignDate >=@Fdate ))
  and b.DOJ<= @Tdate    
 
   
 ) p
 
 group by  p.empcode,p.catname,p.DesgnName ,p.Status,p.Empname,p.sex,p.WeeklyOff,p.Months,p.years,p.Deptname,p.deptcode  
  ,p.DOJ,P.CatCode ,p.SHIFT ,p.Empid
  ,LateMins,EarlyMins,OT_Mts
 ,p.FingerId ,p.wpday
  ) x
group by    x.empcode,x.catname,x.DesgnName ,x.Empname,x.sex,x.WeeklyOff,x.Deptname,x.deptcode
,  x.doj,X.CATCODE,x.years,x.Months,x.Empid,x.FingerId 
,x.wpday
 

--ORDER BY x.Deptname,x.empcode,x.years,x.Months

)





