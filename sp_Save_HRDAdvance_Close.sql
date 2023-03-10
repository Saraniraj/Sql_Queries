USE [MY_Attendance_SAO]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_HRDAdvance_Close]    Script Date: 16/11/2022 10:53:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================    
-- Author  : RAJKUMAR.K    
-- Create date : 10/11/2022    
-- Description : Save Emp Loan/Advance Master  Main  (Insert / Update)    
-- ==================================================================    
--exec [sp_Save_HRDAdvance_Close] '100','THENI','SMWR87','10095','2','2022/11/30' ,'1','10000',0,'0','ADMIN','2017-05-19 17:28:04','0'    
 



ALTER Proc [dbo].[sp_Save_HRDAdvance_Close]    
(    
@Comp_Code   Varchar(20),   
@Location_Code   Varchar(20),     
@Empcode   Varchar(100),    
@Empid    Varchar(100),    
@EDId    Varchar(100),    
@Ded_Date   Varchar(100),    
   
@Installed_No   Varchar(100),    
@Paid_Amount  Varchar(100),    
  
   
@Authorize   Varchar(1),    
@Delete_Mode  Varchar(1),    
@Screen_Mode  Varchar(20),    
@User_Code   Varchar(15),    
@iSuccessFlag  bit output    
)    
  
  
  
  
  
  
  
as    
set nocount on    
set dateformat ymd    
Declare @sqlstr   Varchar(8000)    
Declare @iMode   Numeric(18,0)    
Declare @iServerDate Varchar(19)    
  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))    
BEGIN TRAN TRAN1    
select @sqlstr=''    
  
  
select @sqlstr = 'Insert into HRD_TransAdvance_Entry Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))     + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code   ))    + ''''    
 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Empcode  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Empid ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EDId  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Ded_Date   ))    + ''''    

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Installed_No   ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Paid_Amount  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''Paid'''  +''  
  
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode   ))    + ''''    
  
  
  
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + ''''     
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + '''' + ')'    
  
exec(@sqlstr )    
print (@sqlstr)    
  
IF (@@error <> 0) goto ErrHand    
COMMIT TRAN TRAN1    
select @iSuccessFlag=1    
return    
ErrHand:    
BEGIN    
ROLLBACK TRAN TRAN1    
select @iSuccessFlag=0    
END


