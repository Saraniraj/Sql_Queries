use DB_General 
go

-- =====================================================================        
-- Author  : KRK         
-- Create date : 22/06/2022       
-- Modified date: 07/06/2022       
        
-- Description : Get Delivery Challan Details       
-- =====================================================================        
-- Grant Execute On sp_GetGEN_DeliveryChallan_Details To Public        
 
-- exec [sp_GEN_GetDeliveryChallan_Details] '100','THENI','1','','0','','ALL'     
-- exec [sp_GEN_GetDeliveryChallan_Details] '100','THENI','1','DC/0002122-23','','','SPECIFY'     
-- exec [sp_GEN_GetDeliveryChallan_Details] '100','THENI','1','DC/0002122-23','','','Delivery_Challan'        
-- exec [sp_GEN_GetDeliveryChallan_Details] '100','UNIT I','1','DC1/0001/22-23','','','Delivery_Challan_Tax'        
     
 
alter  PROC [dbo].[sp_GEN_GetDeliveryChallan_Details]        
(        
@Comp_Code    Varchar(10),        
@Location_Code   Varchar(10),        
@Fin_Year_Code   Varchar(10),        
@Entry_No   Varchar(100),        
@Authorize    Varchar(1),         
     
@Delete_Mode   Varchar(1),  
@Filter_Data   Varchar(100)        
        
)        
as        
BEGIN        
set nocount on        
set dateformat ymd        
Declare @sqlstr varchar(8000)        
        
IF               
(               
             
ltrim(rtrim(@Authorize))= '1'               
and ltrim(rtrim(@Filter_Data))='ALL'              
)              
BEGIN        
select @sqlstr= 'Select '   

select @sqlstr = @sqlstr + ' a.DC_No,a.DC_Date,a.DC_Type   '
select @sqlstr = @sqlstr + ' ,a.Party_Code,a.Party_Name   '
select @sqlstr = @sqlstr + ' ,a.Delivered_To,d.Party_Name as  ShipTo_Name,a.Place_Of_Supply,a.Department,a.Lorry_no   '
select @sqlstr = @sqlstr + '    ,a.Lorry_Fr  ,a.Tot_Taxable_Value    , a.Tot_CGST    , a.Tot_SGST   '
select @sqlstr = @sqlstr + '  , a.Tot_IGST    , a.Tot_GST_Value,a.Round_Off    ,a. Invoice_Value ,a.Gst_type  '
select @sqlstr = @sqlstr + ' ,a.Ref_Doc_No,a.Ref_Doc_Date,a.Others_Desc    '
--select @sqlstr = @sqlstr + ' ,b.SNo,b.Prod_Code,b.Prod_Desc,b.ID_Mark   '
--select @sqlstr = @sqlstr + ' ,b.HSN_Code,b.Packing_Mode,b.UOM_Code   '
--select @sqlstr = @sqlstr + ' ,b.Net_Meters,b.No_Of_Bags,b.Net_Wt,b.Lorry_no   '    
select @sqlstr = @sqlstr + ' ,a.Comp_Code,a.Location_Code,a.Fin_Year_Code   '
        
select @sqlstr = @sqlstr + ' 	FROM GEN_DeliveryChallan_Main as a '
select @sqlstr = @sqlstr + ' left join GEN_DeliveryChallan_Line as b on b.DC_No=a.DC_No and b.DC_Date =a.DC_Date  '
select @sqlstr = @sqlstr + ' Left  Join  DB_Common..Party_Details c On    c.Party_Code=a.Party_Code And a.Party_Code Is Not Null'    
select @sqlstr = @sqlstr + ' Left  Join  DB_Common..Party_Details d On    d.Party_Code=a.Delivered_To And a.Party_Code Is Not Null'    
 
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='   + '''' + @Location_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
        
		
select @sqlstr = @sqlstr + ' group by a.DC_No,a.DC_Date,a.DC_Type   '
select @sqlstr = @sqlstr + ' ,a.Party_Code,a.Party_Name   '
select @sqlstr = @sqlstr + ' ,a.Delivered_To,d.Party_Name,a.Place_Of_Supply,a.Department,a.Lorry_no   '
select @sqlstr = @sqlstr + ' ,a.Ref_Doc_No,a.Ref_Doc_Date,a.Others_Desc    '
select @sqlstr = @sqlstr + '   ,a.Lorry_Fr   ,a.Tot_Taxable_Value    , a.Tot_CGST    , a.Tot_SGST   '
select @sqlstr = @sqlstr + '  , a.Tot_IGST    , a.Tot_GST_Value ,a.Round_Off   ,a. Invoice_Value   ,a.Gst_type  '
--select @sqlstr = @sqlstr + ' ,b.SNo,b.Prod_Code,b.Prod_Desc,b.ID_Mark   '
--select @sqlstr = @sqlstr + ' ,b.HSN_Code,b.Packing_Mode,b.UOM_Code   '
--select @sqlstr = @sqlstr + ' ,b.Net_Meters,b.No_Of_Bags,b.Net_Wt,b.Lorry_no   '    
select @sqlstr = @sqlstr + ' ,a.Comp_Code,a.Location_Code,a.Fin_Year_Code   '
select @sqlstr = @sqlstr + ' Order by  a.DC_Date desc, a.DC_No'        
END    

          
              
else IF               
(               
             
ltrim(rtrim(@Authorize))= '0'               
and ltrim(rtrim(@Filter_Data))='ALL'       
)              
BEGIN   
       
select @sqlstr= 'Select '   

select @sqlstr = @sqlstr + ' a.DC_No,a.DC_Date,a.DC_Type   '
select @sqlstr = @sqlstr + ' ,a.Party_Code,a.Party_Name   '
select @sqlstr = @sqlstr + ' ,a.Delivered_To,d.Party_Name as  ShipTo_Name,a.Place_Of_Supply,a.Department,a.Lorry_no   '
select @sqlstr = @sqlstr + '    ,a.Lorry_Fr  ,a.Tot_Taxable_Value    , a.Tot_CGST    , a.Tot_SGST   '
select @sqlstr = @sqlstr + '  , a.Tot_IGST    , a.Tot_GST_Value,a.Round_Off    ,a. Invoice_Value ,a.Gst_type  '
select @sqlstr = @sqlstr + ' ,a.Ref_Doc_No,a.Ref_Doc_Date,a.Others_Desc    '
--select @sqlstr = @sqlstr + ' ,b.SNo,b.Prod_Code,b.Prod_Desc,b.ID_Mark   '
--select @sqlstr = @sqlstr + ' ,b.HSN_Code,b.Packing_Mode,b.UOM_Code   '
--select @sqlstr = @sqlstr + ' ,b.Net_Meters,b.No_Of_Bags,b.Net_Wt,b.Lorry_no   '    
select @sqlstr = @sqlstr + ' ,a.Comp_Code,a.Location_Code,a.Fin_Year_Code   '
        
select @sqlstr = @sqlstr + ' 	FROM GEN_DeliveryChallan_Main as a '
select @sqlstr = @sqlstr + ' left join GEN_DeliveryChallan_Line as b on b.DC_No=a.DC_No and b.DC_Date =a.DC_Date  '
select @sqlstr = @sqlstr + ' Left  Join  DB_Common..Party_Details c On    c.Party_Code=a.Party_Code And a.Party_Code Is Not Null'    
select @sqlstr = @sqlstr + ' Left  Join  DB_Common..Party_Details d On    d.Party_Code=a.Delivered_To And a.Party_Code Is Not Null'    
 
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='   + '''' + @Location_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
select @sqlstr = @sqlstr + ' And a.Authorize=0'   
		
select @sqlstr = @sqlstr + ' group by a.DC_No,a.DC_Date,a.DC_Type   '
select @sqlstr = @sqlstr + ' ,a.Party_Code,a.Party_Name   '
select @sqlstr = @sqlstr + ' ,a.Delivered_To,d.Party_Name,a.Place_Of_Supply,a.Department,a.Lorry_no   '
select @sqlstr = @sqlstr + ' ,a.Ref_Doc_No,a.Ref_Doc_Date,a.Others_Desc    '
select @sqlstr = @sqlstr + '   ,a.Lorry_Fr   ,a.Tot_Taxable_Value    , a.Tot_CGST    , a.Tot_SGST   '
select @sqlstr = @sqlstr + '  , a.Tot_IGST    , a.Tot_GST_Value ,a.Round_Off   ,a. Invoice_Value   ,a.Gst_type  '
    
select @sqlstr = @sqlstr + ' ,a.Comp_Code,a.Location_Code,a.Fin_Year_Code   '
select @sqlstr = @sqlstr + ' Order by  a.DC_Date desc, a.DC_No' 

END    
         
ELSE IF         
(        
ltrim(rtrim(@Entry_No)) <>''        
        
and LTRIM(rtrim(@Filter_Data))='SPECIFY'        
        
)        
BEGIN        
        
select @sqlstr= 'Select '    
     
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code,a.Fin_Year_Code   '
select @sqlstr = @sqlstr + ' ,a.DC_No,a.DC_Date,a.DC_Type   '
select @sqlstr = @sqlstr + ' ,a.Party_Code,a.Party_Name   '
select @sqlstr = @sqlstr + ' ,a.Delivered_To,d.Party_Name as  ShipTo_Name,a.Place_Of_Supply,a.Department,a.Lorry_no   '
select @sqlstr = @sqlstr + ' ,a.Ref_Doc_No,a.Ref_Doc_Date,a.Others_Desc    '
select @sqlstr = @sqlstr + ' ,a.Lorry_Fr,a.Round_Off   '
select @sqlstr = @sqlstr + '      ,a.Tot_Taxable_Value    , a.Tot_CGST    , a.Tot_SGST   '
select @sqlstr = @sqlstr + '  , a.Tot_IGST    , a.Tot_GST_Value    ,a. Invoice_Value   '
select @sqlstr = @sqlstr + ' ,b.SNo,b.Trans_Type,b.Prod_Code,b.Prod_Desc,b.ID_Mark   '
select @sqlstr = @sqlstr + ' ,b.HSN_Code,b.Packing_Mode,b.UOM_Code   '
select @sqlstr = @sqlstr + ' ,b.Net_Meters,b.No_Of_Bags,b.Net_Wt,b.Lorry_Frieght,b.Taxable_Amt   ' 
select @sqlstr = @sqlstr + '    ,b.Rate_Per_Qty,b.Line_Total   '              
select @sqlstr = @sqlstr + '    	,b. GST_per ,b. CGST ,b. SGST ,b. IGST ,b. Tot_GST ,b. HSN_Code   '   
        
select @sqlstr = @sqlstr + ' 	FROM GEN_DeliveryChallan_Main as a '
select @sqlstr = @sqlstr + ' left join GEN_DeliveryChallan_Line as b on b.DC_No=a.DC_No and b.DC_Date =a.DC_Date  '
          
select @sqlstr = @sqlstr + ' Left  Join  DB_Common..Party_Details c On    c.Party_Code=a.Party_Code And a.Party_Code Is Not Null'   
select @sqlstr = @sqlstr + ' Left  Join  DB_Common..Party_Details d On    d.Party_Code=a.Delivered_To And a.Party_Code Is Not Null'    
 
    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + '''' 
select @sqlstr = @sqlstr + ' And a.DC_No='   + '''' + @Entry_No  + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
        
select @sqlstr = @sqlstr + ' Order by a.Created_Date, a.DC_Date desc '        
        
        
        
END        
        
ELSE IF         
(        
ltrim(rtrim(@Entry_No)) <>''        
        
and LTRIM(rtrim(@Filter_Data))='Delivery_Challan'        
        
)        
BEGIN        
        
select @sqlstr= 'Select '   

select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code,a.Fin_Year_Code   '
select @sqlstr = @sqlstr + ' ,a.DC_No,a.DC_Date,a.DC_Type   '
select @sqlstr = @sqlstr + ' ,a.Party_Code,a.Party_Name   '
select @sqlstr = @sqlstr + ' ,a.Delivered_To,a.Place_Of_Supply,a.Department,a.Lorry_no   '
select @sqlstr = @sqlstr + ' ,a.Ref_Doc_No,a.Ref_Doc_Date,a.Others_Desc    '
select @sqlstr = @sqlstr + '      ,a.Tot_Taxable_Value    , a.Tot_CGST    , a.Tot_SGST   '
select @sqlstr = @sqlstr + '  , a.Tot_IGST    , a.Tot_GST_Value    ,a. Invoice_Value   '
select @sqlstr = @sqlstr + ' ,b.SNo,b.Trans_Type,b.Prod_Code,b.Prod_Desc,b.ID_Mark   '
select @sqlstr = @sqlstr + ' ,b.HSN_Code,b.Packing_Mode,b.UOM_Code   '
select @sqlstr = @sqlstr + ' ,b.Net_Meters,b.No_Of_Bags,b.Net_Wt    ' 
select @sqlstr = @sqlstr + '    ,b.Rate_Per_Qty,b.Line_Total   '              
select @sqlstr = @sqlstr + '    	,b. GST_per ,b. CGST ,b. SGST ,b. IGST ,b. Tot_GST ,b. HSN_Code   ' 
  
select @sqlstr = @sqlstr + '          ,c.Party_Add1 as Party_Add1,c.Party_Add2 as Party_Add2 ,c.Party_Add3 as Party_Add3   '
select @sqlstr = @sqlstr + '        ,c.Party_city as  Party_city,c.Party_State as  Party_State '
select @sqlstr = @sqlstr + '        , c.Party_Pincode as   Party_Pincode  ,c.Party_Mob_No as  Party_Mob_No  '
select @sqlstr = @sqlstr + '        ,c.GST_NO  as GST_NO     '
select @sqlstr = @sqlstr + '    ,d.Party_Name as  ShipTo_Name   '
select @sqlstr = @sqlstr + '          ,d.Party_Add1 as Shipto_Add1,d.Party_Add2 as Shipto_Add2 ,d.Party_Add3 as Shipto_Add3   '
select @sqlstr = @sqlstr + '        ,d.Party_city as  Shipto_city,d.Party_State as  Shipto_State '
select @sqlstr = @sqlstr + '        , d.Party_Pincode as   Shipto_Pincode  ,d.Party_Mob_No as  Shipto_Mob_No  '
select @sqlstr = @sqlstr + '        ,d.GST_NO  as Shipto_GST_NO     '

--select @sqlstr = @sqlstr + '        ,c.Sup_Add1,c.Sup_Add2 ,c.Sup_Add3   '
--    select @sqlstr = @sqlstr + '       ,c.Sup_City,c.Sup_State  , c.Sup_Pincode  ,c.Sup_Mob_No,c.Sup_Others_1 as GST_NO   '



select @sqlstr = @sqlstr + ' 	FROM GEN_DeliveryChallan_Main as a '
select @sqlstr = @sqlstr + ' left join GEN_DeliveryChallan_Line as b on b.DC_No=a.DC_No and b.DC_Date =a.DC_Date  '
          
select @sqlstr = @sqlstr + ' Left  Join  DB_Common..Party_Details c On    c.Party_Code=a.Party_Code And a.Party_Code Is Not Null'    
select @sqlstr = @sqlstr + ' Left  Join  DB_Common..Party_Details d On    d.Party_Code=a.Delivered_To And a.Party_Code Is Not Null'    
    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + '''' 
select @sqlstr = @sqlstr + ' And a.DC_No='   + '''' + @Entry_No  + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'      
        
select @sqlstr = @sqlstr + ' Order by a.Created_Date, a.DC_Date desc '        
END        
     
ELSE IF         
(        
ltrim(rtrim(@Entry_No)) <>''        
        
and LTRIM(rtrim(@Filter_Data))='Delivery_Challan_Tax'        
        
)        
BEGIN        
        
select @sqlstr= 'Select '   

select @sqlstr = @sqlstr + '     '
select @sqlstr = @sqlstr + '  a.DC_No,a.DC_Date    ' 

select @sqlstr = @sqlstr + '    	,sum(b.Line_Total)  as Taxable,b. GST_per ,sum(b.CGST) as CGST ,sum(b.SGST) as SGST ,sum(b.IGST) as IGST  ,b.HSN_Code   ' 
   
select @sqlstr = @sqlstr + ' 	FROM GEN_DeliveryChallan_Main as a '
select @sqlstr = @sqlstr + ' left join GEN_DeliveryChallan_Line as b on b.DC_No=a.DC_No and b.DC_Date =a.DC_Date  '
 
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + '''' 
select @sqlstr = @sqlstr + ' And a.DC_No='   + '''' + @Entry_No  + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'      
select @sqlstr = @sqlstr + '     group by a.DC_No,a.DC_Date        	,b. GST_per,b.HSN_Code  '
select @sqlstr = @sqlstr + ' Order by   b.GST_per   '        
      
END    


 
print (@sqlstr)        
exec(@sqlstr)        
END        
 