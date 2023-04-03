USE [DB_HRMS]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Proll_MonthlyAttendanceEntry_Line]    Script Date: 03/04/2023 17:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ========================================================    
-- Author  : KRK       
-- Create date :31-04-2023
-- Modified date :31-04-2023    
-- Description : Save Payroll Attendance ENTRY Line  (Insert / Update)    
-- ========================================================    
ALTER Proc [dbo].[sp_Save_Proll_MonthlyAttendanceEntry_Line]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(100),    
@Entry_Date     Varchar(100),    
@Sno      Varchar(3), 
@sMonth      Varchar(25), 
@sYear      Varchar(25), 
@EmpCode      Varchar(25), 
@DayHour      Varchar(25), 
@Ot      Varchar(25), 
@Inc1      Varchar(25), 
@Ded2      Varchar(25), 
@Ded3      Varchar(25), 
@HR      Varchar(25), 
@Oth      Varchar(25), 
@NtInc      Varchar(25), 
@Total         Varchar(25),  
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
select @sqlstr = 'Insert into Proll_MonthlyAttendanceEntry_Line Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code ))   + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Sno  ))    + ''''    

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@sMonth  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@sYear  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpCode  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@DayHour  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Ot  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Inc1  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Ded2  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Ded3  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@HR  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Oth  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@NtInc  ))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Total  ))    + ''''    
  
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
  












