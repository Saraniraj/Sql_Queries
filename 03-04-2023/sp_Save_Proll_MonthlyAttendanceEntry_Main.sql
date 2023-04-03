USE [DB_HRMS]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Proll_MonthlyAttendanceEntry_Main]    Script Date: 03/04/2023 17:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================    
-- Author  : KRK       
-- Create date :15-04-2023
-- Modified date :15-04-2023 
-- Description : Save Payroll Monthly Attendance Entry Main  (Insert / Update)    
-- ==================================================================    
    
ALTER Proc [dbo].[sp_Save_Proll_MonthlyAttendanceEntry_Main]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(100),    
@Entry_Date     Varchar(100),    
@Att_date    Varchar(100),    
@Month   Varchar(100),    
@Year   Varchar(100),    
@Cat_Code    Varchar(100), 
   
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
Select Count(Entry_No) from Proll_MonthlyAttendanceEntry_Main    
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
select @sqlstr = 'Insert into Proll_MonthlyAttendanceEntry_Main Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Att_date  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Month ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Year ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Cat_Code ))    + ''''    
 
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
select @sqlstr = 'Update Proll_MonthlyAttendanceEntry_Main Set '    
select @sqlstr= @sqlstr + ' Att_Month='    + '''' + ltrim(rtrim(@Month ))  + ''''    
select @sqlstr= @sqlstr + ',Att_Year='   + '''' + ltrim(rtrim(@Year ))    + ''''    
select @sqlstr= @sqlstr + ',Cat_Code='   + '''' + ltrim(rtrim(@Cat_Code))  + ''''   
  
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
select @sqlstr = 'Delete from Proll_MonthlyAttendanceEntry_Line'    
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
  
  
   












