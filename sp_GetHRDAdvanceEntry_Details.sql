USE [MY_Attendance_SAO]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetHRDAdvanceEntry_Details]    Script Date: 16/11/2022 16:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from HRD_TransAdvance_Entry order by Empcode     
    
    
    
-- ==============================================================            
-- Author  : K.RAJKUMAR            
-- Create date : 30-11-2022        
-- Description : Get HRD Loan and Advance Entry  Details  )            
-- ===============================================================            
-- Grant Execute On  To Public            
            
-- select * from HRD_TransAdvance_Main            
-- exec [sp_GetHRDAdvanceEntry_Details] '100','theni','','2022-11-30','ALL'            
-- exec [sp_GetHRDAdvanceEntry_Details] '100','LN/B/00002',''            
-- exec [sp_GetHRDAdvanceEntry_Details] '100','Theni','smwr11','2022-04-30','All'            
  
-- exec [sp_GetHRDAdvanceEntry_Details] '100','theni','KBR24','All'            
-- exec [sp_GetHRDAdvanceEntry_Details] '100','BR1048','EmpLoan_DeductionDetails'            
          
ALTER Proc [dbo].[sp_GetHRDAdvanceEntry_Details]            
(            
@Comp_Code    Varchar(20),          
@Location_Code    Varchar(20),            
          
            
@Trans_No     Varchar(100),            
 @Trans_Date     Varchar(100),            
            
@Filter_Data   Varchar(30)            
)            
as            
BEGIN            
set nocount on            
set dateformat ymd            
Declare @sqlstr varchar(8000)            
            
IF             
 (            
   @Filter_Data = ''            
  And @Trans_No   <> ''            
 )            
BEGIN            
            
select @sqlstr = ' SELECt a.Entry_No,a.Entry_Date,a.Loan_Date ,a.End_Date'            
select @sqlstr = @sqlstr + ' ,a.Account_No,a.Bank,a.Empcode,a.Empid,a.EDId '            
select @sqlstr = @sqlstr + ' ,a.Loan_Amount,a.interest_Rate,a.No_of_Installs '            
select @sqlstr = @sqlstr + ' ,a.Monthly_Amount,a.Loan_balance,a.Is_Completed '            
select @sqlstr = @sqlstr + ' ,a.Others_Desc,a.Authorize,a.Delete_Mode'            
            
select @sqlstr = @sqlstr + ' , b.empname as EmpName '            
select @sqlstr = @sqlstr + ' ,isnull(f.BankName,'''') as BankName '            
select @sqlstr = @sqlstr + ' ,i.Paid ,i.Paid_months'            
select @sqlstr = @sqlstr + ' FROM HRD_TransAdvance_Main as a'            
            
select @sqlstr = @sqlstr + ' left join  Emp_Master as b on  b.Location_Code=a.Location_Code and  b.EmpCode =a.Empcode '            
select @sqlstr = @sqlstr + ' left join  Category_Master  as c on  c.Location_Code=a.Location_Code and c.CatCode =b.CatCode'            
select @sqlstr = @sqlstr + ' left join  Deptmaster  as d on  d.Location_Code=a.Location_Code and d.DeptCode =b.DeptCode '            
select @sqlstr = @sqlstr + ' left join  Designation  as e on  e.Location_Code=a.Location_Code and e.DesgnCode  =b.DesgnCode'            
select @sqlstr = @sqlstr + '  left join  Bank_Master  as f on   f.Location_Code=a.Location_Code and  f.BankCode   = a.Bank '            
select @sqlstr = @sqlstr + ' '            
            
          
select @sqlstr = @sqlstr + ' '            
select @sqlstr = @sqlstr + ' left join  (SELECT p.Entry_No, p.EDID,P.Empcode , SUM(p.paid_amount) as Paid  ,SUM(p.Installed_no ) as Paid_months FROM '            
select @sqlstr = @sqlstr + ' HRD_TransAdvance_Entry p GROUP BY p.Entry_No, p.EDID ,P.Empcode) AS i'            
select @sqlstr = @sqlstr + '  ON  i.Empcode =a.Empcode and i.Entry_No =a.Entry_No           and i.EDId =a.EDId '            
            
select @sqlstr = @sqlstr + ' Where a.Entry_No='   + '''' + @Trans_No  + ''''            
            
select @sqlstr = @sqlstr + ' and a.Comp_Code='  + '''' + @Comp_Code   + ''''            
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''            
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code=' + '''' + @Fin_Year_Code + ''''            
--select @sqlstr = @sqlstr + ' And a.EntryId='   + '''' + @Trans_No  + ''''            
--select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '            
END            
    ELSE IF @Filter_Data = 'ALL'          
BEGIN          
select @sqlstr = ' SELECT a.Entry_No,a.Entry_Date,a.Loan_Date,a.End_Date '          
select @sqlstr = @sqlstr + ' ,a.Empcode,a.Empid,a.EDId ,g.EDName'          
select @sqlstr = @sqlstr + ' ,a.Loan_Amount,a.interest_Rate,a.No_of_Installs '          
select @sqlstr = @sqlstr + ' ,a.Monthly_Amount,a.Loan_balance,a.Is_Completed '          
select @sqlstr = @sqlstr + ' ,a.Others_Desc,a.Authorize,a.Delete_Mode'         
select @sqlstr = @sqlstr + ' , b.empname as EmpName,d.deptname '    
select @sqlstr = @sqlstr + ' ,isnull(i.Paid,''0'') as Paid,isnull(i.Paid_months,''0'') Paid_months '
select @sqlstr = @sqlstr + '  ,(a.Loan_Amount-isnull(i.Paid,''0'')) as Loan_bal '         
select @sqlstr = @sqlstr + ' from HRD_TransAdvance_Main AS a  '    
       
select @sqlstr = @sqlstr + ' left join  Emp_Master as b on  b.Location_Code=a.Location_Code and  b.EmpCode =a.Empcode '          
select @sqlstr = @sqlstr + ' left join  Category_Master  as c on  c.Location_Code=a.Location_Code and c.CatCode =b.CatCode'          
select @sqlstr = @sqlstr + ' left join  Deptmaster  as d on  d.Location_Code=a.Location_Code and d.DeptCode =b.DeptCode '          
select @sqlstr = @sqlstr + ' left join  Designation  as e on  e.Location_Code=a.Location_Code and e.DesgnCode  =b.DesgnCode'          


select @sqlstr = @sqlstr + ' left join  (SELECT  p.EDID,P.Empcode , SUM(p.paid_amount) as Paid  ,SUM(p.Installed_no ) as Paid_months,Location_Code FROM '          
select @sqlstr = @sqlstr + ' HRD_TransAdvance_Entry p GROUP BY  p.EDID ,P.Empcode,p.Location_Code) AS i'          
select @sqlstr = @sqlstr + '  ON  i.Empcode =a.Empcode   and    i.Location_Code=a.Location_Code    and i.EDId =a.EDId '                      
select @sqlstr = @sqlstr + '  left join  Deduction  as g on   g.Location_Code=a.Location_Code and  g.EDId   = a.EDId '  
          
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''     
        
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''        
select @sqlstr = @sqlstr + ' And a.Loan_Date <=' + '''' + @Trans_Date + ''''          
  
--select @sqlstr = @sqlstr + ' And Delete_Mode=0'          
--select @sqlstr = @sqlstr + ' And a.IsActive=1 and a.isactive=1'          

select @sqlstr = @sqlstr + '  and (a.Loan_Amount-isnull(i.Paid,''0''))>0'          

          --(a.Loan_Amount-isnull(i.Paid,''0''))
select @sqlstr = @sqlstr + ' Order by a.Empid '          
END            
            
            
ELSE IF @Filter_Data = 'EmpLoan_Details'  And @Trans_No <> ''            
BEGIN            
            
            
select @sqlstr = ' SELECT a.Entry_No,a.Entry_Date,a.Loan_Date,a.End_Date '            
select @sqlstr = @sqlstr + ' ,a.Account_No,a.Bank,a.Empcode,a.Empid,a.EDId '            
select @sqlstr = @sqlstr + ' ,a.Loan_Amount,a.interest_Rate,a.No_of_Installs '            
select @sqlstr = @sqlstr + ' ,a.Monthly_Amount,a.Loan_balance,a.Is_Completed '            
select @sqlstr = @sqlstr + ' ,a.Others_Desc,a.Authorize,a.Delete_Mode'            
            
select @sqlstr = @sqlstr + ' , b.empname as EmpName '            
select @sqlstr = @sqlstr + ' ,f.BankName  ,g.EDName '            
select @sqlstr = @sqlstr + ' ,i.Paid ,i.Paid_months'            
            
            
            
            
select @sqlstr = @sqlstr + ' FROM HRD_TransAdvance_Main as a'            
            
select @sqlstr = @sqlstr + ' left join  Emp_Master as b on   b.Location_Code=a.Location_Code and b.EmpCode =a.Empcode '            
select @sqlstr = @sqlstr + ' left join  Category_Master  as c on  c.Location_Code=a.Location_Code and  c.CatCode =b.CatCode'            
select @sqlstr = @sqlstr + ' left join  Deptmaster  as d on  d.Location_Code=a.Location_Code and  d.DeptCode =b.DeptCode '            
select @sqlstr = @sqlstr + ' left join  Designation  as e on  e.Location_Code=a.Location_Code and  e.DesgnCode  =b.DesgnCode'            
select @sqlstr = @sqlstr + '  left join  Bank_Master  as f on  f.Location_Code=a.Location_Code and  f.BankCode   = a.Bank '            
select @sqlstr = @sqlstr + '   left join  Deduction   as g on  g.Location_Code=a.Location_Code and  g.EDId    = a.EDId  '            
            
select @sqlstr = @sqlstr + ' left JOIN   (SELECT p.Entry_No, p.EDID,P.Empcode , SUM(p.paid_amount) as Paid  ,SUM(p.Installed_no ) as Paid_months FROM '            
select @sqlstr = @sqlstr + ' HRD_TransAdvance_Entry p GROUP BY p.Entry_No, p.EDID ,P.Empcode) AS i'            
select @sqlstr = @sqlstr + '  ON  i.Empcode =a.Empcode and i.Entry_No =a.Entry_No           and i.EDId =a.EDId '            
            
select @sqlstr = @sqlstr + ' '            
            
select @sqlstr = @sqlstr + ' Where a.Empcode='   + '''' + @Trans_No  + ''''            
            
END            
            
            
ELSE IF @Filter_Data = 'EmpLoan_DeductionDetails'  And @Trans_No <> ''            
BEGIN            
            
            
select @sqlstr = ' SELECt a.Entry_No,a.Entry_Date,a.Loan_Date,a.End_Date '            
select @sqlstr = @sqlstr + ' ,a.Account_No,a.Bank,a.Empcode,a.Empid,a.EDId '            
select @sqlstr = @sqlstr + ' ,a.Loan_Amount,a.interest_Rate,a.No_of_Installs '            
select @sqlstr = @sqlstr + ' ,a.Monthly_Amount AS m_Paid_Amount,a.Loan_balance,a.Is_Completed '            
select @sqlstr = @sqlstr + ' ,a.Others_Desc,a.Authorize,a.Delete_Mode'            
            
select @sqlstr = @sqlstr + ' , b.empname as EmpName '            
select @sqlstr = @sqlstr + ' ,f.BankName  ,g.EDName '            
select @sqlstr = @sqlstr + '   ,h.Ded_Date ,h.Installed_no ,h.Paid_Amount '            
select @sqlstr = @sqlstr + '   ,(a.Loan_Amount -SUM(h.paid_amount)) as Balance'            
select @sqlstr = @sqlstr + '  '            
select @sqlstr = @sqlstr + '  '            
select @sqlstr = @sqlstr + ' FROM HRD_TransAdvance_Main as a'            
            
select @sqlstr = @sqlstr + ' left join  Emp_Master as b on  b.Location_Code=a.Location_Code and  b.EmpCode =a.Empcode '            
select @sqlstr = @sqlstr + ' left join  Category_Master  as c on  c.Location_Code=a.Location_Code and  c.CatCode =b.CatCode'            
select @sqlstr = @sqlstr + ' left join  Deptmaster  as d on  d.Location_Code=a.Location_Code and  d.DeptCode =b.DeptCode '            
select @sqlstr = @sqlstr + ' left join  Designation  as e on   e.Location_Code=a.Location_Code and e.DesgnCode  =b.DesgnCode'            
select @sqlstr = @sqlstr + '  left join  Bank_Master  as f on  f.Location_Code=a.Location_Code and  f.BankCode   = a.Bank '            
select @sqlstr = @sqlstr + '   left join  Deduction   as g on  g.Location_Code=a.Location_Code and  g.EDId    = a.EDId  '            
            
            
            
select @sqlstr = @sqlstr + ' join HRD_TransAdvance_Entry as h on h.Empcode =a.Empcode and h.Entry_No =a.Entry_No and   h.Location_Code=a.Location_Code      and h.EDId =a.EDId '            
            
select @sqlstr = @sqlstr + ' '            
            
select @sqlstr = @sqlstr + ' Where a.Empcode='   + '''' + @Trans_No  + ''''            
select @sqlstr = @sqlstr + ' group by  a.Entry_No,a.Entry_Date,a.Loan_Date,a.End_Date  ,a.Account_No '            
select @sqlstr = @sqlstr + ' ,a.Bank,a.Empcode,a.Empid,a.EDId  ,a.Loan_Amount,a.interest_Rate,a.No_of_Installs  '            
select @sqlstr = @sqlstr + ' ,a.Monthly_Amount,a.Loan_balance,a.Is_Completed  ,a.Others_Desc'         
select @sqlstr = @sqlstr + ' ,a.Authorize,a.Delete_Mode , b.empname   ,f.BankName  ,g.EDName'            
select @sqlstr = @sqlstr + '  ,h.Ded_Date ,h.Installed_no ,h.Paid_Amount '            
select @sqlstr = @sqlstr + ' '            
            
            
            
            
            
END            
            
print (@sqlstr)            
exec(@sqlstr)            
END 
