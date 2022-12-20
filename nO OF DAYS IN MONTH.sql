DECLARE @tmpDate as date
set @tmpDate  = '2022-08-31'; --you can add any date
DECLARE @Startdate as varchar( 8)
DECLARE @Enddate as varchar( 8)
SELECT @Startdate = replace(convert(varchar,cast(DATEADD(month, DATEDIFF(month, 0, @tmpDate), 0) as date) , 111), '/', '');
SELECT @Enddate =  replace(convert(varchar, cast(DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,@tmpDate)+1,0)) as date), 111), '/', '');

with [dates] as (
    select  convert(date , @Startdate  ) as [date] --start
    union all
    select   dateadd(day , 1 , [date]) 
    from [dates]
    where [date] < @Enddate )
Select X.WeekDayNumber, count(X.WeekDayNumber) as NumberOfDays,ss
from (
SELECT [date] , DATEPART(weekday,[date] ) as WeekDayNumber, DATENAME(weekday, [date])as ss
from [dates]
WHERE [date] IS NOT NULL  and  DATENAME(weekday, [date])='Sunday')X
Group  by X.WeekDayNumber,ss
--option (maxrecursion 0 )