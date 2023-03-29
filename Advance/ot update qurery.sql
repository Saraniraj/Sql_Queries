update TRANSAttendance set   
Shift_mts=         isnull(  DateDiff(Minute, cast(cast(cast( case when StartNDay=1 then dateadd(d, 1, a.SDate)  Else a.SDate End   As Date) As varchar(30))+' '+b.StartTime  as datetime)     
,cast(cast(cast(   Case When EndNxtDay=1 Then dateadd(d,1,a.SDate)  Else a.SDate End   As Date) As varchar(30))+' '+b.EndTime  as datetime)  ) ,0) 
,Total_mts=        isnull( Case    when a.outtime<>'1900-01-01 12:00:00' and a.INTIME<>'1900-01-01 12:00:00' 
then DATEDIFF(MINUTE, a.INTIME , a.outtime) else '0' end ,0)       

,latemins=        isnull( Case    when  Status in ('X','x','/','/a') then Case    when a.outtime<>'1900-01-01 12:00:00' and a.INTIME<>'1900-01-01 12:00:00' then  
DateDiff(Minute,      cast(cast(cast( case when StartNDay=1 then  
dateadd(d, 1, a.SDate)  Else a.SDate End   As Date) As varchar(30))+' '+b.StartTime  as datetime)  , a.intime    ) else  0 end else  0 end    ,0) 

,earlymins=        isnull( Case    when  Status in ('X','x','/','/a') then Case    when a.outtime<>'1900-01-01 12:00:00'   then  
DATEDIFF(MINUTE,outtime,case when EndNxtDay='true' then dateadd(d,1,a.SDate)+ ' '+EndTime else a.SDate + ' '+EndTime end) else '0' end else  0 end   ,0) 

,Launch_mts=        isnull( Case    when  Status in ('X','x','/','/a') then Case    when a.LaunchOUTTIME<>'1900-01-01 12:00:00' and a.LaunchINTIME<>'1900-01-01 12:00:00'  
then DATEDIFF(MINUTE, a.LaunchINTIME , a.LaunchOUTTIME) else '0' end else  0 end ,0)   

,Early_OT=        isnull( Case    when  Status in ('X','x','/','/a') then Case    when a.outtime<>'1900-01-01 12:00:00' and a.INTIME<>'1900-01-01 12:00:00'   then   
DateDiff(Minute, a.intime,Case When StartNDay=1 Then dateadd(d, 1, a.SDate)+ ' '+b.StartTime else a.SDate + ' '+b.StartTime end)  
Else '0' end else  0 end    ,0)  

,OT=        isnull( Case  
  when  Status in ('X','x','/','/a') then Case    When a.outtime<>'1900-01-01 12:00:00' and a.INTIME<>'1900-01-01 12:00:00' then   
DateDiff(Minute, cast(cast(cast( case when EndNxtDay='true' then   
DateAdd(d, 1, a.SDate)  Else a.SDate End   As Date) As varchar(30))+' '+b.EndTime  as datetime)      
, a.outtime    ) else  0 end 
   when  Status in ('OT') then isnull( Case    when a.outtime<>'1900-01-01 12:00:00' and a.INTIME<>'1900-01-01 12:00:00' 
 then DATEDIFF(MINUTE, a.INTIME , a.outtime) else '0' end ,0)

else  0 end   ,0)  


FROM TRANSAttendance a       
INNER JOIN shift_master  b On b.ShiftId = a.ShiftId        
WHERE sdate = '2023-01-27 00:00:00.000' 
and EmpCode = 'FDR48' 



Update TRANSAttendance set  Total_mts=        isnull( Case    when      
    Total_mts> = Shift_mts 
then  Total_mts- Shift_mts  else 0 end  ,0 )    
,LateMins=        isnull( Case    when         latemins > 0 
then  latemins  else 0 end  ,0 )    
,earlymins=        isnull( Case    when    STATUS IN ('X','x') then case when   earlymins > 0      
then  earlymins  else 0 end else 0 end   ,0 )    
,Early_OT=        isnull( Case    when    STATUS IN ('X','x') then case when   Early_OT > 0      
then  Early_OT  else 0 end else 0 end   ,0 )    
,OT=        isnull( Case    when    STATUS IN ('X','x') then case when   OT > 0   
 then  OT  else 0 end
  when  Status in ('OT') then OT
 else 0 end   ,0 )    
WHERE sdate = '2023-01-27 00:00:00.000' 
and EmpCode = 'FDR48' 


select * FROM TRANSAttendance a       
INNER JOIN shift_master  b On b.ShiftId = a.ShiftId        
WHERE sdate = '2023-01-27 00:00:00.000' 
and EmpCode = 'FDR48' 