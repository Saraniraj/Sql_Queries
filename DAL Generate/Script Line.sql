SELECT  '@'+column_name as COl_Name
,data_type    as  Dataty 
 ,isnull(CHARACTER_MAXIMUM_LENGTH,0) as masx

,data_type,CHARACTER_MAXIMUM_LENGTH 
FROM INFORMATION_SCHEMA.Columns where TABLE_NAME = 'SOP_ProformaInvoice_Line'
 


 SELECT  ' select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(  ' + '@'+column_name + ' )) +'''''  as COl_Name

--,data_type,CHARACTER_MAXIMUM_LENGTH 
FROM INFORMATION_SCHEMA.Columns where TABLE_NAME = 'SOP_ProformaInvoice_Line'
 

  
 --select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))				+ ''''
 -- select @sqlstr= @sqlstr + ''+ ltrim(rtrim( Comp_Code ) +'