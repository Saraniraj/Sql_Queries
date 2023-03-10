USE [DB_HRMS]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Proll_OvertimeEntry_Line]    Script Date: 03-Feb-2023 16:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ========================================================    
-- Author  : KRK       
-- Create date :03-02-2023
-- Modified date :03-02-2023     
-- Description : Save Payroll Overtime ENTRY Line  (Insert / Update)    
    
-- ========================================================    
    
    
ALTER Proc [dbo].[sp_Save_Proll_OvertimeEntry_Line]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(100),    
@Entry_Date     Varchar(100),    
@Sno      Varchar(100),    
@EmpCode     Varchar(100),    
@Tokenno    Varchar(100),  
@sDate     Varchar(100),   
@DaySalary     Varchar(100),    
@OtHours     Varchar(10),    
@OTPercent     Varchar(100),    
@OT_Amount     Varchar(100),    
@Otincen     Varchar(100),    
@OtNett     Varchar(100),    
@OTFlag     Varchar(100),    
@Unit     Varchar(100),    
@DEPTCODE     Varchar(100),    
@DIVICODE     Varchar(100),    
@DESGCODE     Varchar(100),    
@OTCAT    Varchar(100),    
@SHED     Varchar(100),     
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
select @sqlstr = 'Insert into Proll_OvertimeEntry_Line Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code ))   + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Sno  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpCode ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Tokenno ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@sDate     ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@DaySalary     ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@OtHours     ))  + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@OTPercent     ))  + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@OT_Amount     ))  + ''''   

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Otincen     ))  + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@OtNett     ))  + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@OTFlag     ))  + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Unit     ))  + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@DEPTCODE     ))  + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@DIVICODE      ))  + ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@DESGCODE      ))  + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@OTCAT      ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@SHED      ))  + ''''     
 
     
  
   
    
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
  












