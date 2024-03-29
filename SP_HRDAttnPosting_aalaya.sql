USE [PowerERP_AALAYAA]
GO
/****** Object:  StoredProcedure [dbo].[SP_HRDAttnPosting]    Script Date: 25/05/2023 17:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
                      
                      
--  exec [SP_HRDAttnPosting] '','', '2023-05-23','','ADMIN','1'                         
                              
ALTER PROC [dbo].[SP_HRDAttnPosting] 
(

@Comp_Code		Varchar(20),
@Location_Code		Varchar(20),
@Sdate as datetime ,  
@Cat_name		varchar(500),
@User_Code		Varchar(15),
@iSuccessFlag   bit	output
)                                                              
as                                                       
                          
                                              
--DECLARE @SDATE AS DATETIME                                                                  
--SET @SDATE='2014-06-24'                                                                 
                  
              
------------ Update Attandance log file Finger ID and Emp Code Match                                                             
UPDATE Bio_Attnlog                           
SET Empcode=ISNULL((Select top 1 Empcode FROM Emp_Master A 
WHERE (a.ResignDate = '1900-01-01 00:00:00.000' or (a.resigndate<>'1900-01-01' and a.Resigndate>@Sdate) )                         
and cast(A.FingerId as bigint) =cast(Bio_Attnlog.Fid as bigint)),0) WHERE  sdate =@SDATE    
--and cast(A.FingerId as bigint) =cast(Bio_Attnlog.Fid as bigint)),0) WHERE  Sdate between @Sdate and dateadd(d,1,@Sdate)  
and Fid in (Select FingerId  from Emp_Master)               


  
                ------------ Delete Attendance Particular date   
delete from TransAttendance where sdate=@Sdate and EType='DOWNLOAD'         
and EmpCode in (select EmpCode from Emp_Master
 
--and Catcode in (select Catcode from Category_Master where Location_Code =@Location_Code 
--and CatName in (@Cat_name))
)   
                                       
                      
                                    
truncate table TMP_INOUT                                                                  
truncate table Tmp_AttnLog                                                                  
insert into Tmp_AttnLog                                                                  
select * from Bio_Attnlog where Sdate between @Sdate and dateadd(d,1,@Sdate)                                                                   
                                                         
declare emp cursor for                                   
select empcode,SHIFTGROUP from emp_master
WHERE (RESIGNDATE='1900-01-01 00:00:00.000' OR (RESIGNDATE<>'1900-01-01 00:00:00.000'
AND RESIGNDATE>@SDATE))   
and doj  <= @SDATE  
--and  EmpId <> 0 
and EmpCode in (select EmpCode from Emp_Master  
-- AND Catcode in (select Catcode from Category_Master where CatName in (@Cat_name))
)                   
                     
open emp                                                                  
declare @empcode as varchar(50)                              
DECLARE @SHIFTGROUP AS VARCHAR(2)                                  
fetch emp into @empcode,@ShiftGroup                            
while @@fetch_status=0                                                                   
begin                                                       
                                                               
DECLARE @ChkInStart AS DATETIME                                                                  
DECLARE @ChkInEnd AS DATETIME                                                                  
DECLARE @ChkOutStart AS DATETIME                                                                  
DECLARE @ChkOutEnd AS DATETIME               
                                                                  
Declare @Shift as Varchar(10)                                                                                                                                  
declare @InTime as datetime                                     
declare @OutTime as datetime                                    
declare @InId as varchar(500)                                   
declare @outId as varchar(500)
declare @LAUNCHInId as varchar(500)                        
declare @launchoutId as varchar(500)                        
SET @InId='-'                                            
SET @OUTID='-'       
SET @LAUNCHInId='-'                                            
SET @launchoutId='-'                                                              
SET @InTime='1900-01-01'                                        
SET @OutTime='1900-01-01'                                                                  
set @Shift=0                                                  
declare @LaunchInTime as datetime                                  
declare @LaunchOutTime as datetime   
declare @LaunchstartInTime as datetime                                  
declare @LaunchentOutTime as datetime   
declare @LaunchentOutTimestart as datetime     
                                                            
SET @ChkInStart =@SDATE +'04:00:00 AM'                          
set @ChkInEnd =DATEADD(DAY,1,@Sdate) + '01:00:00 AM'   

select  @Shift =b.shiftid
,@SHIFTGROUP=a.ID
from HRD_EmpShiftMatch a,Shift_Master b where b.shiftcode=a.id   
and a.empcode=@empcode   
--select @SHIFTGROUP


                                                  
                                                    
select @InTime=isnull(min(SDatetime),'1900-01-01 12:00:00 PM') from Tmp_AttnLog where empcode=@empcode and sdatetime between @ChkInStart and @ChkInEnd and inout  IN ('1')                                                             
AND idtxt not in (select Inid from TMP_TransAttn where sdate<@Sdate and TMP_TransAttn.empcode=Tmp_AttnLog.empcode)                               
                                                
declare @nextIn as datetime                                                
if @InTime<>'1900-01-01 12:00:00 PM'                                                
select @nextIn=isnull(min(SDatetime),'1900-01-01 12:00:00 PM') from Tmp_AttnLog where empcode=@empcode and sdatetime > @InTime and inout  IN ('1')                                                         
else                                      
set @nextIn='1900-01-01 12:00:00 PM'                                                
                                                
                                                                  
select @InId=isnull(IDTxt,'-') from Tmp_AttnLog where empcode=@empcode and sdatetime =@InTime                                                                  
                                                               
if @inTime='1900-01-01 12:00:00 PM'                                                              
begin                                                              
set @ChkOutStart=@Sdate +' '+'01:00:01 PM'                                                       
set @ChkOutEnd=dateadd(hh,20,@ChkOutStart)                                                                  
end                                                
else                                                              
Begin                                                              
set @ChkOutStart=dateadd(hh,1,@InTime)                                                                  
set @ChkOutEnd=dateadd(hh,20,@INTime)                                                                  
end                                                              
                                                             
if @nextIn <>'1900-01-01 12:00:00 PM'                                                             
select @OutTime=isnull(MAX(SDatetime),'1900-01-01 12:00:00 PM') from Tmp_AttnLog where empcode=@empcode and sdatetime between @ChkOutStart and @ChkOutEnd  
and inout  IN ('2')                                                                  
--and idTxt not in (select OutId from TMP_TransAttn where sdate<@Sdate and TMP_TransAttn.empcode=Tmp_AttnLog.empcode)  

  
--- and Sdatetime < @nextIn                                                              
else                                                
select @OutTime=isnull(MAX(SDatetime),'1900-01-01 12:00:00 PM') from Tmp_AttnLog where empcode=@empcode and sdatetime between @ChkOutStart and @ChkOutEnd 
and inout  IN ('2')                                       
                        
                                                      
select @outId=isnull(IDTxt,'-') from Tmp_AttnLog where empcode=@empcode and sdatetime =@OutTime     
                                                    
         
select @LaunchInTime =isnull(min(SDatetime),'1900-01-01 12:00:00 PM') from Tmp_AttnLog 
where empcode=@empcode and sdatetime between @LaunchstartInTime and @LaunchentOutTime 
select @LAUNCHInId =isnull(IDTxt,'-') from Tmp_AttnLog where empcode=@empcode and sdatetime =@LaunchInTime    set @LaunchentOutTimestart = dateadd(MINUTE, +30, (dateadd(d,0,@sdate) +' '+ @LaunchInTime) )  

                                                 
select @LaunchOutTime =isnull(MAX(SDatetime),'1900-01-01 12:00:00 PM') from Tmp_AttnLog 

where empcode=@empcode and sdatetime between @LaunchstartInTime and @LaunchentOutTime and Sdatetime > @LaunchentOutTimestart 
                                                    
select @launchoutId =isnull(IDTxt,'-') from Tmp_AttnLog where empcode=@empcode and sdatetime =@LaunchOutTime 

                                                         
select top 1 @Shift =b.shiftid from HRD_EmpShiftMatch a,Shift_Master b where a.id=b.shiftcode and a.empcode=@empcode  
and @InTime between case when InStartPDay='true' then dateadd(d,-1,@Sdate)+ ' '+PunchStartFrom else  @Sdate+ ' '+PunchStartFrom  end                  
and case when StartNDay='true' then dateadd(hh,1,dateadd(d,1,@Sdate)+ ' '+StartTime) else  dateadd(hh,1,@Sdate+ ' '+StartTime)  end                                                                 
                     
--SELECT @Shift,@empcode ,@InTime, @OutTime ,@inid,@outId,@ChkInStart,@ChkInEnd,@ChkOutStart ,@ChkOutEnd ,@sdate
--,@LaunchInTime,@LaunchOutTime,@LaunchentOutTimestart


                               
                                          
insert into TMP_INOUT                                                                  
select @Comp_Code ,@Location_Code , @empcode Empcode,@InTime InTime,@OutTime OutTime,@Shift Shift,DATEDIFF(mi,@Intime,@outtime) TotlaMins
,                                                                 
case when DATEDIFF(mi,@Intime,@outtime)-480>0 then DATEDIFF(mi,@Intime,@outtime)-480 else 0 end OTMins,@InId,@OUTId    
,@LaunchInTime ,@LaunchOutTime ,@LAUNCHInId ,@launchoutId
  ,0,'1900-01-01 12:00:00 PM','1900-01-01 12:00:00 PM',0,'1900-01-01 12:00:00 PM','1900-01-01 12:00:00 PM',0
  ,'1900-01-01 12:00:00 PM','1900-01-01 12:00:00 PM',0 
                                                                
                                                              
fetch emp into @empcode,@ShiftGroup                                                                    
end                                                                  
close emp                                                                  
deallocate emp                                                                  
                                                                
UPDATE TMP_INOUT SET TOTALMINS=0,OTMINS=0 WHERE TOTALMINS>3000  
UPDATE TMP_INOUT SET TOTALMINS=0,OTMINS=0 WHERE TOTALMINS<0                                   
                                                                
--ablvtable posting                                                                  
--select * from TMP_INOUT                                 
                                                                
--PRESENT                                                                  
                                                               
INSERT INTO transAttendAnce             
----- Weekly Off Check And Manual Attendance Check                                                      
select  @comp_Code,@Location_Code, @SDATE,EMPCODE ,0,SHIFT,'X',1,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID
, LaunchINTIME,LaunchOUTTIME,LaunchINID,LaunchOUTID
,0,0,0,0, 0   ,           'false',''  from TMP_INOUT                                                         
where intime<>'1900-01-01 12:00:00.000' and outtime<>'1900-01-01 12:00:00.000'
-- and TotalMins>=420                                 
and  empcode not in (Select empcode from emp_master where upper(weeklyoff) =upper(left(datename(w,@Sdate),3)))                     
and Empcode not in (Select EmpCode from TransAttendance where sDate=@Sdate)  

----- Weekly Off Check                                                 
                           
INSERT INTO TransAttendance                                                                  
select @comp_Code,@Location_Code ,@SDATE,EMPCODE ,0,SHIFT,'W',1,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID
, LaunchINTIME,LaunchOUTTIME,LaunchINID,LaunchOUTID,0,0,0,0,0,'false' ,''
from TMP_INOUT                                                 
where                                                           
empcode in (Select empcode from emp_master where upper(weeklyoff) =upper(left(datename(w,@Sdate),3)))  
and Empcode not in (Select EmpCode from TransAttendance where sDate=@Sdate)       
                                                           
                                                                
--absent                                                                  
INSERT INTO transAttendAnce                                                      
select @comp_Code,@Location_Code, @SDATE,EMPCODE ,0,SHIFT,'A',1,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID
, LaunchINTIME,LaunchOUTTIME,LaunchINID,LaunchOUTID

,0,0,0,0,0,'false' ,''
from TMP_INOUT                                                                   
where intime='1900-01-01 12:00:00.000' and outtime='1900-01-01 12:00:00.000'                                 
and Empcode not in (Select EmpCode from TransAttendance where sDate=@Sdate)     
--and Empcode in (Select Empcode from Emp_Master where ShiftGroup in ('G2','G3','G4','G5'))  
                                                    
--LEAVE                                                
--INSERT INTO transAttendAnce                                                                  
--select @comp_Code,@Location_Code, @SDATE,EMPCODE ,0,SHIFT,'L',1,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID
--, LaunchINTIME,LaunchOUTTIME,LaunchINID,LaunchOUTID
--,0,0,0,0,0,'false',''
--from TMP_INOUT                                                                   
--where intime='1900-01-01 12:00:00.000' and outtime='1900-01-01 12:00:00.000'    
--and Empcode not in (Select EmpCode from TransAttendance where sDate=@Sdate)  
--and Empcode in (Select Empcode from Emp_Master where  Catcode in (1,2))                                         
                                                    
                                                               
--HALF PRESENT                                                           
--INSERT INTO transAttendance                                                                          
--select @comp_Code,@Location_Code, @SDATE,EMPCODE ,0,SHIFT,'/L',0.5,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID
--, LaunchINTIME,LaunchOUTTIME,LaunchINID,LaunchOUTID
--,0,0,0,0,0,'false',''
--from TMP_INOUT                                                                           
--where intime<>'1900-01-01 12:00:00.000' and outtime<>'1900-01-01 12:00:00.000' 
--and TotalMins<470 AND TOTALMins>=240 
--and Empcode not in (Select EmpCode from transAttendAnce where sDate=@Sdate)        
--and Empcode in (Select Empcode from Emp_Master where Catcode in (1,2))   
                                                                              
--HALF PRESENT                                                           
INSERT INTO transAttendance                                                                          
select @comp_Code,@Location_Code, @SDATE,EMPCODE ,0,SHIFT,'/',0.5,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID
, LaunchINTIME,LaunchOUTTIME,LaunchINID,LaunchOUTID
,0,0,0,0,0,'false',''
from TMP_INOUT                                        
where intime<>'1900-01-01 12:00:00.000' and outtime<>'1900-01-01 12:00:00.000' 
and TotalMins<470 AND TOTALMins>=240                                                                          
and Empcode not in (Select EmpCode from transAttendAnce where sDate=@Sdate)        
--AND EmpCode   IN(Select EmpCode FROM Emp_Master WHERE Catcode NOT IN(1,2))                                   

--and Empcode in (Select Empcode from Emp_Master where ShiftGroup in ('G3','G4','G5','G6'))

                                                
--EXPECTION                                                                        
INSERT INTO transAttendance        
select @comp_Code,@Location_Code, @SDATE,EMPCODE ,0,SHIFT,'/',0.5,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID
, LaunchINTIME,LaunchOUTTIME,LaunchINID,LaunchOUTID
,0,0,0,0,0,'false',''
from TMP_INOUT                                                                           
where (intime='1900-01-01 12:00:00.000' OR outtime='1900-01-01 12:00:00.000') 
and TotalMins<240                                                                       
and Empcode not in (Select EmpCode from transAttendAnce where sDate=@Sdate)                                              
------------------------------

---------------Admin Staff and Technical Staff Absent to Leave and Half Day to Half day Set-------     
update TRANSAttendance set Status='L',DAYVALUE=1 where SDate=@SDATE and status='A'  AND ETYPE='DOWNLOAD' 
AND EmpCode IN(Select EmpCode FROM Emp_Master WHERE Catcode IN(1,2))                                               
update TRANSAttendance set Status='/L',DAYVALUE=0.5 where SDate=@SDATE and status='/'  AND ETYPE='DOWNLOAD' 
AND EmpCode IN(Select EmpCode FROM Emp_Master WHERE Catcode IN(1,2))                                               
---------------------------XXX---------------------------
                     
--------------------  Update NH,FH, Master Holidays Set                                                      
update TRANSAttendance set Status ='NH',DAYVALUE =1 WHERE SDate IN (Select Date FROM Holiday_Master WHERE Holidaycode ='NH'
AND Date=@Sdate)  AND ETYPE='DOWNLOAD'                                                      
                                                    
update TRANSAttendance set Status ='FH',DAYVALUE =1 WHERE SDate IN (Select Date FROM Holiday_Master WHERE Holidaycode ='FH'
AND Date=@Sdate)  AND ETYPE='DOWNLOAD'                    
                                                    
update TRANSAttendance set Status ='LH',DAYVALUE =1 WHERE SDate IN (Select Date FROM Holiday_Master WHERE Holidaycode ='LH' 
AND Date=@Sdate)   AND ETYPE='DOWNLOAD'                                                       
                                              
UPDATE TRANSAttendance set ShiftId=1 where EmpCode in (SELECT empcode from emp_master where shiftgroup in('G1','G8')) AND SHIFTID in (15,0)  AND ETYPE='DOWNLOAD' and SDate=@Sdate                                                         
                                          
UPDATE TRANSAttendance set ShiftId=2 where EmpCode in (SELECT empcode from emp_master where shiftgroup ='G2') AND SHIFTID in (13,0) AND ETYPE='DOWNLOAD'  and SDate=@Sdate                           
  
                                         
update TRANSAttendance set Status='/',DAYVALUE=0.5 where SDate=@SDATE and status='x' and ShiftId=0   AND ETYPE='DOWNLOAD'                                        
                                                        
update TransAttendance set empid=isnull((select empid from emp_master where emp_master.empcode=TransAttendance.empcode),0) where sdate=@Sdate                                           
                                          
--declare @Sdate as datetime                                          
--set @SDATE='2014-11-02'       
                                        
update TRANSAttendance set latemins=isnull((                                          
Select                                
DATEDIFF(MINUTE,case when StartNDay='true' then 
dateadd(d,1,@Sdate)+ ' '+StartTime else  @Sdate+ ' '+StartTime  end,intime)
from TRANSAttendance a,shift_master b where a.ShiftId=b.ShiftId and  SDate=@SDATE
and TRANSAttendance.Id=a.id),0) where SDate=@Sdate        

update TRANSAttendance set  Total_mts=isnull((                                          
Select      

case when a.outtime<>'1900-01-01 12:00:00' and a.INTIME<>'1900-01-01 12:00:00' then DATEDIFF(MINUTE, a.INTIME , a.outtime) else '0' end as Total_mts 
from TRANSAttendance a,shift_master b where a.ShiftId=b.ShiftId and  SDate=@SDATE
and TRANSAttendance.Id=a.id),0) where SDate=@Sdate     

--DATEDIFF(MINUTE,case when StartNDay='true' then 
--dateadd(d,1,@Sdate)+ ' '+PunchStartTo else  @Sdate+ ' '+PunchStartTo  end,intime)
                      

update TRANSAttendance set  Shift_mts=isnull((                                          
Select    DATEDIFF(MINUTE, 
cast(cast(cast(   a.SDate    as date) as varchar(30))+' '+b.StartTime   as datetime)  


,cast(cast(cast(   case when EndNxtDay=1 then dateadd(d,1,a.SDate)  else a.SDate end   as date) as varchar(30))+' '+b.EndTime  as datetime)  )  as Shift_mts
from TRANSAttendance a,shift_master b where a.ShiftId=b.ShiftId and  SDate=@SDATE
and TRANSAttendance.Id=a.id),0) where SDate=@Sdate   

--	update TRANSAttendance set  Shift_mts=isnull((                                          
--Select    case when a.outtime<>'1900-01-01 12:00:00' and a.INTIME<>'1900-01-01 12:00:00' then DATEDIFF(MINUTE, a.INTIME
--,cast(cast(cast(   case when EndNxtDay=1 then dateadd(d,1,a.SDate)  else a.SDate end   as date) as varchar(30))+' '+b.EndTime  as datetime)  ) else '0' end as Shift_mts
--from TRANSAttendance a,shift_master b where a.ShiftId=b.ShiftId and  SDate=@SDATE
--and TRANSAttendance.Id=a.id),0) where SDate=@Sdate   


--update TRANSAttendance set  OT_Mts=isnull((                                          
--Select  
--case when a.outtime<>'1900-01-01 12:00:00' and a.INTIME<>'1900-01-01 12:00:00' then 
--(DATEDIFF(MINUTE, CAST(b.EndTime  AS TIME) ,CAST(a.outtime  AS TIME) ) )else '0' end as OT_Mts 

--from TRANSAttendance a,shift_master b where a.ShiftId=b.ShiftId and  SDate=@SDATE
--and TRANSAttendance.Id=a.id),0) where SDate=@Sdate

Update TRANSAttendance set OT_Mts=Total_mts-Shift_mts where   SDate= @sdate   	 

Update TRANSAttendance set OT_Mts=0 where OT_Mts<0 and SDate= @sdate   	 
                                          
Update TRANSAttendance set latemins=0 where latemins<0 and SDate= @sdate   
                                    
Update TRANSAttendance set latemins=0 where INID='-' and SDate= @sdate    

                        
--update TRANSAttendance set earlymins =isnull((                                          
--Select    
--case when a.outtime<>'1900-01-01 12:00:00'  then                            
--DATEDIFF(MINUTE,OUTTIME,case when EndNxtDay='true' then 
--dateadd(d,1,@Sdate)+ ' '+endtime  else  @Sdate+ ' '+EndTime   end)
--else 0 end as early
--from TRANSAttendance a,shift_master b where a.ShiftId=b.ShiftId and  SDate=@SDATE
--and TRANSAttendance.Id=a.id),0) where SDate=@Sdate  
  
  
update TRANSAttendance set  earlymins=isnull((                                          
Select   
case when a.outtime<>'1900-01-01 12:00:00'  then                 
DATEDIFF(MINUTE,outtime,case when EndNxtDay='true' then dateadd(d,1,a.SDate)+ ' '+EndTime else  a.SDate + ' '+EndTime  end)        else '0' end as earlymins                          
from TRANSAttendance a,shift_master b where a.ShiftId=b.ShiftId and  SDate=a.SDate  
and TRANSAttendance.Id=a.id),0) where SDate=@Sdate  



Update TRANSAttendance set EarlyMins=0 where EarlyMins<0 and SDate= @sdate   
Update TRANSAttendance set EarlyMins=0 where outid='-' and SDate= @sdate 


update TRANSAttendance set  Status=isnull((                                          
Select   


case when a.outtime<>'1900-01-01 12:00:00' or a.INTIME<>'1900-01-01 12:00:00' then 

case when cast(A.INTIME    as datetime)  <=
cast(cast(cast(   a.SDate    as date) as varchar(30))+' '+b.PunchStartTo  as datetime) and a.INTIME<>'1900-01-01 12:00:00'
then 
case when cast(A.OUTTIME    as datetime)  >=(
cast(cast(cast(   case when EndNxtDay=1 then dateadd(d,1,a.SDate)  else a.SDate end   as date) as varchar(30))+' '+b.PunchEndFrom  as datetime))  and a.outtime<>'1900-01-01 12:00:00'  then  'X'
ELSE'/' END 
when a.outtime<>'1900-01-01 12:00:00' then 
'/'
else '/' end 
when a.outtime='1900-01-01 12:00:00' or a.INTIME='1900-01-01 12:00:00' then 

'A'

else 'A' end as Status 
 
from TRANSAttendance a,shift_master b where a.ShiftId=b.ShiftId and  SDate=@SDATE
and TRANSAttendance.Id=a.id),0) where SDate=@Sdate  
                                       
--UPDATE TRANSAttendance set Status='/',DAYVALUE=0.5 where  latemins>0 and SDate= @sdate   AND ETYPE='DOWNLOAD' 
--and 
--Status not in ('NH','FH','W','L','Wx')
                                        
declare @eid as bigint                                          
declare @eempcode as varchar(50)                                          
declare @lmin as float                                          
declare cur4 cursor for                         
SELECT id,EmpCode,latemins FROM TransAttendance where SDate=@sdate and LateMins>0 and ShiftId in (1,2,3)                                          
and EmpCode in (select EmpCode from Emp_Master where Catcode in (select Catcode from Category_Master where CatName  in (@Cat_name)))       
                      
open cur4                                          
fetch cur4 into @eid,@eempcode,@lmin                                          
while @@FETCH_STATUS=0                               
begin                                          
declare @pcount as bigint                                          
select @pcount =COUNT(*) from TRANSAttendance where month(sdate)=month(@sdate) and YEAR(sdate)=YEAR(@sdate) and Id <>@eid and  EmpCode=@eempcode   


select  @eid
                          
if @pcount <=0                                           
begin                                          
if @lmin<=120                                          
BEGIN    
DECLARE @WOFF AS VARCHAR(10)    
SELECT @WOFF=Emp_Master.WeeklyOff FROM Emp_Master WHERE EmpCode=@eempcode     
IF UPPER(LEFT(DATENAME (WEEKDAY,@Sdate),3)) <> @WOFF     
update TRANSAttendance set Status='x' ,DAYVALUE=1 ,permision='true' where Id=@eid  AND ETYPE='DOWNLOAD' AND STATUS='X'                                           
END    
end                                          
else                                
begin                                
update TRANSAttendance set Status='/', DAYVALUE=0.5 ,permision='false' where Id=@eid   AND ETYPE='DOWNLOAD' AND Status='X'                                          
end                                
                                
fetch cur4 into @eid,@eempcode,@lmin                                          
end                   
close cur4                                          
deallocate cur4 

