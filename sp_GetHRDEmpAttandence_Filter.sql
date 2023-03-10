USE [DB_HRMS]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetHRDEmpAttandence_Filter]    Script Date: 16/11/2022 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ============================================================      
-- Author  : KRK 
-- Create date :15-01-2022
-- Modified date :15-01-2022   
-- Description : Get Emp Attandence   Details     
-- =============================================================      
-- Grant Execute On sp_GetEmpAttandencebyType_Details To Public      
   
      
-- Exec [sp_GetHRDEmpAttandence_Filter] '100','','ADMIN-STAFF','ACCOUNTS','', "'A','B','C','G'",'','present','','All','ALL','2018-10-01','2018-10-31','GetEmpAttendancebyAttFilter'      
    
-- Exec [sp_GetHRDEmpAttandence_Filter] 'ls mills','ADMIN-STAFF','ACCOUNTS','', "'A','B','C','G'",'','present','','All','ALL','2020-09-24','2020-09-25','GetBioMetric_Finger_Details'      
      
--Exec [sp_GetHRDEmpAttandence_Filter] 'ls mills','','','','','3','','08:00','','','','2022-02-01','2022-02-4','GetEmpAttendancebyAttFilter' 
  
    
    
ALTER Proc [dbo].[sp_GetHRDEmpAttandence_Filter]      
(      
@Comp_Code    Varchar(20),  
@Location_Code    Varchar(20),  
  
@Cat_name   Varchar(5000),      
@Dept_name     Varchar(5000),    
@Desgn_name     Varchar(5000),    
@Shift_Group   Varchar(1000),    
@Shift   Varchar(100),      
@Status   Varchar(100),      
 @Gender   Varchar(100),      
@mCondition Varchar(100),  
    
@From_Date    Varchar(50),    
@To_Date    Varchar(50),    
@mode      Varchar(150)      
)      
as      
BEGIN      
set nocount on      
set dateformat ymd      
Declare @sqlstr varchar(8000)      
print @Comp_Code   
  
Declare @mCat_name Varchar(1000)    
Set @mCat_name=''    
  
Declare @mshift Varchar(500)    
Set @mshift=''    
Declare @mDept_name Varchar(1000)    
Set @mDept_name=''    
  
Declare @mstatusname Varchar(100)    
Set @mstatusname=''    
  
  
Declare @mEmp_code Varchar(100)    
Set @mEmp_code=''    
  
Declare @munit Varchar(100) Set @munit=''    
Declare @mShift_group  Varchar(100)    
Set @mShift_group=''      
Declare @mDesg_name Varchar(100)    Set @mDesg_name=''    
Declare @mgender Varchar(100)    
Set @mgender=''    
  
  
  
IF LTRIM(RTRIM(@Cat_name   ))='ALL' or LTRIM(RTRIM(@Cat_name ))=''    
BEGIN    
Set @mCat_name  ='%'    
END    
ELSE    
BEGIN    
--Set @mCat_name ='%'+@Cat_name  +  '%'   
     

Set @mCat_name = @Cat_name 

     
END    
  
IF LTRIM(RTRIM(@Dept_name))='ALL' or LTRIM(RTRIM(@Dept_name ))=''   
BEGIN    
Set @mDept_name ='%'   
END    
ELSE    
BEGIN    
Set @mDept_name  ='%'+ @Dept_name    + '%'  
END    
  
IF LTRIM(RTRIM(@Status))='ALL' or LTRIM(RTRIM(@Status ))=''    
BEGIN      
Set @mstatusname ='%'    
END    
ELSE    
BEGIN    
Set @mstatusname  =@Status 
END    
  
IF LTRIM(RTRIM(@Shift ))='ALL' or LTRIM(RTRIM(@Shift ))=''    
BEGIN    
Set @mshift ='%'    
END    
ELSE    
BEGIN    
Set @mshift  =@Shift  
END   
  
  
  
IF LTRIM(RTRIM(@Desgn_name ))='ALL' or LTRIM(RTRIM(@Desgn_name ))=''    
BEGIN    
Set @mDesg_name ='%'    
END    
ELSE    
BEGIN    
Set @mDesg_name  =  '%'+   @Desgn_name +  '%'   
END    
  
  
 
  
  
     
IF LTRIM(RTRIM(@Shift_Group))='ALL' or LTRIM(RTRIM(@Shift_Group ))=''    
BEGIN    
Set @mShift_group  ='%'     
END    
ELSE    
BEGIN    
Set @mShift_group   =@Shift_Group 
END    
  
IF LTRIM(RTRIM(@Gender  ))='ALL' or LTRIM(RTRIM(@Gender  ))=''    
BEGIN    
Set @mgender   ='%'    
END    
ELSE    
BEGIN    
Set @mgender   =  @Gender +  '%'  
END    
  
  
IF     
(     
ltrim(rtrim(@mode))= 'GetEmpAttendancebyAttFilter'     
  
)    
  
BEGIN    
select @sqlstr= 'select row_number() Over (Order by AttendanceStatus,empcodeid) as slno '   
  
select @sqlstr = @sqlstr + '  ,  id, convert(varchar, Sdate, 105) AS Sdate   ,     WkDay '    
select @sqlstr = @sqlstr + '    ,EmpCode,    Empname,  sex,      catname,  Deptname,'    
select @sqlstr = @sqlstr + '   DesgnName,shift,    ShiftCode,SGroup,shiftname  ,status,   statusname, shiftID  ,     day2'    
select @sqlstr = @sqlstr + '  , InTime,   OutTime,  AttendanceStatus '    
select @sqlstr = @sqlstr + '  ,  empcodeid, Empid,  FingerId, doj,ResignDate '    
select @sqlstr = @sqlstr + '   ,WeeklyOff' 
select @sqlstr = @sqlstr + '   '      
select @sqlstr = @sqlstr + '   '    
      
select @sqlstr = @sqlstr + '   '    
      
  
select @sqlstr = @sqlstr + '  from  Fun_EmpMonthlyAttn' 
 
select @sqlstr = @sqlstr + ' ( '  + '''' + @Comp_Code +''' , '  + '''' + @Location_Code +''''   
select @sqlstr = @sqlstr + '  , ' + '''' + @From_Date  +''' , '+ '''' + @To_Date   +''')'    
 
Select @sqlstr = @sqlstr + ' Where Deptname like  ' + '''' + @mDept_name     +''''    
IF ltrim(rtrim(@mCat_name ))='%'     
BEGIN    
Select @sqlstr = @sqlstr + ' and  Catname like ' + '''' +  @mCat_name  +''''    
end     
else    
begin   
Select @sqlstr = @sqlstr + ' and  Catname like ' + '''' +  @mCat_name  +''''    
  
end     
Select @sqlstr = @sqlstr + ' and SGroup in ('  + @mShift_group      +')'    
Select @sqlstr = @sqlstr + ' and statusname like  ' + '''' + @mstatusname     +''''    
--Select @sqlstr = @sqlstr + ' and EmpCode like  ' + '''' + @mEmp_code +''''    
Select @sqlstr = @sqlstr + ' and Sex like  ' + '''' + @mgender +''''    
 Select @sqlstr = @sqlstr + ''+    @mCondition     
  
select @sqlstr = @sqlstr + ' order by AttendanceStatus,empcodeid  '      
  
end   
  
  
else IF     
(     
ltrim(rtrim(@mode))= 'GetEmpAttendancebyAttFilter_Abstract'     
  
)    
  
BEGIN    
select @sqlstr= 'select sum(Present) as present, sum(p.Absent) as Absent'   
  
select @sqlstr = @sqlstr + '  ,sum(Leave) as Leave,sum(Woff) as Woff,sum(NHFH) as NHFH '    
select @sqlstr = @sqlstr + '    , sum(p.Absent) +sum(Present) +sum(Leave) +sum(Woff) +sum(NHFH) as Total'    
select @sqlstr = @sqlstr + '   from ('    
select @sqlstr = @sqlstr + '  select'    
select @sqlstr = @sqlstr + '  CASE WHEN status  in (''X'',''/'',''P'',''OD'',''/L'',''L/'')  THEN isnull(sum(dayvalue),0) ELSE 0 END as Present'    
select @sqlstr = @sqlstr + ' ,CASE WHEN status  in (''/'',''A'',''E'',''FHA'',''NHA'',''HA'')  THEN isnull(sum(dayvalue),0) ELSE 0 END as Absent '    
select @sqlstr = @sqlstr + '  ,CASE WHEN status  in (''/L'',''L'',''CL'',''PL'',''EL'',''/CL'',''/PL'')  THEN isnull(sum(dayvalue),0) ELSE 0 END as Leave'    
select @sqlstr = @sqlstr + '  ,CASE WHEN status  in  (''W'',''Wx'')  THEN isnull(sum(dayvalue),0) ELSE 0 END as Woff'    
select @sqlstr = @sqlstr + ' ,CASE WHEN status  in (''NH'',''FH'',''H'')  THEN isnull(sum(dayvalue),0) ELSE 0 END as NHFH '     
select @sqlstr = @sqlstr + '  from  Fun_EmpMonthlyAttn'      
select @sqlstr = @sqlstr + ' ( '  + '''' + @Comp_Code +''' , '  + '''' + @Location_Code +''''   
select @sqlstr = @sqlstr + '  , ' + '''' + @From_Date  +''' , '+ '''' + @To_Date   +''')'    
Select @sqlstr = @sqlstr + '  where Deptname like  ' + '''' + @mDept_name     +''''    
  
IF ltrim(rtrim(@mCat_name ))='%'     
BEGIN    
Select @sqlstr = @sqlstr + ' and Catname like ' + '''' +  @mCat_name  +''''    
end     
else    
begin   
Select @sqlstr = @sqlstr + ' and Catname like ' + '''' +  @mCat_name  +''''    
end     
  
Select @sqlstr = @sqlstr + ' and Desgnname like  ' + '''' + @mDesg_name     +''''    
Select @sqlstr = @sqlstr + ' and SGroup in ('  + @mShift_group      +')'    
Select @sqlstr = @sqlstr + ' and statusname like  ' + '''' + @mstatusname     +'''' 

Select @sqlstr = @sqlstr + ' and Sex like  ' + '''' + @mgender +''''    
 
  
  
select @sqlstr = @sqlstr + ' group by status '    
select @sqlstr = @sqlstr + '  ) p  '      
select @sqlstr = @sqlstr + '   '      
select @sqlstr = @sqlstr + '   '   
  
  
end      
 else IF     
(     
ltrim(rtrim(@mode))= 'GetEmpMultiAttendancebyAttFilter'     
  
)    
  
BEGIN    
select @sqlstr= 'select row_number() Over (Order by AttendanceStatus,empcodeid) as slno '   
  
select @sqlstr = @sqlstr + '  ,  id, convert(varchar, Sdate, 105) AS Sdate   ,     WkDay '    
select @sqlstr = @sqlstr + '    ,EmpCode,    Empname,  sex,      catname,  Deptname,'    
select @sqlstr = @sqlstr + '   DesgnName,shift,    ShiftCode,SGroup,shiftname  ,status,   statusname, shiftID  ,     day2'    
select @sqlstr = @sqlstr + '  , InTime,   OutTime,  AttendanceStatus '    
select @sqlstr = @sqlstr + '  ,  empcodeid, Empid,  FingerId, doj,ResignDate '    
select @sqlstr = @sqlstr + '   ,WeeklyOff'    
 select @sqlstr = @sqlstr + '   '    
      
select @sqlstr = @sqlstr + '  from  Fun_EmpMonthlyAttn' 

select @sqlstr = @sqlstr + ' ( '  + '''' + @Comp_Code +''' , '  + '''' + @Location_Code +''''   
select @sqlstr = @sqlstr + '  , ' + '''' + @From_Date  +''' , '+ '''' + @To_Date   +''')'    
Select @sqlstr = @sqlstr + ' Where Deptname like  ' + '''' + @mDept_name     +''''    

IF ltrim(rtrim(@Cat_name ))='ALL'   or ltrim(rtrim(@Cat_name ))=''      
BEGIN    
Select @sqlstr = @sqlstr + ' and  Catname like ' + '''' +  @mCat_name  +''''    
end     
else    
begin     
Select @sqlstr = @sqlstr + ' and  Catname = ' + '''' +  @mCat_name  +''''    
end     

  
Select @sqlstr = @sqlstr + ' and Desgnname like  ' + '''' + @mDesg_name     +''''    
Select @sqlstr = @sqlstr + ' and SGroup in ('  + @mShift_group      +')'    
Select @sqlstr = @sqlstr + ' and statusname like  ' + '''' + @mstatusname     +''''    
Select @sqlstr = @sqlstr + ' and Sex like  ' + '''' + @mgender +''''    
 Select @sqlstr = @sqlstr + ''+    @mCondition       
  
select @sqlstr = @sqlstr + ' order by AttendanceStatus,empcodeid  '      
  
end   
  
  
  
  
   
    
print (@sqlstr)      
exec(@sqlstr)      
END
