USE [DB_HRMS]
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_HRDPermissionEntry]    Script Date: 02/05/2023 16:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================================        
-- Author  : RAJKUMAR.K        
-- Create date : 03-05-2023      
-- Description : Get Employee Perday Wages Details       
-- =============================================================        
-- Grant Execute On [sp_Get_Proll_EmployeePerdaywages_Entry] To Public        
  --  exec  [sp_Get_Proll_EmployeePerdaywages_Entry] '100','theni','','ALL'
  --  exec  [sp_Get_Proll_EmployeePerdaywages_Entry] '100','theni','1','Specify'



alter Proc [dbo].[sp_Get_Proll_EmployeePerdaywages_Entry]        
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
--and ltrim(rtrim(@Authorize))= ''         
--and ltrim(rtrim(@Delete_Mode))=''        
and ltrim(rtrim(@Filter_Data))='ALL'        
)        
BEGIN  
select @sqlstr= 'select        ' 
select @sqlstr = @sqlstr + '     '
select @sqlstr = @sqlstr + ' a.ID ,a.SDate ,a.Empcode ,a.Empid   '
select @sqlstr = @sqlstr + ' ,a.Min_perday_Wages ,a.Remarks ,a.IS_Active   '
select @sqlstr = @sqlstr + '   ,b.EmpName   '
select @sqlstr = @sqlstr + ' , a.IS_Active ,a.Comp_Code , a.Location_Code   '
select @sqlstr = @sqlstr + '  FROM   Proll_EmployeePerdaywages_Entry  as a   '  
select @sqlstr = @sqlstr + ' left join emp_master  as b on b.EmpCode =a.empcode and b.empid=a.empid  ' 
select @sqlstr = @sqlstr + '  and b.location_code=a.Location_Code  '  
 

  select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''  
select @sqlstr = @sqlstr + ' and a.ID<>0 '    

        
END
    
 ELSE IF         
(        
ltrim(rtrim(@ID ))<> ''         
      
and ltrim(rtrim(@Filter_Data))='Specify'        
)        
BEGIN        
select @sqlstr= 'select      '      
select @sqlstr = @sqlstr + ' a.ID ,a.SDate ,a.Empcode ,a.Empid   '
select @sqlstr = @sqlstr + ' ,a.Min_perday_Wages ,a.Remarks ,a.IS_Active   '
select @sqlstr = @sqlstr + '   ,b.EmpName   '
select @sqlstr = @sqlstr + ' , a.IS_Active ,a.Comp_Code , a.Location_Code   '
select @sqlstr = @sqlstr + '  FROM   Proll_EmployeePerdaywages_Entry  as a   '  
select @sqlstr = @sqlstr + ' left join emp_master  as b on b.EmpCode =a.empcode and b.empid=a.empid  ' 
select @sqlstr = @sqlstr + '  and b.location_code=a.Location_Code  '  
  select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''     
select @sqlstr = @sqlstr + ' And a.ID='    + '''' + @ID    + ''''         
select @sqlstr = @sqlstr + '  '        
     

END           
print (@sqlstr)        
exec(@sqlstr)        
END

 