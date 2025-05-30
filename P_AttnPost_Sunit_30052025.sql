USE [LS_HRD_S]
GO
/****** Object:  StoredProcedure [dbo].[P_AttnPost]    Script Date: 30-05-2025 19:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
                      
                       
                       
                                   
--select * from TRANSAttendance where SDate='2024-10-01' and EmpCode='S1144'                                   
                          
--  exec P_AttnPost '2025-04-09'


ALTER  PROC [dbo].[P_AttnPost] @Sdate as datetime                                                                  
as   



 INSERT INTO  [LS_Attnlog].[dbo].Attnlog   
SELECT   
[employeeID]  as Fid    
,authDate as sdate      
  ,convert(varchar(10),authDateTime, 108)  as stime      
,case when (deviceName ='172.160.6.51' or deviceName ='IN1' or deviceName ='172.160.6.54' or deviceName ='IN2' ) then 1  when  (deviceName ='172.160.6.52' or deviceName ='OUT1' or deviceName ='172.160.6.53' or deviceName ='OUT2')then 2 else '0' end as  inout1      
,case when (deviceName ='172.160.6.51' or deviceName ='IN1' or deviceName ='172.160.6.54' or deviceName ='IN2' ) then 1  when  (deviceName ='172.160.6.52' or deviceName ='OUT1' or deviceName ='172.160.6.53' or deviceName ='OUT2')then 2 else '0' end as  inout      
,case when (deviceName ='172.160.6.51' or deviceName ='IN1' or deviceName ='172.160.6.54' or deviceName ='IN2' ) then 1  when  (deviceName ='172.160.6.52' or deviceName ='OUT1' or deviceName ='172.160.6.53' or deviceName ='OUT2')then 2 else '0' end as  mcid      

,[authDateTime] as Sdatetime      
,'' as Empcode ,'Download-Face' as STATUS      
,employeeID+' - '+FORMAT (authDateTime, 'yyyy-MM-dd hh:mm:ss tt')  +' - '+deviceName as IDTXT
,'NONE' as fhey,'S' as Unit , case when (deviceName ='172.160.6.51' or deviceName ='IN1')  then 13  when (deviceName ='172.160.6.52' or deviceName ='OUT1') then 14
 when (deviceName ='172.160.6.54' or deviceName ='IN2') then 15  when (deviceName ='172.160.6.53' or deviceName ='OUT2') then 16 else '0' end as  DeviceId      
FROM [LS_HRD_S].[dbo].attlog_hik   as t1   
WHERE t1.authDate between @Sdate and dateadd(d,1,@Sdate)   

 INSERT INTO  [LS_Attnlog].[dbo].Attnlog   
SELECT   
[employeeID]  as Fid    
,authDate as sdate      
  ,convert(varchar(10),authDateTime, 108)  as stime      
,case when (deviceName ='172.160.6.56' or deviceName ='LSW-W-IN')  then 1  when (deviceName ='172.160.6.57' or deviceName ='LSW-W-OUT') then 2 else '0' end as  inout1      
,case when (deviceName ='172.160.6.58' or deviceName ='LSW-G-IN') then 1  when (deviceName ='172.160.6.59' or deviceName ='LSW-G-OUT') then 2 else '0' end as  inout      
,case when (deviceName ='172.160.6.56' or deviceName ='LSW-W-IN' or deviceName ='172.160.6.58' or deviceName ='LSW-G-IN' ) then 1  when  (deviceName ='172.160.6.57' or deviceName ='LSW-W-OUT' or deviceName ='172.160.6.59' or deviceName ='LSW-G-OUT')then 2 else '0' end as  mcid      

,[authDateTime] as Sdatetime      
,'' as Empcode ,'Download-Face' as STATUS      
,employeeID+' - '+FORMAT (authDateTime, 'yyyy-MM-dd hh:mm:ss tt')  +' - '+deviceName as IDTXT
,'NONE' as fhey,'W' as Unit , case when (deviceName ='172.160.6.56' or deviceName ='LSW-W-IN')  then 9  when (deviceName ='172.160.6.57' or deviceName ='LSW-W-OUT') then 10 
 when (deviceName ='172.160.6.58' or deviceName ='LSW-G-IN') then 11  when (deviceName ='172.160.6.59' or deviceName ='LSW-G-OUT') then 12 else '0' end as  DeviceId      
 
FROM [LS_HRD_W].[dbo].attlog_hik   as t1   
WHERE t1.authDate between @Sdate and dateadd(d,1,@Sdate)  
AND NOT EXISTS (
        SELECT 1 
        FROM [LS_Attnlog].[dbo].Attnlog as t2
        WHERE t2.Fid = t1.employeeID
        AND t2.sdate = t1.authDate
        AND t2.stime = convert(varchar(10), t1.authDateTime, 108)
    ) 

select  'INSERT INTO  [LS_Attnlog].[dbo].Attnlog   ' as Status

 ------------ Update Attandance log file Finger ID and Emp Code Match                                                             
UPDATE LS_Attnlog..Attnlog                           
SET Empcode=ISNULL((Select top 1 Empcode FROM Emp_Master A 
WHERE (a.ResignDate = '1900-01-01 00:00:00.000' or (a.resigndate<>'1900-01-01' and a.Resigndate>@Sdate) )                         
and cast(A.Sap_ID  as bigint) =cast(LS_Attnlog..Attnlog.Fid as bigint)),0) WHERE  sdate=@SDATE  
--and cast(A.Sap_ID  as bigint) =cast(LS_Attnlog..Attnlog.Fid as bigint)),0) WHERE  sdate=@SDATE  
--and Fid in (Select Sap_ID   from Emp_Master)               
and Fid in (Select sap_id  from Emp_Master)               


select  'UPDATE LS_Attnlog..Attnlog  ' as Status
  
                                               ------------ Delete Attendance Particular date   
delete from TransAttendance where sdate=@Sdate and EType='DOWNLOAD'         
and EmpCode in(select EmpCode from Emp_Master
 where Catcode in (select Catcode from Category_Master where CatName in (select code1 from SelectionTable))) 
 --and EmpCode=
 --('S1144')    
 
 -----------Store temptransatt table  for Emp Attandance date +1 and -1
 TRUNCATE TABLE tmpTransAt                                
                                 
 INSERT INTO tmpTransAt                                
 SELECT * FROM TRANSAttendance WHERE SDate BETWEEN DATEADD(DAY,-1,@SDATE) AND DATEADD(DAY,1,@SDATE)    
 and EmpCode in (select EmpCode from Emp_Master 
 where Catcode in (select Catcode from Category_Master 
 where CatName in (select code1 from SelectionTable)))

 select  ' INSERT INTO tmpTransAt                    
 SELECT * FROM TRANSAttendance ' as Status

      --select * from  tmpTransAt    WHERE EMPCODE IN ('SR1133','S1378')
  -----------Store tmp Attand log for  Emp Attandance date +1 
                  
truncate table tmpINOUT  
truncate table tmpAttnLog  
                                                                
insert into tmpAttnlog 
select * from LS_Attnlog..AttnLog where Sdate between @Sdate and dateadd(d,1,@Sdate)   
 select  ' insert into tmpAttnlog 
select * from LS_Attnlog..AttnLog ' as Status

------select empcode,SHIFTGROUP in Particular Category 

--select empcode,SHIFTGROUP from emp_master
--WHERE (RESIGNDATE='1900-01-01 00:00:00.000' OR (RESIGNDATE<>'1900-01-01 00:00:00.000' AND RESIGNDATE>@SDATE))   
--and EmpCode in 
--(select EmpCode from Emp_Master 
--where Catcode in (select Catcode from Category_Master where CatName in (select code1 from SelectionTable)))  


------select empcode,SHIFTGROUP in Particular Category  Attendance While Loop till end
                       
                                 
declare emp cursor for                                                                  
select empcode,SHIFTGROUP from emp_master
 WHERE (RESIGNDATE='1900-01-01 00:00:00.000' OR (RESIGNDATE<>'1900-01-01 00:00:00.000' AND RESIGNDATE>@SDATE))   
 and doj  <= @SDATE     
 and EmpCode in (select EmpCode from Emp_Master where Catcode in (select Catcode from Category_Master where CatName in (select code1 from SelectionTable))) 
 
  --where Catcode in (select Catcode from Category_Master where   CatName in ('CASUALS STAFF')))
   --(select code1 from SelectionTable)))
    --and     EmpCode = 'S1144'                               
open emp                                                                  
declare @empcode as varchar(50)                                                                  
DECLARE @SHIFTGROUP AS VARCHAR(2)                                                                  
fetch emp into @empcode,@ShiftGroup                                                                  
while @@fetch_status=0                                                                  
begin  
-------Decalre Variable-------------
DECLARE @ChkInStart AS DATETIME                                                                  
DECLARE @ChkInEnd AS DATETIME                                                                  
DECLARE @ChkOutStart AS DATETIME                               
DECLARE @ChkOutEnd AS DATETIME                                                                  
Declare @Shift as Varchar(10) 
Declare @ShiftCode as Varchar(10)                                                          
                                                         
declare @InTime as datetime                                  
declare @OutTime as datetime                                                          
declare @InId as varchar(500)                        
declare @outId as varchar(500)                                                                  
SET @InId='-'                                            
SET @OUTID='-'                                                                  
SET @InTime='1900-01-01'                                                                  
SET @OutTime='1900-01-01'                                      
set @Shift=0      


----- Select Group intime and Outime Select
IF @SHIFTGROUP ='G1' OR @SHIFTGROUP ='G2'                                     
  BEGIN 
  --select @ChkInStart= dateadd(d,0,@sdate) +' '+PunchStartFrom 
 select  @ChkInStart= dateadd(HOUR, -4, (dateadd(d,0,@sdate) +' '+PunchStartFrom) ) 
  
   ,@ChkInEnd= dateadd(HOUR, 5, (dateadd(d,0,@sdate) +' '+StartTime) ) 
   ,@ChkOutStart=dateadd(HOUR, -3, (dateadd(d,0,@sdate) +' '+EndTime) ) 
   ,@ChkOutEND=dateadd(HOUR, +4, (dateadd(d,0,@sdate) +' '+PunchENDTO) ) 
   
   --,@ChkOutEND=dateadd(d,0,@sdate) +' '+PunchENDTO 
   from Shift_Master   WHERE  ShiftCode =@SHIFTGROUP
   
   --Select * FROM Shift_Master 
   --SELECT * FROM empShiftmatch
  
   select @InTime=isnull(min(SDatetime),'1900-01-01 12:00:00 PM') from tmpAttnLog 
   where empcode=@empcode and sdatetime between @ChkInStart and @ChkInEnd 
    select @InId=isnull(IDTxt,'-') from tmpAttnLog where empcode=@empcode and sdatetime =@InTime    
                                                            
select @OutTime=isnull(MAX(SDatetime),'1900-01-01 12:00:00 PM') from tmpAttnLog 
where empcode=@empcode and sdatetime between @ChkOutStart and @ChkOutEnd and Sdatetime > @inTime 
                                                    
select @outId=isnull(IDTxt,'-') from tmpAttnLog where empcode=@empcode and sdatetime =@OutTime               
                                                                         
select  @Shift =b.shiftid from empShiftmatch a,Shift_Master b where a.id=b.shiftcode and a.empcode=@empcode   
SELECT @empcode
 SELECT @Shift,@empcode ,@InTime, @OutTime ,@inid,@outId,@ChkInStart,@ChkOutStart ,@ChkOutEnd ,@sdate
 WHERE @empcode='SR950'
 
 
  END
  ----------------g1 AND g2 rEADY
  
 
   IF @SHIFTGROUP ='G3' OR @SHIFTGROUP ='G4'                                     
  BEGIN                
  
   --select  @ChkInStart= dateadd(HOUR, -4, (dateadd(d,0,@sdate) +' '+PunchStartFrom) ) 
  
   --,@ChkInEnd= dateadd(HOUR, 4, (dateadd(d,0,@sdate) +' '+StartTime) ) 
   --,@ChkOutStart=dateadd(HOUR, -3, (dateadd(d,0,@sdate) +' '+EndTime) ) 
   --,@ChkOutEND=dateadd(HOUR, +4, (dateadd(d,0,@sdate) +' '+PunchENDTO) ) 
   
   ----,@ChkOutEND=dateadd(d,0,@sdate) +' '+PunchENDTO 
   --from Shift_Master   WHERE  ShiftCode =@SHIFTGROUP AND StartNDay =0
  SET @ChkInStart =@SDATE +' 05:00:00 AM'
  set @ChkInEnd =DATEADD(DAY,1,@Sdate) + ' 07:00:00 AM'   
  --SET @ChkOutEND=dateadd(HOUR, -1, (dateadd(d,0,@sdate) +' '++' 04:00:00 AM')  
  
                      
  select @InTime=isnull(min(SDatetime),'1900-01-01 12:00:00 PM') from tmpAttnLog where empcode=@empcode 
  and sdatetime between @ChkInStart and @ChkInEnd       
  --and inout1=1                                                                
AND idtxt not in (select Inid from tmpTransAt) and idTxt not in (select OutId from tmpTransAt)                  
                                                     
          
                                                        
declare @nextIn as datetime                                                
if @InTime<>'1900-01-01 12:00:00 PM'                                                
select @nextIn=isnull(min(SDatetime),'1900-01-01 12:00:00 PM') from tmpAttnLog where empcode=@empcode and sdatetime > @InTime 
     --and inout=1                                                       
else                                      
set @nextIn='1900-01-01 12:00:00 PM'                                                
                                                
                                                                  
select @InId=isnull(IDTxt,'-') from tmpAttnLog where empcode=@empcode and sdatetime =@InTime  
          
   if @inTime='1900-01-01 12:00:00 AM'                                                              
 begin                                                              
  set @ChkOutStart=@Sdate +' '+'13:00:01 PM'                                                       
  set @ChkOutEnd=dateadd(hh,20,@ChkOutStart)                                                                  
 end                                                
else                                                              
 Begin                                                              
  set @ChkOutStart=dateadd(hh,4,@INTime)                                                                  
  set @ChkOutEnd=dateadd(hh,18,@INTime)                                                                  
 end 
 
 
 if @nextIn <>'1900-01-01 12:00:00 PM'                                                             
select @OutTime=isnull(MAX(SDatetime),'1900-01-01 12:00:00 PM') from tmpAttnLog where empcode=@empcode
 and sdatetime between @ChkOutStart and @ChkOutEnd        
 --and inout=1                                                             
and idTxt not in (select OutId from tmpTransAt where sdate<@Sdate and tmpTransAt.empcode=tmpAttnLog.empcode)   
 and Sdatetime <= @nextIn    
                                                           
else                                                
select @OutTime=isnull(MAX(SDatetime),'1900-01-01 12:00:00 PM') from tmpAttnLog where empcode=@empcode 
and sdatetime between @ChkOutStart and @ChkOutEnd     
--and inout=1                                       
and idTxt not in (select OutId from tmpTransAt where sdate<@Sdate and tmpTransAt.empcode=tmpAttnLog.empcode) 


                                               
select @outId=isnull(IDTxt,'-') from tmpAttnLog where empcode=@empcode and sdatetime =@OutTime                      
                                   
                                                                  
select top 1 @Shift =b.shiftid from empShiftmatch a,Shift_Master b where a.id=b.shiftcode and a.empcode=@empcode                  
                                               
and @InTime between case when InStartPDay='true' then dateadd(d,-1,@Sdate)+ ' '+PunchStartFrom else  @Sdate+ ' '+PunchStartFrom  end 
                 
and case when StartNDay='true' then dateadd(hh,2,dateadd(d,1,@Sdate)+ ' '+StartTime) else  dateadd(hh,2,@Sdate+ ' '+StartTime)  end 
                                                                
                     
                     


 
--select @OutTime=isnull(MAX(SDatetime),'1900-01-01 12:00:00 PM') from tmpAttnLog where empcode=@empcode
-- --and sdatetime between @ChkOutStart and @ChkOutEnd                                                                        
--AND idtxt not in (select Inid from tmpTransAt) and idTxt not in (select OutId from tmpTransAt)  
--  --and Sdatetime < @nextIn 
   
--select @outId=isnull(IDTxt,'-') from tmpAttnLog where empcode=@empcode and sdatetime =@OutTime      
                                     
                     
                                                           
                                                                  
   --SELECT @empcode   

--SELECT @Shift,@empcode ,@InTime, @OutTime ,@inid,@outId,@ChkInStart,@ChkOutStart ,@ChkOutEnd ,@sdate 
--WHERE @empcode='SR950'                             

------------ G3if end                                                
END                           
insert into tmpINOUT                  
select @empcode Empcode,@InTime InTime,@OutTime OutTime,@Shift Shift,DATEDIFF(mi,@Intime,@outtime) TotlaMins,    
                                                              
case when DATEDIFF(mi,@Intime,@outtime)-480>0 then DATEDIFF(mi,@Intime,@outtime)-480 else 0 end OTMins,@InId,@OUTId    
                                                              
                                                              
fetch emp into @empcode,@ShiftGroup                                                                  
end                                        
close emp                     
                                             
deallocate emp                                                                  
                                                                
UPDATE TMPINOUT SET TOTALMINS=0,OTMINS=0 WHERE TOTALMINS>3000                                           
                                                                 
UPDATE TMPINOUT SET TOTALMINS=0,OTMINS=0 WHERE TOTALMINS<0  


SELECT * FROM tmpINOUT

--ablvtable posting                                                                  
                                                           
--PRESENT                                                                  
                                                              
INSERT INTO transAttendAnce             
----- Weekly Off Check And Manual Attendance Check                                                      
select @SDATE,EMPCODE,'LS MILLS',SHIFT,0,'X',1,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID,0,'false',''
 from tmpINOUT                                                         
where intime<>'1900-01-01 12:00:00.000' and outtime<>'1900-01-01 12:00:00.000'
-- and TotalMins>=420                                 
and  empcode not in (Select empcode from emp_master where upper(weeklyoff) =upper(left(datename(w,@Sdate),3)))                     
and Empcode not in (Select EmpCode from TransAttendance where sDate=@Sdate)  

----- Weekly Off Check                                                 
                           
INSERT INTO transAttendAnce                                                                  
select @SDATE,EMPCODE,'LS MILLS',SHIFT,0,'W',1,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID,0,'false' ,''
from tmpINOUT                                                                   
where                                                           
empcode in (Select empcode from emp_master where upper(weeklyoff) =upper(left(datename(w,@Sdate),3)))  
 and Empcode not in (Select EmpCode from TransAttendance where sDate=@Sdate)       
                                                           
                                                                
--absent                                                                  
INSERT INTO transAttendAnce                                                      
select @SDATE,EMPCODE,'LS MILLS',SHIFT,0,'A',1,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID,0,'false' ,''
from tmpINOUT                                                                   
where intime='1900-01-01 12:00:00.000' and outtime='1900-01-01 12:00:00.000'                                 
and Empcode not in (Select EmpCode from TransAttendance where sDate=@Sdate)     
and Empcode in (Select Empcode from Emp_Master where ShiftGroup in ('G2','G3','G4','G5'))  
                                                    
--LEAVE                                                
INSERT INTO transAttendAnce                                                                  
select @SDATE,EMPCODE,'LS MILLS',SHIFT,0,'L',1,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID,0,'false',''
 from tmpINOUT                                                                   
where intime='1900-01-01 12:00:00.000' and outtime='1900-01-01 12:00:00.000'    
and Empcode not in (Select EmpCode from TransAttendance where sDate=@Sdate)  
and Empcode in (Select Empcode from Emp_Master where  Catcode in (1,2))                                         
                                                    
                                                               
--HALF PRESENT                                                           
INSERT INTO transAttendance                                                                          
select @SDATE,EMPCODE,'LS MILLS',SHIFT,0,'/L',0.5,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID,0,'false',''
 from tmpINOUT                                                                           
where intime<>'1900-01-01 12:00:00.000' and outtime<>'1900-01-01 12:00:00.000' 
and TotalMins<470 AND TOTALMins>=240 
and Empcode not in (Select EmpCode from transAttendAnce where sDate=@Sdate)        
and Empcode in (Select Empcode from Emp_Master where Catcode in (1,2))   
                                                                              
--HALF PRESENT                                                           
INSERT INTO transAttendance                                                                          
select @SDATE,EMPCODE,'LS MILLS',SHIFT,0,'/',0.5,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID,0,'false',''
 from tmpINOUT                                        
where intime<>'1900-01-01 12:00:00.000' and outtime<>'1900-01-01 12:00:00.000' 
and TotalMins<470 AND TOTALMins>=240                                                                          
and Empcode not in (Select EmpCode from transAttendAnce where sDate=@Sdate)        

and Empcode in (Select Empcode from Emp_Master where ShiftGroup in ('G3','G4','G5','G6'))

                                                
--EXPECTION                                                                        
INSERT INTO transAttendance        
select @SDATE,EMPCODE,'LS MILLS',SHIFT,0,'/',0.5,'DOWNLOAD',INTIME,OUTTIME,INID,OUTID,0,'false',''
 from tmpINOUT                                                                           
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
                   ------------------ ----------------------
                   
                    ---------Set Shift Code in Transattendance------                          
UPDATE TRANSAttendance set ShiftId=1 where EmpCode in (SELECT empcode from emp_master where shiftgroup='G1') AND SHIFTID=0  
 AND ETYPE='DOWNLOAD'                                        
                                          
UPDATE TRANSAttendance set ShiftId=2 where EmpCode in (SELECT empcode from emp_master where shiftgroup='G2') AND SHIFTID=0   
                      --------------------------------------------      
                                          
update TRANSAttendance set Status='/',DAYVALUE=0.5 where SDate=@SDATE and status='x' and ShiftId=0   AND ETYPE='DOWNLOAD' 

------------------Update EmpID in Transattendance----------------
update TransAttendance set empid=isnull((select empid from emp_master where emp_master.empcode=TransAttendance.empcode),0)
 where sdate=@Sdate  

                              
update TRANSAttendance set latemins=isnull((                                          
Select                                           
DATEDIFF(MINUTE,case when StartNDay='true' then dateadd(d,1,@Sdate)+ ' '+PunchStartTo else  @Sdate+ ' '+PunchStartTo  end,intime)
 from TRANSAttendance a,shift_master b where a.ShiftId=b.ShiftId and  SDate=@SDATE                                 
and TRANSAttendance.Id=a.id),0) where SDate=@Sdate                                          
                                          
Update TRANSAttendance set latemins=0 where latemins<0 and SDate= @sdate                                
        
update TRANSAttendance set latemins=latemins+ case when isnull((                                          
Select                                
DATEDIFF(MINUTE,outtime,case when EndNxtDay='true' then dateadd(d,1,@Sdate)+ ' '+PunchEndFrom else  @Sdate+ ' '+PunchEndFrom  end) 
                                
from TRANSAttendance a,shift_master b where a.ShiftId=b.ShiftId and  SDate=@SDATE                                 
and TRANSAttendance.Id=a.id),0)>0 then  
isnull((                                          
Select                                
DATEDIFF(MINUTE,outtime,case when EndNxtDay='true' then dateadd(d,1,@Sdate)+ ' '+PunchEndFrom else  @Sdate+ ' '+PunchEndFrom  end)   
                              
from TRANSAttendance a,shift_master b where a.ShiftId=b.ShiftId and  SDate=@SDATE                                 
and TRANSAttendance.Id=a.id),0)
 else 0 end where SDate=@Sdate                                          


Update TRANSAttendance set latemins=0 where INID='-' and SDate= @sdate                                          
Update TRANSAttendance set latemins=0 where outid='-' and SDate= @sdate                                          
                                          
                                         
declare @eid as bigint                                          
declare @eempcode as varchar(50)                                   
declare @lmin as float                                          
declare cur4 cursor for                                          
SELECT id,EmpCode,latemins FROM TransAttendance where SDate=@sdate and latemins>0 and ShiftId in (1,2,3)
and EmpCode in (select EmpCode from Emp_Master where Catcode in (select Catcode from Category_Master 
where CatName in (select code1 from SelectionTable)))                    
                                    
open cur4                                          
fetch cur4 into @eid,@eempcode,@lmin                                          
while @@FETCH_STATUS=0                               
begin                                          
declare @pcount as bigint                                          
select @pcount =COUNT(*) from TRANSAttendance where month(sdate)=month(@sdate) and YEAR(sdate)=YEAR(@sdate) and Id <>@eid  
and EmpCode=@eempcode                                
if @pcount <0                                          
 begin                                          
  if @lmin<=120                                          
   BEGIN    
 DECLARE @WOFF AS VARCHAR(10)    
   SELECT @WOFF=Emp_Master.WeeklyOff FROM Emp_Master WHERE EmpCode=@eempcode     
   IF UPPER(LEFT(DATENAME (WEEKDAY,@Sdate),3)) <> @WOFF     
         update TRANSAttendance set Status='x',permision='true' where Id=@eid  AND ETYPE='DOWNLOAD' AND STATUS='X'   
                                                 
    END    
  end                                          
 else                                
 begin                                
    update TRANSAttendance set Status='/' ,DAYVALUE =0.5,permision='false' where Id=@eid   AND ETYPE='DOWNLOAD' AND Status='X'    
                                          
 end                                
                                
fetch cur4 into @eid,@eempcode,@lmin                                          
end                   
close cur4                                          
deallocate cur4



--select * from TRANSAttendance where     EmpCode ='Sr1017' and SDate >='2017-10-24' 