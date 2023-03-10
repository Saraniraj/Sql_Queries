USE [MY_Attendance_SAO]
GO
/****** Object:  StoredProcedure [dbo].[sp_HRDAdvanceDeduction_Ledger_Report]    Script Date: 22/11/2022 15:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author  : KRK  
-- mODIFIED  :KRK  
-- Create date : 22/11/2022  
-- Modified date : 22/11/2022  

-- Description : Get Accounts Details  
-- =============================================  
-- Grant Execute On sp_GetParty_Details To Public  
-- Execute [sp_HRDAdvanceDeduction_Ledger_Report '100','1','','','ALL'  
-- Execute sp_HRDAdvanceDeduction_Ledger_Report '100','theni','1', 'SMWR10'  ,'2022-10-01','2022-10-01'

ALTER PROCEDURE [dbo].[sp_HRDAdvanceDeduction_Ledger_Report]
 @Comp_Code Varchar(10),   
@Location_Code   Varchar(10),   
@Fin_Year_Code   Varchar(10),  

@AccountName VARCHAR(MAX)  
,@Fromdate as datetime
,@Todate as datetime
AS

declare @table table
(
entrydate datetime,
Empcode 	Varchar(100),
opening decimal(15,3),
Advance decimal(15,3),
Deductions decimal(15,3),
closingbal decimal(15,3),

Refaccountname  	Varchar(100),
EmpName   	Varchar(100),
FingerId  	Varchar(100)


)  
IF             
(             
            
  @AccountName !='All'        
)  
insert into @table
select Loan_Date ,a.Empcode,0 as opening, current_Adv,Paid_Amount,0 as Closing  , Trans_Type as [Refaccountname]
,EmpName ,FingerId 
from IV_HRDAdvance_Ledger a   
LEFT JOIN Emp_Master as b  ON b.location_code=a.Location_Code  and  B.EMPCODE=A.EMPCODE    
where a.Location_Code =@location_code  and  a.Comp_Code  =@comp_code   
 and a.Empcode =  @AccountName
;
with cte as(  select *,  ROW_NUMBER()over (order by entrydate)rid from @table
), cte1 as(
select entrydate,Refaccountname, opening,  Advance,Deductions, cast(opening +  Advance-Deductions  as decimal(15,3)) as closingbal
,Empcode,EmpName ,FingerId 
, rid
from cte where rid = 1
union all
select curr.entrydate,curr.Refaccountname, cast(prev.closingbal as decimal(15,3)), curr.Advance, curr.Deductions, 
cast(prev.closingbal + curr.Advance - curr.Deductions as decimal(15,3)) as closingbal,curr.Empcode 
,curr.EmpName ,curr.FingerId 
, curr.rid
from cte curr inner join cte1 prev on curr.rid = prev.rid + 1
)
select *
from cte1
order by entrydate
option (maxrecursion 0)



