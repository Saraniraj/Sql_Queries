USE [DB_HRMS]
GO
/****** Object:  Table [dbo].[HRD_OtherDeductionEntry_Line]    Script Date: 03-02-2025 9:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[HRD_OtherDeductionEntry_Line](
	[Comp_Code] [nvarchar](100) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [nvarchar](150) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Sno] [varchar](10) NOT NULL,
	[EmpCode] [nvarchar](150) NOT NULL,
	[EmpID] [nvarchar](150) NULL,
	[DeptCode] [nvarchar](150) NULL,
	[SDate] [datetime] NOT NULL,
	[Amount] [float] NOT NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_HRD_OtherDeductionEntry_Line] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Sno] ASC,
	[EmpCode] ASC,
	[SDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HRD_OtherDeductionEntry_Main]    Script Date: 03-02-2025 9:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HRD_OtherDeductionEntry_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [varchar](100) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Sdate] [datetime] NOT NULL,
	[Earn_Month] [nvarchar](50) NOT NULL,
	[Earn_Year] [nvarchar](50) NOT NULL,
	[Cat_Code] [nvarchar](150) NOT NULL,
	[Earn_Name] [nvarchar](50) NOT NULL,
	[EDId] [int] NOT NULL,
	[AliseEarn_Name] [nvarchar](50) NULL,
	[Tot_Amount] [float] NOT NULL,
	[Others_Desc] [nvarchar](150) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_HRD_OtherDeductionEntry_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Earn_Month] ASC,
	[Earn_Year] ASC,
	[Cat_Code] ASC,
	[EDId] ASC,
	[Sdate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proll_MonthlyDeductionEntry_Line]    Script Date: 03-02-2025 9:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Proll_MonthlyDeductionEntry_Line](
	[Comp_Code] [nvarchar](100) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [nvarchar](150) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Sno] [varchar](10) NOT NULL,
	[EmpCode] [nvarchar](15) NOT NULL,
	[Tokenno] [nvarchar](15) NOT NULL,
	[EmpName] [nvarchar](150) NOT NULL,
	[Amount] [float] NOT NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Proll_MonthlyDeductionEntry_Line] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Sno] ASC,
	[Tokenno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proll_MonthlyDeductionEntry_Main]    Script Date: 03-02-2025 9:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proll_MonthlyDeductionEntry_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [varchar](100) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Sdate] [datetime] NOT NULL,
	[Ded_Month] [nvarchar](50) NOT NULL,
	[Ded_Year] [nvarchar](50) NOT NULL,
	[Cat_Code] [nvarchar](150) NOT NULL,
	[Ded_Name] [nvarchar](50) NOT NULL,
	[Tot_Amount] [float] NOT NULL,
	[Others_Desc] [nvarchar](150) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Proll_MonthlyDeductionEntry_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_GetHRD_OtherDeduction_Details]    Script Date: 03-02-2025 9:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================        
-- Author  : KRK       
-- Create date :15-01-2022
-- Modified date :15-01-2022      
-- Description : Get Manual OT ENTRY Line  (Insert / Update)        
-- ===============================================================        
-- Grant Execute On  To Public        
-- select * from OvertimeHead        
-- select * from OVERTIME        
      
-- exec [sp_GetHRD_OtherDeduction_Details] 'LS SPIN','SPINNING','INC/00008/20-21' ,'Specify'      
--- exec [sp_GetHRD_OtherDeduction_Details] 'LS SPIN','SPINNING','2020-07-02' ,'Increment Report'      
-- exec [sp_GetHRD_OtherDeduction_Details] 'LS SPIN','SPINNING',' ','' ,'aLL'      
      
      
        
        
        
Create Proc [dbo].[sp_GetHRD_OtherDeduction_Details]        
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
select @sqlstr = @sqlstr + ' ,a.Sdate,a.Earn_Month,a.Earn_Year '        
select @sqlstr = @sqlstr + ' ,a.Cat_Code,c.CatName ,a.Others_Desc '   
select @sqlstr = @sqlstr + ' ,a.Earn_Name,a.EDId ,a.AliseEarn_Name '             
select @sqlstr = @sqlstr + ' ,b.Entry_No,b.Entry_Date '        
select @sqlstr = @sqlstr + ' ,b.Sno,b.EmpCode,b.EmpID '        
select @sqlstr = @sqlstr + ' ,b.SDate '        
select @sqlstr = @sqlstr + ' ,b.Amount  '        
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  HRD_OtherDeductionEntry_Main as a '        
select @sqlstr = @sqlstr + ' left join  HRD_OtherDeductionEntry_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =a.cat_code '        
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
select @sqlstr = @sqlstr + ' ,a.Sdate,a.Earn_Month,a.Earn_Year '      
select @sqlstr = @sqlstr + ' ,a.Cat_Code,c.CatName ,a.Others_Desc '        
select @sqlstr = @sqlstr + ' ,a.Earn_Name,a.EDId ,a.AliseEarn_Name '        
       
select @sqlstr = @sqlstr + ' ,b.Sno,b.EmpCode,b.EmpID '        
select @sqlstr = @sqlstr + ' ,b.SDate '     
select @sqlstr = @sqlstr + ' ,b.Amount  '        
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  HRD_OtherDeductionEntry_Main as a '        
select @sqlstr = @sqlstr + ' left join  HRD_OtherDeductionEntry_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '       
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '        
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
select @sqlstr = @sqlstr + '  ,a.Sdate,a.Earn_Month,a.Earn_Year '        
  select @sqlstr = @sqlstr + ' ,a.Earn_Name,a.EDId ,a.AliseEarn_Name '  
select @sqlstr = @sqlstr + '  ,a.Cat_Code,b.CatName ,a.Others_Desc '        
select @sqlstr = @sqlstr + '   ,a.Tot_Amount  '        
  
 select @sqlstr = @sqlstr + '  FROM  HRD_OtherDeductionEntry_Main as a '        
 select @sqlstr = @sqlstr + '  left join Category_Master as b  '        
 select @sqlstr = @sqlstr + ' on b.Location_Code =a.location_code and b.CatCode =a.cat_code '        
      
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='   +  '''' + @Location_Code   + ''''        
      
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
--select @sqlstr = @sqlstr + ' And a.Authorize=1  '        
        
select @sqlstr = @sqlstr + ' Order by a.Entry_Date desc'        
END        
        
print (@sqlstr)        
exec(@sqlstr)        
END  













GO
/****** Object:  StoredProcedure [dbo].[sp_GetProll_MonthlyDeduction_Details]    Script Date: 03-02-2025 9:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==============================================================        
-- Author  : KRK       
-- Create date :31-12-2022
-- Modified date :31-12-2022      
-- Description : Get Payroll monthly Deductiion ENTRY Line  (Insert / Update)        
-- ===============================================================        
-- Grant Execute On  To Public        
-- select * from OvertimeHead        
-- select * from OVERTIME        
      
-- exec [sp_GetProll_MonthlyDeduction_Details] '100','Main Unit','Ded/00001/22-23', '2020-07-02','Specify'      
--- exec [sp_GetProll_MonthlyDeduction_Details] '100','Main Unit','2020-07-02' ,'Increment Report'      
-- exec [sp_GetProll_MonthlyDeduction_Details] '100','Main Unit',' ','' ,'aLL'      
      
      
        
        
        
CREATE Proc [dbo].[sp_GetProll_MonthlyDeduction_Details]        
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
select @sqlstr = @sqlstr + ' ,a.Sdate,a.Ded_Month,a.Ded_Year  ,a.Ded_Name '        
select @sqlstr = @sqlstr + ' ,a.Cat_Code,c.CatName ,a.Others_Desc '   
           
select @sqlstr = @sqlstr + ' ,b.Entry_No,b.Entry_Date '        
select @sqlstr = @sqlstr + ' ,b.Sno,b.EmpCode,b.Tokenno '        
    
select @sqlstr = @sqlstr + ' ,b.Amount  '        
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,isnull(h.EmpName,'''') as  EmpName '      
select @sqlstr = @sqlstr + ' FROM  Proll_MonthlyDeductionEntry_Main as a '        
select @sqlstr = @sqlstr + ' left join  Proll_MonthlyDeductionEntry_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on   h.empoldcode=b.Tokenno and h.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =a.cat_code '        
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
select @sqlstr = @sqlstr + ' Order by b.sno asc'         
END       
      
else IF         
 (        
   @Filter_Data = 'Other Earning Report'        
          
 )        
BEGIN        
       
select @sqlstr = 'SELECT  '        
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code '        
select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.Sdate,a.Ded_Month,a.Ded_Year  ,a.Ded_Name '      
select @sqlstr = @sqlstr + ' ,a.Cat_Code,c.CatName ,a.Others_Desc '        
   
       
select @sqlstr = @sqlstr + ' ,b.Sno,b.EmpCode,b.EmpID '        
select @sqlstr = @sqlstr + ' ,b.SDate '     
select @sqlstr = @sqlstr + ' ,b.Amount  '        
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  Proll_MonthlyDeductionEntry_Main as a '        
select @sqlstr = @sqlstr + ' left join  Proll_MonthlyDeductionEntry_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '       
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '        
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
     
select @sqlstr = @sqlstr + ' ,a.Sdate,a.Ded_Month,a.Ded_Year  ,a.Ded_Name '     
select @sqlstr = @sqlstr + '  ,a.Cat_Code,b.CatName ,a.Others_Desc '        
select @sqlstr = @sqlstr + '   ,a.Tot_Amount  '        
  
 select @sqlstr = @sqlstr + '  FROM  Proll_MonthlyDeductionEntry_Main as a '        
 select @sqlstr = @sqlstr + '  left join Category_Master as b  '        
 select @sqlstr = @sqlstr + ' on b.Location_Code =a.location_code and b.CatCode =a.cat_code '        
      
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='   +  '''' + @Location_Code   + ''''        
      
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
--select @sqlstr = @sqlstr + ' And a.Authorize=1  '        
        
select @sqlstr = @sqlstr + ' Order by a.Entry_Date desc'        
END        
        
print (@sqlstr)        
exec(@sqlstr)        
END  















GO
/****** Object:  StoredProcedure [dbo].[sp_Save_HRD_OtherDeductionEntry_Line]    Script Date: 03-02-2025 9:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================    
-- Author  : KRK       
-- Create date :15-01-2022
-- Modified date :15-01-2022
-- Description : Save Manual Other Deduction ENTRY Line  (Insert / Update)    
    
-- ========================================================    
    
    
Create Proc [dbo].[sp_Save_HRD_OtherDeductionEntry_Line]    
(    
@Comp_Code     Varchar(20),    
  
@Location_Code     Varchar(20),    
@Entry_No     Varchar(100),    
@Entry_Date     Varchar(100),    
@Sno      Varchar(100),    
@EmpCode     Varchar(100),    
@EmpID     Varchar(100),    
@DeptCode     Varchar(100),    
@Att_date    Varchar(100),     
 @Amount  Varchar(100),    
  
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
select @sqlstr = 'Insert into HRD_OtherDeductionEntry_Line Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code ))   + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Sno  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpCode ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpID ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@DeptCode   ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Att_date  ))  + ''''    
    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Amount   ))  + ''''     
    
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
  












GO
/****** Object:  StoredProcedure [dbo].[sp_Save_HRD_OtherDeductionEntry_Main]    Script Date: 03-02-2025 9:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================    
-- Author  : KRK       
-- Create date :15-01-2022
-- Modified date :15-01-2022 
-- Description : Save Manual OT ENTRY Main  (Insert / Update)    
-- ==================================================================    
    
CREATE Proc [dbo].[sp_Save_HRD_OtherDeductionEntry_Main]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
  
@Entry_No     Varchar(100),    
@Entry_Date     Varchar(100),    
@Att_date    Varchar(100),    
        
@Month   Varchar(100),    
@Year   Varchar(100),    
  
@Cat_Code    Varchar(100), 
@Earn_Name		varchar(50),
@EDId		varchar(50),
@AliseEarn_Name		varchar(50),  
   
@Tot_Amount    Varchar(100),   
  
@Others      Varchar(100),    
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
Declare @iMode   Numeric(18,0)    
Declare @iServerDate Varchar(19)    
Set @iMode=(    
Select Count(Entry_No) from HRD_OtherDeductionEntry_Main    
Where Comp_Code  = @Comp_Code     
And  Location_Code   = @Location_Code   
And  Entry_No  = @Entry_No     
And  Entry_Date   = @Entry_Date    
)    
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))    
BEGIN TRAN TRAN1    
select @sqlstr=''    
IF @iMode<=0     
BEGIN    
select @sqlstr = 'Insert into HRD_OtherDeductionEntry_Main Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))   + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Att_date  ))    + ''''    
  
    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Month ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Year ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Cat_Code ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Earn_Name    ))				+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EDId    ))				+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@AliseEarn_Name    ))				+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Tot_Amount  ))    + ''''    
  
  
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Others  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))     + ''''    
    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + ''''     
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + '''' + ')'    
END    
ELSE IF @iMode=1    
BEGIN    
select @sqlstr = 'Update HRD_OtherDeductionEntry_Main Set '    
select @sqlstr= @sqlstr + ' Earn_Month='    + '''' + ltrim(rtrim(@Month ))  + ''''    
  
select @sqlstr= @sqlstr + ',Earn_Year='   + '''' + ltrim(rtrim(@Year ))    + ''''    
    
select @sqlstr= @sqlstr + ',Cat_Code='   + '''' + ltrim(rtrim(@Cat_Code))  + ''''    
  
select @sqlstr= @sqlstr + ',Tot_Amount='   + '''' + ltrim(rtrim(@Tot_Amount))  + ''''    
  
  
select @sqlstr= @sqlstr + ',Others_Desc='   + '''' + ltrim(rtrim(@others))    + ''''    
select @sqlstr= @sqlstr + ',Authorize='    + '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ',Delete_Mode='   + '''' + ltrim(rtrim(@Delete_Mode))   + ''''    
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))   + ''''    
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate      + ''''    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code       + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
  
select @sqlstr= @sqlstr +  ' And Entry_No ='  + '''' + @Entry_No        + ''''      
select @sqlstr= @sqlstr +  ' And Entry_Date='  + '''' + @Entry_Date       + ''''      
END    
exec(@sqlstr )    
print @sqlstr    
IF @iMode=1    
BEGIN    
select @sqlstr = 'Delete from HRD_OtherDeductionEntry_Line'    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code   + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
  
select @sqlstr= @sqlstr +  ' And Entry_No='   + '''' +  @Entry_No   + ''''      
    
exec(@sqlstr )    
END    
IF (@@error <> 0) goto ErrHand    
COMMIT TRAN TRAN1    
select @iSuccessFlag=1    
return    
ErrHand:    
BEGIN    
ROLLBACK TRAN TRAN1    
select @iSuccessFlag=0    
END    
  
  
   












GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Proll_MonthlyDeductionEntry_Line]    Script Date: 03-02-2025 9:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ========================================================    
-- Author  : KRK       
-- Create date :31-12-2022
-- Modified date :31-12-2022     
-- Description : Save Payroll Monthly Deduction ENTRY Line  (Insert / Update)    
    
-- ========================================================    
    
    
Create Proc [dbo].[sp_Save_Proll_MonthlyDeductionEntry_Line]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(100),    
@Entry_Date     Varchar(100),    
@Sno      Varchar(100),    
@EmpCode     Varchar(100),    
@Tokenno    Varchar(100),    
@Empname     Varchar(100),    
@Amount  Varchar(100),    
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
select @sqlstr = 'Insert into Proll_MonthlyDeductionEntry_Line Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code ))   + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Sno  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpCode ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Tokenno ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Empname    ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Amount   ))  + ''''     
    
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
  














GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Proll_MonthlyDeductionEntry_Main]    Script Date: 03-02-2025 9:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================    
-- Author  : KRK       
-- Create date :31-12-2022
-- Modified date :31-12-2022 
-- Description : Save Payroll monthly Deduction Main  (Insert / Update)    
-- ==================================================================    
    
create Proc [dbo].[sp_Save_Proll_MonthlyDeductionEntry_Main]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(100),    
@Entry_Date     Varchar(100),    
@Att_date    Varchar(100),    
@Month   Varchar(100),    
@Year   Varchar(100),    
@Cat_Code    Varchar(100), 
@Ded_Name		varchar(50),

@Tot_Amount    Varchar(100),   
  
@Others      Varchar(100),    
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
Declare @iMode   Numeric(18,0)    
Declare @iServerDate Varchar(19)    
Set @iMode=(    
Select Count(Entry_No) from Proll_MonthlyDeductionEntry_Main    
Where Comp_Code  = @Comp_Code     
And  Location_Code   = @Location_Code   
And  Entry_No  = @Entry_No     
And  Entry_Date   = @Entry_Date    
)    
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))    
BEGIN TRAN TRAN1    
select @sqlstr=''    
IF @iMode<=0     
BEGIN    
select @sqlstr = 'Insert into Proll_MonthlyDeductionEntry_Main Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Att_date  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Month ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Year ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Cat_Code ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Ded_Name    ))				+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Tot_Amount  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Others  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + ''''     
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + '''' + ')'    
END    
ELSE IF @iMode=1    
BEGIN    
select @sqlstr = 'Update Proll_MonthlyDeductionEntry_Main Set '    
select @sqlstr= @sqlstr + ' Ded_Month='    + '''' + ltrim(rtrim(@Month ))  + ''''    
select @sqlstr= @sqlstr + ',Ded_Year='   + '''' + ltrim(rtrim(@Year ))    + ''''    
select @sqlstr= @sqlstr + ',Cat_Code='   + '''' + ltrim(rtrim(@Cat_Code))  + ''''   
select @sqlstr= @sqlstr + ',Ded_Name='   + '''' + ltrim(rtrim(@Ded_Name))  + ''''    
select @sqlstr= @sqlstr + ',Tot_Amount='   + '''' + ltrim(rtrim(@Tot_Amount))  + ''''    
select @sqlstr= @sqlstr + ',Others_Desc='   + '''' + ltrim(rtrim(@others))    + ''''    
select @sqlstr= @sqlstr + ',Authorize='    + '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ',Delete_Mode='   + '''' + ltrim(rtrim(@Delete_Mode))   + ''''    
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))   + ''''    
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate      + ''''    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code       + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
select @sqlstr= @sqlstr +  ' And Entry_No ='  + '''' + @Entry_No        + ''''      
select @sqlstr= @sqlstr +  ' And Entry_Date='  + '''' + @Entry_Date       + ''''      
END    
exec(@sqlstr )    
print @sqlstr    
IF @iMode=1    
BEGIN    
select @sqlstr = 'Delete from Proll_MonthlyDeductionEntry_Line'    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code   + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
  
select @sqlstr= @sqlstr +  ' And Entry_No='   + '''' +  @Entry_No   + ''''      
    
exec(@sqlstr )    
END    
IF (@@error <> 0) goto ErrHand    
COMMIT TRAN TRAN1    
select @iSuccessFlag=1    
return    
ErrHand:    
BEGIN    
ROLLBACK TRAN TRAN1    
select @iSuccessFlag=0    
END    
  
  
   














GO
