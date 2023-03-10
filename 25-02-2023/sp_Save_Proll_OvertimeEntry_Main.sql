USE [DB_HRMS]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Proll_OvertimeEntry_Main]    Script Date: 03-Feb-2023 15:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================    
-- Author  : KRK       
-- Create date :31-12-2022
-- Modified date :31-12-2022 
-- Description : Save Payroll Overtime Entry Main  (Insert / Update)    
-- ==================================================================    
    
ALTER Proc [dbo].[sp_Save_Proll_OvertimeEntry_Main]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(100),    
@Entry_Date     Varchar(100),    
@OT_Date     Varchar(20),  
@Shift_ID    Varchar(100),  
@OT_Type      Varchar(100), 
@Tot_OT_Hours   Varchar(100), 
@Tot_OT_Amount     Varchar(100),
@Unit      Varchar(100),
@Others      Varchar(100),    
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
Declare @iMode   Numeric(18,0)    
Declare @iServerDate Varchar(19)    
Set @iMode=(    
Select Count(Entry_No) from Proll_OvertimeEntry_Main    
Where Comp_Code  = @Comp_Code     
And  Location_Code   = @Location_Code   
And  Entry_No  = @Entry_No     
And  Entry_Date   = @Entry_Date    
)    
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))    
BEGIN TRAN TRAN1    
select @sqlstr=''    
IF @iMode<=0     
BEGIN    
select @sqlstr = 'Insert into Proll_OvertimeEntry_Main Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@OT_Date  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Shift_ID ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@OT_Type ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Tot_OT_Hours ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Tot_OT_Amount ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Unit ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Others  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + ''''     
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + '''' + ')'    
END    
ELSE IF @iMode=1    
BEGIN    
select @sqlstr = 'Update Proll_OvertimeEntry_Main Set '    
select @sqlstr= @sqlstr + ' OT_Date='    + '''' + ltrim(rtrim(@OT_Date ))  + ''''    
select @sqlstr= @sqlstr + ',ShiftId='   + '''' + ltrim(rtrim(@Shift_ID ))    + ''''    
select @sqlstr= @sqlstr + ',OT_Type='   + '''' + ltrim(rtrim(@OT_Type))  + ''''   
select @sqlstr= @sqlstr + ',Tot_OT_Hours='   + '''' + ltrim(rtrim(@Tot_OT_Hours))  + ''''   
select @sqlstr= @sqlstr + ',Tot_OT_Amount='   + '''' + ltrim(rtrim(@Tot_OT_Amount))  + '''' 
select @sqlstr= @sqlstr + ',Tot_OT_Amount='   + '''' + ltrim(rtrim(@Tot_OT_Amount))  + ''''   
select @sqlstr= @sqlstr + ',Unit='   + '''' + ltrim(rtrim(@Unit))  + ''''   
select @sqlstr= @sqlstr + ',Others_Desc='   + '''' + ltrim(rtrim(@others))    + ''''    
select @sqlstr= @sqlstr + ',Authorize='    + '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ',Delete_Mode='   + '''' + ltrim(rtrim(@Delete_Mode))   + ''''    
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))   + ''''    
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate      + ''''    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code       + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
select @sqlstr= @sqlstr +  ' And Entry_No ='  + '''' + @Entry_No        + ''''      
select @sqlstr= @sqlstr +  ' And Entry_Date='  + '''' + @Entry_Date       + ''''      
END    
exec(@sqlstr )    
print @sqlstr    
IF @iMode=1    
BEGIN    
select @sqlstr = 'Delete from Proll_OvertimeEntry_Line'    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code   + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
select @sqlstr= @sqlstr +  ' And Entry_No='   + '''' +  @Entry_No   + ''''      
    
exec(@sqlstr )    
END    
IF (@@error <> 0) goto ErrHand    
COMMIT TRAN TRAN1    
select @iSuccessFlag=1    
return    
ErrHand:    
BEGIN    
ROLLBACK TRAN TRAN1    
select @iSuccessFlag=0    
END    
/****** Object:  StoredProcedure [dbo].[sp_GetProll_MonthlyAllowance_Details]    Script Date: 31-Dec-2022 13:19:35 ******/
SET ANSI_NULLS ON

