select DATEADD(MONTH, DATEDIFF(MONTH, 0, '2022-06-13')-1, 0) --First day of previous month
select DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-1, -1)
select DATEADD(day, DATEDIFF(DAY , 0, '2022-06-13')-1, 0) -- previous day


select DATEADD(MONTH, DATEDIFF(MONTH, 0, '2022-06-13')-0, 0) --First day of Current month
select DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-0, -1)