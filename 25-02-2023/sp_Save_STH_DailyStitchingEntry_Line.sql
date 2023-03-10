USE [DB_HRMS]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_STH_DailyStitchingEntry_Line]    Script Date: 02-Mar-2023 16:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 -- ========================================================    
-- Author  : KRK       
-- Create date :03-03-2023
-- Modified date :03-03-2023     
-- Description : Save Daily Stitching ENTRY Line  (Insert / Update)    
    
-- ========================================================    
     
ALTER Proc [dbo].[sp_Save_STH_DailyStitchingEntry_Line]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(100),    
@Entry_Date     Varchar(100),    
@STH_Date     Varchar(100), 
@Sno      Varchar(100),    
@EmpCode     Varchar(100),    
@Tokenno    Varchar(100),  
@Ops_Code    Varchar(100),  
@Operation_Name     Varchar(100),    
@Product_Name     Varchar(10),    
@Rate_Per_Pcs     Varchar(100),    
@NO_of_Stitched     Varchar(100),    
@Stitched_Amount     Varchar(100),   
@Authorize     Varchar(1),    
@Delete_Mode    Varchar(1),    
@Screen_Mode    Varchar(20),    
@User_Code     Varchar(15),    
@iSuccessFlag       bit output    
)    
as    
set nocount on    
set dateformat ymd    
Declare @sqlstr   Varchar(8000)    
    
Declare @iServerDate Varchar(19)    
    
    
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))    
    
BEGIN TRAN TRAN1    
select @sqlstr=''    
    
BEGIN    
select @sqlstr=''    
select @sqlstr = 'Insert into STH_DailyStitchingEntry_Line Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code ))   + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))  + ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@STH_Date     ))  + ''''    
    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Sno  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpCode ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Tokenno ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Ops_Code      ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Operation_Name      ))  + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Product_Name      ))  + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Rate_Per_Pcs     ))  + ''''   

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@NO_of_Stitched      ))  + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Stitched_Amount     ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))  + ''''    
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''    
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + ''''     
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''    
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + '''' + ')'    
END    
exec(@sqlstr )    
print @sqlstr    
IF (@@error <> 0) goto ErrHand    
COMMIT TRAN TRAN1    
select @iSuccessFlag=1    
return    
ErrHand:    
BEGIN    
ROLLBACK TRAN TRAN1    
select @iSuccessFlag=0    
END   