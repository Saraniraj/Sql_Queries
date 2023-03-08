USE  MY_Attendance_SAO 
GO
/****** Object:  UserDefinedFunction [dbo].[RG1_YarnStock_Statement]    Script Date: 22/11/2022 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		K.Rajkumar
-- Create date: 01-12-2022
-- Description:	<Description,,>
-- =============================================


--  select * from Fun_HRDAdvance_Deductions ('100','THENI','3','SMWR1','2022-09-01','2022-11-30')  order by EmpName,Trans_Date

alter FUNCTION  [dbo].[Fun_HRDAdvance_Deductions] (
@comp_code as varchar(30)
,@location_code as varchar(30)
,@fin_year_code as varchar(30)
,@count as varchar(300)

,@Fromdate as datetime
,@Todate as datetime

) 
returns Table  
return  
(  


select      p.Empcode  ,p.EmpName        ,p.trans_date  as Trans_Date
, sum(Opening) as Opening   ,sum(current_Adv) as Advance        ,sum(Paid_Amount) as Deductions   
,sum(Closing)  as Closing       
 
 

from  (      
	
select   M.location_code , Trans_date,   M.Empcode,M.EmpName  ,0 as Opening,0 as   current_Adv    ,0 as   Paid_Amount 
,((Sum(Opening)+Sum(current_Adv)-sum( Paid_Amount)   ))  as Closing 
	from (
	
	select    a.location_code  , @Fromdate  as Trans_date    ,a.Empcode,b.EmpName, sum(Opening) as Opening,0 as   current_Adv    ,0 as   Paid_Amount 
	,0   as Closing 
from IV_HRDAdvance_Ledger a   
LEFT JOIN Emp_Master as b  ON b.location_code=a.Location_Code  and  B.EMPCODE=A.EMPCODE    
where a.Location_Code =@location_code  and  a.Comp_Code  =@comp_code   
	and trans_type='Opening' 
	 --and a.Fin_Year_Code  =2          
	  and a.Trans_Date  > ='2021-04-01' 
	And a.Trans_Date <=@Fromdate
	and a.Empcode=@count
	Group By a.Empcode,b.EmpName,a.comp_code,a.location_code      
	union all     

	select    a.location_code    ,@Fromdate  as Trans_date        , a.Empcode,b.EmpName        , 0 as Opening,sum(current_Adv)current_Adv    ,sum(Paid_Amount) as Paid_Amount 
	,0 as Closing    
from IV_HRDAdvance_Ledger a   
LEFT JOIN Emp_Master as b  ON b.location_code=a.Location_Code  and  B.EMPCODE=A.EMPCODE    
where a.Location_Code =@location_code  and  a.Comp_Code  =@comp_code   
	--and a.Fin_Year_Code  =@fin_year_code
	 and a.Trans_Date  > ='2021-04-01' 
	And a.Trans_Date <@Fromdate
	and a.Empcode=@count
	Group By a.Empcode,b.EmpName,       a.location_code    
	) m Group By m.Empcode,m.EmpName,m.location_code,m.Trans_date        


	union all    
	select    a.location_code ,a.Trans_Date          , a.Empcode,b.EmpName         , sum(Opening) as Opening,sum(current_Adv)current_Adv    ,sum(Paid_Amount) as Paid_Amount 
	,0 as Closing   
	from IV_HRDAdvance_Ledger a   
LEFT JOIN Emp_Master as b  ON b.location_code=a.Location_Code  and  B.EMPCODE=A.EMPCODE    
where a.Location_Code =@location_code  and  a.Comp_Code  =@comp_code   
	--and a.Fin_Year_Code  =@fin_year_code
	And a.Trans_Date >=@Fromdate And a.Trans_Date <=@Todate
	and a.Empcode=@count
	Group By a.Empcode,b.EmpName     ,a.comp_code,a.location_code,a.Trans_Date 
	
	)as p   
	group by      p.location_code    ,p.Empcode,p.EmpName    ,p.Trans_date     having sum(Closing) >0  or sum(current_Adv) >0  or   sum(Paid_Amount) >0      
	--order by p.Empcode,p.EmpName  
	)