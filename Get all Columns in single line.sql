DECLARE @allcolname NVARCHAR(MAX)='';
SELECT @allcolname='SELECT '
SELECT @allcolname = @allcolname + 'A.' + C.Name +' AS '+C.Name+', '
 
FROM sysobjects T 
INNER JOIN syscolumns C ON T.ID = C.ID
WHERE T.Name ='GST_PartyDebitNote_Main' 
AND C.name NOT IN ('Comp_Code','Location_Code','Fin_Year_Code'
,'Created_By','Created_Date','Modified_BY','Modified_Date')

 ORDER BY colid ;  
SELECT @allcolname= @allcolname +'FROM ' +'GST_PartyDebitNote_Main '

SELECT @allcolname  

--SELECT * FROM sysobjects T WHERE T.Name ='GST_PartyDebitNote_Main' 
--SELECT * FROM  syscolumns T   WHERE id='283148054'
