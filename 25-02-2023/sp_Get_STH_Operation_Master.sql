USE [DB_HRMS]
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_STH_Product_Master]    Script Date: 25-Feb-2023 17:26:45 ******/
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
create Proc [dbo].[sp_Get_STH_Operation_Master]        
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
select @sqlstr= 'select Ops_Code,Operation_Name,Rate_Per_Pcs,Effect_from,Effect_To,Comp_Code ,a.IS_Active       '        
select @sqlstr = @sqlstr + ' from STH_Product_Master  as a'     
  select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''  
select @sqlstr = @sqlstr + ' and Ops_Code<>0 '    

        
END
    
 ELSE IF         
(        
ltrim(rtrim(@ID ))<> ''         
      
and ltrim(rtrim(@Filter_Data))=''        
)        
BEGIN        
select @sqlstr= 'select  a.,Ops_Code,a.Operation_Name,a.Rate_Per_Pcs,a.Effect_from,a.Effect_To,a.Comp_Code ,a.IS_Active   '        
select @sqlstr = @sqlstr + ' from STH_Product_Master  as a '     

  select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''     
select @sqlstr = @sqlstr + ' And a.Ops_Code='    + '''' + @ID    + ''''         
select @sqlstr = @sqlstr + '  '
END           
print (@sqlstr)        
exec(@sqlstr)        
END