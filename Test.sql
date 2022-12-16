select    

empid	,empcode,	FingerId	,Empname, Present,	ABLV,	woff,	NHFH,	Woff_Psent,	WeeklyOff
 
from [Fun_AttnMusterAbstract]  ('theni','2022-11-01','2022-11-30')     order by catname

select empcode,Actual_Present ,Actual_Absent 
,Present	,Absent,	Leave,	Holiday,	WeeklyOff,	TotalDays,Weekoff_Day
,No_Of_Woff,catcode
from SalStoreTable_Muster where SDate ='2022-11-30' 
order by empid
--Select * from Temp_MusterAttendance


select empcode 
,Present	,Absent,	Leave,	  	WeeklyOff,	TotalDays,Weekoff_Day
,No_Of_Woff
from SalStoreTable  where SDate ='2022-11-30' 

--with [dates] as (
--select  convert(date , '2022-11-01'  ) as [date] --start
--union all
--select   dateadd(day , 1 , [date]) 
--from [dates]
--where [date] < '2022-11-30' )


--Update Temp_MusterAttendance set Week_off =(
--Select   count(X.WeekDayNumber) as NumberOfDays 
--from (
--SELECT [date] , DATEPART(weekday,[date] ) as WeekDayNumber, DATENAME(weekday, [date])as ss
--from [dates]
--WHERE [date] IS NOT NULL   )X
-- where ss=Week_off 
--Group  by X.WeekDayNumber,ss )




--select upper(left(datename(dw,'2022-11-30'),3)) 
--select datename(dw, '2022-11-30') 
--select upper(left(datename(dw, @StartDate)))

 