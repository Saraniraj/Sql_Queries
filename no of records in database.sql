GO
SELECT
  OBJECT_SCHEMA_NAME(OBJECT_ID) AS [Schema Name]
, OBJECT_NAME(OBJECT_ID) As [Table Name] 
, SUM([rows]) as [Total Records] 

,'Update ' + OBJECT_NAME(OBJECT_ID) + '  Set comp_Code=''100''' As [Table Name] 


FROM sys.partitions
WHERE OBJECTPROPERTYEX (OBJECT_ID, N'IsUserTable')=1
--Remove the above where clause,
--if you need to view system objects as well.
--AND [index_id] >=1
GROUP BY OBJECT_ID
--HAVING SUM([rows])<>0
ORDER BY [Total Records], OBJECT_NAME(OBJECT_ID)
--OUTPUT