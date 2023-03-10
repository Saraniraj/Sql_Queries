USE [DB_HRMS]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProll_Overtime_Details]    Script Date: 03-Feb-2023 16:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==============================================================        
-- Author  : KRK       
-- Create date :03-02-2023
-- Modified date :03-02-2023      
-- Description : Get Manual OT ENTRY Line  (Insert / Update)        
-- ===============================================================        
-- Grant Execute On  To Public        
-- select * from OvertimeHead        
-- select * from OVERTIME        
      
-- exec [sp_GetProll_Overtime_Details] '100','Main Unit','INC/00008/20-21', '2020-07-02','Specify'      
--- exec [sp_GetProll_Overtime_Details] '100','Main Unit','2020-07-02' ,'Increment Report'      
-- exec [sp_GetProll_Overtime_Details] '100','Main Unit',' ','' ,'aLL'      
      
      
        
        
        
ALTER Proc [dbo].[sp_GetProll_Overtime_Details]        
(        
@Comp_Code    Varchar(20),        
@Location_Code   Varchar(20),        
--@Fin_Year_Code   Varchar(10),        
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
select @sqlstr = @sqlstr + ' ,a.OT_Date,a.ShiftId,a.OT_Type '  
select @sqlstr = @sqlstr + ' ,a.Tot_OT_Hours,a.Tot_OT_Amount,a.Unit,a.Others_Desc '  
select @sqlstr = @sqlstr + ' ,b.EmpCode,b.Tokenno,b.SDate '  
select @sqlstr = @sqlstr + ' ,b.DaySalary,b.OtHours,b.OTPercent '  
select @sqlstr = @sqlstr + ' ,b.OT_Amount,b.Otincen,b.OtNett '  
select @sqlstr = @sqlstr + ' ,b.OTFlag,b.Unit '  
select @sqlstr = @sqlstr + ' ,b.DEPTCODE,b.DIVICODE,b.DESGCODE,b.OTCAT,b.SHED '  
select @sqlstr = @sqlstr + ' ,a.Authorize,a.Delete_Mode '  
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '     
select @sqlstr = @sqlstr + ' FROM DB_HRMS.dbo.Proll_OvertimeEntry_Main as a '  
select @sqlstr = @sqlstr + ' left join DB_HRMS.dbo.Proll_OvertimeEntry_Line as b  '  
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date and b.Location_Code=a.Location_Code  '  
select @sqlstr = @sqlstr + '  '  
    
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on   h.Empid=b.Tokenno and h.Location_Code=a.Location_Code '        
--select @sqlstr = @sqlstr + ' left join Category_Master as c       
--on c.Location_Code =b.location_code and c.CatCode =a.cat_code '        
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
select @sqlstr = @sqlstr + '  '

select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '  
select @sqlstr = @sqlstr + ' ,a.OT_Date,a.ShiftId,a.OT_Type '  
select @sqlstr = @sqlstr + ' ,a.Tot_OT_Hours,a.Tot_OT_Amount,a.Unit,a.Others_Desc '  
select @sqlstr = @sqlstr + ' ,b.EmpCode,b.Tokenno,b.SDate '  
select @sqlstr = @sqlstr + ' ,b.DaySalary,b.OtHours,b.OTPercent '  
select @sqlstr = @sqlstr + ' ,b.OT_Amount,b.Otincen,b.OtNett '  
select @sqlstr = @sqlstr + ' ,b.OTFlag,b.Unit '  
select @sqlstr = @sqlstr + ' ,b.DEPTCODE,b.DIVICODE,b.DESGCODE,b.OTCAT,b.SHED '  
select @sqlstr = @sqlstr + ' ,a.Authorize,a.Delete_Mode '  
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '     
select @sqlstr = @sqlstr + ' FROM DB_HRMS.dbo.Proll_OvertimeEntry_Main as a '  
select @sqlstr = @sqlstr + ' left join DB_HRMS.dbo.Proll_OvertimeEntry_Line as b  '  
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date and b.Location_Code=a.Location_Code  '  
select @sqlstr = @sqlstr + '  '  
    
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on   h.Empid=b.Tokenno and h.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =a.cat_code '        
select @sqlstr = @sqlstr + ' left join Deptmaster as d  '        
select @sqlstr = @sqlstr + ' on d.Location_Code =b.location_code and d.DeptCode =h.Deptcode  '        
select @sqlstr = @sqlstr + ' left join Designation as e  '        
select @sqlstr = @sqlstr + ' on e.Location_Code =b.location_code and e.DesgnCode =h.Desgncode  '       
       
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_No='   + '''' + @Trans_No  + '''' 
select @sqlstr = @sqlstr + ' and a.Att_date='   + '''' + @Att_date  + ''''       
END       
        
ELSE IF @Filter_Data  = 'All'        
BEGIN        
select @sqlstr = ' SELECT '        
      
select @sqlstr = @sqlstr + '  a.Comp_Code,a.Location_Code  '        
select @sqlstr = @sqlstr + '  ,a.Entry_No,a.Entry_Date '        
     
select @sqlstr = @sqlstr + ' ,a.OT_Date,a.ShiftId,a.OT_Type '
select @sqlstr = @sqlstr + '   ,a.Tot_OT_Hours,a.Tot_OT_Amount,a.Unit,a.Others_Desc    '        
  
 select @sqlstr = @sqlstr + '  FROM  Proll_OvertimeEntry_Main as a '        
 --select @sqlstr = @sqlstr + '  left join Category_Master as b  '        
 --select @sqlstr = @sqlstr + ' on b.Location_Code =a.location_code and b.CatCode =a.cat_code '        
      
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='   +  '''' + @Location_Code   + ''''        
      
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
--select @sqlstr = @sqlstr + ' And a.Authorize=1  '        
        
select @sqlstr = @sqlstr + ' Order by a.Entry_Date desc'        
END        
        
print (@sqlstr)        
exec(@sqlstr)        
END  



