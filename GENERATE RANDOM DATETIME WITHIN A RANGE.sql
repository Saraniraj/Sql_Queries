-------GENERATE RANDOM DATETIME WITHIN A RANGE

DECLARE @DateFrom DATETime = '2022-11-01'
DECLARE @DateTo DATETIME = '2022-11-30'
DECLARE @DaysRandom Int= 0
DECLARE @MillisRandom Int=0
 
--get random number of days
 
select @DaysRandom= DATEDIFF(day,@DateFrom,@DateTo)
SELECT @DaysRandom = ROUND(((@DaysRandom -1) * RAND()), 0)
 
--get random millis
SELECT @MillisRandom = ROUND(((99999999) * RAND()), 0)
 
SELECT @DateTo = DATEADD(day, @DaysRandom, @DateFrom)
SELECT @DateTo = DATEADD(MILLISECOND, @MillisRandom, @DateTo)
SELECT @DateTo