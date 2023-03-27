USE [Powersoft_YASOTHA]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_MechanicIncentive_Details]    Script Date: 23-Mar-23 16:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================        
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023 
-- Description : Get Ins_Mechanic  Keeping Incentive ENTRY    
-- ===============================================================        
-- Grant Execute On  To Public        
 --select * from   Ins_MechanicIncentiveEntry_Main
 --select * from   Ins_MechanicIncentiveEntry_Line   
      
-- exec [sp_GetIns_Mechanic_HelperLink_Details] '100','THENI','INC/00008/20-21','' ,'Specify'      
--- exec [sp_GetIns_Mechanic_HelperLink_Details] '100','THENI','2020-07-02' ,'Increment Report'      
-- exec [sp_GetIns_Mechanic_HelperLink_Details] '100','THENI',' ','' ,'aLL'      
 
alter Proc [dbo].[sp_GetIns_Mechanic_HelperLink_Details]        
(        
@Comp_Code    Varchar(20),        
@Location_Code   Varchar(20),        
@Trans_No     Varchar(100),        
@Att_date    Varchar(100),         
@Filter_Data   Varchar(30)        
)        
as        
BEGIN        
set nocount on        
set dateformat ymd        
Declare @sqlstr varchar(8000)        
        
IF         
 (        
   @Filter_Data = 'Specify'        
          
 )        
BEGIN        
select @sqlstr = 'SELECT  '        
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code '        
select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.Deptcode,d.Deptname ,a.Others_Desc '   
select @sqlstr = @sqlstr + ' ,Tot_Amount '             
select @sqlstr = @sqlstr + ' ,b.Entry_No,b.Entry_Date '

select @sqlstr = @sqlstr + ' ,Sno,Mech_EmpCode,Mech_EmpID,Mech_EmpName,Mech_Percentage '
select @sqlstr = @sqlstr + ' ,Helper_EmpCode,Helper_EmpID,Helper_EmpName,Helper_Percentage '
                
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  Ins_Mechanic_HelperLink_Main as a '        
select @sqlstr = @sqlstr + ' left join  Ins_Mechanic_HelperLink_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =h.Catcode '        
select @sqlstr = @sqlstr + ' left join Deptmaster as d  '        
select @sqlstr = @sqlstr + ' on d.Location_Code =b.location_code and d.DeptCode =h.Deptcode  '        
select @sqlstr = @sqlstr + ' left join Designation as e  '        
select @sqlstr = @sqlstr + ' on e.Location_Code =b.location_code and e.DesgnCode =h.Desgncode  '     
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_No='   + '''' + @Trans_No  + ''''        
--select @sqlstr = @sqlstr + ' and a.Att_date='   + '''' + @Att_date  + ''''        
      
      
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code=' + '''' + @Fin_Year_Code + ''''        
--select @sqlstr = @sqlstr + ' And a.EntryId='   + '''' + @Trans_No  + ''''        
--select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '    
select @sqlstr = @sqlstr + ' Order by h.Empid asc'         
END       
      
else IF         
 (        
   @Filter_Data = 'Other Earning Report'        
          
 )        
BEGIN        
       
select @sqlstr = 'SELECT  '        
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code '        
select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.DeptCode,d.Deptname ,a.Others_Desc '        
       
select @sqlstr = @sqlstr + ' ,b.Sno,b.Mech_EmpCode,b.Mech_EmpID,b.Mech_EmpName,b.Mech_Percentage '
select @sqlstr = @sqlstr + ' ,b.Helper_EmpCode,b.Helper_EmpID,b.Helper_EmpName,b.Helper_Percentage '   
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  Ins_Mechanic_HelperLink_Main as a '        
select @sqlstr = @sqlstr + ' left join  Ins_Mechanic_HelperLink_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '    
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =h.cat_code '        
select @sqlstr = @sqlstr + ' left join Deptmaster as d  '        
select @sqlstr = @sqlstr + ' on d.Location_Code =b.location_code and d.DeptCode =h.Deptcode  '        
select @sqlstr = @sqlstr + ' left join Designation as e  '        
select @sqlstr = @sqlstr + ' on e.Location_Code =b.location_code and e.DesgnCode =h.Desgncode  '    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_No='   + '''' + @Trans_No  + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_Date='   + '''' + @Att_date  + ''''       
END       
        
ELSE IF @Filter_Data  = 'All'        
BEGIN        
select @sqlstr = ' SELECT '        
      
select @sqlstr = @sqlstr + '  a.Comp_Code,a.Location_Code  '        
select @sqlstr = @sqlstr + '  ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + '   '  
select @sqlstr = @sqlstr + '  ,a.DeptCode,b.Deptname ,a.Others_Desc '        
select @sqlstr = @sqlstr + '   ,a.Tot_Amount  '        
select @sqlstr = @sqlstr + '  FROM  Ins_Mechanic_HelperLink_Main as a '        
select @sqlstr = @sqlstr + '  left join Deptmaster as b  '        
select @sqlstr = @sqlstr + ' on b.Location_Code =a.location_code and b.DeptCode =a.DeptCode '             
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='   +  '''' + @Location_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
--select @sqlstr = @sqlstr + ' And a.Authorize=1  '        
        
select @sqlstr = @sqlstr + ' Order by a.Entry_Date desc'        
END        
        
print (@sqlstr)        
exec(@sqlstr)        
END 