select Empcode,SDate ,Present,Absent,Leave,WeeklyOff ,NH,FH ,TotalDays    FROM [LS_HRD_B].[dbo].[SalStoreTable] 
where Empcode='br620' and SDate ='2022-11-30'




truncate table Temp_MusterAttendance   
Declare @Shift as Varchar(10) 
set @Shift=0 
declare @empcode as varchar(50) 
set @empcode='br620'
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

select   @Weekoff =a.weeklyoff from emp_master a  where EmpCode=@empcode      
select   @Present =a.Present from SalStoreTable a  where EmpCode=@empcode and SDate ='2022-11-30'  
select   @Leave =a.leave from SalStoreTable a  where EmpCode=@empcode and SDate ='2022-11-30'  
select   @Absent =a.absent from SalStoreTable a  where EmpCode=@empcode and SDate ='2022-11-30'  

--	Loop while the start date is less than the overall end date
while(@OverallEndDate >= @StartDate)
begin
 

 
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
from empShiftmatch a,Shift_Master b where a.id=b.shiftcode and a.empcode=@empcode
and    upper(@Weekoff )=upper(left(datename(w,@StartDate),3)) 
and Empcode not in (Select EmpCode from Temp_MusterAttendance where sDate=@StartDate) 

  
 --select @StartDate 
  
 insert into Temp_MusterAttendance
select  b.shiftid,@StartDate as sdate ,@empcode as Empcode,b.StartTime ,b.EndTime ,b.PunchStartFrom ,b.PunchStartTo 
,b.PunchEndFrom ,b.PunchEndTo 
,case when b.ShiftId<>2 then ROUND(((10 - 1 -1) * RAND() + 1), 0) else ROUND(((6 - 1 -1) * RAND() + 1), 0) end  as  inRand
,case when b.ShiftId<>2 then ROUND(((10 - 1 -1) * RAND() + 1), 0) else ROUND(((6 - 1 -1) * RAND() + 1), 0) end  as  OutRand



,@StartDate + DATEADD(minute,ROUND(((10 - 1 -1) * RAND() + 1), 0),b.StartTime) as INTIME
,@StartDate +  DATEADD(minute,ROUND(((6 - 1 -1) * RAND() + 1), 0),b.PunchEndFrom) as OutTIME

,'X' as Status,1 as DayValue,'Muster' as ETYPE 
,@Weekoff
--,upper(left(datename(w,@rdate),3)) 
from empShiftmatch a,Shift_Master b where a.id=b.shiftcode and a.empcode=@empcode
and    upper(@Weekoff )<>upper(left(datename(w,@StartDate),3)) 
and Empcode not in (Select EmpCode from Temp_MusterAttendance where sDate=@StartDate) 

 --select @startLoopID ;
 --SET @startLoopID = @startLoopID+1  ;                   


        ----     Print the working weeks
        --set @PrintStart = CONVERT( varchar(10),@StartDate, 120)
        --set @PrintEnd = CONVERT( varchar(10),@EndDate, 120)
        --raiserror('Working on %s to %s' ,10, 1,@PrintStart ,@PrintEnd)
 

        --     Increment the weeks
        set @StartDate = @EndDate
        set @EndDate = dateadd( dd,1 ,@startDate)

end
raiserror('Finished!' ,10, 1)


declare @FromDate date = '2022-11-01'
declare @ToDate date = '2022-11-30'
DECLARE @startLoopID INT = 1
DECLARE @endLoopID INT = 26 -- Rows you want to add
 DECLARE @rdate DATE
 

WHILE @startLoopID <= @endLoopID-1
BEGIN




SET @rdate =   dateadd(day,  rand(checksum(newid()))*(1+datediff(day, @FromDate, @ToDate)),  @FromDate)

 
 
select  b.shiftid,@rdate as sdate ,@empcode as Empcode,b.StartTime ,b.EndTime ,b.PunchStartFrom ,b.PunchStartTo 
,b.PunchEndFrom ,b.PunchEndTo 
,case when b.ShiftId<>2 then ROUND(((10 - 1 -1) * RAND() + 1), 0) else ROUND(((6 - 1 -1) * RAND() + 1), 0) end  as  inRand
,case when b.ShiftId<>2 then ROUND(((10 - 1 -1) * RAND() + 1), 0) else ROUND(((6 - 1 -1) * RAND() + 1), 0) end  as  OutRand

,DATEADD(minute,ROUND(((10 - 1 -1) * RAND() + 1), 0),b.StartTime) as INTIME
,DATEADD(minute,ROUND(((6 - 1 -1) * RAND() + 1), 0),b.PunchEndFrom) as OutTIME
,'X' as Status,1 as DayValue,'Muster' as ETYPE 
,@Weekoff
,upper(left(datename(w,@rdate),3)) 
from empShiftmatch a,Shift_Master b where a.id=b.shiftcode and a.empcode=@empcode
and    upper(@Weekoff )<>upper(left(datename(w,@rdate),3)) 
and Empcode not in (Select EmpCode from Temp_MusterAttendance where sDate=@rdate) 
 select @startLoopID ;
 SET @startLoopID = @startLoopID+1  ;                   

   
END






























----select * FROM [LS_HRD_B].[dbo].[TRANSAttendance]
----where  Empcode='br620'
----and SDate ='2022-12-11'

----SELECT * FROM tmpAttnlog
----SELECT * FROM TMPauditreport

----SELECT * FROM tmpINOUT
----select top 1 b.shiftid from empShiftmatch a,Shift_Master b where a.id=b.shiftcode and a.empcode='br620'


----Declare @Shift as Varchar(10) 
----declare @InTime as datetime   
----select top 1 b.shiftid from empShiftmatch a,Shift_Master b where a.id=b.shiftcode and a.empcode='br620'
----and @InTime between case when InStartPDay='true' then dateadd(d,-1,'2022-12-11')+ ' '+PunchStartFrom else  '2022-12-11'+ ' '+PunchStartFrom  end                    
----and case when StartNDay='true' then dateadd(hh,2,dateadd(d,1,'2022-12-11')+ ' '+StartTime) else  dateadd(hh,2,'2022-12-11'+ ' '+StartTime)  end  


----DECLARE @StartDate AS date;
----DECLARE @EndDate AS date;

----SELECT @StartDate = '2022-11-01', -- Date Format - DD/MM/YYY
----       @EndDate   = '2022-11-30';

----SELECT DATEADD(DAY, RAND(CHECKSUM(NEWID()))*(1+DATEDIFF(DAY, @StartDate, @EndDate)),@StartDate) AS 'SalesDate';


----declare @FromDate date = '2022-11-01'
----declare @ToDate date = '2022-12-31'

----select dateadd(day,  rand(checksum(newid()))*(1+datediff(day, @FromDate, @ToDate)),  @FromDate)

--truncate table Temp_MusterAttendance   
--Declare @Shift as Varchar(10) 
--set @Shift=0 
--declare @empcode as varchar(50) 
--set @empcode='br620'
--declare @Weekoff as varchar(50) 
--DECLARE @Present  as INT    


--select   @Weekoff =a.weeklyoff from emp_master a  where EmpCode=@empcode      
--select   @Present =a.Present from SalStoreTable a  where EmpCode=@empcode and SDate ='2022-11-30'                    

 


--declare @StartTime as datetime
--declare @endTime as datetime
--declare @InTime as datetime
--declare @OutTime as datetime
--DECLARE @ChkInStart AS DATETIME
--DECLARE @ChkInEnd AS DATETIME
--DECLARE @ChkOutStart AS DATETIME
--DECLARE @ChkOutEnd AS DATETIME 

--DECLARE @rdate DATE
--declare @FromDate date = '2022-11-01'
--declare @ToDate date = '2022-11-30'
--DECLARE @startLoopID INT = 1
--DECLARE @endLoopID INT = 26 -- Rows you want to add
--declare @EndDate        date
--set @EndDate = dateadd( dd,1 ,@FromDate)
--declare @PrintStart     varchar(10)
--declare @PrintEnd       varchar(10)

--while(@ToDate > @FromDate)
--begin

----exec [SP_HRDAttnPosting] '100','MAIN UNIT', @FromDate,'','ADMIN','1'     
 
    
     
--        --     Increment the weeks
--        set @FromDate = @ToDate
--        set @EndDate = dateadd( dd,1 ,@FromDate)

--		    set @PrintStart = CONVERT( varchar(10),@FromDate, 120)
--        set @PrintEnd = CONVERT( varchar(10),@EndDate, 120)
--        raiserror('Working on %s to %s' ,10, 1,@PrintStart ,@PrintEnd)

--end










----WHILE @startLoopID <= @endLoopID-1
----BEGIN




----SET @rdate =   dateadd(day,  rand(checksum(newid()))*(1+datediff(day, @FromDate, @ToDate)),  @FromDate)



--insert into Temp_MusterAttendance
--select  b.shiftid,@StartDate as sdate ,@empcode as Empcode,b.StartTime ,b.EndTime ,b.PunchStartFrom ,b.PunchStartTo 
--,b.PunchEndFrom ,b.PunchEndTo 
--,case when b.ShiftId<>2 then ROUND(((10 - 1 -1) * RAND() + 1), 0) else ROUND(((6 - 1 -1) * RAND() + 1), 0) end  as  inRand
--,case when b.ShiftId<>2 then ROUND(((10 - 1 -1) * RAND() + 1), 0) else ROUND(((6 - 1 -1) * RAND() + 1), 0) end  as  OutRand
--,'1900-01-01 09:06:00.000' as INTIME
--,'1900-01-01 09:06:00.000' as OutTIME
--,'W' as Status,1 as DayValue,'Muster' as ETYPE 
--,@Weekoff
----,upper(left(datename(w,@rdate),3)) 
--from empShiftmatch a,Shift_Master b where a.id=b.shiftcode and a.empcode=@empcode
--and    upper(@Weekoff )=upper(left(datename(w,@rdate),3)) 
--and Empcode not in (Select EmpCode from Temp_MusterAttendance where sDate=@rdate) 

  
 
-- insert into Temp_MusterAttendance
--select  b.shiftid,@rdate as sdate ,@empcode as Empcode,b.StartTime ,b.EndTime ,b.PunchStartFrom ,b.PunchStartTo 
--,b.PunchEndFrom ,b.PunchEndTo 
--,case when b.ShiftId<>2 then ROUND(((10 - 1 -1) * RAND() + 1), 0) else ROUND(((6 - 1 -1) * RAND() + 1), 0) end  as  inRand
--,case when b.ShiftId<>2 then ROUND(((10 - 1 -1) * RAND() + 1), 0) else ROUND(((6 - 1 -1) * RAND() + 1), 0) end  as  OutRand

--,DATEADD(minute,ROUND(((10 - 1 -1) * RAND() + 1), 0),b.StartTime) as INTIME
--,DATEADD(minute,ROUND(((6 - 1 -1) * RAND() + 1), 0),b.PunchEndFrom) as OutTIME
--,'X' as Status,1 as DayValue,'Muster' as ETYPE 
--,@Weekoff
----,upper(left(datename(w,@rdate),3)) 
--from empShiftmatch a,Shift_Master b where a.id=b.shiftcode and a.empcode=@empcode
--and    upper(@Weekoff )<>upper(left(datename(w,@rdate),3)) 
--and Empcode not in (Select EmpCode from Temp_MusterAttendance where sDate=@rdate) 
-- select @startLoopID ;
-- SET @startLoopID = @startLoopID+1  ;                   

   
----END
 
select *  FROM [LS_HRD_B].[dbo].[Temp_MusterAttendance]   order by sdate 
















