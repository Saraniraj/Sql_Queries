USE  PowerERP_ACV 
GO
/****** Object:  UserDefinedFunction [dbo].[Fun_AttnMusterMonthly]    Script Date: 16/12/2022 15:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================================        
-- Author  : RAJKUMAR.K        
-- Create date : 03/04/2017        
-- Description : Get Employee Monthly Attendance Details       
-- =============================================================        
-- Grant Execute On sp_GetEmployeeMaster_Details To Public        
---  select *  from [Fun_AttnMusterMonthly] ('2022-11-01','2022-11-30','') order by catname 


ALTER function [dbo].[Fun_AttnMusterMonthly] (@From_Date as datetime,@to_Date as datetime,@status as varchar) 


 returns Table
 
return
     
(     
SELECT empcode, empname, CatName as catname  
,DeptName ,DesgnName   
,ISNULL ([1],'-') as  [1],ISNULL ([2],'-') as  [2]    
,ISNULL ([3],'-') as  [3]
,ISNULL ([4],'-') as  [4],ISNULL ([5],'-') as  [5]  
,ISNULL ([6],'-') as  [6]   
,ISNULL ([7],'-') as  [7],ISNULL ([8],'-') as  [8]  
,ISNULL ([9],'-') as  [9]  
,ISNULL ([10],'-') as  [10],ISNULL ([11],'-') as  [11],ISNULL ([12],'-') as  [12] 
,ISNULL ([13],'-') as  [13],ISNULL ([14],'-') as  [14],ISNULL ([15],'-') as  [15]    
,ISNULL ([16],'-') as  [16],ISNULL ([17],'-') as  [17],ISNULL ([18],'-') as  [18]    
,ISNULL ([19],'-') as  [19],ISNULL ([20],'-') as  [20],ISNULL ([21],'-') as  [21]    
,ISNULL ([22],'-') as  [22],ISNULL ([23],'-') as  [23],ISNULL ([24],'-') as  [24]    
,ISNULL ([25],'-') as  [25],ISNULL ([26],'-') as  [26],ISNULL ([27],'-') as  [27]    
,ISNULL ([28],'-') as  [28],ISNULL ([29],'-') as  [29],ISNULL ([30],'-') as  [30]    
,ISNULL ([31],'-') as  [31]   
,DOB ,DOJ ,ResignDate ,SGroup ,ShiftGroup ,EmpCodeId     
 FROM (     
    
 SELECT  a.empcode ,b.empname  ,b.SGroup,b.ShiftGroup      
 , c.CatName as  CatName,     
 d.DeptName ,e.DesgnName    
 ,isnull(DATENAME(day, a.SDate ),0) At_day    
 ,b.DOB ,b.DOJ ,b.ResignDate ,b.EmpCodeId     
    
 ,case when a.Status  in ('X','/','/A','/CL','/PL','E') then 
 
-- Case when a.ShiftId IN (1  ,4 ,5,6) then '1' 
-- when a.ShiftId IN (2) then '2'        
-- when a.shiftid  IN (3) then '3'                                                               
-- when a.shiftid=1 OR a.shiftid=2 OR a.shiftid=3 OR a.shiftid=14  then 'X'       
-- when  a.shiftid=0 then a.Status     
--else '-' end      
 a.Status 
when a.Status  in ('OD') then 'P'    
else  a.Status  end  as At_Status1  

   
 from Temp_MusterAttendance   as a   
  left join Emp_Master as b on b.EmpCode =a.EmpCode     
and b.EmpCode <>'0'   
 left join Category_Master  as c on c.CatCode =b.Catcode   
 left join Deptmaster  as d on d.DeptCode  =b.Deptcode      
 left join Designation  as e on e.DesgnCode  =b.Desgncode    
      
 left join Shift_Master  as f on f.ShiftId =a.ShiftId     
   left join statusmaster   as g on g.code  =a.Status   
      
 where   
      
       
  --a.EmpCode ='BR620'   
  a.SDate >b.DOJ  
   and( b.ResignDate ='1900-01-01' or a.SDate<=b.ResignDate )  
  
--and  c.catname in (  @mCat_name      )   
        
   and SDate between    
    
   DATEADD(MONTH, DATEDIFF(MONTH , 0,   @From_Date    )-0, 0) and DATEADD(MONTH, DATEDIFF(MONTH , -1, @To_Date )-0, -1)     
    
            
 GROUP BY c.CatName,  d.DeptName ,e.DesgnName     
 , a.EmpCode ,b.empname  ,DATENAME(day, a.SDate)     
 ,a.shiftid,a.Status ,b.DOB ,b.DOJ ,b.ResignDate     
 ,b.SGroup ,b.ShiftGroup ,b.EmpCodeId     
     
     
  ) AS MontlyAttData    
          
PIVOT( min(At_Status1)    
FOR At_day IN ([1],[2],[3],[4],[5],[6],[7],[8],[9]     
,[10],[11],[12],[13],[14],[15]     
,[16],[17],[18],[19],[20],[21],[22],[23],[24],[25]     
,[26],[27],[28],[29],[30],[31]     
  )) AS MNamePivot    
  --order by catname    
      
    
    

)




----select * from statusmaster 