USE [PowerERP_Cashew]
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_HRDPaymentReceipt]    Script Date: 07/09/2023 13:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================        
-- Author  : RAJKUMAR.K        
-- Create date : 01-10-2023      
-- Description : Get Daily Expenses Details       
-- =============================================================        
-- Grant Execute On [sp_Gettbl_DailyExpensesEntry] To Public        
  --  exec  [sp_Gettbl_DailyExpensesEntry] '100','Chennai','','ALL'


create Proc [dbo].[sp_Gettbl_DailyExpensesEntry]        
(        
@Comp_Code    Varchar(20),     
@Location_Code		Varchar(20),
@ID   Varchar(100),        
@Filter_Data   Varchar(50)        
)        
as        
BEGIN        
set nocount on        
set dateformat ymd        
Declare @sqlstr varchar(8000)        
print @Comp_Code     

        
IF         
(         
ltrim(rtrim(@ID))= ''         
--and ltrim(rtrim(@Authorize))= ''         
--and ltrim(rtrim(@Delete_Mode))=''        
and ltrim(rtrim(@Filter_Data))='ALL'        
)        
BEGIN  
select @sqlstr= 'select        ' 
 
select @sqlstr = @sqlstr + '   a.Expense_ID,a.Expense_Date,a.LotNo  '
select @sqlstr = @sqlstr + '  ,a.ExpenseHead_ID,a.ExpenseHead_Desc,a.Qty,a.Amount,a.Remarks  '
select @sqlstr = @sqlstr + ' , a.IS_Active ,a.Comp_Code , a.Location_Code   '
select @sqlstr = @sqlstr + '  FROM   tbl_DailyExpensesEntry  as a   '  
select @sqlstr = @sqlstr + ' left join tbl_Expense_head_Details  as b on b.ExpenseHead_ID =a.ExpenseHead_ID  ' 
select @sqlstr = @sqlstr + '  and b.location_code=a.Location_Code  '  
  
  select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''  
select @sqlstr = @sqlstr + ' and a.Expense_ID<>0 '    

        
END
    
 ELSE IF         
(        
ltrim(rtrim(@ID ))<> ''         
      
and ltrim(rtrim(@Filter_Data))='Specify'        
)        
BEGIN        
select @sqlstr= 'select      '      
select @sqlstr = @sqlstr + '   a.Expense_ID,a.Expense_Date,a.LotNo  '
select @sqlstr = @sqlstr + '  ,a.ExpenseHead_ID,a.ExpenseHead_Desc,a.Qty,a.Amount,a.Remarks  '

select @sqlstr = @sqlstr + ' ,a. IS_Active ,a.Comp_Code , a.Location_Code   '
select @sqlstr = @sqlstr + '  FROM   tbl_DailyExpensesEntry  as a   '  
select @sqlstr = @sqlstr + ' left join tbl_Expense_head_Details  as b on b.ExpenseHead_ID =a.ExpenseHead_ID  ' 
select @sqlstr = @sqlstr + '  and b.location_code=a.Location_Code  '  

  select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''     
select @sqlstr = @sqlstr + ' And a.Expense_ID='    + '''' + @ID    + ''''         
select @sqlstr = @sqlstr + '  '        
     

END           
print (@sqlstr)        
exec(@sqlstr)        
END


