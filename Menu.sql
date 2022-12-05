/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
a.Menu_ID,a.Screen_Name,a.Parent_ID,a.Screen_Type,a.Screen_Group,a.Menu_Order
,b.Screen_Name 
FROM eCommon.dbo.Menu_Details as a
left join  eCommon.dbo.Menu_Details as b on b.Menu_ID =a.Parent_ID 


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
a.caccountname, a.cparent,a.cledgertype,a.cpriaccountname,a.cSubLedgerType
 ,b.caccountname 
FROM [Accounts22_23].[dbo].[iaccountmaster]  as a
left join  [Accounts22_23].[dbo].[iaccountmaster]  as b on b.cparent =a.caccountname 
order by a.cparent asc ,a.caccountname 