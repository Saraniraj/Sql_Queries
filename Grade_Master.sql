USE PowerERP_Cashew
GO
/****** Object:  Table [dbo].[Grade_Master]    Script Date: 07/09/2023 10:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grade_Master](
	[Comp_Code] [varchar](20) NOT NULL,
	[Location_Code] [varchar](20) NOT NULL,
	[Grade_ID] [bigint] NOT NULL,
	[Grade_Name] [varchar](50) NOT NULL,
	[Grade_type] [varchar](250) NOT NULL,
	[IS_Active] [int] NULL,
	[Created_By] [varchar](15) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](15) NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Grade_Master] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Grade_ID] ASC,
	[Grade_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_GetLotMaster]    Script Date: 07/09/2023 10:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================        
-- Author  : KRK       
-- Create date :01-10-2023
-- Modified date :01-10-2023  
-- Description : Get Grade Master Details       
-- =============================================================        
-- Grant Execute On [sp_GetGradeMaster] To Public        
--  exec [sp_GetGradeMaster] '100','3',''
CREATE Proc [dbo].[sp_GetGradeMaster]        
(        
@Comp_Code    Varchar(20),    
@Location_Code		Varchar(20),
@Grade_ID   Varchar(100),        
@Filter_Data   Varchar(50)        
)        
as        
BEGIN        
set nocount on        
set dateformat ymd        
Declare @sqlstr varchar(8000)        
print @Comp_Code     

        
IF         
(         
ltrim(rtrim(@Grade_ID))= ''         
--and ltrim(rtrim(@Authorize))= ''         
--and ltrim(rtrim(@Delete_Mode))=''        
and ltrim(rtrim(@Filter_Data))=''        
)        
BEGIN  
select @sqlstr= 'Select a.Grade_ID,a.Grade_Name,a.Grade_type,a.Comp_code ,a.IS_Active     '        
select @sqlstr = @sqlstr + ' from Grade_Master as a '  
  select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''      
select @sqlstr = @sqlstr + ' and a.Grade_ID<>0 '    
       
END
    
ELSE IF         
(        
ltrim(rtrim(@Grade_ID ))<> ''         
      
and ltrim(rtrim(@Filter_Data))=''        
)        
BEGIN        
select @sqlstr= 'select   a.Grade_ID,a.Grade_Name,a.Grade_type,a.Comp_code,a.IS_Active     '        
select @sqlstr = @sqlstr + ' from Grade_Master  as a '     
select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''   
select @sqlstr = @sqlstr + ' And a.Grade_ID='    + '''' + @Grade_ID    + ''''         
 

END           
print (@sqlstr)        
exec(@sqlstr)        
END
 
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_HRDOrginMaster]    Script Date: 07/09/2023 10:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Author  : KRK       
-- Create date :01-10-2023
-- Modified date :01-10-2023
-- Description	:	Save LOT MAster  (Insert / Update)
-- ==================================================================
--select * from Grade_Master
--exec sp_Save_LOTMaster '100','1','1','10','10','1','ADD','ADMIN','0'
CREATE Proc [dbo].[sp_Save_GradeMaster]
(
	@Comp_Code		Varchar(20),
	@Location_Code		Varchar(20),
	@Grade_ID		varchar(10),
	@Grade_Name	varchar(50),
	@Grade_type		varchar(250),
	@Isactive		Varchar(1),
	@Screen_Mode	Varchar(20),
	@User_Code		Varchar(15),
	@iSuccessFlag   bit	output
)
as
set nocount on
set dateformat ymd
Declare @sqlstr			Varchar(8000)
Declare @iMode			Numeric(18,0)
Declare @iServerDate	Varchar(19)
Set @iMode=(
				Select Count(Grade_ID ) from  Grade_Master 
				Where	Comp_code  =	@Comp_Code 
				And		Location_Code 	=	@Location_Code 
				And		Grade_ID	=	@Grade_ID 
				
			)
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))
BEGIN TRAN TRAN1
select @sqlstr=''
IF @iMode<=0 
BEGIN
select @sqlstr = 'Insert into Grade_Master Values('
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code  ))				+ ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Grade_ID  ))				+ ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Grade_Name    ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Grade_type    ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Isactive ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate							+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate							+ '''' + ')'
END
ELSE IF @iMode=1
BEGIN
select @sqlstr = 'Update Grade_Master Set '
select @sqlstr= @sqlstr + ' Grade_Name='			+ '''' + ltrim(rtrim(@Grade_Name))		+ ''''
select @sqlstr= @sqlstr + ',Grade_type='				+ '''' + ltrim(rtrim(@Grade_type))		+ ''''
select @sqlstr= @sqlstr + ',IS_Active='				+ '''' + ltrim(rtrim(@Isactive))		+ ''''
select @sqlstr= @sqlstr + ',Modified_By='			+ '''' + ltrim(rtrim(@User_Code))	+ ''''
select @sqlstr= @sqlstr + ',Modified_Date='			+ '''' + @iServerDate				+ ''''
select @sqlstr= @sqlstr +  ' Where Comp_Code='		+ '''' + @Comp_Code					+ ''''
select @sqlstr= @sqlstr +  ' and Location_Code='		+ '''' + @Location_Code					+ ''''
select @sqlstr= @sqlstr +  ' And Grade_ID='	+ '''' + @Grade_ID				+ ''''  
END
exec(@sqlstr )
print @sqlstr
IF (@@error <> 0) goto ErrHand
COMMIT TRAN TRAN1
select @iSuccessFlag=1
return
ErrHand:
BEGIN
ROLLBACK TRAN TRAN1
select @iSuccessFlag=0
END
 
GO
