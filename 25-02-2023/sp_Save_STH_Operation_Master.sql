USE [DB_HRMS]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_STH_Operation_Master]    Script Date: 25-Feb-2023 17:29:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =================================================================
-- Author  : KRK       
-- Create date :15-01-2022
-- Modified date :25-02-2022
-- Description	:	Save STH  Product MAster  (Insert / Update)
-- ==================================================================
--select * from STH_Operation_Master
--exec sp_Save_STH_Operation_Master 'LS MILLS','1','1','10','10','1','ADD','ADMIN','0'
create Proc [dbo].[sp_Save_STH_Operation_Master]
(
	@Comp_Code		Varchar(20),
	@Location_Code		Varchar(20),
	@Ops_Code		varchar(50),
	@Operation_Name		varchar(50),
	@Rate_Per_Pcs		varchar(50),
	@Effect_from		varchar(50),
	@Effect_To		varchar(50),
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
				Select Count(Ops_Code   )  from  STH_Operation_Master  
				Where	comp_code =	@Comp_Code 
				
			And		Location_Code 		=	@Location_Code
				And		Ops_Code		=	@Ops_Code 
				
			)
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))
BEGIN TRAN TRAN1
select @sqlstr=''
IF @iMode<=0 
BEGIN
select @sqlstr = 'Insert into STH_Operation_Master Values('
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code    ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Ops_Code    ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Operation_Name    ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Rate_Per_Pcs    )) 		+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Effect_from    )) 		+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Effect_To    )) 		+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Isactive ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate							+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate							+ '''' + ')'
END
ELSE IF @iMode=1
BEGIN
select @sqlstr = 'Update STH_Operation_Master Set '
select @sqlstr= @sqlstr + ' Operation_Name='			+ '''' + ltrim(rtrim(@Operation_Name  ))		+ ''''
select @sqlstr= @sqlstr + ',Rate_Per_Pcs='		+ '''' + ltrim(rtrim(@Rate_Per_Pcs ))		+ ''''
select @sqlstr= @sqlstr + ',Effect_from='		+ '''' + ltrim(rtrim(@Effect_from ))		+ ''''
select @sqlstr= @sqlstr + ',Effect_To='		+ '''' + ltrim(rtrim(@Effect_To ))		+ ''''
select @sqlstr= @sqlstr + ',Is_active='				+ '''' + ltrim(rtrim(@Isactive))		+ ''''
select @sqlstr= @sqlstr + ',Modified_By='			+ '''' + ltrim(rtrim(@User_Code))	+ ''''
select @sqlstr= @sqlstr + ',Modified_Date='			+ '''' + @iServerDate				+ ''''
select @sqlstr= @sqlstr +  ' Where comp_code='		+ '''' + @Comp_Code					+ ''''
select @sqlstr= @sqlstr +  ' and Location_Code='		+ '''' + @Location_Code					+ ''''
select @sqlstr= @sqlstr +  ' And Ops_Code='	+ '''' + @Ops_Code				+ ''''  

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











