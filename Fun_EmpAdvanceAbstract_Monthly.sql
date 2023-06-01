USE  Powersoft_FDR 
GO
/****** Object:  UserDefinedFunction [dbo].[Fun_OvertimeAbstract_Monthly]    Script Date: 06/04/2023 15:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ============================================================        
-- Author  : RAJKUMAR.K        
-- Create date : 06/05/2017        
-- Description : Get Employee Monthly Attendance Details       
-- =============================================================        
-- Grant Execute On sp_GetEmployeeMaster_Details To Public        
--- select *  from [Fun_EmpAdvanceAbstract_Monthly] ('2023-03-01','2023-03-31') ORDER BY Empcode

alter function [dbo].[Fun_EmpAdvanceAbstract_Monthly] (@Fdate as datetime,@Tdate as datetime)  returns Table
 
return    
(    
      
    SELECt
	A.COMP_CODE,
 a.Empcode as Empcode,h.EmpName as EmpName  
 ,IsNull(C.CatName ,'') as CatName
 ,sex,H.SGroup AS SHIFT
 ,IsNull(d.DEPTname,'') as Deptname
 ,IsNull(e.Desgnname,'') as Desgnname   
 

 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,0,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D1 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,1,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D2 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,2,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D3 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,3,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D4 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,4,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D5
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,5,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D6 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,6,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D7 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,7,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D8 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,8,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D9 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,9,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D10
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,10,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D11
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,11,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D12
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,12,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D13 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,13,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D14 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,14,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D15 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,15,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D16 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,16,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D17 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,17,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D18 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,18,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D19 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,19,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D20
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,20,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D21 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,21,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D22 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,22,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D23 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,23,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D24 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,24,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D25
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,25,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D26 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,26,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D27
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,27,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D28 
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,28,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D29
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,29,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D30
 , COALESCE(SUM(CASE WHEN   a.Advance_Date= DATEADD(day,30,@Fdate) THEN (a.Advance_Amount+a.Personal_Advance) ELSE NULL END),'0') AS D31 
 
 
 FROM HRD_AdvanceEntry_Main a  
  
 left  join Emp_Master h on H.EmpCode =a.EmpCode  
 left join category_master as c on c.CatCode  =h.CatCode 
 left join Deptmaster as d on d.DeptCode =h.Deptcode  
 left join designation as e on e.DesgnCode  =h.DesgnCode 
 Where     a.Advance_Date between   @fdate and @tdate
 and a.Delete_Mode=0  
 group by A.Comp_Code , a.EmpCode  ,h.EmpName ,h.AcNo
 ,C.CatName ,d.DeptName  ,e.DesgnName    
 ,h.Account_Type , h.Branch_Code ,h.IFSC_Code  
 ,sex,H.SGroup 
 
 

      ,h.Branch_Location
)

