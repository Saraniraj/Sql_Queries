USE [DB_HRMS]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Proll_EmployeePerdaywages_Entry]    Script Date: 02/05/2023 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================        
-- Author  : RAJKUMAR.K        
-- Create date : 03-05-2023     
-- Description : Save HRD Permission Entry Details       
-- =============================================================        
-- Grant Execute On [sp_Save_Proll_EmployeePerdaywages_Entry] To Public        
  --  exec  [sp_Save_Proll_EmployeePerdaywages_Entry] '100','theni','','ALL'



create Proc [dbo].[sp_Save_Proll_EmployeePerdaywages_Entry]
(
@Comp_Code		Varchar(20),
@Location_Code		Varchar(20),
@ID		varchar(50),
@SDate		varchar(50),
@Empcode	varchar(50),
@Empid			varchar(50),
@Min_perday_Wages		varchar(50),
 
@Remarks	varchar(50),
	@Isactive		Varchar(50),
	@Screen_Mode	Varchar(20),
	@User_Code		Varchar(15),
	@iSuccessFlag   bit	output
	


)
as
set nocount on
set dateformat ymd
Declare @sqlstr			Varchar(8000)
Declare @iMode			Numeric(18,0)
Declare @iServerDate	Varchar(19)
Set @iMode=(
				Select Count(ID   )  from  Proll_EmployeePerdaywages_Entry  
				Where	comp_code =	@Comp_Code 
				
			And		Location_Code 		=	@Location_Code
				And		ID		=	@ID 
				
			)
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))
BEGIN TRAN TRAN1
select @sqlstr=''
IF @iMode<=0 
BEGIN
 
select @sqlstr = 'Insert into Proll_EmployeePerdaywages_Entry Values('
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))					+ ''''

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code    ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@id     ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@SDate    ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Empcode    ))				+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Empid    ))				+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Min_perday_Wages     ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Remarks   ))				+ ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Isactive ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate							+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate							+ '''' + ')'
END
ELSE IF @iMode=1
BEGIN
select @sqlstr = 'Update Proll_EmployeePerdaywages_Entry Set '
select @sqlstr= @sqlstr + ' Empcode='			+ '''' + ltrim(rtrim(@Empcode  ))		+ ''''
select @sqlstr= @sqlstr + ',Empid='		+ '''' + ltrim(rtrim(@Empid ))		+ ''''
select @sqlstr= @sqlstr + ',SDate='			+ '''' + ltrim(rtrim(@SDate ))		+ ''''
select @sqlstr= @sqlstr + ',Min_perday_Wages='			+ '''' + ltrim(rtrim(@Min_perday_Wages ))		+ ''''
select @sqlstr= @sqlstr + ',Remarks='			+ '''' + ltrim(rtrim(@Remarks ))		+ ''''
select @sqlstr= @sqlstr + ',Is_active='				+ '''' + ltrim(rtrim(@Isactive))		+ ''''
select @sqlstr= @sqlstr + ',Modified_By='			+ '''' + ltrim(rtrim(@User_Code))	+ ''''
select @sqlstr= @sqlstr + ',Modified_Date='			+ '''' + @iServerDate				+ ''''
select @sqlstr= @sqlstr +  ' Where comp_code='		+ '''' + @Comp_Code					+ ''''
select @sqlstr= @sqlstr +  ' and Location_Code='		+ '''' + @Location_Code					+ ''''
select @sqlstr= @sqlstr +  ' And ID='	+ '''' + @ID				+ ''''  

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


