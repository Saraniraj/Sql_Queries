USE PowerERP_ACV
GO
/****** Object:  UserDefinedFunction [dbo].[Fun_PRoll_Earnings]    Script Date: 27-Mar-23 16:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- ============================================================        
-- Author  : RAJKUMAR.K        
-- Create date : 03/11/2022        
-- Description : Get Employee Monthly Attendance Details       
-- =============================================================        
-- Grant Execute On sp_GetEmployeeMaster_Details To Public        
--- select *  from  Fun_PRoll_Earnings ('2022-01-31' )   


create function [dbo].[Fun_PRoll_Earnings] (@Sdate as datetime )  returns Table

return    
(    

	 
select a.EmpCode,b.EmpName as EmpName,'Basic' as Type ,a.Basic as Wages ,a.AttnEarning  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate  
and a.Basic  <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   
union all
select a.EmpCode,b.EmpName as EmpName,'Weekoff Salary' as Type ,0 as Wages ,a.Weekoff_Salary  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate 
and Weekoff_Salary <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   

union all
select a.EmpCode,b.EmpName as EmpName,'NHFH' as Type ,0 as Wages ,NHFH_Salary  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate 
and NHFH_Salary  <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   

union all
select a.EmpCode,b.EmpName as EmpName,'OVERTIME' as Type ,0 as Wages , OT_SALARY  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate 
and OT_SALARY <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   

union all
select a.EmpCode,b.EmpName as EmpName,'INCENTIVE' as Type ,0 as Wages ,a.Monthly_inc  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate 
and Monthly_inc  <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   
 
union all
select a.EmpCode,b.EmpName as EmpName,'MERIT' as Type ,0 as Wages ,a.Merit_Amount  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate 
and Merit_Amount  <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   

--GROUP BY a.CatCode,c.CatName ,Datename(month, SDATE),YEAR(SDATE),MONTH(SDATE)
--,b.Sex ,b.EmpName,a.EmpCode,b.resigndate,b.doj,d.deptname
--having  SUM(TotalEarnings )<>0
 )

