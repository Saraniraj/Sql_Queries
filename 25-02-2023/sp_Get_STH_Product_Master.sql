USE [DB_HRMS]
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_STH_Product_Master]    Script Date: 25-Feb-2023 17:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ============================================================        
-- Author  : KRK       
-- Create date :25-02-2022
-- Modified date :25-02-2022  
-- Description : Get STH Product MAster Details       
-- =============================================================        
-- Grant Execute On [sp_Get_STH_Product_Master] To Public        
  --  exec  [sp_Get_STH_Product_Master] '100','5',''
ALTER Proc [dbo].[sp_Get_STH_Product_Master]        
(        
@Comp_Code    Varchar(20),     
@Location_Code		Varchar(20),
@ID   Varchar(100),        
@Filter_Data   Varchar(50)        
)        
as        
BEGIN        
set nocount on        
set dateformat ymd        
Declare @sqlstr varchar(8000)        
print @Comp_Code     

        
IF         
(         
ltrim(rtrim(@ID))= ''         
and ltrim(rtrim(@Filter_Data))=''        
)        
BEGIN  
select @sqlstr= 'select STH_Prod_Code,Product_Name,Product_Desc,Comp_Code ,a.IS_Active       '        
select @sqlstr = @sqlstr + ' from STH_Product_Master  as a'     
  select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''  
select @sqlstr = @sqlstr + ' and STH_Prod_Code<>0 '    

        
END
    
 ELSE IF         
(        
ltrim(rtrim(@ID ))<> ''         
      
and ltrim(rtrim(@Filter_Data))=''        
)        
BEGIN        
select @sqlstr= 'select  a.STH_Prod_Code,a.Product_Name,a.Product_Desc,a.Comp_Code ,a.IS_Active   '        
select @sqlstr = @sqlstr + ' from STH_Product_Master  as a '     

  select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''     
select @sqlstr = @sqlstr + ' And a.STH_Prod_Code='    + '''' + @ID    + ''''         
select @sqlstr = @sqlstr + '  '
END           
print (@sqlstr)        
exec(@sqlstr)        
END