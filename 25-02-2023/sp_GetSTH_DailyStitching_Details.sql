USE [DB_HRMS]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSTH_DailyStitching_Details]    Script Date: 02-Mar-2023 16:05:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==============================================================        
-- Author  : KRK       
-- Create date :03-03-2023
-- Modified date :03-03-2023      
-- Description : Get STH  Daily Stitching Details  (Insert / Update)        
-- ===============================================================        
-- Grant Execute On  To Public        
-- select * from STH_DailyStitchingEntry_Line        
-- select * from STH_DailyStitchingEntry_Main        
      
-- exec [sp_GetSTH_DailyStitching_Details] '100','Main Unit','INC/00008/20-21', '2020-07-02','Specify'      
--- exec [sp_GetSTH_DailyStitching_Details] '100','Main Unit','2020-07-02' ,'Increment Report'      
-- exec [sp_GetSTH_DailyStitching_Details] '100','Main Unit',' ','' ,'aLL'      
ALTER Proc [dbo].[sp_GetSTH_DailyStitching_Details]        
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
select @sqlstr = @sqlstr + ',a.STH_Date,a.Total_Stitched,a.Total_Amount,a.Unit,a.Others_Desc  ' 

select @sqlstr = @sqlstr + ' ,b.Sno,b.EmpCode,b.Tokenno,b.Ops_Code,b.Operation_Name,b.Product_Name '
select @sqlstr = @sqlstr + ' ,b.Rate_Per_Pcs,b.NO_of_Stitched,b.Stitched_Amount '
 select @sqlstr = @sqlstr + ' ,a.Authorize,a.Delete_Mode '  
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '     
select @sqlstr = @sqlstr + ' ,e.DesgnName,h.DesgnCode  '     

select @sqlstr = @sqlstr + '  FROM DB_HRMS.dbo.STH_DailyStitchingEntry_Main as a  '
select @sqlstr = @sqlstr + ' left join DB_HRMS.dbo.STH_DailyStitchingEntry_Line as b on b.Entry_No=a.Entry_No  '
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
select @sqlstr = @sqlstr + ' Order by h.Empid asc'         
END       
   
        
ELSE IF @Filter_Data  = 'All'        
BEGIN        
select @sqlstr = ' SELECT '        
      
select @sqlstr = @sqlstr + '    a.Comp_Code,a.Location_Code  ' 
select @sqlstr = @sqlstr + ',a.Entry_No,a.Entry_Date  ' 
select @sqlstr = @sqlstr + ',a.STH_Date,a.Total_Stitched,a.Total_Amount,a.Unit,a.Others_Desc  ' 
select @sqlstr = @sqlstr + ',a.Authorize,a.Delete_Mode  ' 
select @sqlstr = @sqlstr + ' FROM STH_DailyStitchingEntry_Main as a  ' 
select @sqlstr = @sqlstr + 'left join STH_DailyStitchingEntry_Line as b on b.Entry_No=a.Entry_No  ' 
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='   +  '''' + @Location_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
--select @sqlstr = @sqlstr + ' And a.Authorize=1  '        
        
select @sqlstr = @sqlstr + ' Order by a.Entry_Date desc'        
END   

   
else IF         
 (        
   @Filter_Data = 'Daily Stitching Entry'        
          
 )        
BEGIN        
       
select @sqlstr = 'SELECT  '        
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code '  

select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '  
select @sqlstr = @sqlstr + ',a.STH_Date,a.Total_Stitched,a.Total_Amount,a.Unit,a.Others_Desc  ' 

select @sqlstr = @sqlstr + ' ,b.Sno,b.EmpCode,b.Tokenno,b.Ops_Code,b.Operation_Name,b.Product_Name '
select @sqlstr = @sqlstr + ' ,b.Rate_Per_Pcs,b.NO_of_Stitched,b.Stitched_Amount '
 select @sqlstr = @sqlstr + ' ,a.Authorize,a.Delete_Mode '  
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '     
select @sqlstr = @sqlstr + ' ,e.DesgnName,h.DesgnCode  '     

select @sqlstr = @sqlstr + '  FROM DB_HRMS.dbo.STH_DailyStitchingEntry_Main as a  '
select @sqlstr = @sqlstr + ' left join DB_HRMS.dbo.STH_DailyStitchingEntry_Line as b on b.Entry_No=a.Entry_No  '
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
select @sqlstr = @sqlstr + ' and a.STH_Date='   + '''' + @Att_date  + ''''       
END            
        
print (@sqlstr)        
exec(@sqlstr)        
END  



