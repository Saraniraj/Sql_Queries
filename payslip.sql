
SELECT                         
                    
                    
SDate,A.EmpCode,FingerId, EmpName ,FatherName                       
ESINo ,UanNo ,PFNo ,C.CatName,Deptname, DesgnName                        
                    
DOJ, DOB, Sex                       
                     
,a.Present,a.Absent,a.Leave ,a.WeeklyOff                       
,a.NH +a.FH as NHFH ,a.TotalDays,a.PaidDays    
,a.TotalEarnings ,a.TotalDeductions 
                    
--case when a.CatCode IN  (1,2,6,7,3,10,14,15)                       
-- then    a.Basic+HRAAmount1+MEDICAL1+ENTERTAIN1+Wash1+Hair1+Convey1                        
-- when a.CatCode IN  (3,10) then    a.Basic+HRAAmount1+MEDICAL1+Wash1+Hair1+Convey1                        
-- when a.CatCode in (4,5)                        
-- then    round(((DaPoint-LessPoint) * DaPaise)/Salaryday1 * 26,2)+A.FDA+A.Basic                         
--   else    end  as Wages                          
--case when a.CatCode IN  (1,2)                      
--  then     round(((a.Basic+HRAAmount1+MEDICAL1+ENTERTAIN1+Wash1+Hair1+Convey1)/30),2)                        
-- when a.CatCode in (3,10)                       
--  then     round(((a.Basic+HRAAmount1+MEDICAL1+Wash1+Hair1+Convey1)/26),2)                          
-- when a.CatCode in (4,5)                        
-- then     round(((((((DaPoint-LessPoint) * DaPaise)/Salaryday1) * 26)+A.FDA+A.Basic)/26),2)                           
                    
--  when a.CatCode in (6,7,14,15)  then     round(((a.Basic+HRAAmount1+MEDICAL1+ENTERTAIN1+Wash1+Hair1+Convey1)/26),2)                        
--     else   end  as RsPerDay                          
--case when a.CatCode IN  (1,2)                       
-- then    round(((a.Basic+HRAAmount1+MEDICAL1+ENTERTAIN1+Wash1+Hair1+Convey1)*60/100),2)                        
-- when a.CatCode IN  (3,10)                     
-- then    round(((a.Basic+HRAAmount1+MEDICAL1+ENTERTAIN1+Wash1+Hair1+Convey1)*60/100),2)                        
-- when a.CatCode in (14,15)                      
-- then    round(((a.Basic+HRAAmount1+MEDICAL1+ENTERTAIN1+Wash1+Hair1+Convey1)*60/100),2)                         
-- when a.CatCode in (6,7)                
-- then    round(((a.Basic+HRAAmount1+MEDICAL1+ENTERTAIN1+Wash1+Hair1+Convey1)*60/100),2)               
---- then    round(((((((DaPoint-LessPoint) * DaPaise)/Salaryday1) * 26)+A.FDA+A.Basic)*60/100),2)                         
-- else  0 end  as Fixed_Basic                       
                    
--case when a.CatCode IN  (1,2) then    round((HRAAmount+MEDICAL ),2)                         
-- when a.CatCode IN  (3,10) then  round((HRAAmount+MEDICAL ),2)                        
                    
-- when a.CatCode in (14,15)then   round((HRAAmount+MEDICAL ),2)                         
-- when a.CatCode in (6,7) then    round((HRAAmount+MEDICAL ),2)                           
-- else  0 end  as HRAAmount                      
--case when a.CatCode IN  (1,2) then    round((Wash ),2)                         
-- when a.CatCode in (3,10)then   round((Wash ),2)                         
-- when a.CatCode in (14,15)then   round((Wash ),2)                         
-- when a.CatCode in (6,7) then    round((Wash ),2)                           
-- else  0 end  as EA_Wash                       
--case when a.CatCode IN  (1,2) then    round((Convey ),2)                          
-- when a.CatCode IN  (3,10) then  round((Hair +Convey  ),2)                        
-- when a.CatCode in (14,15)then   round((Convey ),2)                         
-- when a.CatCode in (6,7) then    round((Convey ),2)                           
-- else  0 end  as EA_Convey                      
                    
                    
--a.LeaveSalary    ,round(a.AttnEarning,2) as AttnEarning                        
                    
--AttnEarnRound                          
                         
--a.AttnEarning +HRAAmount+MEDICAL  +Wash+ENTERTAIN+TAAmount  as Total                          
--PFAmount, EmpESIAmount,   Advance, BankLoan, LIC, PTax                          
-- Ded1, Ded2, Ded3,ded4,Ded5,dedround                          
--  ,a.TotalEarnings , TotalDeductions, a.NetAmount                         
--  ,MaxPFSalary ,MaxESISalary ,round(a.AttnEarning,2)+a.LeaveSalary   AS PFSource,a.ESISource                       
--a.LOPAmount,a.PFAmount,a.EPFAmount,a.EPSAmount                       
--a.ESIAmount,a.EmpESIAmount,a.MDESIAmount                       
--a.TotalEarnings,a.TotalDeductions,a.NetAmount                       
                   
--a.Canteen,a.BankLoan                       
--a.Ded1,a.Ded2,a.Ded3,a.Ded4,a.Ded5                       
--a.LIC,a.PTax,a.Advance                       
--a.DaPoint,a.DaPaise,a.FDA,a.DAAmount,a.FDAAmount                       
--a.Earn1,a.Earn2,a.Earn3,a.Earn4,a.Earn5                       
--a.SalaryDay                       
--a.PF,a.EPF,a.EPS,a.ESI,a.EmpESI,a.MDESI                       
--a.MaxPFSalary,a.MaxESISalary,a.MinESISalary                       
--a.HRAAmount1,a.DAAmount1                       
--a.MEDICAL1,a.ENTERTAIN1                       
--a.Wash1,a.Hair1,a.Convey1,a.TAAmount1                       
--a.EarnRound,a.DedRound,a.AttnEarnRound                       
--a.EarnDay ,a.GrossAmount,a.Grossround                       
--case when b.PFNo IN  (,-,0) then   1                     
-- else   end  as groupno                      
--d.SLNO as DeptSno ,EmpCodeId                     
                    
               
from SalStoreTable  as a                      
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
left join category_master as c on c.CatCode  =A.CatCode   
left join Deptmaster as d on d.DeptCode =b.Deptcode    
left join designation as e on e.DesgnCode  =b.DesgnCode                      
                      
where   a.sdate ='2022-09-30'
and a.EmpCode like  'br620'      


select a.Empcode ,b.EmpName ,

case when a.CatCode IN  (1,2 )                       
 then    a.Basic+HRAAmount1+MEDICAL1+ENTERTAIN1+Wash1+Hair1+Convey1   else 0 end  as ConsWages ,b.Basic,b.wpday 
 ,a.PFAmount ,a.EmpESIAmount ,a.Advance ,a.BankLoan ,a.Canteen,a.LIC ,a.PTax 
 ,a.Ded1 ,a.Ded2 ,a.Ded3 ,a.Ded4 ,a.Ded5 
 ,a.*

 from SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
left join category_master as c on c.CatCode  =A.CatCode   
left join Deptmaster as d on d.DeptCode =b.Deptcode    
left join designation as e on e.DesgnCode  =b.DesgnCode    
where 
a.sdate ='2022-09-30'
and a.EmpCode like  'br620'      



--select a.EmpCode,'Basic' as Type ,a.Basic as Wages ,a.AttnEarning  as Amount 
--from   SalStoreTable  as a   
--LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
--where a.sdate ='2022-09-30' and a.EmpCode like  'br620'  
--union all
--select a.EmpCode,'HRAAmount' as Type ,a.HRAAmount1 as Wages ,a.HRAAmount  as Amount 
--from   SalStoreTable  as a   
--LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
--where a.sdate ='2022-09-30' and a.EmpCode like  'br620' 

--union all
--select a.EmpCode,'MEDICAL' as Type ,a.MEDICAL1 as Wages ,a.MEDICAL  as Amount 
--from   SalStoreTable  as a   
--LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
--where a.sdate ='2022-09-30' and a.EmpCode like  'br620' 

--union all
--select a.EmpCode,'ENTERTAIN' as Type ,a.ENTERTAIN1 as Wages ,a.ENTERTAIN  as Amount 
--from   SalStoreTable  as a   
--LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
--where a.sdate ='2022-09-30' and a.EmpCode like  'br620' 

--union all
--select a.EmpCode,'Convey' as Type ,a.Convey1 as Wages ,a.Convey  as Amount 
--from   SalStoreTable  as a   
--LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
--where a.sdate ='2022-09-30' and a.EmpCode like  'br620' 

--union all
--select a.EmpCode,'Hair' as Type ,a.Hair1 as Wages ,a.Hair  as Amount 
--from   SalStoreTable  as a   
--LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
--where a.sdate ='2022-09-30' and a.EmpCode like  'br620' 
--union all
--select a.EmpCode,'Wash' as Type ,a.Wash1  as Wages ,a.Wash  as Amount 
--from   SalStoreTable  as a   
--LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
--where a.sdate ='2022-09-30' and a.EmpCode like  'br620' 