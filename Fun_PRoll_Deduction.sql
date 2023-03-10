USE [LS_HRD_B]
GO
/****** Object:  UserDefinedFunction [dbo].[Fun_EmpPerdayWages]    Script Date: 15/11/2022 16:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ============================================================        
-- Author  : RAJKUMAR.K        
-- Create date : 03/04/2017        
-- Description : Get Employee Monthly Attendance Details       
-- =============================================================        
-- Grant Execute On sp_GetEmployeeMaster_Details To Public        
--- select *  from  Fun_PRoll_Deduction ('2022-09-30' )   


Alter function [dbo].[Fun_PRoll_Deduction] (@Sdate as datetime )  returns Table

return    
(    


 
select a.EmpCode,b.EmpName as EmpName,'PFAmount' as Type ,a.PFAmount  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate 
and a.PFAmount  <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   
union all
select a.EmpCode,b.EmpName as EmpName,'ESIAmount' as Type   ,a.EmpESIAmount  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate
and EmpESIAmount <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   

union all
select a.EmpCode,b.EmpName as EmpName,'Advance' as Type   ,a.Advance  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate
and Advance  <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   


union all
select a.EmpCode,b.EmpName as EmpName,'BankLoan' as Type   ,a.BankLoan  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate
and BankLoan <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   

union all
select a.EmpCode,b.EmpName as EmpName,'Canteen' as Type  ,a.Canteen  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate
and Canteen  <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   
 
union all
select a.EmpCode,b.EmpName as EmpName,'LIC' as Type  ,a.LIC  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate
and LIC  <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   
union all
select a.EmpCode,b.EmpName as EmpName,'PTax' as Type  ,a.PTax  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate
and PTax <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   




union all
select a.EmpCode,b.EmpName as EmpName,'ded1' as Type  ,a.ded1  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate
and ded1 <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   
union all
select a.EmpCode,b.EmpName as EmpName,'ded2' as Type  ,a.ded2  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate
and ded2 <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   

union all
select a.EmpCode,b.EmpName as EmpName,'ded3' as Type  ,a.ded3  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate
and ded3 <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   

union all
select a.EmpCode,b.EmpName as EmpName,'ded4' as Type  ,a.ded4  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate
and ded4 <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   
union all
select a.EmpCode,b.EmpName as EmpName,'ded5' as Type  ,a.ded5  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate
and ded5 <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   



--GROUP BY a.CatCode,c.CatName ,Datename(month, SDATE),YEAR(SDATE),MONTH(SDATE)
--,b.Sex ,b.EmpName,a.EmpCode,b.resigndate,b.doj,d.deptname
--having  SUM(TotalEarnings )<>0
 )
