USE PowerERP_Cashew
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_HRD_PaymentReceipt]    Script Date: 07/09/2023 13:21:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[sp_Save_tbl_DailyExpensesEntry]
(
	@Comp_Code		Varchar(20),
	@Location_Code		Varchar(20),
	@Expense_ID		varchar(50),
	@Expense_Date		varchar(50),
	@LotNo		varchar(50),
	@ExpenseHead_ID		varchar(50),
	@ExpenseHead_Name		varchar(50),
	@Qty	varchar(50),
	@Amount			varchar(50),
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
				Select Count(Expense_ID	   )  from  tbl_DailyExpensesEntry  
				Where	comp_code =	@Comp_Code 
				
			And		Location_Code 		=	@Location_Code
				And		Expense_ID			=	@Expense_ID 
				
			)
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))
BEGIN TRAN TRAN1
select @sqlstr=''
IF @iMode<=0 
BEGIN
 
select @sqlstr = 'Insert into tbl_DailyExpensesEntry Values('
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))					+ ''''

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code    ))				+ ''''

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Expense_ID     ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Expense_Date    ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@LotNo     ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@ExpenseHead_ID    ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@ExpenseHead_Name     ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Qty    ))				+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Amount    ))				+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Remarks    ))				+ ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Isactive ))				+ ''''

select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate							+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate							+ '''' + ')'
END
ELSE IF @iMode=1
BEGIN
select @sqlstr = 'Update tbl_DailyExpensesEntry Set '
select @sqlstr= @sqlstr + ' Expense_Date='			+ '''' + ltrim(rtrim(@Expense_Date  ))		+ ''''
select @sqlstr= @sqlstr + ',LotNo='			+ '''' + ltrim(rtrim(@LotNo ))		+ ''''
select @sqlstr= @sqlstr + ',ExpenseHead_ID='			+ '''' + ltrim(rtrim(@ExpenseHead_ID ))		+ ''''
select @sqlstr= @sqlstr + ',ExpenseHead_Name='			+ '''' + ltrim(rtrim(@ExpenseHead_Name ))		+ ''''
select @sqlstr= @sqlstr + ',Qty='			+ '''' + ltrim(rtrim(@Qty ))		+ ''''
select @sqlstr= @sqlstr + ',Amount='			+ '''' + ltrim(rtrim(@Amount ))		+ ''''
select @sqlstr= @sqlstr + ',Remarks='			+ '''' + ltrim(rtrim(@Remarks ))		+ ''''
select @sqlstr= @sqlstr + ',Is_active='				+ '''' + ltrim(rtrim(@Isactive))		+ ''''
select @sqlstr= @sqlstr + ',Modified_By='			+ '''' + ltrim(rtrim(@User_Code))	+ ''''
select @sqlstr= @sqlstr + ',Modified_Date='			+ '''' + @iServerDate				+ ''''
select @sqlstr= @sqlstr +  ' Where comp_code='		+ '''' + @Comp_Code					+ ''''
select @sqlstr= @sqlstr +  ' and Location_Code='		+ '''' + @Location_Code					+ ''''
select @sqlstr= @sqlstr +  ' And Expense_ID='	+ '''' + @Expense_ID				+ ''''  

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




