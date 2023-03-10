USE [DB_HRMS]
GO
/****** Object:  UserDefinedFunction [dbo].[Fun_EmpMeritAllowance]    Script Date: 24/12/2022 09:57:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================================        
-- Author  : RAJKUMAR.K        
-- Create date : 03/04/2017        
-- Description : Get Employee Monthly Bonus Details       
-- =============================================================        
-- Grant Execute On sp_GetEmployeeMaster_Details To Public        
--- select *  from [Fun_EmpMeritAllowance] ('Main unit','2022-11-01','2022-11-30')   order by fingerid

ALTER function [dbo].[Fun_EmpMeritAllowance] (
@Location_code    Varchar(20),  
@Fdate as datetime
,@Tdate as datetime)  returns Table

return    
(    
 selecT p.empcode,p.fingerid ,p.empname,p.Sex,P.ShiftGroup   ,p.catcode,p.Deptcode,p.Desgncode 
 ,p.CatName ,p.Deptname as Deptname ,p.DesgnName  ,p.Present as Present ,p.AB as ABLV,p.woff  as woff 
 ,p.Woff_Psent as Woff_Psent
 , Present +AB +woff+Woff_Psent  as Tot 
 , Present +Woff_Psent  as Paid_Days 

 ,PerDayAmt as PerDayAmt  ,merit_Amount  as amount
 
 
 
  

 
 ,Amount1=round((Present+Woff_Psent)* sum(PerDayAmt) ,0)  
 
   ,ResignDate   ,p.depslno  as depslno  
    ,acno,p.BankName  
 ,p.EmpCodeId
   ,p.Account_Type ,p.Branch_Code ,p.IFSC_Code   ,p.Location_Code  
 FROM  ( 
 
 select  a.empcode,a.FingerId ,a.catcode,a.Desgncode ,a.Sex ,A.SHIFTGROUP  ,SUM(Present) as Present,sum(AB) as AB
  ,sum(woff) as woff 
  ,sum(Woff_Psent) as Woff_Psent
   ,acno,f.BankName   ,a.empname,b.CatName ,c.DeptName as DeptName ,a.EmpCodeId ,a.Deptcode,e.DesgnName as DesgnName  
,case when (sum(Present)+sum(Woff_Psent)) =26 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup ='G4'     then  50  
when (sum(Present)+sum(Woff_Psent)) =27 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup ='G4'     then  55  
when (sum(Present)+sum(Woff_Psent)) =28 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup ='G4'     then  60  
when (sum(Present)+sum(Woff_Psent)) =29 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup ='G4'     then  65  
when (sum(Present)+sum(Woff_Psent)) =30 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup ='G4'     then  70  
when (sum(Present)+sum(Woff_Psent)) =31 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup ='G4'     then  75  
      
when (sum(Present)+sum(Woff_Psent)) =26 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup IN ('G1','G2','G3','G5')     then  30   
when (sum(Present)+sum(Woff_Psent)) =27 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup IN ('G1','G2','G3','G5')    then  35  
when (sum(Present)+sum(Woff_Psent)) =28 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup IN ('G1','G2','G3','G5')     then  40  
when (sum(Present)+sum(Woff_Psent)) =29 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup IN ('G1','G2','G3','G5')    then  45  
when (sum(Present)+sum(Woff_Psent)) =30 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup IN ('G1','G2','G3','G5')    then  50  
when (sum(Present)+sum(Woff_Psent)) =31 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup IN ('G1','G2','G3','G5')    then  55  


when (sum(Present)+sum(Woff_Psent)) =26 AND  b.CatName='WORKERS 1' and c.DeptName ='WAREHOUSE' AND A.ShiftGroup ='G4'     then  25   
when (sum(Present)+sum(Woff_Psent)) =27 AND  b.CatName='WORKERS 1' and c.DeptName ='WAREHOUSE' AND A.ShiftGroup ='G4'     then  25  
when (sum(Present)+sum(Woff_Psent)) =28 AND  b.CatName='WORKERS 1' and c.DeptName ='WAREHOUSE' AND A.ShiftGroup ='G4'     then  25  
when (sum(Present)+sum(Woff_Psent)) =29 AND  b.CatName='WORKERS 1' and c.DeptName ='WAREHOUSE' AND A.ShiftGroup ='G4'     then  25  
when (sum(Present)+sum(Woff_Psent)) =30 AND  b.CatName='WORKERS 1' and c.DeptName ='WAREHOUSE' AND A.ShiftGroup ='G4'     then  25  
when (sum(Present)+sum(Woff_Psent)) =31 AND  b.CatName='WORKERS 1' and c.DeptName ='WAREHOUSE' AND A.ShiftGroup ='G4'     then  25  
   
   
else 0 end  as  PerDayAmt


,case when (sum(Present)+sum(Woff_Psent)) =26 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup ='G4'  then  ((sum(Present)+sum(Woff_Psent))*50)  
when (sum(Present)+sum(Woff_Psent)) =27 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup ='G4'     then  ((sum(Present)+sum(Woff_Psent))*55  )
when (sum(Present)+sum(Woff_Psent)) =28 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup ='G4'     then  ((sum(Present)+sum(Woff_Psent))*60  )
when (sum(Present)+sum(Woff_Psent)) =29 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup ='G4'     then  ((sum(Present)+sum(Woff_Psent))*65 ) 
when (sum(Present)+sum(Woff_Psent)) =30 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup ='G4'     then  ((sum(Present)+sum(Woff_Psent))*70  )
when (sum(Present)+sum(Woff_Psent)) =31 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup ='G4'     then  ((sum(Present)+sum(Woff_Psent))*75)  
      
when (sum(Present)+sum(Woff_Psent)) =26 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup IN ('G1','G2','G3','G5')     then ((sum(Present)+sum(Woff_Psent))* 30   )
when (sum(Present)+sum(Woff_Psent)) =27 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup IN ('G1','G2','G3','G5')    then  ((sum(Present)+sum(Woff_Psent))*35  )
when (sum(Present)+sum(Woff_Psent)) =28 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup IN ('G1','G2','G3','G5')     then  ((sum(Present)+sum(Woff_Psent))*40  )
when (sum(Present)+sum(Woff_Psent)) =29 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup IN ('G1','G2','G3','G5')    then  ((sum(Present)+sum(Woff_Psent))*45  )
when (sum(Present)+sum(Woff_Psent)) =30 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup IN ('G1','G2','G3','G5')    then  ((sum(Present)+sum(Woff_Psent))*50  )
when (sum(Present)+sum(Woff_Psent)) =31 AND  b.CatName='WORKERS 1' and c.DeptName ='WEAVING' AND A.ShiftGroup IN ('G1','G2','G3','G5')    then  ((sum(Present)+sum(Woff_Psent))*55  )


when (sum(Present)+sum(Woff_Psent)) =26 AND  b.CatName='WORKERS 1' and c.DeptName ='WAREHOUSE' AND A.ShiftGroup ='G4'     then  ((sum(Present)+sum(Woff_Psent))*25  ) 
when (sum(Present)+sum(Woff_Psent)) =27 AND  b.CatName='WORKERS 1' and c.DeptName ='WAREHOUSE' AND A.ShiftGroup ='G4'     then  ((sum(Present)+sum(Woff_Psent))*25 ) 
when (sum(Present)+sum(Woff_Psent)) =28 AND  b.CatName='WORKERS 1' and c.DeptName ='WAREHOUSE' AND A.ShiftGroup ='G4'     then  ((sum(Present)+sum(Woff_Psent))*25  )
when (sum(Present)+sum(Woff_Psent)) =29 AND  b.CatName='WORKERS 1' and c.DeptName ='WAREHOUSE' AND A.ShiftGroup ='G4'     then ((sum(Present)+sum(Woff_Psent))* 25  )
when (sum(Present)+sum(Woff_Psent)) =30 AND  b.CatName='WORKERS 1' and c.DeptName ='WAREHOUSE' AND A.ShiftGroup ='G4'     then ((sum(Present)+sum(Woff_Psent))* 25  )
when (sum(Present)+sum(Woff_Psent)) =31 AND  b.CatName='WORKERS 1' and c.DeptName ='WAREHOUSE' AND A.ShiftGroup ='G4'     then  ((sum(Present)+sum(Woff_Psent))*25 ) 
   
       
when (sum(Present)+sum(Woff_Psent)) =26 AND  b.CatName='WORKERS 1' and c.DeptName ='GENERAL' AND A.ShiftGroup IN ('G1','G2','G3','G4','G5')    then 300
when (sum(Present)+sum(Woff_Psent)) =27 AND  b.CatName='WORKERS 1' and c.DeptName ='GENERAL' AND A.ShiftGroup IN ('G1','G2','G3','G4','G5')    then  300
when (sum(Present)+sum(Woff_Psent)) =28 AND  b.CatName='WORKERS 1' and c.DeptName ='GENERAL' AND A.ShiftGroup IN ('G1','G2','G3','G4','G5')     then 300
when (sum(Present)+sum(Woff_Psent)) =29 AND  b.CatName='WORKERS 1' and c.DeptName ='GENERAL' AND A.ShiftGroup IN ('G1','G2','G3','G4','G5')    then  300
when (sum(Present)+sum(Woff_Psent)) =30 AND  b.CatName='WORKERS 1' and c.DeptName ='GENERAL' AND A.ShiftGroup IN ('G1','G2','G3','G4','G5')    then 300
when (sum(Present)+sum(Woff_Psent)) =31 AND  b.CatName='WORKERS 1' and c.DeptName ='GENERAL' AND A.ShiftGroup IN ('G1','G2','G3','G4','G5')    then  300


else 0 end  as  merit_Amount

 
  ,ResignDate    ,c.SlNo  as depslno     ,a.Account_Type ,a.Branch_Code ,a.IFSC_Code    ,a.Location_Code   
 from Emp_Master a 
 left join  Category_Master b on b.CatCode =a.Catcode 
 left join Deptmaster c on c.DeptCode =a.Deptcode  
 left join Designation e on e.DesgnCode =a.Desgncode 
 left join  Bank_Master f  on f.BankCode =a.Bankcode 
 left join  Fun_AttendancenAbstract   (@Location_code, @Fdate , @Tdate)  as h on h.EmpCode =a.EmpCode 
 --left join Attn_Incentive as i on i.CatCode =a.CatCode   and i.Deptcode =a.DeptCode    
 --AND i.Effect_from <=@Tdate      
 --AND i.Effect_to >=@Tdate            



 where  A.Sex like  '%' 
 and        (a.resigndate='1900-01-01' OR ( a.ResignDate <>'1900-01-01'  AND a.Resigndate> =@Tdate )) 
 AND a.doj<= @Fdate
 and a.Catcode in ('5')
 ---------- Corona Period leave adjust on before 13 th@Fdate
 group by   a.empcode,a.FingerId,a.catcode,a.Desgncode   ,acno,f.BankName ,a.empname,b.CatName ,c.DeptName ,a.EmpCodeId,a.Deptcode
 ,e.DesgnName 
  ,ResignDate ,a.Sex   
  --,i.Working_Days,i.Perday   ,i.CatCode ,i.Deptcode ,I.Shift_type 
     ,c.SlNo      ,a.Account_Type ,a.Branch_Code ,a.IFSC_Code   
  ,A.ShiftGroup    ,a.Location_Code 
 
 )p 
 
 group by  p.empcode,p.FingerId,p.catcode,p.Desgncode ,p.sex ,p.Present,p.AB,acno,p.BankName 
  ,p.empname,p.CatName ,p.DesgnName   ,p.Account_Type ,p.Branch_Code ,p.IFSC_Code 
 ,p.EmpCodeId,p.Deptcode,p.Deptname ,p.ResignDate,P.empcodeid ,p.woff  ,p.depslno  
 ,p.Woff_Psent, p.Location_Code ,p.PerDayAmt ,P.ShiftGroup 
 ,p.merit_Amount 
  having  p.merit_Amount  <>0      
 ---order by  Catcode ,depslno, empcodeid   


)




