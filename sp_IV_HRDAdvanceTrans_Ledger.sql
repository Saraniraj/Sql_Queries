USE [MY_Attendance_SAO]
GO
/****** Object:  StoredProcedure [dbo].[sp_IV_HRDAdvanceTrans_Ledger]    Script Date: 22/11/2022 16:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================            
-- Author  : KRK  
-- Create date : 01/12/2022           
          
-- Description  : Save Stock Transaction Ledger -             
-- =========================================================================            
           
-- Exec sp_IV_HRDAdvanceTrans_Ledger '100','Theni' ,'2020-12-30','Advance Entry'   
-- Exec sp_IV_HRDAdvanceTrans_Ledger '100','Theni' ,'2020-12-30','Deduction'       
-- Exec sp_IV_HRDAdvanceTrans_Ledger '100','Theni' ,'2020-12-30','Paid Amount'            
     
         
        
-- Exec [sp_IV_HRDAdvanceTrans_Ledger] '100','SPINNING','2','INV/00454/21-22','SALES'           
          
   
      
ALTER Proc [dbo].[sp_IV_HRDAdvanceTrans_Ledger]            
(            
@Comp_Code    Varchar(10),            
@Location_Code   Varchar(10),            
          
@Tran_No    Varchar(100),            
@Tran_Type    Varchar(500)            
)            
AS            
SET NOCOUNT ON            
SET DATEFORMAT ymd              
Declare @sqlstr varchar(8000)            
Declare @iServerDate Varchar(19)            
            
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))             
            
BEGIN TRAN TRAN1             
            
select @sqlstr =''            
        
select @sqlstr='Delete from IV_HRDAdvance_Ledger'            
select @sqlstr = @sqlstr + ' Where Comp_Code='  + '''' + ltrim(rtrim(@Comp_Code))   + ''''            
select @sqlstr = @sqlstr + ' And Location_Code=' + '''' + ltrim(rtrim(@Location_Code))  + ''''     
select @sqlstr = @sqlstr + ' And Trans_Type=' + '''' + ltrim(rtrim(@Tran_Type))  + ''''            
       
           
select @sqlstr = @sqlstr + ' And Loan_Date='   + '''' + ltrim(rtrim(@Tran_No))    + ''''            
print(@sqlstr)            
exec (@sqlstr)       
      
--IF (@@error <> 0) goto ErrHand          
--COMMIT TRAN TRAN1          
--END      
          
select @sqlstr =''            
select @sqlstr = 'Insert into IV_HRDAdvance_Ledger'            
            
IF (            
 @Tran_Type ='Advance Entry'         
       
        
 )            
           
          
BEGIN            
select @sqlstr = @sqlstr + ' Select a.Comp_Code,a.Location_Code ' 
select @sqlstr = @sqlstr + ','''',a.Loan_Date,Loan_Date,''Advance Entry'' '            
select @sqlstr = @sqlstr + ',a.Empcode,a.Empid  '            
     select @sqlstr = @sqlstr + ' , 0,Sum(Loan_Amount),0  '
    
select @sqlstr = @sqlstr + ' From HRD_TransAdvance_Main a '            
          
       
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + ltrim(rtrim(@Comp_Code))   + ''''            
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + ltrim(rtrim(@Location_Code))  + ''''            
           
select @sqlstr = @sqlstr + ' And a.Loan_Date='  + '''' + ltrim(rtrim(@Tran_No))    + ''''   
 
select @sqlstr = @sqlstr + ' Group By '
select @sqlstr = @sqlstr + '     Comp_Code,Location_Code,Loan_Date,Loan_Date '
select @sqlstr = @sqlstr + ' ,Empcode,Empid         '
print(@sqlstr)          
exec (@sqlstr)           
IF (@@error <> 0) goto ErrHand          
COMMIT TRAN TRAN1          
END      
ELSE IF (        
      
      
 @Tran_Type ='Deduction'      
         
 )            
BEGIn            
select @sqlstr = @sqlstr + ' Select a.Comp_Code,a.Location_Code ' 
select @sqlstr = @sqlstr + ' ,'''',a.Ded_Date,Ded_Date,''Deduction'' '            
select @sqlstr = @sqlstr + ',a.Empcode,a.Empid  '            
     select @sqlstr = @sqlstr + ' , 0,0,Sum(Paid_Amount)  '
    
select @sqlstr = @sqlstr + ' From HRD_TransAdvance_Entry a '            
          
       
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + ltrim(rtrim(@Comp_Code))   + ''''            
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + ltrim(rtrim(@Location_Code))  + ''''            
           
select @sqlstr = @sqlstr + ' And a.Ded_Date='  + '''' + ltrim(rtrim(@Tran_No))    + ''''   
 
select @sqlstr = @sqlstr + ' Group By '
select @sqlstr = @sqlstr + '      Comp_Code,Location_Code,Ded_Date,Ded_Date '
select @sqlstr = @sqlstr + ' ,Empcode,Empid         '         
print(@sqlstr)          
exec (@sqlstr)           
IF (@@error <> 0) goto ErrHand          
COMMIT TRAN TRAN1          
END          
       


     
ELSE IF (        
      
      
 @Tran_Type ='Paid Amount'      
         
 )            
BEGIn            
select @sqlstr = @sqlstr + ' Select a.Comp_Code,a.Location_Code ' 
select @sqlstr = @sqlstr + ','''',a.Paid_Date,Paid_Date,''Paid Amount'' '            
select @sqlstr = @sqlstr + ',a.Empcode,a.Empid  '            
     select @sqlstr = @sqlstr + ' , 0,0,Sum(Amount)  '
    
select @sqlstr = @sqlstr + ' From HRD_PaymentReceipt a '            
          
       
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + ltrim(rtrim(@Comp_Code))   + ''''            
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + ltrim(rtrim(@Location_Code))  + ''''            
           
select @sqlstr = @sqlstr + ' And a.Paid_Date='  + '''' + ltrim(rtrim(@Tran_No))    + ''''   
 
select @sqlstr = @sqlstr + ' Group By '
select @sqlstr = @sqlstr + '      Comp_Code,Location_Code,Paid_Date '
select @sqlstr = @sqlstr + ' ,Empcode,Empid         '         
print(@sqlstr)          
exec (@sqlstr)           
IF (@@error <> 0) goto ErrHand          
COMMIT TRAN TRAN1          
END    
      
           
return          
ErrHand:          
BEGIN          
 ROLLBACK TRAN TRAN1          
END      
            
            






