USE [DB_General]
GO
/****** Object:  Table [dbo].[GEN_MaterialOUTNOTReturn_Line]    Script Date: 26/04/2023 13:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_MaterialOUTNOTReturn_Line](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[Gpass_No] [varchar](100) NOT NULL,
	[Gpass_Date] [datetime] NOT NULL,
	[SNo] [int] NOT NULL,
	[Prod_Code] [varchar](500) NOT NULL,
	[UOM_Code] [varchar](10) NOT NULL,
	[Return_Type] [varchar](50) NULL,
	[Return_Mode] [int] NULL,
	[IS_Closed] [int] NULL,
	[Close_Reason] [varchar](500) NULL,
	[No_Of_Qty] [numeric](18, 3) NOT NULL,
	[Net_wt] [numeric](18, 3) NOT NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_GEN_MaterialOUTNOTReturn_Line] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Fin_Year_Code] ASC,
	[Gpass_No] ASC,
	[Gpass_Date] ASC,
	[Prod_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GEN_MaterialOUTNOTReturn_Main]    Script Date: 26/04/2023 13:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_MaterialOUTNOTReturn_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[Gpass_No] [varchar](100) NOT NULL,
	[Gpass_Date] [datetime] NOT NULL,
	[Ref_Inv_No] [varchar](100) NULL,
	[Ref_Inv_Date] [datetime] NULL,
	[DC_No] [int] NULL,
	[DC_Date] [datetime] NOT NULL,
	[Department] [varchar](300) NULL,
	[From_Company] [varchar](300) NOT NULL,
	[To_Company] [varchar](300) NOT NULL,
	[Delivered_By] [varchar](300) NOT NULL,
	[Vehicle_no] [nvarchar](50) NULL,
	[Delivery_Location] [nvarchar](500) NULL,
	[Total_Items] [numeric](18, 3) NOT NULL,
	[Total_Netwt] [numeric](18, 3) NOT NULL,
	[Remarks] [varchar](1000) NOT NULL,
	[Material_From] [nvarchar](50) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_GEN_MaterialOUTNOTReturn_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Fin_Year_Code] ASC,
	[Gpass_No] ASC,
	[Gpass_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_GEN_GetMaterialOUTNOTReturn_Details]    Script Date: 26/04/2023 13:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================  
-- Author		:	KRK
-- Create date	:	09/05/2022
-- Description : Get Gatepass OUT transaction Details Weaving)  
-- ===============================================================  
-- Grant Execute On [sp_GetBeamtransaction_Details] To Public  
-- select * from GEN_MaterialOUTNOTReturn_Line  
-- select * from GEN_MaterialOUTNOTReturn_Main  
---exec sp_GEN_GetMaterialpassOUT_Details '100','THENI','1','','ALL'
  
CREATE Proc [dbo].[sp_GEN_GetMaterialOUTNOTReturn_Details]  
(  
@Comp_Code    Varchar(10),  
@Location_Code   Varchar(10),  
@Fin_Year_Code   Varchar(10),  
@GatepassOut_No    Varchar(100),  
@Filter_Data   Varchar(30)  
)  
as  
BEGIN  
set nocount on  
set dateformat ymd  
Declare @sqlstr varchar(8000)  
declare @mFilterdata varchar(50)  
set @mFilterdata=''  
  
IF LTRIM(RTRIM(@Filter_Data))='ALL'  
BEGIN  
Set @mFilterdata='%'  
END  
ELSE  
BEGIN  
Set @mFilterdata=@Filter_Data   
END  
  
IF   
 (  
   @Filter_Data = 'SPECIFY'  
 
 )  
BEGIN  
select @sqlstr = 'select a.Gpass_No,a.Gpass_Date,a.DC_No,a.DC_Date'  


select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company,a.Delivered_By,b.Return_Type  '
select @sqlstr = @sqlstr + ' ,a.Total_Items,A.Total_Netwt,a.Remarks,a.Material_From'   
select @sqlstr = @sqlstr + ' ,A.Ref_Inv_No,A.Ref_Inv_Date,A.Department,A.Vehicle_no,A.Delivery_Location  '
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code,b.UOM_Code,b.No_Of_Qty,b.Net_wt'  
select @sqlstr = @sqlstr + ', a.Comp_Code,a.Location_Code,a.Fin_Year_Code'  
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialOUTNOTReturn_Main a'   
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialOUTNOTReturn_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code = b.Fin_Year_Code And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_No='    + '''' + @GatepassOut_No    + ''''  

--Select @sqlstr = @sqlstr + 'and a.Authorize like '	+ ''''  + @Filter_Data  		+ ''''   
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
select @sqlstr = @sqlstr + ' Order by b.SNo'  
  
END  
  
ELSE IF @Filter_Data = 'ALL'  
BEGIN  
select @sqlstr = 'Select  Gpass_No,Gpass_Date,DC_No,DC_Date'  
select @sqlstr = @sqlstr + ',From_Company,To_Company,Delivered_By,Total_Items,Remarks,Material_From'  
select @sqlstr = @sqlstr + ' ,Ref_Inv_No,Ref_Inv_Date,Department,Vehicle_no,Delivery_Location  '
select @sqlstr = @sqlstr + ',Authorize as [Authorize]'  
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialOUTNOTReturn_Main  '  
select @sqlstr = @sqlstr + ' Where Comp_Code='   + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And Location_Code='   + '''' + @Location_Code  + ''''  
select @sqlstr = @sqlstr + ' And Fin_Year_Code='   + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And Delete_Mode=0'  
  
select @sqlstr = @sqlstr + ' Order by Created_Date desc'  
END  
  
      
else IF     
 (     
  ltrim(rtrim(@mFilterdata))= 'Gatepass_Print_ALL'     
      
  )    
    
BEGIN   

select @sqlstr = 'select a.Gpass_No,a.Gpass_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company,a.Delivered_By,b.Return_Type  '
select @sqlstr = @sqlstr + ' ,a.Total_Items,A.Total_Netwt,a.Remarks,a.Material_From'   
select @sqlstr = @sqlstr + ' ,A.Ref_Inv_No,A.Ref_Inv_Date,A.Department,A.Vehicle_no,A.Delivery_Location  '
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code,b.UOM_Code,b.No_Of_Qty,b.Net_wt'  
select @sqlstr = @sqlstr + ', a.Comp_Code,a.Location_Code,a.Fin_Year_Code'  
select @sqlstr = @sqlstr + ',a.Modified_Date as [Modified_Date],a.Modified_By,a.Created_Date,a.Created_By'  
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialOUTNOTReturn_Main a'  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialOUTNOTReturn_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code = b.Fin_Year_Code And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_No='    + '''' + @GatepassOut_No    + ''''  
 
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
select @sqlstr = @sqlstr + ' Order by b.SNo'  
end   

   
else IF     
 (     
  ltrim(rtrim(@mFilterdata))= 'Gatepass_Print_Authorized'     
      
  )    
    
BEGIN   
select @sqlstr = 'select a.Gpass_No,a.Gpass_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company,a.Delivered_By,b.Return_Type  '
select @sqlstr = @sqlstr + ' ,a.Total_Items,A.Total_Netwt,a.Remarks,a.Material_From'   
select @sqlstr = @sqlstr + ' ,A.Ref_Inv_No,A.Ref_Inv_Date,A.Department,A.Vehicle_no,A.Delivery_Location  '
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code,b.UOM_Code,b.No_Of_Qty,b.Net_wt'  
select @sqlstr = @sqlstr + ', a.Comp_Code,a.Location_Code,a.Fin_Year_Code'  
select @sqlstr = @sqlstr + ',a.Modified_Date as [Modified_Date],a.Modified_By,a.Created_Date,a.Created_By'  
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialOUTNOTReturn_Main a'  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialOUTNOTReturn_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code = b.Fin_Year_Code And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_No='    + '''' + @GatepassOut_No    + ''''  
select @sqlstr = @sqlstr + ' And a.Authorize=1'  

--Select @sqlstr = @sqlstr + 'and a.Authorize like '	+ ''''  + @Filter_Data  		+ ''''   
 
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
select @sqlstr = @sqlstr + ' Order by b.SNo'  
end     

print (@sqlstr)  
exec(@sqlstr)  
END   
GO
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveGEN_MaterialOUTNOTReturn_Line]    Script Date: 26/04/2023 13:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================
-- Author		:	KRK
-- Create date	:	09/05/2022
-- Description	:	Save  Gatepass out receipt  LINE (Insert / Update)
--					Delete Gatepass Out  Receipt Line
-- ========================================================
-- Grant Execute On [sp_SaveGatepassOUTReceipt_lINE] To Public
-- Select * from GEN_MaterialOUTNOTReturn_Line

CREATE Proc [dbo].[sp_Gen_SaveGEN_MaterialOUTNOTReturn_Line]
(
@Comp_Code					Varchar(10),
@Location_Code				Varchar(10),
@Fin_Year_Code				Varchar(10),
@Gpass_No					Varchar(100),
@Gpass_Date				Varchar(10),
@SNo						Varchar(3),
@Prod_Code					Varchar(500),
@UOM_Code					Varchar(10),
@Return_Type		Varchar(50),
@Return_Mode		Varchar(10),
@IS_Closed		Varchar(10),
@Close_Reason 	Varchar(150),
@No_Of_QTY                 Varchar(10),
@Net_wt                 Varchar(10),

@Authorize					Varchar(1),
@Delete_Mode				Varchar(1),
@Screen_Mode				Varchar(20),
@User_Code					Varchar(15),


@iSuccessFlag			    bit	output
)
as
set nocount on
set dateformat ymd
Declare @sqlstr			Varchar(8000)
Declare @iMode			Numeric(18,0)
Declare @iServerDate	Varchar(19)

Set @iMode=(
				Select Count(Gpass_No) from GEN_MaterialOUTNOTReturn_Line 
				Where	Comp_Code		=	@Comp_Code 
				And		Location_Code	=	@Location_Code
				--And		Fin_Year_Code	=	@Fin_Year_Code
				And		Gpass_No			=	@Gpass_No 
				And	 Gpass_Date 		=	@Gpass_Date
				And	 Prod_Code 		=	@Prod_Code
				
			)

Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))

BEGIN TRAN TRAN1
select @sqlstr=''
IF @iMode<=0 
BEGIN

--Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))

--BEGIN TRAN TRAN1

select @sqlstr=''
select @sqlstr = 'Insert into GEN_MaterialOUTNOTReturn_Line Values('
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))		+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))		+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Gpass_No ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Gpass_Date ))			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@SNo))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Prod_Code))			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@UOM_Code  ))			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Return_Type))			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Return_Mode  ))			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@IS_Closed))			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + 	''	+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@No_Of_QTY ))		+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Net_wt ))		+ ''''


select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))		+ ''''
select @sqlstr= @sqlstr + ','+''''+ @User_Code							+ ''''
select @sqlstr= @sqlstr + ','+''''+ @iServerDate						+ '''' 
select @sqlstr= @sqlstr + ','+''''+ @User_Code							+ ''''
select @sqlstr= @sqlstr + ','+''''+ @iServerDate						+ '''' + ')'
END
ELSE IF @iMode=1
BEGIN
select @sqlstr = 'UpdatE GEN_MaterialOUTNOTReturn_Line Set '
select @sqlstr= @sqlstr + 'IS_Closed='				+ '''' + ltrim(rtrim(@IS_Closed))				+ ''''
select @sqlstr= @sqlstr + ',Close_Reason='				+ '''' + @Close_Reason	+ ''''
select @sqlstr= @sqlstr + ',Modified_By='			+ '''' + ltrim(rtrim(@User_Code))				+ ''''
select @sqlstr= @sqlstr + ',Modified_Date='			+ '''' + @iServerDate							+ ''''
select @sqlstr= @sqlstr +  ' Where Comp_Code='		+ '''' + @Comp_Code								+ ''''
select @sqlstr= @sqlstr +  ' And Location_Code='	+ '''' + @Location_Code							+ ''''  
--select @sqlstr= @sqlstr +  ' And Fin_Year_Code='	+ '''' + @Fin_Year_Code							+ ''''  
select @sqlstr= @sqlstr +  ' And Gpass_No	='			+ '''' + @Gpass_No 									+ ''''  
select @sqlstr= @sqlstr +  ' And Prod_Code	='			+ '''' + @Prod_Code 									+ ''''  

--select @sqlstr= @sqlstr +  ' And GatePass_OUT_Date='			+ '''' + @GatePass_OUT_Date 								+ ''''  
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveGEN_MaterialOUTNOTReturn_Main]    Script Date: 26/04/2023 13:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Author		:	KRK
-- Create date	:	09/05/2023
-- Description	:	Save  Gatepass out receipt  Main (Insert / Update)
--					Delete Gatepass Out  Receipt Line
-- ==================================================================
-- Grant Execute On [sp_Gen_SaveGEN_VehiclepassOUT_Main] To Public
-- Select * from GEN_MaterialOUTNOTReturn_Main
-- Select * from GEN_MaterialOUTNOTReturn_Line

CREATE Proc [dbo].[sp_Gen_SaveGEN_MaterialOUTNOTReturn_Main]
(
@Comp_Code					Varchar(10),
@Location_Code				Varchar(10),
@Fin_Year_Code				Varchar(10),
@Gpass_No					Varchar(100),
@Gpass_Date				Varchar(10),
@Ref_Inv_No     Varchar(100),  
@Ref_Inv_Date    Varchar(10), 
@DC_No					Varchar(100),
@DC_Date					Varchar(10),
@Department					Varchar(100),

@From_Company				Varchar(250),
@To_Company				Varchar(250),
@Delivered_By				Varchar(250),
@Vehicle_no				Varchar(250),
@Delivery_Location				Varchar(250),
@Total_Items		Varchar(10),
@Total_Netwt		Varchar(10),

@Remarks		Varchar(1000),
@Material_From	Varchar(100),
@Authorize					Varchar(1),
@Delete_Mode				Varchar(1),
@Screen_Mode				Varchar(20),
@User_Code					Varchar(15),
@iSuccessFlag			    bit	output
)
as
set nocount on
set dateformat ymd
Declare @sqlstr			Varchar(8000)
Declare @iMode			Numeric(18,0)
Declare @iServerDate	Varchar(19)

Set @iMode=(
				Select Count(Gpass_No) from GEN_MaterialOUTNOTReturn_Main 
				Where	Comp_Code		=	@Comp_Code 
				And		Location_Code	=	@Location_Code
				And		Fin_Year_Code	=	@Fin_Year_Code
				And		Gpass_No			=	@Gpass_No 
				And	 Gpass_Date 		=	@Gpass_Date
			)

Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))

BEGIN TRAN TRAN1
select @sqlstr=''
IF @iMode<=0 
BEGIN
select @sqlstr = 'Insert into GEN_MaterialOUTNOTReturn_Main Values('
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))						+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Gpass_No ))						+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Gpass_Date ))					+ ''''
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Ref_Inv_No))   + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Ref_Inv_Date))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@DC_No))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@DC_Date))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Department))					+ ''''


select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@From_Company))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@To_Company))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delivered_By ))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Vehicle_no))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delivery_Location))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Total_Items))					+ ''''

 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Total_Netwt  ))				+ ''''

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Remarks ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Material_From ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate								+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate								+ '''' + ')'
END
ELSE IF @iMode=1
BEGIN
select @sqlstr = 'Update GEN_MaterialOUTNOTReturn_Main Set '
select @sqlstr= @sqlstr + 'DC_No='				+ '''' + ltrim(rtrim(@DC_No))				+ ''''
select @sqlstr= @sqlstr + ',DC_Date='				+ '''' + ltrim(rtrim(@DC_Date))				+ ''''
select @sqlstr= @sqlstr + ',Ref_Inv_No='   + '''' + ltrim(rtrim(@Ref_Inv_No))   + ''''  
select @sqlstr= @sqlstr + ',Ref_Inv_Date='   + '''' + ltrim(rtrim(@Ref_Inv_Date))  + ''''  
select @sqlstr= @sqlstr + ',Department='				+ '''' + ltrim(rtrim(@Department))				+ ''''

select @sqlstr= @sqlstr + ',From_Company='				+ '''' + ltrim(rtrim(@From_Company))				+ ''''
select @sqlstr= @sqlstr + ',To_Company='			+ '''' + ltrim(rtrim(@To_Company ))				+ ''''
select @sqlstr= @sqlstr + ',Delivered_By='			+ '''' + ltrim(rtrim(@Delivered_By))			+ ''''
select @sqlstr= @sqlstr + ',Vehicle_no='				+ '''' + ltrim(rtrim(@Vehicle_no))				+ ''''
select @sqlstr= @sqlstr + ',Delivery_Location='				+ '''' + ltrim(rtrim(@Delivery_Location))				+ ''''
select @sqlstr= @sqlstr + ',Material_From='				+ '''' + ltrim(rtrim(@Material_From))				+ ''''


select @sqlstr= @sqlstr + ',Remarks='			+ '''' + ltrim(rtrim(@Remarks  ))				+ ''''

select @sqlstr= @sqlstr + ',Total_Items='			+ '''' + ltrim(rtrim(@Total_Items  ))			+ ''''
select @sqlstr= @sqlstr + ',Total_Netwt='			+ '''' + ltrim(rtrim(@Total_Netwt  ))			+ ''''
select @sqlstr= @sqlstr + ',Authorize='				+ '''' + ltrim(rtrim(@Authorize))				+ ''''
select @sqlstr= @sqlstr + ',Delete_Mode='			+ '''' + ltrim(rtrim(@Delete_Mode))				+ ''''
select @sqlstr= @sqlstr + ',Modified_By='			+ '''' + ltrim(rtrim(@User_Code))				+ ''''
select @sqlstr= @sqlstr + ',Modified_Date='			+ '''' + @iServerDate							+ ''''
select @sqlstr= @sqlstr +  ' Where Comp_Code='		+ '''' + @Comp_Code								+ ''''
select @sqlstr= @sqlstr +  ' And Location_Code='	+ '''' + @Location_Code							+ ''''  
select @sqlstr= @sqlstr +  ' And Fin_Year_Code='	+ '''' + @Fin_Year_Code							+ ''''  
select @sqlstr= @sqlstr +  ' And Gpass_No	='			+ '''' + @Gpass_No 									+ ''''  
select @sqlstr= @sqlstr +  ' And Gpass_Date='			+ '''' + @Gpass_Date 								+ ''''  
END
exec(@sqlstr )
print @sqlstr
IF @iMode=1
BEGIN
select @sqlstr = 'Delete from GEN_MaterialOUTNOTReturn_Line'
select @sqlstr= @sqlstr +  ' Where Comp_Code='		+ '''' + @Comp_Code			+ ''''
select @sqlstr= @sqlstr +  ' And Location_Code='	+ '''' + @Location_Code		+ ''''  
select @sqlstr= @sqlstr +  ' And Fin_Year_Code='	+ '''' + @Fin_Year_Code		+ ''''  
select @sqlstr= @sqlstr +  ' And Gpass_No='			+ '''' +  @Gpass_No 			+ ''''  
select @sqlstr= @sqlstr +  ' And Gpass_Date='			+ '''' + @Gpass_Date 			+ ''''  
exec(@sqlstr )
END

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
