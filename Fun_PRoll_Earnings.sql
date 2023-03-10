USE [LS_HRD_B]
GO
/****** Object:  UserDefinedFunction [dbo].[Fun_PRoll_Earnings]    Script Date: 15/11/2022 16:34:10 ******/
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
--- select *  from  Fun_PRoll_Earnings ('2022-09-30' )   


ALTER function [dbo].[Fun_PRoll_Earnings] (@Sdate as datetime )  returns Table

return    
(    


 
select a.EmpCode,b.EmpName as EmpName,'Basic' as Type ,a.Basic as Wages ,a.AttnEarning  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate  
and a.Basic  <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   
union all
select a.EmpCode,b.EmpName as EmpName,'HRAAmount' as Type ,a.HRAAmount1 as Wages ,a.HRAAmount  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate 
and HRAAmount1 <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   

union all
select a.EmpCode,b.EmpName as EmpName,'MEDICAL' as Type ,a.MEDICAL1 as Wages ,a.MEDICAL  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate 
and MEDICAL1  <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   

union all
select a.EmpCode,b.EmpName as EmpName,'ENTERTAIN' as Type ,a.ENTERTAIN1 as Wages ,a.ENTERTAIN  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate 
and ENTERTAIN1 <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   

union all
select a.EmpCode,b.EmpName as EmpName,'Convey' as Type ,a.Convey1 as Wages ,a.Convey  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate 
and Convey1  <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   

union all
select a.EmpCode,b.EmpName as EmpName,'Hair' as Type ,a.Hair1 as Wages ,a.Hair  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate 
and Hair1  <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   
union all
select a.EmpCode,b.EmpName as EmpName,'Wash' as Type ,a.Wash1  as Wages ,a.Wash  as Amount 
from   SalStoreTable  as a   
LEFT JOIN Emp_Master as b  ON B.EMPCODE=A.EMPCODE  
where a.sdate =@Sdate 
and Wash1 <>0
and b.EmpName  <> 'NONE' and b.DOJ<@Sdate   


--GROUP BY a.CatCode,c.CatName ,Datename(month, SDATE),YEAR(SDATE),MONTH(SDATE)
--,b.Sex ,b.EmpName,a.EmpCode,b.resigndate,b.doj,d.deptname
--having  SUM(TotalEarnings )<>0
 )
