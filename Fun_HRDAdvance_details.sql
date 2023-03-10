USE [MY_Attendance_SAO]
GO
/****** Object:  UserDefinedFunction [dbo].[Fun_HRDAdvance_details]    Script Date: 22/11/2022 15:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		K.R.K
-- Create date: 04-06-2022
-- Description:	<Description,,>
-- =============================================

--  select * from [Fun_HRDAdvance_details] ('100','Theni','1',' ','2022-09-01','2022-11-30')   order by Empcode,EmpName  

ALTER FUNCTION  [dbo].[Fun_HRDAdvance_details] (
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
selecT    
   
p.Empcode,p.EmpName    
, sum(Closing) as Opening   ,sum(current_Adv) as Advances    
,sum(Paid_Amount) Paid     
,((sum(Closing)+sum(current_Adv) )   -(sum(Paid_Amount)))  as Closing    
 from  (   
    
--------------Closing As Opening start------------------------  sum(Sales_Export_Qty)+sum(Sales_MerchExport_Qty)    
  
    
select    
M.location_code,    M.Empcode,M.EmpName  
,0 as Opening,0 as   current_Adv,0 as   Paid_Amount  
,(Sum(Opening)+Sum(current_Adv))-( Sum(   Paid_Amount) )  as Closing   
from (    
---- Opening------------------------    
select    a.location_code   ,a.Empcode,b.EmpName    
, sum(Opening) as Opening,0 as   current_Adv   
,0 as   Paid_Amount ,0   as Closing    
from IV_HRDAdvance_Ledger a    
LEFT JOIN Emp_Master as b  ON b.location_code=a.Location_Code  and  B.EMPCODE=A.EMPCODE   
where a.Location_Code =@location_code  and  a.Comp_Code  =@comp_code    
--and a.Fin_Year_Code  =1    
and trans_type='Opening'   
and a.Loan_Date  > ='2020-04-01' 
And a.Loan_Date <=@Fromdate  
Group By a.Empcode,b.EmpName ,a.comp_code,a.location_code    
union all   
   
--------------Opening Transactions----------------------------    
select    a.location_code, a.Empcode,b.EmpName    
, 0 as Opening,sum(current_Adv)current_Adv    ,sum(Paid_Amount) as Paid_Amount   
,0 as Closing    
from IV_HRDAdvance_Ledger a   
LEFT JOIN Emp_Master as b  ON b.location_code=a.Location_Code  and  B.EMPCODE=A.EMPCODE    
where a.Location_Code =@location_code  and  a.Comp_Code  =@comp_code   

-- and a.Fin_Year_Code  =' + '''' + @Fin_year_Code+''' '    
and a.Loan_Date  > ='2021-04-01' 
And a.Loan_Date < @Fromdate
--and a.Empcode=@count   
   
Group By a.Empcode,b.EmpName     ,a.location_code
    
--------------Opening Transactions End----------------------------    
   
    
) m   
Group By m.Empcode,m.EmpName   
,m.location_code    
--------------Closing As Opening------------------------    
union all   
select    a.location_code, a.Empcode,b.EmpName 
    
, sum(Opening) as Opening,sum(current_Adv)current_Adv ,sum(Paid_Amount) Paid_Amount      
,0 as Closing    
from IV_HRDAdvance_Ledger a   
LEFT JOIN Emp_Master as b  ON b.location_code=a.Location_Code  and  B.EMPCODE=A.EMPCODE     
where a.Location_Code =@location_code  and  a.Comp_Code  =@comp_code 
And a.Loan_Date >=@Fromdate And a.Loan_Date <=@Todate    
   
Group By a.Empcode,b.EmpName ,a.comp_code,a.location_code    
    
--------------Opening Transactions End----------------------------    
   
)as p   
group by    p.location_code   ,p.Empcode,p.EmpName   
having sum(Closing) >0  or sum(current_Adv) >0 or  sum(Paid_Amount)   >0    
   
 
  
)






