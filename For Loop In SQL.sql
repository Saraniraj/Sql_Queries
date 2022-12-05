

declare @StartDate      date
declare @EndDate        date
declare @OverallEndDate	date
declare @PrintStart     varchar(10)
declare @PrintEnd       varchar(10)

--	Set the start date and overall end date
--	Set the end date to 7 days after the start date
set @OverallEndDate = '2022-11-20'
set @StartDate = '2022-11-01'
set @EndDate = dateadd( dd,1 ,@startDate)

--	Loop while the start date is less than the overall end date
while(@OverallEndDate > @StartDate)
begin
exec [SP_HRDAttnPosting] '100','MAIN UNIT', @StartDate,'','ADMIN','1'     
 
 
--exec P_AuditINOUT  @StartDate
  --exec [SP_HRDAttnPosting] '100','VADAPUDUPATTI', @StartDate,'','ADMIN','1'    

        --     Print the working weeks
        set @PrintStart = CONVERT( varchar(10),@StartDate, 120)
        set @PrintEnd = CONVERT( varchar(10),@EndDate, 120)
        raiserror('Working on %s to %s' ,10, 1,@PrintStart ,@PrintEnd)

        --     Do something here
		--	select  [SalesOrderID]
		--	from	[Sales].[SalesOrderHeader]
		--	where	[OrderDate] >= @StartDate
		--	and		[OrderDate] < @EndDate

        --     Increment the weeks
        set @StartDate = @EndDate
        set @EndDate = dateadd( dd,1 ,@startDate)

end
raiserror('Finished!' ,10, 1)