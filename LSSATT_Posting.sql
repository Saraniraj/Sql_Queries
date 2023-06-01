USE [LS_HRD_B]
GO
/****** Object:  StoredProcedure [dbo].[SP_HRD_AttnPosting]  Script Date: 07-05-2022 10:46:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec [SP_HRD_AttnPosting] 'LS SPIN', '2022-01-23' ,'ADMIN'  
							  
ALTER PROC [dbo].[SP_HRD_AttnPosting]
( 
@Comp_Code  Varchar(10), 
@Sdate  datetime , 
@User_Code  Varchar(15)H
		 
)
as 
Declare @iServerDate Varchar(19) 
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))

--DECLARE @SDATE AS DATETIME 
--SET @SDATE='2014-06-24'

delete from TransAttendance where sdate=@Sdate  and EType='DOWNLOAD'
 
--and EmpCode in (select EmpCode from Emp_Master where Catcode in (select Catcode from Category_Master where CatName in (select code1 from SelectionTable)))

INSERT INTO  LS_Attnlog..Attnlog
SELECT
[employeeID]  as Fid 
,authDate as sdate 
,convert(varchar(10),authDateTime, 108)  as stime 
,case when deviceName ='IN' then 1  when deviceName ='OUT' then 2 else '0' end as  inout1
,case when deviceName ='IN' then 1  when deviceName ='OUT' then 2 else '0' end as  inout 
,case when deviceName ='IN' then 1  when deviceName ='OUT' then 2 else '0' end as  mcid  
,[authDateTime] as Sdatetime 
,'' as Empcode ,'Face-New' as STATUS
,employeeID+' - '+FORMAT (authDateTime, 'yyyy-MM-dd hh:mm:ss tt')  +' - '+deviceName as IDTXT
,'NONE' as fhey,'LS' as Unit
FROM [ivms_face].[dbo].[attlog]as t1
WHERE NOT EXISTS(SELECT stime FROM LS_Attnlog..Attnlog  t2 WHERE
t2.sdate  =t1.authDate  and t2.Fid =t1.employeeID and t2.Sdatetime=t1.authDateTime )  
and t1.authDate between @Sdate and dateadd(d,1,@Sdate)  

TRUNCATE TABLE TMPTRANSAT  

INSERT INTO tmpTransAt  
SELECT * FROM TRANSAttendance WHERE SDate BETWEEN DATEADD(DAY,-1,@SDATE) AND DATEADD(DAY,1,@SDATE)  
--and EmpCode in (select EmpCode from Emp_Master where Catcode in (select Catcode from Category_Master where CatName in (select code1 from SelectionTable)))

UPDATE LS_Attnlog..Attnlog SET Empcode=ISNULL((Select top 1 Empcode FROM Emp_Master A WHERE (a.ResignDate = '1900-01-01 00:00:00.000' or (a.resigndate<>'1900-01-01' and a.Resigndate>@Sdate) ) and A.FingerId =LS_Attnlog..Attnlog.Fid),'0'), inout=mcid ,inout1=mcid  WHERE  sdate=@SDATE  
and Fid in (Select FingerId  from Emp_Master)  
--UPDATE LS_Attnlog..Attnlog SET Empcode=ISNULL((Select Empcode FROM Emp_Master A WHERE A.FingerId =LS_Attnlog..Attnlog.Fid),'0') WHERE Empcode='0' AND sdate=DATEADD(DAY,1,@SDATE) 

--delete from TransAttendance where sdate=DATEADD(DAY,1,@Sdate) and EType='DOWNLOAD' 

truncate table tmpINOUT 
truncate table tmpAttnLog 
insert into tmpAttnlog 
select * from LS_Attnlog..AttnLog where Sdate between @Sdate and dateadd(d,1,@Sdate) 

declare emp cursor for
select empcode from emp_master WHERE RESIGNDATE='1900-01-01 00:00:00.000' OR (RESIGNDATE<>'1900-01-01 00:00:00.000' AND RESIGNDATE>@SDATE) 

--and EmpCode in (select EmpCode from Emp_Master where Catcode in (select Catcode from Category_Master where CatName in (select code1 from SelectionTable)))

open emp 
declare @empcode as varchar(50) 
fetch emp into @empcode 
while @@fetch_status=0 
begin

DECLARE @ChkInStart AS DATETIME 
DECLARE @ChkInEnd AS DATETIME 
DECLARE @ChkOutStart AS DATETIME 
DECLARE @ChkOutEnd AS DATETIME 
Declare @Shift as Varchar(10)
declare @InTime as datetime  
declare @OutTime as datetime
declare @InId as varchar(1500) 
declare @outId as varchar(1500) 
SET @InId='-' 
SET @OUTID='-'
SET @InTime='1900-01-01' 
SET @OutTime='1900-01-01' 
set @Shift=0 
declare @LaunchInTime as datetime
declare @LaunchOutTime as datetime
declare @LaunchstartOutTime as datetime  
declare @LaunchendInTime as datetime
declare @LaunchentinTimestart as datetime
declare @LAUNCHInId as varchar(1500)
declare @launchoutId as varchar(1500)
SET @ChkInStart =@SDATE +'04:00:00 AM'  

--select @ChkInEnd=max(case when InEndNxtDay=1 then dateadd(d,1,@sdate) +' '+PunchStartTo else @sdate +' '+PunchStartTo end) from Shift_Master 
--WHERE  shiftcode in (select shiftgroup from Emp_Master where EmpCode=@empcode)  
set @ChkInEnd =DATEADD(DAY,1,@Sdate) + '01:00:00 AM'

select @InTime=isnull(min(SDatetime),'1900-01-01 12:00:00 PM') from tmpAttnLog where empcode=@empcode and sdatetime between @ChkInStart and @ChkInEnd and inout=1 
AND idtxt not in (select Inid from tmpTransAt where sdate<@Sdate and tmpTransAt.empcode=tmpAttnLog.empcode) 

declare @nextIn as datetime
if @InTime<>'1900-01-01 12:00:00 PM'
select @nextIn=isnull(min(SDatetime),'1900-01-01 12:00:00 PM') from tmpAttnLog where empcode=@empcode and sdatetime > @InTime and inout=1
else
set @nextIn='1900-01-01 12:00:00 PM'

select @InId=isnull(IDTxt,'-') from tmpAttnLog where empcode=@empcode and sdatetime =@InTime 

if @inTime='1900-01-01 12:00:00 PM'  
begin  
set @ChkOutStart=@Sdate +' '+'01:00:01 PM'
set @ChkOutEnd=dateadd(hh,20,@ChkOutStart) 
end
else  
Begin  
set @ChkOutStart=dateadd(hh,4,@InTime) 
set @ChkOutEnd=dateadd(hh,18,@INTime) 
end  
if @nextIn <>'1900-01-01 12:00:00 PM' 
select @OutTime=isnull(MAX(SDatetime),'1900-01-01 12:00:00 PM') from tmpAttnLog where empcode=@empcode and sdatetime between @ChkOutStart and @ChkOutEnd  
and inout=2 
--and idTxt not in (select OutId from tmpTransAt where sdate<@Sdate and tmpTransAt.empcode=tmpAttnLog.empcode)  
--- and Sdatetime < @nextIn  
else
select @OutTime=isnull(MAX(SDatetime),'1900-01-01 12:00:00 PM') from tmpAttnLog where empcode=@empcode and sdatetime between @ChkOutStart and @ChkOutEnd 
and inout=2  
select @outId=isnull(IDTxt,'-') from tmpAttnLog where empcode=@empcode and sdatetime =@OutTime  
select top 1 @Shift =b.shiftid from empShiftmatch a,Shift_Master b where a.id=b.shiftcode and a.empcode=@empcode
and @InTime between case when InStartPDay='true' then dateadd(d,-1,@Sdate)+ ' '+PunchStartFrom else  @Sdate+ ' '+PunchStartFrom  end
and case when StartNDay='true' then dateadd(hh,2,dateadd(d,1,@Sdate)+ ' '+StartTime) else  dateadd(hh,2,@Sdate+ ' '+StartTime)  end

insert into tmpINOUT 
select @empcode Empcode,@InTime InTime,@OutTime OutTime,@Shift Shift,DATEDIFF(mi,@Intime,@outtime) TotlaMins
,case when DATEDIFF(mi,@Intime,@outtime)-480>0 then DATEDIFF(mi,@Intime,@outtime)-480 else 0 end OTMins,@InId,@OUTId  
,@LaunchOutTime,@LaunchInTime,@launchoutId,@LAUNCHInId 
fetch emp into @empcode 
end 
close emp 
deallocate emp 

UPDATE TMPINOUT SET TOTALMINS=0,OTMINS=0 WHERE TOTALMINS>3000 
UPDATE TMPINOUT SET TOTALMINS=0,OTMINS=0 WHERE TOTALMINS<0

--ablvtable posting 
select * from tmpINOUT
--PRESENT 

INSERT INTO transAttendance 
select @SDATE,EMPCODE,@Comp_Code,SHIFT,0,'X',1,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID
,0,0,0,0
,0,'false',''  
,@User_Code,@iServerDate,@User_Code,@iServerDate 
from tmpINOUT
where intime<>'1900-01-01 12:00:00.000' and outtime<>'1900-01-01 12:00:00.000' and 
TotalMins>=480 and  
empcode not in (Select empcode from emp_master where upper(weeklyoff) =upper(left(datename(w,@Sdate),3))) 
and Empcode not in (Select EmpCode from TransAttendance where sDate=@Sdate)  

----------Weekoff present
INSERT INTO transAttendance 
select @SDATE,EMPCODE,@Comp_Code,SHIFT,0,'Wx',1,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID
,0,0,0,0

,0,'false',''  
,@User_Code,@iServerDate,@User_Code,@iServerDate 
from tmpINOUT  
	  
where (intime<>'1900-01-01 12:00:00.000' or outtime<>'1900-01-01 12:00:00.000') 
and empcode in (Select empcode from emp_master where upper(weeklyoff) =upper(left(datename(w,@Sdate),3)))
and Empcode not in (Select EmpCode from TransAttendance where sDate=@Sdate)

-----------Weekoff

INSERT INTO transAttendance 
select @SDATE,EMPCODE,@Comp_Code,SHIFT,0,'W',1,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID
,0,0,0,0

,0,'false',''  
,@User_Code,@iServerDate,@User_Code,@iServerDate 
from tmpINOUT  
where 
empcode in (Select empcode from emp_master where upper(weeklyoff) =upper(left(datename(w,@Sdate),3))) 
and Empcode not in (Select EmpCode from TransAttendance where sDate=@Sdate) 

--absent  
--select * from Category_Master
INSERT INTO transAttendance 
select @SDATE,EMPCODE,@Comp_Code,SHIFT,0,'A',1,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID
,0,0,0,0
,0,'false' ,''
,@User_Code,@iServerDate,@User_Code,@iServerDate 
from tmpINOUT  
where intime='1900-01-01 12:00:00.000' and outtime='1900-01-01 12:00:00.000' 
and Empcode not in (Select EmpCode from TransAttendance where sDate=@Sdate) 
and Empcode in (Select Empcode from Emp_Master where catcode not in (1,2,8))  

--LEAVE  
INSERT INTO transAttendance 
select @SDATE,EMPCODE,@Comp_Code,SHIFT,0,'L',1,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID
,0,0,0,0
,0,'false',''  
,@User_Code,@iServerDate,@User_Code,@iServerDate 
from tmpINOUT  
where intime='1900-01-01 12:00:00.000' and outtime='1900-01-01 12:00:00.000'  
and Empcode not in (Select EmpCode from TransAttendance where sDate=@Sdate) 
and Empcode in (Select Empcode from Emp_Master where catcode in (1,2,8))  

--HALF PRESENT 
INSERT INTO transAttendance 
select @SDATE,EMPCODE,@Comp_Code,SHIFT,0,'/L',0.5,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID
,0,0,0,0
,0,'false' ,'' 
,@User_Code,@iServerDate,@User_Code,@iServerDate 
from tmpINOUT  
where intime<>'1900-01-01 12:00:00.000' and outtime<>'1900-01-01 12:00:00.000'
and TotalMins<480 AND TOTALMins>=240 
and Empcode not in (Select EmpCode from transAttendAnce where sDate=@Sdate)
and Empcode in (Select Empcode from Emp_Master where catcode in (1,2,8))
--HALF PRESENT 
INSERT INTO transAttendance 
select @SDATE,EMPCODE,@Comp_Code,SHIFT,0,'/',0.5,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID
,0,0,0,0
,0,'false',''  
,@User_Code,@iServerDate,@User_Code,@iServerDate 
from tmpINOUT  
where intime<>'1900-01-01 12:00:00.000' and outtime<>'1900-01-01 12:00:00.000' and TotalMins<480 AND TOTALMins>=240 
and Empcode not in (Select EmpCode from transAttendAnce where sDate=@Sdate)  
and Empcode in (Select Empcode from Emp_Master where catcode not in (1,2,8)) 

--EXPECTION 
INSERT INTO transAttendance 
select @SDATE,EMPCODE,@Comp_Code,SHIFT,0,'/',0.5,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID
,0,0,0,0
,0,'false',''  
,@User_Code,@iServerDate,@User_Code,@iServerDate 
from tmpINOUT  
where (intime='1900-01-01 12:00:00.000' OR outtime='1900-01-01 12:00:00.000') and TotalMins<240 
and Empcode not in (Select EmpCode from transAttendAnce where sDate=@Sdate)  
and Empcode in (Select Empcode from Emp_Master where catcode not in (1,2,8))  

INSERT INTO transAttendance 
select @SDATE,EMPCODE,@Comp_Code,SHIFT,0,'/L',0.5,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID
,0,0,0,0
,0,'false' ,'' 
,@User_Code,@iServerDate,@User_Code,@iServerDate 
from tmpINOUT  
where (intime='1900-01-01 12:00:00.000' OR outtime='1900-01-01 12:00:00.000') and TotalMins<240 
and Empcode not in (Select EmpCode from transAttendAnce where sDate=@Sdate)  
and Empcode in (Select Empcode from Emp_Master where catcode in (1,2,8))

update TRANSAttendance set Status ='NH',DAYVALUE =1 WHERE SDate IN (Select Date FROM Holiday_Master WHERE Holidaycode ='NH' AND Date=@Sdate)  AND ETYPE='DOWNLOAD' 

update TRANSAttendance set Status ='FH',DAYVALUE =1 WHERE SDate IN (Select Date FROM Holiday_Master WHERE Holidaycode ='FH' AND Date=@Sdate)AND ETYPE='DOWNLOAD'

update TRANSAttendance set Status ='H',DAYVALUE =1 WHERE SDate IN (Select Date FROM Holiday_Master WHERE Holidaycode ='H' AND Date=@Sdate)AND ETYPE='DOWNLOAD'

UPDATE TRANSAttendance set ShiftId=1 where EmpCode in (SELECT empcode from emp_master where shiftgroup in('G1','G8')) AND SHIFTID in (15,0)  AND ETYPE='DOWNLOAD' and SDate=@Sdate  

UPDATE TRANSAttendance set ShiftId=2 where EmpCode in (SELECT empcode from emp_master where shiftgroup ='G2') AND SHIFTID in (13,0) AND ETYPE='DOWNLOAD'  and SDate=@Sdate  
update TRANSAttendance set Status='/',DAYVALUE=0.5 where SDate=@SDATE and status='x' and ShiftId=0AND ETYPE='DOWNLOAD'

update TransAttendance set empid=isnull((select empid from emp_master where emp_master.empcode=TransAttendance.empcode),0) where sdate=@Sdate

--declare @Sdate as datetime  
--set @SDATE='2014-11-02'  

update TRANSAttendance set latemins=isnull((  
Select  
DATEDIFF(MINUTE,case when StartNDay='true' then 
dateadd(d,1,@Sdate)+ ' '+PunchStartTo else  @Sdate+ ' '+PunchStartTo  end,intime)
from TRANSAttendance a,shift_master b where a.ShiftId=b.ShiftId and  SDate=@SDATE
and TRANSAttendance.Id=a.id),0) where SDate=@Sdate  

Update TRANSAttendance set latemins=0 where latemins<0 and SDate= @sdate
update TRANSAttendance set 
latemins=latemins+ case when isnull(( 
Select DATEDIFF(MINUTE,outtime,case when EndNxtDay='true'
then dateadd(d,1,@Sdate)+ ' '+EndTime else  @Sdate+ ' '+PunchEndFrom  end)
from TRANSAttendance a,shift_master b where a.ShiftId=b.ShiftId and  SDate=@SDATE
and TRANSAttendance.Id=a.id),0)>0 then  
isnull(( Select  
DATEDIFF(MINUTE,outtime,case when EndNxtDay='true' then dateadd(d,1,@Sdate)+ ' '+EndTime else  @Sdate+ ' '+EndTime  end)
from TRANSAttendance a,shift_master b where a.ShiftId=b.ShiftId and  SDate=@SDATE
and TRANSAttendance.Id=a.id),0)
else 0 end where SDate=@Sdate

update TRANSAttendance set  Total_mts=isnull((  
Select 
case when a.outtime<>'1900-01-01 12:00:00' and a.INTIME<>'1900-01-01 12:00:00' then DATEDIFF(MINUTE, a.INTIME , a.outtime) else '0' end as Total_mts
from TRANSAttendance a,shift_master b where a.ShiftId=b.ShiftId and  SDate=@SDATE
and TRANSAttendance.Id=a.id),0) where SDate=@Sdate

update TRANSAttendance set  Shift_mts=isnull((  
Select DATEDIFF(MINUTE, 
cast(cast(cast(a.SDate as date) as varchar(30))+' '+b.StartTimeas datetime)  
,cast(cast(cast(case when InEndNxtDay=1 then dateadd(d,1,a.SDate)  else a.SDate endas date) as varchar(30))+' '+b.EndTime  as datetime)  )  as Shift_mts
from TRANSAttendance a,shift_master b where a.ShiftId=b.ShiftId and  SDate=@SDATE
and TRANSAttendance.Id=a.id),0) where SDate=@Sdate

update TRANSAttendance set  OT_Mts=isnull((  
Select  
case when a.outtime<>'1900-01-01 12:00:00' and a.INTIME<>'1900-01-01 12:00:00' then 
(DATEDIFF(MINUTE, CAST(b.EndTime  AS TIME) ,CAST(a.outtime  AS TIME) ) )else '0' end as OT_Mts 

from TRANSAttendance a,shift_master b where a.ShiftId=b.ShiftId and  SDate=@SDATE
and TRANSAttendance.Id=a.id),0) where SDate=@Sdate
Update TRANSAttendance set OT_Mts=0 where OT_Mts<0 and SDate= @sdate	 

--update TRANSAttendance set  earlymins=isnull((  
--Select
--case when a.outtime<>'1900-01-01 12:00:00'  then  
--DATEDIFF(MINUTE,outtime,case when InEndNxtDay ='true' then dateadd(d,1,a.SDate)+ ' '+PunchEndFrom else  a.SDate + ' '+PunchEndFrom  end)else '0' end as earlymins 
--from TRANSAttendance a,shift_master b where a.ShiftId=b.ShiftId and  SDate=a.SDate  
--and TRANSAttendance.Id=a.id),0) where SDate=@Sdate  

Update TRANSAttendance set EarlyMins=0 where EarlyMins<0 and SDate= @sdate  

Update TRANSAttendance set latemins=0 where INID='-' and SDate= @sdate  
Update TRANSAttendance set latemins=0 where outid='-' and SDate= @sdate

--UPDATE TRANSAttendance set Status='NH/',DAYVALUE=0.5 where  (latemins>0 or EarlyMins>0) and SDate= @sdateAND ETYPE='DOWNLOAD' 
--and 
--Status  in ('NH','FH' )
UPDATE TRANSAttendance set Status='W/',DAYVALUE=0.5 where  (latemins>0 or EarlyMins>0) and SDate= @sdateAND ETYPE='DOWNLOAD' 
and 
Status  in ('Wx')

UPDATE TRANSAttendance set Status='/',DAYVALUE=0.5 where  (latemins>0 or EarlyMins>0) and SDate= @sdateAND ETYPE='DOWNLOAD' 
and 
Status not in ('NH','FH','W','L','W/')

declare @eid as bigint  
declare @eempcode as varchar(50)  
declare @lmin as float  
declare cur4 cursor for
SELECT id,EmpCode,latemins FROM TransAttendance where SDate=@sdate and LateMins>0 and ShiftId in (1,2,3,13)  
--and EmpCode in (select EmpCode from Emp_Master where Catcode in (select Catcode from Category_Master where CatName in (select code1 from SelectionTable)))
 
open cur4  
fetch cur4 into @eid,@eempcode,@lmin  
while @@FETCH_STATUS=0 
begin  
declare @pcount as bigint  
select @pcount =COUNT(*) from TRANSAttendance where month(sdate)=month(@sdate) and YEAR(sdate)=YEAR(@sdate) and Id <>@eid and  EmpCode=@eempcode

select  @eid
 
if @pcount <=0
begin  
if @lmin<=10  
BEGIN 
DECLARE @WOFF AS VARCHAR(10) 
SELECT @WOFF=Emp_Master.WeeklyOff FROM Emp_Master WHERE EmpCode=@eempcode
IF UPPER(LEFT(DATENAME (WEEKDAY,@Sdate),3)) <> @WOFF
update TRANSAttendance set Status='x' ,DAYVALUE=1 ,permision='true' where Id=@eid  AND ETYPE='DOWNLOAD' AND STATUS='X'
END 
end  
else  
begin  
update TRANSAttendance set Status='/', DAYVALUE=0.5 ,permision='false' where Id=@eidAND ETYPE='DOWNLOAD' AND Status='X'  
end  
 
fetch cur4 into @eid,@eempcode,@lmin  
end 
close cur4  
deallocate cur4 