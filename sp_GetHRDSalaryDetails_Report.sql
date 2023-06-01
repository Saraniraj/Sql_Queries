
-- ==============================================================                  
-- Author  : KRK       
-- Create date :15-12-2022
-- Modified date :17-12-2022            
-- Description : Get Employees Salary Details )                  
-- ===============================================================                  
-- Grant Execute On  To Public                  
                                  
                  
  --- exec [sp_GetHRDSalaryDetails_Report] '100','THENI','STAFF','','','2022-11-30','2022-11-30','','GetRegularSalaryabstract_Details'   
  --- exec [sp_GetHRDSalaryDetails_Report] '100','THENI','STAFF','','','2022-08-30','2022-08-30','','GetWorkersSalary_Details'   
  --- exec [sp_GetHRDSalaryDetails_Report] '100','THENI','STAFF','','','2022-08-30','2022-08-30','','GetWeeklyAdvance_Details'    
   
                             
 alter Proc [dbo].[sp_GetHRDSalaryDetails_Report]                  
(                  
@Comp_Code  Varchar(20),     
@Location_Code   Varchar(20),                  
@Cat_name   Varchar(250),                          
@Sex   Varchar(100),                  
@ATM   Varchar(100),                  
@from_date  Varchar(100),                  
@to_date    Varchar(100),                  
@Filter_Data  Varchar(500),                  
@mode            Varchar(150)                          
                  
)                  
as                  
BEGIN                  
set nocount on                  
set dateformat ymd                  
Declare @sqlstr varchar(8000)                  
                  
                  
Declare @mCat_name Varchar(100)                  
Set @mCat_name=''                  
                  
Declare @mDept_name Varchar(100)                  
Set @mDept_name=''                  
                  
Declare @matm Varchar(100)                  
Set @matm=''                  
                  
                  
Declare @mEmp_code Varchar(100)                  
Set @mEmp_code=''                  
                  
Declare @mShift_group Varchar(100)                  
Set @mShift_group=''                  
                  
Declare @mDesg_name Varchar(100)                  
Set @mDesg_name=''                  
                  
                  
Declare @mgender Varchar(100)                  
Set @mgender=''                  
                  
IF LTRIM(RTRIM(@Cat_name   ))='ALL' or LTRIM(RTRIM(@Cat_name ))=''                  
BEGIN                  
Set @mCat_name  ='%'                  
END                  
ELSE                  
BEGIN                  
Set @mCat_name =@Cat_name                     
END                  
                  
IF LTRIM(RTRIM(@Sex  ))='ALL' or LTRIM(RTRIM(@Sex ))=''                  
BEGIN                  
Set @mgender ='%'                  
END                  
ELSE                  
BEGIN                  
Set @mgender   =@Sex                      
END                  
                  
IF LTRIM(RTRIM(@ATM   ))='ALL' or LTRIM(RTRIM(@ATM ))=''                  
BEGIN                  
Set @matm  ='%'                  
END                  
ELSE                  
BEGIN                  
Set @matm   =@Sex                      
END                  
                  
       
	                  
IF                   
 (                  
  ltrim(rtrim(@mode))= 'GetRegularSalaryabstract_Details'                   
 )              
BEGIN                  
select @sqlstr = ' SELECt   '                  
                
                
		
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code  '
select @sqlstr = @sqlstr + ',a.FingerId,a.Empcode,a.EmpID,a.CatCode,a.DeptCode,a.DesignCode  '
select @sqlstr = @sqlstr + ',a.SDate,a.Present,a.Absent,a.Leave,a.WeeklyOff,a.Weekoff_Present,a.Extra_work,a.Extra_work_paid  '
select @sqlstr = @sqlstr + ',a.NH,a.FH,a.LOP  '
select @sqlstr = @sqlstr + ',a.TotalDays,a.PaidDays  '
select @sqlstr = @sqlstr + ',a.Cons_Wages,a.RsPerDay  '
select @sqlstr = @sqlstr + ',a.Basic,a.AttnEarning  '
select @sqlstr = @sqlstr + ',a.DAAmount1,a.DAAmount  '
select @sqlstr = @sqlstr + ',a.Skills,a.SKILLAmount1,a.SKILLAmount  '
select @sqlstr = @sqlstr + ',a.TotalEarnings,a.LeaveSalary,a.LOPAmount  '
select @sqlstr = @sqlstr + ',a.PFSource,a.ESISource  '
select @sqlstr = @sqlstr + ',a.PFAmount,a.EPFAmount,a.EPSAmount,a.ESIAmount,a.EmpESIAmount,a.MDESIAmount  '
select @sqlstr = @sqlstr + ',a.TotalDeductions,a.NetAmount  '
select @sqlstr = @sqlstr + ',a.OT_SALARY,a.Monthly_inc  '
select @sqlstr = @sqlstr + ' ,a.CoffeeAmount1,a.CoffeeAmount,a.MillManAmount1,a.MillManAmount  '
select @sqlstr = @sqlstr + ' ,a.BusfareAmount1 ,a.BusfareAmount  '
select @sqlstr = @sqlstr + ',a.Canteen,a.Advance,a.BankLoan,a.SalaryType,a.SalaryDay  '
select @sqlstr = @sqlstr + ',a.PF,a.EPF,a.EPS,a.ESI,a.EmpESI,a.MDESI  '
select @sqlstr = @sqlstr + ',a.MaxPFSalary,a.MaxESISalary,a.MinESISalary  '
select @sqlstr = @sqlstr + ',a.EarnRound,a.DedRound,a.AttnEarnRound,a.EarnDay  '
select @sqlstr = @sqlstr + ',a.GrossAmount,a.Grossround,a.SalaryDay1  '
select @sqlstr = @sqlstr + ',a.Weekoff_Day,a.No_Of_Woff,a.DaysInMonth,a.Factor_ID,a.IS_Closed  '
select @sqlstr = @sqlstr + ' , EmpName ,FatherName   '                
select @sqlstr = @sqlstr + ' ,ESINo ,UanNo ,PFNo ,C.CatName,Deptname, DesgnName    '                
select @sqlstr = @sqlstr + ' , DOJ, DOB, Sex ,ResignDate   '   
select @sqlstr = @sqlstr + ',round(((a.Basic+DAAmount1+SKILLAmount1 )/SalaryDay1 ),2)   as PER_DAY '  
select @sqlstr = @sqlstr + ',round((((a.Basic+DAAmount1+SKILLAmount1 )/SalaryDay1 )/9),2)   as PER_HRS '  
select @sqlstr = @sqlstr + ' ,b.AcNo '
select @sqlstr = @sqlstr + ' from SalStoreTable  as a  '            
select @sqlstr = @sqlstr + ' LEFT JOIN Emp_Master as b  ON  b.location_code=a.Location_Code  and  B.EMPCODE=A.EMPCODE  '        
select @sqlstr = @sqlstr + ' left join category_master as c on  c.location_code=a.Location_Code  and  c.CatCode  =A.CatCode   '                
select @sqlstr = @sqlstr + ' left join Deptmaster as d on  d.location_code=a.Location_Code  and  d.DeptCode =b.Deptcode    '                
select @sqlstr = @sqlstr + ' left join designation as e on   e.location_code=a.Location_Code  and  e.DesgnCode  =b.DesgnCode  '  
select @sqlstr = @sqlstr + ' left join Location_Details as f on   f.location_code=a.Location_Code   '                 
                  
select @sqlstr = @sqlstr + '    '                  
               select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''          
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''      
--Select @sqlstr = @sqlstr + '  a.CatCode  in (4,5) and '                   
Select @sqlstr = @sqlstr + ' and  c.Catname in ('  + @Cat_name      +')'                  
select @sqlstr = @sqlstr + '  and a.SDate = '   + '''' + @to_date     + ''''                  
Select @sqlstr = @sqlstr + ' and b.Sex like  ' + '''' + @mgender       +''''                  
IF ltrim(rtrim(@ATM)) = 'NON-ATM'                  
BEGIN         
select @sqlstr = @sqlstr + ' and  b.AcNo  in(''0'',''-'')'                  
end                   
else if  ltrim(rtrim(@ATM)) = 'ATM'                  
begin                   
select @sqlstr = @sqlstr + ' and  b.AcNo not in(''0'',''-'')   '                  
end                  
                 
Select @sqlstr = @sqlstr +  '' + @Filter_Data        +''                  
                  
--select @sqlstr = @sqlstr + '   order by   EmpCodeid ,d.SLNO  '                  
END                  
           
	                  
else IF                   
 (                  
  ltrim(rtrim(@mode))= 'GetWeeklyAdvance_Details'                   
 )              
BEGIN                  
select @sqlstr = ' SELECt   '                  
                
       select @sqlstr = @sqlstr + 'a.Entry_No,a.Entry_Date,a.Advance_Date,a.From_Date,a.To_Date  '
select @sqlstr = @sqlstr + ',a.Empcode,a.Fingerid,a.BASIC_PERDAY,a.SKILLS_PERDAY  '
select @sqlstr = @sqlstr + ',a.Std_Pay,a.OT_HRSpay,a.Present,a.Absent,a.NHFH,a.Total_Days  '
select @sqlstr = @sqlstr + ',a.Salary,a.NHFH_Salary,a.MIllMan_Amount,a.coffee_Amount,a.BusFare_Amount,a.OT_Pay,a.Total_Amount  '
select @sqlstr = @sqlstr + ',a.EPF,a.Advance_Amount,a.Late_Mts,a.Late_Fine,a.Balance,a.Others_Desc  '
select @sqlstr = @sqlstr + ', EmpName ,FatherName                '    
select @sqlstr = @sqlstr + ',ESINo ,UanNo ,PFNo ,C.CatName,Deptname, DesgnName     '          
select @sqlstr = @sqlstr + ', DOJ, DOB, Sex ,ResignDate      '
select @sqlstr = @sqlstr + 'FROM Powersoft_FDR.dbo.HRD_AdvanceEntry_Main as a  '
select @sqlstr = @sqlstr + 'LEFT JOIN Emp_Master as b  ON  b.location_code=a.Location_Code  and  B.EMPCODE=A.EMPCODE     '
select @sqlstr = @sqlstr + 'left join category_master as c on  c.location_code=a.Location_Code  and  c.CatCode  =b.CatCode     '               
select @sqlstr = @sqlstr + 'left join Deptmaster as d on  d.location_code=a.Location_Code  and  d.DeptCode =b.Deptcode      '              
select @sqlstr = @sqlstr + 'left join designation as e on   e.location_code=a.Location_Code  and  e.DesgnCode  =b.DesgnCode    '
select @sqlstr = @sqlstr + 'left join Location_Details as f on   f.location_code=a.Location_Code       '                
                  
select @sqlstr = @sqlstr + '    '                  
 select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''          
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''      
              
Select @sqlstr = @sqlstr + ' and  c.Catname in ('  + @Cat_name      +')'                  
select @sqlstr = @sqlstr + '  and Advance_Date between  ' + '''' + @From_Date  +''' and '+ '''' + @To_Date   +''''                   
Select @sqlstr = @sqlstr + ' and b.Sex like  ' + '''' + @mgender       +''''                  
IF ltrim(rtrim(@ATM)) = 'NON-ATM'                  
BEGIN         
select @sqlstr = @sqlstr + ' and  b.AcNo  in(''0'',''-'')'                  
end                   
else if  ltrim(rtrim(@ATM)) = 'ATM'                  
begin                   
select @sqlstr = @sqlstr + ' and  b.AcNo not in(''0'',''-'')   '                  
end                  
                 
Select @sqlstr = @sqlstr +  '' + @Filter_Data        +''                  
                  
--select @sqlstr = @sqlstr + '   order by   EmpCodeid ,d.SLNO  '                  
END   
 	                    
else IF                   
 (                  
  ltrim(rtrim(@mode))= 'GetWorkersSalary_Details'                   
 )              
BEGIN                  
select @sqlstr = ' SELECt   '                  
                
                
		select @sqlstr = @sqlstr + ' a.Empcode ,a.EmpID,a.FingerId '
 select @sqlstr = @sqlstr + ' ,a.PaidDays  ,a.Cons_Wages,a.RsPerDay  '
select @sqlstr = @sqlstr + ' ,B.Basic AS BASIC_PERDAY '
select @sqlstr = @sqlstr + ' ,B.Skill_Amount AS SKILLS_PERDAY '
select @sqlstr = @sqlstr + ' ,B.Basic +B.Skill_Amount AS Std_Pay '
select @sqlstr = @sqlstr + ' ,ROUND(((B.Basic +B.Skill_Amount)*85/100),0) AS  PF_ESI_Day '
select @sqlstr = @sqlstr + ' ,ROUND((((B.Basic +B.Skill_Amount)*85/100)*12/100),0) AS  PF_day '
select @sqlstr = @sqlstr + ' ,ROUND((((B.Basic +B.Skill_Amount)*85/100)*0.75/100),0) AS  ESI_Day '
select @sqlstr = @sqlstr + ' ,ROUND((((B.Basic +B.Skill_Amount)*85/100)*12/100),0) +ROUND((((B.Basic +B.Skill_Amount)*85/100)*0.75/100),0) AS    PF_ESI_TOTAL '
select @sqlstr = @sqlstr + ' ,a.MillManAmount1 AS MillMan '
select @sqlstr = @sqlstr + ' ,B.Basic +B.Skill_Amount +a.MillManAmount1 as Effective_Pay '
select @sqlstr = @sqlstr + ' ,ROUND(((B.Basic +B.Skill_Amount +a.MillManAmount1)/9)*1.15,0) as OT_HRSpay '
select @sqlstr = @sqlstr + ' ,a.Present,a.Absent,a.Leave,a.WeeklyOff  ,a.NH+a.FH as NHFH  ,a.TotalDays '
select @sqlstr = @sqlstr + '  ,a.Busfare_Days  '

select @sqlstr = @sqlstr + ' ,a.AttnEarning as EarnedBasic '
select @sqlstr = @sqlstr + ' ,a.SKILLAmount as EarnedSkill '
select @sqlstr = @sqlstr + ' ,a.TotalEarnings '
select @sqlstr = @sqlstr + ' ,a.CoffeeAmount as coffee '
select @sqlstr = @sqlstr + ' ,MillManAmount as MIllMan_Amount '
select @sqlstr = @sqlstr + ' ,0 as Busfare_Amount '
select @sqlstr = @sqlstr + ' ,a.TotalEarnings+a.CoffeeAmount +a.MillManAmount  as Total '
select @sqlstr = @sqlstr + ' ,a.PFSource as PF_ESI_Source '
select @sqlstr = @sqlstr + ' ,PFAmount as PF ,EmpESIAmount as ESI '
select @sqlstr = @sqlstr + ' ,PFAmount +EmpESIAmount as PFESI_Total '
select @sqlstr = @sqlstr + ' ,a.Advance,a.BankLoan '
select @sqlstr = @sqlstr + ' ,a.TotalDeductions '
select @sqlstr = @sqlstr + ' ,a.NetAmount   +a.CoffeeAmount +a.MillManAmount as NetAmount '
select @sqlstr = @sqlstr + ' ,EmpName ,FatherName    ,ESINo ,UanNo ,PFNo ,C.CatName,Deptname, DesgnName     , DOJ, DOB, Sex ,ResignDate   '
select @sqlstr = @sqlstr + '  ,round(((a.Basic+DAAmount1+SKILLAmount1 )/SalaryDay1 ),2)   as PER_DAY  '
select @sqlstr = @sqlstr + '  ,round((((a.Basic+DAAmount1+SKILLAmount1 )/SalaryDay1 )/9),2)   as PER_HRS  '
select @sqlstr = @sqlstr + '  ,b.AcNo  '
select @sqlstr = @sqlstr + '  ,a.CatCode  ,a.DeptCode,a.DesignCode  ,a.SDate  '
select @sqlstr = @sqlstr + ' from SalStoreTable  as a  '            
select @sqlstr = @sqlstr + ' LEFT JOIN Emp_Master as b  ON  b.location_code=a.Location_Code  and  B.EMPCODE=A.EMPCODE  '        
select @sqlstr = @sqlstr + ' left join category_master as c on  c.location_code=a.Location_Code  and  c.CatCode  =A.CatCode   '                
select @sqlstr = @sqlstr + ' left join Deptmaster as d on  d.location_code=a.Location_Code  and  d.DeptCode =b.Deptcode    '                
select @sqlstr = @sqlstr + ' left join designation as e on   e.location_code=a.Location_Code  and  e.DesgnCode  =b.DesgnCode  '  
select @sqlstr = @sqlstr + ' left join Location_Details as f on   f.location_code=a.Location_Code   '                 
                  
select @sqlstr = @sqlstr + '    '                  
               select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''          
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''      
--Select @sqlstr = @sqlstr + '  a.CatCode  in (4,5) and '                   
Select @sqlstr = @sqlstr + ' and  c.Catname in ('  + @Cat_name      +')'                  
select @sqlstr = @sqlstr + '  and a.SDate = '   + '''' + @to_date     + ''''                  
Select @sqlstr = @sqlstr + ' and b.Sex like  ' + '''' + @mgender       +''''                  
IF ltrim(rtrim(@ATM)) = 'NON-ATM'                  
BEGIN         
select @sqlstr = @sqlstr + ' and  b.AcNo  in(''0'',''-'')'                  
end                   
else if  ltrim(rtrim(@ATM)) = 'ATM'                  
begin                   
select @sqlstr = @sqlstr + ' and  b.AcNo not in(''0'',''-'')   '                  
end                  
                 
Select @sqlstr = @sqlstr +  '' + @Filter_Data        +''                  
                  
--select @sqlstr = @sqlstr + '   order by   EmpCodeid ,d.SLNO  '                  
END                 
print (@sqlstr)                  
exec(@sqlstr)                  
END
