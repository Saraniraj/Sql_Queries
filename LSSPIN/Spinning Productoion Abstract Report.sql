use eSpin
go

---*****************************Mixing Report *****************************
SELECT a.Comp_code,a.Location_code,a.Fin_year_code 
,a.Mix_Date 
,a.Sub_Count_Code as Count_code  ,e.Sub_Count_Code   ,a.Ref_Doc_No as  Mix_no 
--,'' as Lot_No
,COUNT(b.Bale_No ) AS No_Of_Bales
,Tot_Net_Wt AS Mix_Kgs
,0 AS No_Of_Mc,0  AS Carding_Kgs,0 Card_Eff_P
,0 AS Sliver_STD_KGS,0 AS Sliver_ACT_PROD
, 0 AS Rippon_STD_KGS,0  AS Rippon_ACT_PROD
,0 as DRG_STD_PROD ,0 as DRG_ACT_PROD
,0 as    No_of_Machines,0 as  CBR_STD_PROD,0 as CBR_ACT_PROD
,0 as  DRG_STD_PROD, 0 as    DRG_ACT_PROD
,0 as SPX_STD_PROD,0 as SPX_ACT_PROD
,0 as no_of_Drums,0 as ACR_PROD 
,'' as Shift  ,'Mixing' as Type
FROM [eSpin]..Esp_Mix_main a  
left join Esp_Mix_line as b on 
b.Mix_No=a.Mix_No And a.Mix_Date=b.Mix_Date And a.fin_year_code=b.Fin_year_code
left outer join Esp_SubCount_Details e
on  e.Sub_Count_Code=a.Sub_Count_Code
where a.Location_code like 'spinning'
and a.Mix_Date between '2022-12-02' and '2022-12-02'   
and e.Sub_Count_code ='50sCC'
And a.delete_mode=0   
group by a.Comp_code,a.Location_code,a.Fin_year_code 
,a.Mix_Date ,a.Sub_Count_Code  ,e.Sub_Count_Code ,a.Ref_Doc_No ,a.Tot_Net_Wt

---*****************************Mixing Report End *****************************
union all
---*****************************Carding Report Starts *****************************
SELECT a.Comp_code,a.Location_code,a.Fin_year_code 
,a.Entry_Date  
,b.Count_code  as Count_code  ,e.Sub_Count_Code   ,e.Mix_no 
--,e.Lot_No as Lot_No
,0 AS No_Of_Bales
,0 AS Mix_Kgs
,(COUNT(b.Machine_Code )/3) AS No_Of_Mc
,sum(b.Prodn_Kgs)  AS Carding_Kgs
,avg(b.Eff_P)Card_Eff_P
,0 AS Sliver_STD_KGS,0 AS Sliver_ACT_PROD
, 0 AS Rippon_STD_KGS,0  AS Rippon_ACT_PROD
--,(avg(b.Hrs_Run)/60)Hrs_Run ,avg(b.Breaks)Breaks
,0 as DRG_STD_PROD ,0 as DRG_ACT_PROD
,0 as    No_of_Machines,0 as  CBR_STD_PROD,0 as CBR_ACT_PROD
,0 as  DRG_STD_PROD, 0 as    DRG_ACT_PROD
,0 as SPX_STD_PROD,0 as SPX_ACT_PROD
,0 as no_of_Drums,0 as ACR_PROD 
,a.Shift   ,'Carding' as Type
FROM [eSpin]..Esp_Carding_Main a  
left join Esp_Carding_Line as b  
on b.Entry_No =a.Entry_No  and b.Entry_Date=a.Entry_Date 
left outer join Esp_CardingCount_Details e
on      e.Count_Desc =b.Count_Code 
where a.Location_code like 'spinning'
and a.Entry_Date  between '2022-12-02' and '2022-12-02'   
and e.Sub_Count_code ='50sCC'
And a.delete_mode=0   
group by a.Comp_code,a.Location_code,a.Fin_year_code 
,a.Entry_Date ,b.Count_code   ,e.Sub_Count_Code ,e.Mix_no,e.Lot_No     ,a.Shift 
---*****************************Carding Report Ends *****************************
union all
---*****************************Sliver Report Starts *****************************
SELECT a.Comp_code,a.Location_code,a.Fin_year_code 
,a.Entry_Date 
,a.Count_code   ,e.sub_count_code,e.Mix_no
---,e.Lot_No 
,0 AS No_Of_Bales,0 AS Mix_Kgs
,0 AS No_Of_Mc,0  AS Carding_Kgs,0 Card_Eff_P
, (SUM((c.mc_speed*1.09*8*60)/840)/(e.Lap_Hank *2.2046)  ) AS Sliver_STD_kGS
,((SUM(a.hank) /(e.Lap_Hank *2.2046)  )) AS Sliver_ACT_PROD
, 0 AS Rippon_STD_kGS,0  AS Rippon_ACT_PROD

--,((SUM(a.hank) /(e.Lap_Hank *2.2046)  )/SUM((c.mc_speed*1.09*8*60)/840) ) as  Eff_Pers
,0 as DRG_STD_PROD ,0 as DRG_ACT_PROD
,0 as    No_of_Machines,0 as  CBR_STD_PROD,0 as CBR_ACT_PROD
,0 as  DRG_STD_PROD, 0 as    DRG_ACT_PROD
,0 as SPX_STD_PROD,0 as SPX_ACT_PROD
,0 as no_of_Drums,0 as ACR_PROD 
,Shift   ,'Sliver' as Type
FROM [eSpin]..Esp_Sliver_Hank a  
left outer join Esp_SliverMachine_Details c 
on  c.machine_code=a.machine_code  and  c.Sub_Location=a.Sub_Location_Code 
left outer join Esp_SliverCount_Details e
on e.Count_Desc=a.Count_Code 
and  e.comp_code=a.comp_code and a.Location_code=e.location_code 
and  a.Sub_Location_Code=e.Sub_Location   

where a.Location_code like 'spinning'
and a.Entry_Date between '2022-12-02' and '2022-12-02'   
and e.Sub_Count_code ='50sCC'
And a.delete_mode=0   
group by a.Comp_code,a.Location_code,a.Fin_year_code 
,a.Entry_Date 
,a.machine_Code
,a.Count_code   ,e.sub_count_code,e.Mix_no,e.Lot_No ,e.Lap_Hank,Shift 
 
---*****************************Sliver Report Ends *****************************
union all
---*****************************Rippon Report Starts *****************************
SELECT a.Comp_code,a.Location_code,a.Fin_year_code 
,a.Entry_Date 
,a.Count_code   ,e.sub_count_code,e.Mix_no
---,e.Lot_No 
,0 AS No_Of_Bales,0 AS Mix_Kgs
,0 AS No_Of_Mc,0  AS Carding_Kgs,0 Card_Eff_P
, 0 AS Sliver_STD_kGS,0 AS Sliver_ACT_PROD
, (SUM((c.mc_speed*1.09*8*60)/840)/(e.Lap_Hank *2.2046)  ) AS Rippon_STD_kGS
,((SUM(a.hank) /(e.Lap_Hank *2.2046)  )) AS Rippon_ACT_PROD
,0 as DRG_STD_PROD ,0 as DRG_ACT_PROD
,0 as    No_of_Machines,0 as  CBR_STD_PROD,0 as CBR_ACT_PROD
,0 as  DRG_STD_PROD, 0 as    DRG_ACT_PROD
--,((SUM(a.hank) /(e.Lap_Hank *2.2046)  )/SUM((c.mc_speed*1.09*8*60)/840) ) as  Eff_Pers
,0 as SPX_STD_PROD,0 as SPX_ACT_PROD
,0 as no_of_Drums,0 as ACR_PROD 
,Shift ,'Rippon' as Type
FROM [eSpin]..Esp_RipponLap_Hank a  
left outer join Esp_RipponLapMachine_details c 
on  c.machine_code=a.machine_code  and  c.Sub_Location=a.Sub_Location_Code 
left outer join Esp_RipponLapCount_details e
on e.Count_Desc=a.Count_Code 
and  e.comp_code=a.comp_code and a.Location_code=e.location_code 
and  a.Sub_Location_Code=e.Sub_Location   

where a.Location_code like 'spinning'
and a.Entry_Date between '2022-12-02' and '2022-12-02'   
and e.Sub_Count_code ='50sCC'
And a.delete_mode=0   
group by a.Comp_code,a.Location_code,a.Fin_year_code 
,a.Entry_Date 
,a.machine_Code
,a.Count_code   ,e.sub_count_code,e.Mix_no,e.Lot_No ,e.Lap_Hank
,Shift 
---*****************************Rippon Report Ends *****************************
union all
---*****************************Pre Drawing Report Starts *****************************
SELECT a.Comp_code,a.Location_code,a.Fin_year_code 
,a.Entry_Date 
,a.Count_code   ,e.sub_count_code,e.Mix_no
--,e.Lot_No 
,0 AS No_Of_Bales,0 AS Mix_Kgs
,0 AS No_Of_Mc,0  AS Carding_Kgs,0 Card_Eff_P
, 0 AS Sliver_STD_kGS,0 AS Sliver_ACT_PROD
, 0 AS Rippon_STD_kGS
,0 AS Rippon_ACT_PROD
,((SUM((3.1412 * a.Delivery_Roll_dia * a.Delivery_Roll_speed * e.Efficiency*8*60)/(84000 * 36)) /(e.Hank_Count*2.2046))*c.No_Of_Delivery ) as PREDRG_STD_PROD 
,ROUND(((SUM(a.hank) /(e.Hank_Count*2.2046))*c.No_Of_Delivery ),3) as PREDRG_ACT_PROD
,0 as    No_of_Machines,0 as  CBR_STD_PROD,0 as CBR_ACT_PROD
,0 as  DRG_STD_PROD, 0 as    DRG_ACT_PROD
,0 as SPX_STD_PROD,0 as SPX_ACT_PROD
,0 as no_of_Drums,0 as ACR_PROD 
,Shift ,'PRE-Drawing' as Type
--({DrawingCountwis.TotActKgs} / {DrawingCountwis.TotStdKgs})*100 as Eff%
  
FROM [eSpin]..Esp_PreDrawing_Hank a  
left outer join Esp_preDrawingMachine_Details c 
on  c.machine_code=a.machine_code  and  c.Sub_Location=a.Sub_Location_Code 
left outer join Esp_preDrawingCount_details e
on e.Count_Desc=a.Count_Code  
and  a.Sub_Location_Code=e.Sub_Location   

where a.Location_code like 'spinning'
and a.Entry_Date between '2022-12-02' and '2022-12-02'   
and e.Sub_Count_code ='50sCC'
And a.delete_mode=0   
group by a.Comp_code,a.Location_code,a.Fin_year_code 
,a.Entry_Date 
,a.machine_Code
,a.Count_code   ,e.sub_count_code,e.Mix_no,e.Lot_No ,e.Hank_Count,c.No_of_delivery ,Shift 
---*****************************Pre Drawing Report Ends *****************************
union all
---*****************************Comber Report Starts *****************************
SELECT a.Comp_code,a.Location_code,a.Fin_year_code 
,a.Entry_Date 

,a.Count_code   ,e.sub_count_code,e.Mix_no
--,e.Lot_No 
,0 AS No_Of_Bales,0 AS Mix_Kgs
,0 AS No_Of_Mc,0  AS Carding_Kgs,0 Card_Eff_P
, 0 AS Sliver_STD_kGS,0 AS Sliver_ACT_PROD
, 0 AS Rippon_STD_kGS
,0 AS Rippon_ACT_PROD
,0 as    PREDRG_STD_PROD ,0 as  PREDRG_ACT_PROD
,Count(a.machine_Code) as No_of_Machines
,(SUM((3.1412 * c.CalendarRoll_Dia * c.CalendarRoll_Speed * e.Efficiency*8*60)/(84000 * 36))  /(Hanks*2.2046))*No_Of_Delivery as CBR_STD_PROD
,(((SUM(a.hank)) /(Hanks*2.2046))*No_Of_Delivery) * (efficiency/100)    as CBR_ACT_PROD
,0 as  DRG_STD_PROD, 0 as    DRG_ACT_PROD
,0 as SPX_STD_PROD,0 as SPX_ACT_PROD
,0 as no_of_Drums,0 as ACR_PROD 
,Shift ,'COMBER' as Type
--({DrawingCountwis.TotActKgs} / {DrawingCountwis.TotStdKgs})*100 as Eff%
  
FROM [eSpin]..Esp_Comber_Hank a  
left outer join Esp_ComberMachine_Details c 
on  c.machine_code=a.machine_code  and  c.Sub_Location=a.Sub_Location_Code 
left outer join Esp_ComberCount_Details e
on e.Count_Desc=a.Count_Code  and  a.Sub_Location_Code=e.Sub_Location   

where a.Location_code like 'spinning'
and a.Entry_Date between '2022-12-02' and '2022-12-02'   
and e.Sub_Count_code ='50sCC'
And a.delete_mode=0   
group by a.Comp_code,a.Location_code,a.Fin_year_code ,a.Entry_Date 
 
,e.Hanks,c.No_Of_Delivery,efficiency
,a.Count_code   ,e.sub_count_code,e.Mix_no,e.Lot_No  
,shift 

---*****************************Comber Report Ends *****************************
union all
---*****************************Drawing Report Starts *****************************
SELECT a.Comp_code,a.Location_code,a.Fin_year_code 
,a.Entry_Date 
,a.Count_code   ,e.sub_count_code,e.Mix_no 
,0 AS No_Of_Bales,0 AS Mix_Kgs
,0 AS No_Of_Mc,0  AS Carding_Kgs,0 Card_Eff_P
,0 AS Sliver_STD_kGS,0 AS Sliver_ACT_PROD
,0 AS Rippon_STD_kGS
,0 AS Rippon_ACT_PROD
,0 as    PREDRG_STD_PROD ,0 as  PREDRG_ACT_PROD
,0 as    No_of_Machines,0 as  CBR_STD_PROD,0 as CBR_ACT_PROD
,((SUM((3.1412 * a.Delivery_Roll_dia * a.Delivery_Roll_speed * e.Efficiency*8*60)/(84000 * 36)) /(e.Hank_Count*2.2046))*c.No_Of_Delivery ) as DRG_STD_PROD
,ROUND(((SUM(a.hank) /(e.Hank_Count*2.2046))*c.No_Of_Delivery ),3) as DRG_ACT_PROD
,0 as SPX_STD_PROD,0 as SPX_ACT_PROD
,0 as no_of_Drums,0 as ACR_PROD 
,Shift ,'Drawing' as Type
--({DrawingCountwis.TotActKgs} / {DrawingCountwis.TotStdKgs})*100 as Eff%
  
FROM [eSpin]..[Esp_Drawing_Hank] a  
left outer join Esp_DrawingMachine_Details c 
on  c.machine_code=a.machine_code  and  c.Sub_Location=a.Sub_Location_Code 

left outer join Esp_DrawingCount_details e
on e.Count_Desc=a.Count_Code 
and  e.comp_code=a.comp_code and a.Location_code=e.location_code 
and  a.Sub_Location_Code=e.Sub_Location   

where a.Location_code like 'spinning'
and a.Entry_Date between '2022-12-02' and '2022-12-02'   
and e.Sub_Count_code ='50sCC'
And a.delete_mode=0   
group by a.Comp_code,a.Location_code,a.Fin_year_code 
,a.Entry_Date 
 
,a.Count_code   ,e.sub_count_code,e.Mix_no,e.Lot_No ,e.Hank_Count,c.No_of_delivery 
,Shift 
---*****************************  Drawing Report Ends *****************************
union all
---*****************************Simplex Report Starts *****************************

SELECT a.Comp_code,a.Location_code,a.Fin_year_code 
,a.Entry_Date 

,a.Count_code   ,e.sub_count_code,e.Mix_no
,0 AS No_Of_Bales,0 AS Mix_Kgs
,0 AS No_Of_Mc,0  AS Carding_Kgs,0 Card_Eff_P
,0 AS Sliver_STD_kGS,0 AS Sliver_ACT_PROD
,0 AS Rippon_STD_kGS
,0 AS Rippon_ACT_PROD
,0 as    PREDRG_STD_PROD ,0 as  PREDRG_ACT_PROD
,0 as    No_of_Machines,0 as  CBR_STD_PROD,0 as CBR_ACT_PROD
,0  as DRG_STD_PROD,0 as DRG_ACT_PROD
,(SUM((3.1412 * c.Front_Roll_dia * c.Front_Roll_speed  * e.Efficiency*8*60)/(84000 * 36)) /(Hank_Count*2.2046))*
(No_of_Spindles-idle_spindle) AS SPX_STD_PROD
,(((SUM(a.hank) /(Hank_Count*2.2046))* (No_of_Spindles-idle_spindle)) * (efficiency/100) ) AS SPX_ACT_PROD
,0 as no_of_Drums,0 as ACR_PROD 

,Shift ,'Simplex' as Type
FROM [eSpin]..Esp_Simplex_Hank a  
left outer join Esp_SimplexMachine_Details c 
on  c.machine_code=a.machine_code  and  c.Sub_Location=a.Sub_Location_Code 
left outer join Esp_SimplexCount_details e
on e.Count_Desc=a.Count_Code 
and  e.comp_code=a.comp_code and a.Location_code=e.location_code 
and  a.Sub_Location_Code=e.Sub_Location   

where a.Location_code like 'spinning'
and a.Entry_Date between '2022-12-02' and '2022-12-02'   
and e.Sub_Count_code ='50sCC'
And a.delete_mode=0   
group by a.Comp_code,a.Location_code,a.Fin_year_code 
,a.Entry_Date 
,a.machine_Code
,a.Count_code   ,e.sub_count_code,e.Mix_no,e.Lot_No ,e.Hank_Count
,Shift 
,No_of_Spindles,idle_spindle,Efficiency 

---*****************************Simplex Report Ends *****************************
union all
 
---*****************************AUTOCONER Report STARTS *****************************
 
SELECT a.Comp_code,a.Location_code,a.Fin_year_code 
,a.Entry_Date 
 
,a.Count_code   ,e.sub_count_code,e.Mix_no
---,e.Lot_No 
,0 AS No_Of_Bales,0 AS Mix_Kgs
,0 AS No_Of_Mc,0  AS Carding_Kgs,0 Card_Eff_P
,0 AS Sliver_STD_kGS,0 AS Sliver_ACT_PROD
,0 AS Rippon_STD_kGS
,0 AS Rippon_ACT_PROD
,0 as    PREDRG_STD_PROD ,0 as  PREDRG_ACT_PROD
,0 as    No_of_Machines,0 as  CBR_STD_PROD,0 as CBR_ACT_PROD
,0  as DRG_STD_PROD,0 as DRG_ACT_PROD
,0    AS SPX_STD_PROD,0 as SPX_ACT_PROD
,a.No_of_Drums as no_of_Drums,a.Prodn_Kgs as ACR_PROD 


,Shift 
,'Autoconer' as Type
 
 
  
FROM [eSpin]..[Esp_Autoconer_Production] a  
left outer join Esp_AutoConerMachine_Details c 
on  c.machine_code=a.machine_code  and  c.Sub_Location=a.Sub_Location_Code 

left outer join Esp_AutoconerCount_details e
on e.Count_Desc=a.Count_Code and  e.comp_code=a.comp_code and a.Location_code=e.location_code 
and  a.Sub_Location_Code=e.Sub_Location   

where a.Location_code like 'spinning'
and a.Entry_Date between '2022-12-03' and '2022-12-03'   
and e.Sub_Count_code ='50sCC'
And a.delete_mode=0   
group by a.Comp_code,a.Location_code,a.Fin_year_code 

,a.Entry_Date ,a.machine_Code
,a.Count_code   ,e.sub_count_code,e.Mix_no,e.Lot_No  ,shift,a.No_of_Drums
,a.Prodn_Kgs
---*****************************AUTOCONER Report ENDS *****************************

---*****************************Spinning Report Starts *****************************
SELECT A.ENTRY_DATE,a.Comp_code,a.Location_code,a.Fin_year_code,a.Sub_Location_Code,a.Count_code    
,e.sub_count_code,e.Mix_no,e.Lot_No ,e.Market,      
count(distinct(a.Machine_Code))as no_of_frames,a.Conv_Factor ,sum(a.hank) as hank,a.Machine_Code,      
   
((sum(c.No_Of_Spindles)/8) * 8) - (((sum(d.stop_time1)+sum(d.stop_time2)+sum(d.stop_time3)+sum(d.stop_time4)+sum(d.stop_time5))/60) * (sum(c.No_Of_Spindles)/8)) as worked_spindl,      
      
(((sum(d.stop_time1)+sum(d.stop_time2)+sum(d.stop_time3)+sum(d.stop_time4)+sum(d.stop_time5))/60) * (sum(c.No_Of_Spindles)/8)) as stopped_spndls,      
      
e.Std_Grams_Spindl Std_Grams_Spindl,((sum(a.hank))/(2.2046 * (a.Actual_Count))* ((a.twist_Contraction)/100)* sum(c.No_Of_Spindles))  as Prodn_kgs      
,sum(g.Waste_Kgs) as Waste_Kgs,A.Actual_Count,A.Twist_Contraction,sum(c.No_Of_Spindles)AS No_Of_Spindles      
 
,'Spinning' as Type
FROM [eSpin]..[Esp_Spinning_Hank] a      
left outer join Esp_SpinningMachine_Details c on a.comp_code=c.comp_code and a.Location_code=c.location_code and a.Sub_Location_Code=c.Sub_Location       
and a.Equipment_No =c.Equipment_No       
left outer join Esp_Machine_Master f on f.Equipment_No =c.Equipment_No  
and f.Comp_Code=c.comp_Code and f.Location_Code=c.Location_code and f.Location=c.Sub_location       
left outer join Esp_Spinning_Stoppage  d on a.comp_code=d.comp_code and a.Location_code=d.location_code      
and  a.sub_Location_code=d.sub_location_code and a.fin_year_code=d.Fin_year_code and a.Equipment_No =d.Equipment_No 
and a.Entry_No=d.Entry_No     and a.Entry_Date=d.Entry_Date       
left outer join Esp_SpinningCount_details e on a.comp_code=e.comp_code and a.Location_code=e.location_code
and a.Sub_Location_Code=e.Sub_Location       
and a.Count_Code=e.Count_Desc --and e.Count_Desc=c.Running_Count       
left outer join Esp_Spinning_waste g on a.comp_code=g.comp_code and a.Location_code=g.location_code and a.Sub_Location_Code=g.Sub_location_Code       
and a.Entry_no=g.Entry_No and a.Entry_Date=g.Entry_Date and a.Equipment_No =g.Equipment_No        
    

where a.Location_code like 'spinning'
and a.Entry_Date between '2022-12-05' and '2022-12-05'   
and e.Sub_Count_code ='50sCC'
And a.delete_mode=0   
 
And a.delete_mode=0     
group by A.ENTRY_DATE,a.Comp_code,a.Location_code,a.Fin_year_code,a.Sub_Location_Code,a.Count_code
,e.sub_count_code,e.Mix_no,e.Lot_No,e.Market,      
a.Actual_Count,a.Conv_Factor,a.twist_Contraction,a.Machine_Code,A.Shift,e.Std_Grams_Spindl       
---*****************************Spinning Report Ends *****************************
---*****************************AUTOCONER Report STARTS *****************************
 
SELECT a.Comp_code,a.Location_code,a.Fin_year_code 
,a.Entry_Date 
,a.machine_Code

,a.Count_code   ,e.sub_count_code,e.Mix_no,e.Lot_No 
,a.Prodn_Kgs as prodn_kgs ,a.No_of_Drums as no_of_Drums,Shift 
,'Autoconer' as Type
 
--({DrawingCountwis.TotActKgs} / {DrawingCountwis.TotStdKgs})*100 as Eff%
  
FROM [eSpin]..[Esp_Autoconer_Production] a  
left outer join Esp_AutoConerMachine_Details c 
on  c.machine_code=a.machine_code  and  c.Sub_Location=a.Sub_Location_Code 

left outer join Esp_AutoconerCount_details e
on e.Count_Desc=a.Count_Code and  e.comp_code=a.comp_code and a.Location_code=e.location_code 
and  a.Sub_Location_Code=e.Sub_Location   

where a.Location_code like 'spinning'
and a.Entry_Date between '2022-12-03' and '2022-12-03'   
and e.Sub_Count_code ='50sCC'
And a.delete_mode=0   
group by a.Comp_code,a.Location_code,a.Fin_year_code 

,a.Entry_Date ,a.machine_Code
,a.Count_code   ,e.sub_count_code,e.Mix_no,e.Lot_No  ,shift,a.No_of_Drums
,a.Prodn_Kgs
---*****************************AUTOCONER Report ENDS *****************************

--SELECT a.Comp_code,a.Location_code,a.Fin_year_code 
--,a.Entry_Date 
--,a.machine_Code
--,a.Count_code   ,e.sub_count_code,e.Mix_no,e.Lot_No 
--,ROUND(((SUM(a.hank) /(e.Hank_Count*2.2046))*c.No_Of_Delivery ),3) as DRG_ACT_PROD
--,((SUM((3.1412 * a.Delivery_Roll_dia * a.Delivery_Roll_speed * e.Efficiency*8*60)/(84000 * 36)) /(e.Hank_Count*2.2046))*c.No_Of_Delivery ) as DRG_STD_PROD,Shift 
--,'Drawing' as Type
----({DrawingCountwis.TotActKgs} / {DrawingCountwis.TotStdKgs})*100 as Eff%
  
--FROM [eSpin]..[Esp_Drawing_Hank] a  
--left outer join Esp_DrawingMachine_Details c 
--on  c.machine_code=a.machine_code  and  c.Sub_Location=a.Sub_Location_Code 

--left outer join Esp_DrawingCount_details e
--on e.Count_Desc=a.Count_Code 
--and  e.comp_code=a.comp_code and a.Location_code=e.location_code 
--and  a.Sub_Location_Code=e.Sub_Location   

--where a.Location_code like 'spinning'
--and a.Entry_Date between '2022-12-02' and '2022-12-02'   
--and e.Sub_Count_code ='50sCC'
--And a.delete_mode=0   
--group by a.Comp_code,a.Location_code,a.Fin_year_code 
--,a.Entry_Date 
--,a.machine_Code
--,a.Count_code   ,e.sub_count_code,e.Mix_no,e.Lot_No ,e.Hank_Count,c.No_of_delivery 
--,Shift 
-----------------***********************