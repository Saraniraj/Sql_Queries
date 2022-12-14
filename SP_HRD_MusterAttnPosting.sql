USE PowerERP_ACV
GO
/****** Object:  StoredProcedure [dbo].[SP_HRD_AttnPosting]    Script Date: 14/12/2022 15:05:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
                      
                      
--  exec [SP_HRD_MusterAttnPosting] '100', '2022-11-30'   ,'ADMIN'                          
   --VADAPUDUPATTI                           
alter PROC   [dbo].[SP_HRD_MusterAttnPosting]         
(        
@Comp_Code  Varchar(10),            
@Sdate  datetime ,        
@User_Code  Varchar(15)         
         
)                                                                       
as                                                       
Declare @iServerDate Varchar(19)                            
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))             
                                              
--DECLARE @SDATE AS DATETIME                                                                  
--SET @SDATE='2014-06-24'                                                                 
 

                       
TRUNCATE TABLE Temp_MusterAttendance                      
                                               
declare emp cursor for                                   
select empcode from SalStoreTable_Muster WHERE sdate=@SDATE 
and catcode in (1,2)
--and EmpCode in (select EmpCode from Emp_Master where Catcode in (select Catcode from Category_Master where CatName in (select code1 from SelectionTable)))                    
                     
open emp                                                                  
declare @empcode as varchar(50)                                                                  
fetch emp into @empcode                                                                  
while @@fetch_status=0                                                                  
begin   

Declare @Shift as Varchar(10) 
set @Shift=0 
 
 
declare @Weekoff as varchar(50) 
DECLARE @Present  as INT  
DECLARE @Leave  as INT  
DECLARE @Absent  as INT  
declare @StartDate      date
declare @EndDate        date
declare @OverallEndDate	date
declare @PrintStart     varchar(10)
declare @PrintEnd       varchar(10)

--	Set the start date and overall end date
--	Set the end date to 7 days after the start date
set @OverallEndDate = '2022-11-30'
set @StartDate = '2022-11-01'
set @EndDate = dateadd( dd,1 ,@startDate)

-- select Empcode,SDate ,Present,Absent,Leave,WeeklyOff ,NH,FH ,TotalDays   
-- FROM [LS_HRD_B].[dbo].[SalStoreTable_Muster] 
--where Empcode=@empcode and SDate =@Sdate

select   @Weekoff =a.weeklyoff from emp_master a  where EmpCode=@empcode      
select   @Present =a.Present from SalStoreTable_Muster a  where EmpCode=@empcode and SDate =@Sdate
select   @Leave =a.leave from SalStoreTable_Muster a  where EmpCode=@empcode and SDate =@Sdate  
select   @Absent =a.absent from SalStoreTable_Muster a  where EmpCode=@empcode and SDate =@Sdate




--	Loop while the start date is less than the overall end date
while(@OverallEndDate >= @StartDate)
begin

select top 1 @Shift =b.shiftid from HRD_EmpShiftMatch a,Shift_Master b where a.id=b.shiftcode and a.empcode=@empcode       

insert into Temp_MusterAttendance
select  b.shiftid,@StartDate as sdate ,@empcode as Empcode,b.StartTime ,b.EndTime ,b.PunchStartFrom ,b.PunchStartTo 
,b.PunchEndFrom ,b.PunchEndTo 
,case when b.ShiftId<>2 then ROUND(((10 - 1 -1) * RAND() + 1), 0) else ROUND(((6 - 1 -1) * RAND() + 1), 0) end  as  inRand
,case when b.ShiftId<>2 then ROUND(((10 - 1 -1) * RAND() + 1), 0) else ROUND(((6 - 1 -1) * RAND() + 1), 0) end  as  OutRand
,'1900-01-01 00:00:00.000' as INTIME
,'1900-01-01 00:00:00.000' as OutTIME
,'W' as Status,1 as DayValue,'Muster' as ETYPE 
,@Weekoff
--,upper(left(datename(w,@rdate),3)) 
from HRD_EmpShiftMatch a,Shift_Master b where a.id=b.shiftcode and a.empcode=@empcode
and b.ShiftId =@Shift
and    upper(@Weekoff )=upper(left(datename(w,@StartDate),3)) 
and Empcode not in (Select EmpCode from Temp_MusterAttendance where sDate=@StartDate) 
group by b.shiftid, b.StartTime ,b.EndTime ,b.PunchStartFrom ,b.PunchStartTo ,b.PunchEndFrom ,b.PunchEndTo 
  
--select @StartDate 
  
insert into Temp_MusterAttendance
select  b.shiftid,@StartDate as sdate ,@empcode as Empcode,b.StartTime ,b.EndTime ,b.PunchStartFrom ,b.PunchStartTo 
,b.PunchEndFrom ,b.PunchEndTo 
,case when b.ShiftId<>2 then ROUND(((10 - 1 -1) * RAND() + 1), 0) else ROUND(((6 - 1 -1) * RAND() + 1), 0) end  as  inRand
,case when b.ShiftId<>2 then ROUND(((10 - 1 -1) * RAND() + 1), 0) else ROUND(((6 - 1 -1) * RAND() + 1), 0) end  as  OutRand

, cast(cast(   @StartDate  as date) as varchar(30))+' '+CAST(DATEADD(minute,ROUND(((10 - 1 -1) * RAND() + 1), 0),b.StartTime) AS DATETIME)  as INTIME 
, cast(cast(   @StartDate  as date) as varchar(30))+' '+CAST(DATEADD(minute,ROUND(((10 - 1 -1) * RAND() + 1), 0),b.EndTime) AS DATETIME)   as Outtime

--,cast(@StartDate AS DATE) +' '+  CAST(DATEADD(minute,ROUND(((10 - 1 -1) * RAND() + 1), 0),b.StartTime) AS DATETIME) as INTIME
--,cast(@StartDate AS DATE)  

--+' '+  CAST(DATEADD(minute,ROUND(((10 - 1 -1) * RAND() + 1), 0),b.StartTime) AS DATETIME) as Outtime

--,@StartDate + DATEADD(minute,ROUND(((10 - 1 -1) * RAND() + 1), 0),b.StartTime) as INTIME
--,@StartDate +  DATEADD(minute,ROUND(((6 - 1 -1) * RAND() + 1), 0),b.EndTime) as OutTIME

,'X' as Status,1 as DayValue,'Muster' as ETYPE 
,@Weekoff
--,upper(left(datename(w,@rdate),3)) 
from HRD_EmpShiftMatch a,Shift_Master b where a.id=b.shiftcode and a.empcode=@empcode
and b.ShiftId =@Shift
and    upper(@Weekoff )<>upper(left(datename(w,@StartDate),3)) 
and Empcode not in (Select EmpCode from Temp_MusterAttendance where sDate=@StartDate) 
group by b.shiftid, b.StartTime ,b.EndTime ,b.PunchStartFrom ,b.PunchStartTo ,b.PunchEndFrom ,b.PunchEndTo 



 

--     Increment the weeks
set @StartDate = @EndDate
set @EndDate = dateadd( dd,1 ,@startDate)

end
            
			
UPDATE Temp_MusterAttendance    
SET
status=B.status
,intime=b.intime
,OUTTIME =B.OUTTIME 
FROM  Temp_MusterAttendance  AS a
INNER JOIN  TRANSAttendance  AS B
ON a.Empcode   = B.Empcode   and a.SDate  =B.SDate   
and B.Status  in ('L'  ,'A')
where a.Empcode =@empcode


fetch emp into @empcode                                                                  
end                                                                  
close emp                                                                  
deallocate emp


select *  FROM [Temp_MusterAttendance]   order by sdate 