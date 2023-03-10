USE [DB_HRMS]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_STH_DailyStitchingEntry_Main]    Script Date: 02-Mar-2023 16:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================    
-- Author  : KRK       
-- Create date :03-03-2023
-- Modified date :03-03-2023
-- Description : Save Stitching Daily Production Entry Main  (Insert / Update)    
-- ==================================================================    
    
ALTER Proc [dbo].[sp_Save_STH_DailyStitchingEntry_Main]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(100),    
@Entry_Date     Varchar(100),    
@STH_Date     Varchar(20),  
@Total_Stitched    Varchar(100),  
@Total_Amount      Varchar(100),  
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
Select Count(Entry_No) from STH_DailyStitchingEntry_Main    
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
select @sqlstr = 'Insert into STH_DailyStitchingEntry_Main Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@STH_Date  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Total_Stitched ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Total_Amount ))    + ''''    
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
select @sqlstr = 'Update STH_DailyStitchingEntry_Main Set '    
select @sqlstr= @sqlstr + ' STH_Date='    + '''' + ltrim(rtrim(@STH_Date ))  + ''''    
select @sqlstr= @sqlstr + ',Total_Stitched='   + '''' + ltrim(rtrim(@Total_Stitched ))    + ''''    
select @sqlstr= @sqlstr + ',Total_Amount='   + '''' + ltrim(rtrim(@Total_Amount))  + ''''    
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
select @sqlstr = 'Delete from STH_DailyStitchingEntry_Line'    
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

SET ANSI_NULLS ON
 