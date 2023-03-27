USE [Powersoft_YASOTHA]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_MechanicIncentiveEntry_Line]    Script Date: 23-Mar-23 16:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================    
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023    
-- Description : Save Mechanic Incentive ENTRY lINE  (Insert / Update)    
-- ========================================================    

create Proc [dbo].[sp_Save_Ins_Mechanic_HelperLink_Line]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(100),    
@Entry_Date     Varchar(100),    
@Sno      Varchar(10),    
@Mech_EmpCode     Varchar(10),    
@Mech_EmpID     Varchar(10),    
@Mech_EmpName     Varchar(10),    
@Mech_Percentage     Varchar(10),    
@Helper_EmpCode     Varchar(10),    
@Helper_EmpID     Varchar(10),    
@Helper_EmpName     Varchar(10),    
@Helper_Percentage     Varchar(10),    
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
select @sqlstr = 'Insert into Ins_Mechanic_HelperLink_Line Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code ))   + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Sno  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Mech_EmpCode ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Mech_EmpID ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Mech_EmpName   ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Mech_Percentage    ))  + ''''  

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Helper_EmpCode   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Helper_EmpID   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Helper_EmpName   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Helper_Percentage   ))  + ''''   
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