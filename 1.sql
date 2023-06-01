--SELECT * FROM tmpSalProcess where empcode='FDR5'
--SELECT * FROM SalStoreTable where sdate='2023-03-31'

 
select '100' AS Comp_Code,'THENI' AS Location_Code,
 c.fingerid ,p.Empcode,c.Empid 
 ,p.CatCode,p.DeptCode,p.DesgnCode,'2023-03-31' as sdate   
      ,c.Present  ,c.ABLV ,0 as Leave   
	  ,c.woff	,	c.Woff_Psent
	  ,0 as Extra_work,0 as Extra_work_paid,c.NHFH,0 as FH,0 as LOP,c.Total as Total_Days   
 	
 ,[PRESENT]+c.NHFH as Paid_Days
 ,  p.ConsWages, p.wpday                
,case when p.SalaryType ='Monthly' then (( p.ConsWages) *75/100) 
 when  p.SalaryType ='Daily' then 
 ( p.Basic *p.SalaryDay )   else p.Basic end as basic
 ,([PRESENT]+c.NHFH)*([Basic] ) as AttnEarning
 , ISNULL((p.ConsWages)*25/100,0) as  DAAmount1
 ,0 as DAAmount


, p.SKILLS_PERDAY *p.SalaryDay
   as SkillAmount1
,round(((( p.SKILLS_PERDAY *p.SalaryDay) / [SalaryDay]) *([PRESENT]+c.NHFH)) ,2) as SkillAmount

,PF_ESI_Day*c.Busfare_Day  as PF_Source
,PF_ESI_Day*c.Busfare_Day  as ESI_Source

,ROUND(((PF_ESI_Day*c.Busfare_Day )*12/100),2)
,(p.PF_day* c.Busfare_Day) as PF 

,(p.ESI_Day* c.Busfare_Day) as ESI 

,ROUND((((p.Basic *p.SalaryDay +round(((( p.SKILLS_PERDAY *p.SalaryDay) / [SalaryDay]) *([PRESENT]+c.NHFH)) ,2))*85/100) ),2)


 , c.Empname 
,p.BASIC_PERDAY ,p.SKILLS_PERDAY  as Skills
,p.Std_Pay,p.PF_ESI_Day,p.PF_day,p.ESI_Day 

,round(ROUND((((p.Std_Pay+ sum(p.MIllMan_Amount))*85/100)*12/100),0) +ROUND((((p.Std_Pay+ sum(p.MIllMan_Amount))*85/100)*0.75/100),0),0) AS    PF_ESI_TOTAL 
,p.Std_Pay +sum(MIllMan_Amount) as Effective_Pay   
,case when p.catcode not in ('1')then ROUND(((p.Std_Pay +sum(MIllMan_Amount))/9)*1.15,0) else 0 end as OT_HRSpay   
,sum(coffee) as coffee,sum(MIllMan_Amount) as MIllMan_Amount,sum(Bus_Fare) as Bus_Fare 
 
,c.Present*p.Std_Pay as Salary  
,c.NHFH*p.Std_Pay as NHFH_Salary 

,(sum(coffee)*c.Present) as coffee_Amt,(sum(MIllMan_Amount)*c.Busfare_Day)as MIllMan_Amt,(sum(Bus_Fare)*c.Busfare_Day) as Bus_Fare_AMt 

,round((c.Present*p.Std_Pay)+(c.NHFH*p.Std_Pay)+(sum(coffee)*c.Present)+(sum(MIllMan_Amount)*c.Present)+(sum(Bus_Fare)*c.Busfare_Day),0) as Total_Salary 

--ROUND((TotalEarnings*85/100),0)

,round((p.PF_day* c.Busfare_Day) +(p.ESI_Day* c.Busfare_Day),0) as PFESI_Total 

,round((((c.Present*p.Std_Pay)+(c.NHFH*p.Std_Pay)+(sum(coffee)*c.Present)+(sum(MIllMan_Amount)*c.Present)+(sum(Bus_Fare)*c.Busfare_Day))  
+ (case when p.catcode Not in ('1')then (ROUND(((((p.Std_Pay +sum(MIllMan_Amount))/9)/60)*1.15),2)*(c.OT_Mts))else 0 end)  
) - 
((p.PF_day* c.Busfare_Day) +(p.ESI_Day* c.Busfare_Day) 
+(case when p.catcode not in ('1')then (ROUND(((((p.Std_Pay +sum(MIllMan_Amount))/9)/60)*1.15),2)*(c.LateMins+c.EarlyMins)) else 0 end)   
),0) as Net_Amount 
,isnull(i.Prev_Advance,0) as Prev_Advance  
,isnull(j.Personal_Advance,0) as Personal_Advance  

,c.Empid    , (c.LateMins+c.EarlyMins)  as LateMins, c.EarlyMins  as EarlyMins,c.OT_Mts  as OT_Mts  
,case when p.catcode Not in ('1')then (ROUND(((((p.Std_Pay +sum(MIllMan_Amount))/9)/60)*1.15),2)*(c.OT_Mts)) else 0 end as OT_AMt  
,case when p.catcode not in ('1')then round((ROUND(((((p.Std_Pay +sum(MIllMan_Amount))/9)/60)*1.15),2)*(c.LateMins+c.EarlyMins)),0) else 0 end as Latefine   

from ( 

Select a.EMPCODE 
,CASE WHEN Allow_Name='Coffee' THEN  ISNULL(sum(Amount),0)  ELSE 0 END AS coffee 
,CASE WHEN Allow_Name='Mill Man' THEN  ISNULL(sum(Amount),0)  ELSE 0 END AS MIllMan_Amount 
,CASE WHEN Allow_Name='Bus Fare' THEN  ISNULL(sum(Amount),0)  ELSE 0 END AS Bus_Fare 

,a.Basic AS BASIC_PERDAY  ,a.Skill_Amount AS SKILLS_PERDAY  
,a.Basic +a.Skill_Amount AS Std_Pay   
,ROUND(((a.Basic +a.Skill_Amount)*85/100),0) AS  PF_ESI_Day  
    ,CASE WHEN ISPF =1 THEN  ROUND((((a.Basic +a.Skill_Amount)*85/100)*12/100),2) ELSE 0 END AS  PF_day   
,Case When isESI =1 Then ROUND((((a.Basic +a.Skill_Amount)*85/100)*0.75/100),2)  Else 0 End As  ESI_Day   

               
,a.Catcode  ,a.Deptcode ,a.Desgncode 
,a.ConsWages,a.wpday,a.Basic,a.Skill_Amount,a.SalaryType,d.SalaryDay
from  Emp_Master As A     
LEFT JOIN  [HRD_OtherAllowanceEntry_Line] As b On            b.EMPCODE=a.EMPCODE   
LEFT JOIN  [HRD_OtherAllowanceEntry_Main] c On c.[Entry_No]=b.entry_No And c.entry_date=b.entry_date 
LEFT JOIN  Category_Master d On d.catcode=a.catcode
LEFT JOIN  Designation e  on e.DesgnCode =a.Desgncode 

where a.empcode <>'VPY0'  
GROUP BY a.EMPCODE,Allow_Name ,a.Basic    ,a.Skill_Amount ,a.Catcode  ,a.Deptcode ,a.Desgncode 
 ,A.ISPF,A.isESI  
 ,a.ConsWages,a.wpday,a.Basic,a.Skill_Amount,a.SalaryType,d.SalaryDay

) as p 
left join [Fun_AttendancenAbstract]    
(  'THENI' ,'2023-03-01' , '2023-03-31'    ) as C  
ON C.empcode =p.EmpCode and c.catcode='2'  

left JOIN   (SELECT AE.Empcode , SUM(AE.Advance_Amount) as Prev_Advance
,SUM(Personal_Advance) AS  Personal_Advance,Location_Code   
  FROM  HRD_AdvanceEntry_Main as AE   
  where Advance_Date between '2023-03-01' and '2023-03-31'    
              

GROUP BY AE.Empcode,Location_Code) AS i  ON  i.Empcode =p.Empcode       

Left Join(   
SELECT Aj.Empcode  , SUM(Amount) As  Personal_Advance, Location_Code    
 FROM  HRD_PersonalAdvance as Aj    
where Paid_Date between '2023-03-01' and '2023-03-31'     

GROUP BY Aj.Empcode,Location_Code) AS j  ON  j.Empcode =p.Empcode  

              

group by p.EmpCode ,c.Empid ,c.fingerid 
,p.catcode ,p.Deptcode ,p.Desgncode 

,p.BASIC_PERDAY,p.SKILLS_PERDAY,p.Std_Pay ,p.PF_ESI_Day,p.PF_day,p.ESI_Day 
,c.Present,c.ABLV   ,c.woff	,	c.Woff_Psent

 ,c.Busfare_Day ,c.NHFH ,c.total 
,c.Empname , c.LateMins  , c.EarlyMins  ,c.OT_Mts ,i.Prev_Advance,j.Personal_Advance 
,p.ConsWages,p.wpday,p.SalaryType,p.Basic,p.SalaryDay,p.Skill_Amount
having empid <> 0   
order by   c.Empid         




--select * from SalStoreTable where sdate='2023-03-31'  ORDER BY EMPID
--SELECT * FROM [Fun_AttendancenAbstract]    (  'THENI' ,'2023-03-01' , '2023-03-31' ) WHERE CatCode =2    order by   Empid    


select * from category_master