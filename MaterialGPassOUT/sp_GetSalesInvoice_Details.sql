-- =============================================    
-- Author  : SRS    
-- Create date : 30/01/2012    
-- Description : Get Sales Invoice Details    
-- =============================================    
-- Grant Execute On sp_GetSalesInvoice_Details To Public    
-- select * from SOP_SalesInvoice_Main    
-- select * from SOP_SalesInvoice_Others    
-- select * from SOP_SalesInvoice_Line    
-- select * from SOP_SalesInvoice_Tax    
-- select * from eCommon..Customer_Details    
-- select * from eCommon..Product_Details    
-- exec sp_GetSalesInvoice_Details 'LS SPIN','SPINNING','2','INV/00096/21-22','yarn','local','','',''    
    
CREATE Proc [dbo].[sp_GetSalesInvoice_Details]    
(    
@Comp_Code    Varchar(10),    
@Location_Code   Varchar(10),    
@Fin_Year_Code   Varchar(10),    
@SINV_No    Varchar(100),    
@Prod_Sales_Type  Varchar(100),    
@Cust_Type    Varchar(50),    
@Authorize    Varchar(1),    
@Delete_Mode   Varchar(1),    
@Tax_Mode    Varchar(3)    
)    
as    
BEGIN    
set nocount on    
set dateformat ymd    
Declare @sqlstr varchar(8000)    
print @Comp_Code    
IF     
(     
ltrim(rtrim(@SINV_No))= ''     
and ltrim(rtrim(@Authorize))= ''     
and ltrim(rtrim(@Delete_Mode))=''    
and ltrim(rtrim(@Prod_Sales_Type))<>''    
and ltrim(rtrim(@Cust_Type))<>''    
and ltrim(rtrim(@Tax_Mode)) =''    
)    
BEGIN    
select @sqlstr = 'select Distinct a.SINV_No as [SINV_No],a.SINV_Date as [SINV_Date],b.Cust_Name as [Cust_Name],a.Sec_Location_Code as [Sec_Location_Code]'    
select @sqlstr = @sqlstr + ',a.Cust_Type as [Cust_Type]'    
select @sqlstr = @sqlstr +' ,a.Prod_Sales_Type as [Prod_Sales_Type]'    
select @sqlstr = @sqlstr + ',a.EINV_No as [EINV_No]'    
select @sqlstr = @sqlstr + ',a.Authorize as [Authorize]'    
select @sqlstr = @sqlstr + ',a.Delete_Mode as [Delete_Mode],a.Created_Date'    
select @sqlstr = @sqlstr + ' from eSales..SOP_SalesInvoice_Main a,eCommon..Customer_Details b'    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''    
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''    
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''    
select @sqlstr = @sqlstr + ' And a.Prod_Sales_Type=' + '''' + @Prod_Sales_Type + ''''    
select @sqlstr = @sqlstr + ' And a.Cust_Type='   + '''' + @Cust_Type   + ''''    
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'    
select @sqlstr = @sqlstr + ' And a.Comp_Code=b.Comp_Code And a.Cust_Code=b.Cust_Code'    
select @sqlstr = @sqlstr + ' Order by a.Created_Date desc'    
END    
ELSE IF     
(     
ltrim(rtrim(@SINV_No))= ''     
and ltrim(rtrim(@Authorize))= ''     
and ltrim(rtrim(@Delete_Mode))=''    
and ltrim(rtrim(@Prod_Sales_Type))=''    
and ltrim(rtrim(@Cust_Type))=''    
and ltrim(rtrim(@Tax_Mode)) =''    
)    
BEGIN    
select @sqlstr = 'select Distinct a.SINV_No as [SINV_No],a.SINV_Date as [SINV_Date],b.Cust_Name as [Cust_Name],a.Sec_Location_Code as [Sec_Location_Code]'    
select @sqlstr = @sqlstr + ',a.Cust_Type as [Cust_Type]'    
select @sqlstr = @sqlstr +' ,a.Prod_Sales_Type as [Prod_Sales_Type]'    
select @sqlstr = @sqlstr + ',a.EINV_No as [EINV_No]'    
select @sqlstr = @sqlstr + ',a.Authorize as [Authorize],a.Delete_Mode as [Delete_Mode],a.Created_Date'    
select @sqlstr = @sqlstr + ' from eSales..SOP_SalesInvoice_Main a,eCommon..Customer_Details b'    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''    
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''    
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''    
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'    
select @sqlstr = @sqlstr + ' And a.Comp_Code=b.Comp_Code And a.Cust_Code=b.Cust_Code'    
select @sqlstr = @sqlstr + ' Order by a.Created_Date desc'    
END    
ELSE IF     
(    
ltrim(rtrim(@SINV_No)) <>''     
and ltrim(rtrim(@Tax_Mode)) =''    
)    
BEGIN    
select @sqlstr='select a.*,b.*,c.*,d.*,e.*,f.*,g.*,h.*'    
select @sqlstr = @sqlstr + ' from eSales..SOP_SalesInvoice_Main a'    
select @sqlstr = @sqlstr + ' Left Outer Join eSales..SOP_SalesInvoice_Others b'    
select @sqlstr = @sqlstr + ' On a.Comp_Code = b.Comp_Code And a.Location_Code = b.Location_Code'    
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code= b.Fin_Year_Code And a.SINV_No = b.SINV_No'    
select @sqlstr = @sqlstr + ' And a.SINV_Date = b.SINV_Date'    
select @sqlstr = @sqlstr + ' Left Outer Join eSales..SOP_SalesInvoice_Line c'    
select @sqlstr = @sqlstr + ' On a.Comp_Code = c.Comp_Code And a.Location_Code = c.Location_Code'    
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code= c.Fin_Year_Code And c.SINV_No = b.SINV_No'    
select @sqlstr = @sqlstr + ' And c.SINV_Date = b.SINV_Date'    
select @sqlstr = @sqlstr + ' Left Outer Join eCommon..Customer_Details d'    
select @sqlstr = @sqlstr + ' On  a.Comp_Code = d.Comp_Code And a.Cust_Code = d.Cust_Code'    
select @sqlstr = @sqlstr + ' And a.Cust_Type = d.Cust_Type'    
select @sqlstr = @sqlstr + ' Left Outer Join eCommon..Product_Details e'    
select @sqlstr = @sqlstr + ' On b.Comp_Code = e.Comp_Code and c.Prod_Code = e.Prod_Code'    
select @sqlstr = @sqlstr + ' Left Outer Join eCommon..Agent_Details f'    
select @sqlstr = @sqlstr + ' On a.Comp_Code = f.Comp_Code And a.Agent_Code = f.Agent_Code'    
select @sqlstr = @sqlstr + ' Left Outer Join eCommon..Supplier_Details g'    
select @sqlstr = @sqlstr + ' On a.Comp_Code=g.Comp_Code and a.Sup_Code=g.Sup_Code'    
select @sqlstr = @sqlstr + ' Left Join eCommon..Customer_Delivery_Address  h'    
select @sqlstr = @sqlstr + ' On a.comp_code=h.comp_code And d.cust_code=h.cust_code And a.Ship_To_ID=h.SNO'    
select @sqlstr = @sqlstr + ' Where a.Comp_Code=' + '''' + @Comp_Code   + ''''    
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code  + ''''    
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code=' + '''' + @Fin_Year_Code  + ''''    
select @sqlstr = @sqlstr + ' And a.SINV_No='  + '''' + @SINV_No   + ''''    
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'    
END    
ELSE IF     
(    
ltrim(rtrim(@SINV_No)) <>''     
and ltrim(rtrim(@Tax_Mode)) <>''    
)    
BEGIN    
--select @sqlstr = 'select * from eSales..SOP_SalesInvoice_Tax'    
--select @sqlstr = @sqlstr + ' Where Comp_Code='  + '''' + @Comp_Code   + ''''    
--select @sqlstr = @sqlstr + ' And Location_Code=' + '''' + @Location_Code  + ''''    
--select @sqlstr = @sqlstr + ' And Fin_Year_Code=' + '''' + @Fin_Year_Code  + ''''    
--select @sqlstr = @sqlstr + ' And SINV_No='   + '''' + @SINV_No   + ''''    
  
DEclare @mExchangeRate  numeric(18,2)  
set @mExchangeRate = 0   
select @mExchangeRate = Exchange_Rate from eSales..SOP_SalesInvoice_Main Where Comp_Code= @Comp_Code      
 And Location_Code= @Location_Code     
 And Fin_Year_Code=@Fin_Year_Code    
 And SINV_No= @SINV_No  
 AND Invoice_Type='EXPORT'  
select Comp_Code,  
Location_Code,  
Fin_Year_Code,  
SINV_No,  
SINV_Date,  
Sec_Location_Code,  
TCD_Group_Code,  
Sno,  
TCD_Code,  
TCD_Type,  
TCD_Value,  
TCD_For,  
Add_Less,  
AC_Posting,  
Case when @mExchangeRate>0   then TCD_Amount*@mExchangeRate  
else TCD_Amount ENd [TCD_Amount],  
Authorize,  
Delete_Mode,  
Created_By,  
Created_Date,  
Modified_By,  
Modified_Date  
from eSales..SOP_SalesInvoice_Tax  
 Where Comp_Code= @Comp_Code      
 And Location_Code= @Location_Code     
 And Fin_Year_Code=@Fin_Year_Code    
 And SINV_No= @SINV_No  
return  
END    
print (@sqlstr)    
exec(@sqlstr)    
END    
  
  
  