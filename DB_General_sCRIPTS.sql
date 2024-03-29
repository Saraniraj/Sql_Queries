 
USE [DB_General]
GO
/****** Object:  Table [dbo].[ACC_JournalEntry]    Script Date: 25/04/2023 16:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACC_JournalEntry](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[voucher_No] [varchar](200) NOT NULL,
	[voucher_Date] [datetime] NOT NULL,
	[inv_No] [nvarchar](200) NULL,
	[inv_Date] [datetime] NULL,
	[particulars] [varchar](50) NOT NULL,
	[totalAmount] [decimal](18, 5) NULL,
	[Narration] [varchar](255) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ACC_JournalEntry_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACC_JournalEntry_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[voucher_No] [varchar](200) NOT NULL,
	[voucher_Date] [datetime] NOT NULL,
	[SNo] [int] NOT NULL,
	[particulars] [varchar](50) NOT NULL,
	[Narration] [varchar](255) NULL,
	[debit] [numeric](12, 2) NOT NULL,
	[credit] [numeric](12, 2) NOT NULL,
	[status] [char](1) NOT NULL,
	[updatefrom] [varchar](100) NULL,
	[refaccountname] [varchar](500) NULL,
	[Ref_inv_No] [varchar](100) NULL,
	[Ref_inv_Date] [datetime] NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GEN_DeliveryChallan_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_DeliveryChallan_Line](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[DC_No] [varchar](20) NOT NULL,
	[DC_Date] [datetime] NOT NULL,
	[SNo] [int] NOT NULL,
	[Trans_Type] [nvarchar](100) NULL,
	[Prod_Code] [varchar](100) NOT NULL,
	[Prod_Desc] [varchar](300) NOT NULL,
	[ID_Mark] [nvarchar](150) NULL,
	[HSN_Code] [varchar](50) NOT NULL,
	[Packing_Mode] [varchar](50) NOT NULL,
	[UOM_Code] [varchar](10) NOT NULL,
	[No_Of_Bags] [numeric](18, 3) NULL,
	[Net_Meters] [numeric](18, 3) NULL,
	[Net_Wt] [numeric](18, 3) NOT NULL,
	[Rate_Per_Qty] [numeric](18, 5) NULL,
	[Line_Total] [numeric](18, 5) NULL,
	[Lorry_Frieght] [numeric](18, 3) NULL,
	[Taxable_Amt] [numeric](18, 3) NULL,
	[GST_per] [numeric](18, 2) NULL,
	[CGST] [numeric](18, 2) NULL,
	[SGST] [numeric](18, 2) NULL,
	[IGST] [numeric](18, 2) NULL,
	[Tot_GST] [numeric](18, 2) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_GEN_DeliveryChallan_Line] PRIMARY KEY CLUSTERED 
(
	[Location_Code] ASC,
	[SNo] ASC,
	[DC_No] ASC,
	[Prod_Code] ASC,
	[Prod_Desc] ASC,
	[Packing_Mode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GEN_DeliveryChallan_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_DeliveryChallan_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[DC_No] [varchar](100) NOT NULL,
	[DC_Date] [datetime] NOT NULL,
	[DC_Type] [nvarchar](50) NOT NULL,
	[Party_Code] [varchar](150) NOT NULL,
	[Party_Name] [varchar](150) NOT NULL,
	[Delivered_To] [nvarchar](2000) NOT NULL,
	[Place_Of_Supply] [varchar](500) NOT NULL,
	[Department] [varchar](500) NULL,
	[Lorry_no] [varchar](500) NULL,
	[Ref_Doc_No] [varchar](100) NULL,
	[Ref_Doc_Date] [datetime] NULL,
	[Lorry_Fr] [numeric](18, 2) NULL,
	[Tot_Taxable_Value] [numeric](18, 2) NULL,
	[Tot_CGST] [numeric](18, 2) NULL,
	[Tot_SGST] [numeric](18, 2) NULL,
	[Tot_IGST] [numeric](18, 2) NULL,
	[Tot_GST_Value] [numeric](18, 2) NULL,
	[Round_Off] [numeric](18, 2) NULL,
	[Invoice_Value] [numeric](18, 2) NULL,
	[Others_Desc] [varchar](500) NULL,
	[Gst_type] [varchar](50) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_GEN_DeliveryChallan_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Fin_Year_Code] ASC,
	[DC_No] ASC,
	[DC_Date] ASC,
	[DC_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GEN_GatepassOUT_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_GatepassOUT_Line](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[GatePass_OUT_No] [varchar](100) NOT NULL,
	[GatePass_OUT_Date] [datetime] NOT NULL,
	[SNo] [int] NOT NULL,
	[Prod_Code] [varchar](500) NOT NULL,
	[UOM_Code] [varchar](10) NOT NULL,
	[Return_Type] [varchar](50) NULL,
	[Return_Mode] [int] NULL,
	[IS_Closed] [int] NULL,
	[Close_Reason] [varchar](500) NULL,
	[No_Of_Qty] [numeric](18, 3) NOT NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_GEN_GatepassOUT_Line] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Fin_Year_Code] ASC,
	[GatePass_OUT_No] ASC,
	[GatePass_OUT_Date] ASC,
	[Prod_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GEN_GatepassOUT_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_GatepassOUT_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[GatePass_OUT_No] [varchar](100) NOT NULL,
	[GatePass_OUT_Date] [datetime] NOT NULL,
	[DC_No] [int] NULL,
	[DC_Date] [datetime] NOT NULL,
	[Issued_Company] [varchar](300) NOT NULL,
	[Recd_Company] [varchar](300) NOT NULL,
	[Delivered_By] [varchar](300) NOT NULL,
	[Remarks] [varchar](1000) NOT NULL,
	[Total_Items] [numeric](18, 3) NOT NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_GEN_GatepassOUT_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Fin_Year_Code] ASC,
	[GatePass_OUT_No] ASC,
	[GatePass_OUT_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GEN_MaterialOUTNOTReturn_Line]    Script Date: 25/04/2023 16:39:56 ******/
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
/****** Object:  Table [dbo].[GEN_MaterialOUTNOTReturn_Main]    Script Date: 25/04/2023 16:39:56 ******/
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
/****** Object:  Table [dbo].[GEN_MaterialpassIN_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_MaterialpassIN_Line](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[GatePass_IN_No] [varchar](100) NOT NULL,
	[GatePass_IN_Date] [datetime] NOT NULL,
	[SNo] [int] NOT NULL,
	[Gpass_No] [varchar](100) NOT NULL,
	[Gpass_Date] [datetime] NOT NULL,
	[Prod_Code] [varchar](500) NOT NULL,
	[UOM_Code] [varchar](10) NOT NULL,
	[No_Of_Qty] [numeric](18, 3) NOT NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_GEN_MaterialpassIN_Line] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Fin_Year_Code] ASC,
	[GatePass_IN_No] ASC,
	[GatePass_IN_Date] ASC,
	[SNo] ASC,
	[Gpass_No] ASC,
	[Gpass_Date] ASC,
	[Prod_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GEN_MaterialpassIN_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_MaterialpassIN_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[GatePass_IN_No] [varchar](100) NOT NULL,
	[GatePass_IN_Date] [datetime] NOT NULL,
	[From_Company] [varchar](100) NOT NULL,
	[Total_Items] [numeric](18, 3) NOT NULL,
	[Remarks] [nvarchar](1000) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_GEN_MaterialpassIN_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Fin_Year_Code] ASC,
	[GatePass_IN_No] ASC,
	[GatePass_IN_Date] ASC,
	[From_Company] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GEN_MaterialpassOUT_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_MaterialpassOUT_Line](
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
 CONSTRAINT [PK_GEN_MaterialpassOUT_Line] PRIMARY KEY CLUSTERED 
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
/****** Object:  Table [dbo].[GEN_MaterialpassOUT_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_MaterialpassOUT_Main](
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
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_GEN_GEN_MaterialpassOUT_Main] PRIMARY KEY CLUSTERED 
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
/****** Object:  Table [dbo].[GEN_Party_Master]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_Party_Master](
	[Comp_Code] [varchar](10) NOT NULL,
	[Party_Code] [varchar](50) NOT NULL,
	[Sender_Recvr_Name] [varchar](70) NOT NULL,
	[Type] [varchar](300) NOT NULL,
	[IsActive] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_GP_Party_Master_1] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Sender_Recvr_Name] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GEN_VehicleExpenses_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_VehicleExpenses_Line](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[Entry_No] [varchar](50) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[SNo] [int] NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Qty] [varchar](500) NULL,
	[Invoice_Value] [numeric](18, 3) NOT NULL,
	[Others_Desc] [varchar](500) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_GEN_VehicleExpenses_Line] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Fin_Year_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GEN_VehicleExpenses_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_VehicleExpenses_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[Entry_No] [varchar](50) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Expense_Type] [varchar](500) NULL,
	[Vehicle_no] [nvarchar](50) NULL,
	[Bill_From] [nvarchar](150) NULL,
	[Ref_Inv_No] [varchar](100) NULL,
	[Ref_Inv_Date] [datetime] NULL,
	[Total_Invoice_Value] [numeric](18, 3) NOT NULL,
	[Remarks] [varchar](1000) NOT NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_GEN_GEN_VehicleExpenses_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Fin_Year_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GEN_VehiclepassIN_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_VehiclepassIN_Line](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[GatePass_IN_No] [varchar](100) NOT NULL,
	[GatePass_IN_Date] [datetime] NOT NULL,
	[SNo] [int] NOT NULL,
	[Gpass_No] [varchar](100) NOT NULL,
	[Gpass_Date] [datetime] NOT NULL,
	[Prod_Code] [varchar](500) NOT NULL,
	[UOM_Code] [varchar](10) NOT NULL,
	[No_Of_Qty] [numeric](18, 3) NOT NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_GEN_GatepassIN_Line] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Fin_Year_Code] ASC,
	[GatePass_IN_No] ASC,
	[GatePass_IN_Date] ASC,
	[SNo] ASC,
	[Gpass_No] ASC,
	[Gpass_Date] ASC,
	[Prod_Code] ASC,
	[UOM_Code] ASC,
	[No_Of_Qty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GEN_VehiclepassIN_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_VehiclepassIN_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[GatePass_IN_No] [varchar](100) NOT NULL,
	[GatePass_IN_Date] [datetime] NOT NULL,
	[From_Company] [varchar](100) NOT NULL,
	[Total_Items] [numeric](18, 3) NOT NULL,
	[Remarks] [nvarchar](1000) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_GEN_GatepassIN_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Fin_Year_Code] ASC,
	[GatePass_IN_No] ASC,
	[GatePass_IN_Date] ASC,
	[From_Company] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GEN_VehiclepassOUT_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_VehiclepassOUT_Line](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[Gpass_No] [varchar](100) NOT NULL,
	[Gpass_Date] [datetime] NOT NULL,
	[SNo] [int] NOT NULL,
	[Prod_Code] [varchar](500) NOT NULL,
	[Net_Meters] [numeric](18, 3) NULL,
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
 CONSTRAINT [PK_GEN_VehiclepassOUT_Line] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Fin_Year_Code] ASC,
	[Gpass_No] ASC,
	[Prod_Code] ASC,
	[UOM_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GEN_VehiclepassOUT_Line_old]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_VehiclepassOUT_Line_old](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[Gpass_No] [varchar](100) NOT NULL,
	[Gpass_Date] [datetime] NOT NULL,
	[SNo] [int] NOT NULL,
	[Prod_Code] [varchar](500) NOT NULL,
	[Prod_Type] [numeric](18, 3) NOT NULL,
	[UOM_Code] [varchar](10) NOT NULL,
	[Return_Type] [varchar](50) NULL,
	[Return_Mode] [int] NULL,
	[IS_Closed] [int] NULL,
	[Close_Reason] [varchar](500) NULL,
	[No_Of_Qty] [numeric](18, 3) NOT NULL,
	[Net_wt] [numeric](18, 3) NOT NULL,
	[Net_Meters] [numeric](18, 3) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_GEN_vachileGatepassOUT_Line_old] PRIMARY KEY CLUSTERED 
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
/****** Object:  Table [dbo].[GEN_VehiclepassOUT_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_VehiclepassOUT_Main](
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
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_GEN_vachileGatepassOUT_Main] PRIMARY KEY CLUSTERED 
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
/****** Object:  Table [dbo].[GEN_VehicleTaxInsurance_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_VehicleTaxInsurance_Line](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[Entry_No] [varchar](50) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[SNo] [int] NOT NULL,
	[Tax_type] [varchar](50) NOT NULL,
	[Ref_Inv_No] [varchar](100) NULL,
	[Ref_Inv_Date] [datetime] NULL,
	[Tax_Date] [datetime] NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Duration] [varchar](500) NULL,
	[Amount] [numeric](18, 3) NOT NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_GEN_VehicleTaxInsurance_Line] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Fin_Year_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Tax_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GEN_VehicleTaxInsurance_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEN_VehicleTaxInsurance_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[Entry_No] [varchar](50) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Vehicle_no] [nvarchar](50) NULL,
	[Vehicle_Make] [varchar](50) NOT NULL,
	[Vehicle_Model] [varchar](50) NOT NULL,
	[Tot_Amount] [float] NULL,
	[Remarks] [varchar](1000) NOT NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_GEN_VehicleTaxInsurance_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Fin_Year_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PM_Activity_Master]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PM_Activity_Master](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[ACT_ID] [varchar](150) NOT NULL,
	[Dept_Code] [varchar](150) NOT NULL,
	[Dept_Name] [varchar](150) NULL,
	[Act_Type_ID] [int] NOT NULL,
	[Act_Type] [varchar](150) NOT NULL,
	[OPER_ID] [int] NOT NULL,
	[OPER_Name] [varchar](150) NULL,
	[Frequency] [int] NULL,
	[Duaration] [int] NOT NULL,
	[Persons_involved] [varchar](150) NULL,
	[Tollerance] [nvarchar](50) NULL,
	[Remarks] [varchar](1000) NULL,
	[IsActive] [int] NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_PM_Activity_Master] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[ACT_ID] ASC,
	[Dept_Code] ASC,
	[Act_Type_ID] ASC,
	[OPER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PM_ActivityType_Master]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PM_ActivityType_Master](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Act_Type_ID] [varchar](200) NOT NULL,
	[Act_Type] [nvarchar](200) NOT NULL,
	[Act_Desc] [nvarchar](200) NOT NULL,
	[IsActive] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_date] [datetime] NOT NULL,
 CONSTRAINT [PK_PM_ActivityType_Master] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Act_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PM_Maintenance_Entry_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PM_Maintenance_Entry_Line](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](20) NOT NULL,
	[Fin_year_code] [int] NULL,
	[Entry_No] [varchar](50) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[SNO] [int] NOT NULL,
	[Maint_PlanID] [varchar](20) NOT NULL,
	[Dept_code] [varchar](150) NOT NULL,
	[Dept_Name] [varchar](150) NOT NULL,
	[Equip_No] [varchar](150) NOT NULL,
	[Machine_name] [varchar](150) NOT NULL,
	[Act_Type_ID] [varchar](150) NOT NULL,
	[ACT_ID] [varchar](150) NOT NULL,
	[Act_Type] [varchar](150) NOT NULL,
	[OPER_ID] [varchar](150) NOT NULL,
	[OPER_Name] [varchar](150) NOT NULL,
	[Last_Done] [datetime] NOT NULL,
	[Due_Date] [datetime] NOT NULL,
	[Done_Date] [datetime] NOT NULL,
	[Date_Delays] [int] NULL,
	[Reason] [varchar](1000) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_PM_Maintenance_Entry_Line] PRIMARY KEY CLUSTERED 
(
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Maint_PlanID] ASC,
	[SNO] ASC,
	[ACT_ID] ASC,
	[OPER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PM_Maintenance_Entry_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PM_Maintenance_Entry_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_year_code] [int] NULL,
	[Entry_No] [varchar](50) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Ref_NO] [varchar](50) NOT NULL,
	[Ref_Date] [datetime] NOT NULL,
	[Dept_Code] [varchar](150) NOT NULL,
	[Dept_Name] [varchar](150) NOT NULL,
	[Schedule_Date] [datetime] NULL,
	[Remarks] [varchar](1000) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_PM_Maintenance_Entry_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Dept_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PM_Maintenance_Plan_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PM_Maintenance_Plan_Line](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](20) NOT NULL,
	[Maint_PlanID] [varchar](20) NOT NULL,
	[SNO] [int] NOT NULL,
	[ACT_ID] [varchar](150) NOT NULL,
	[Act_Type_ID] [varchar](150) NOT NULL,
	[Act_Type] [varchar](150) NOT NULL,
	[OPER_ID] [varchar](150) NOT NULL,
	[OPER_Name] [varchar](150) NOT NULL,
	[Start_Date] [datetime] NOT NULL,
	[Last_DoneDate] [datetime] NOT NULL,
	[Next_DueDate] [datetime] NOT NULL,
	[Remarks] [varchar](1000) NULL,
	[IsActive] [int] NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_PM_Maintenance_Plan_Line] PRIMARY KEY CLUSTERED 
(
	[Location_Code] ASC,
	[Maint_PlanID] ASC,
	[SNO] ASC,
	[ACT_ID] ASC,
	[OPER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PM_Maintenance_Plan_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PM_Maintenance_Plan_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Maint_PlanID] [varchar](50) NOT NULL,
	[Ref_NO] [varchar](50) NOT NULL,
	[Ref_Date] [datetime] NOT NULL,
	[Dept_Code] [varchar](150) NOT NULL,
	[Dept_Name] [varchar](150) NOT NULL,
	[Equipment_No] [varchar](150) NOT NULL,
	[Machine_Code] [varchar](150) NOT NULL,
	[Remarks] [varchar](1000) NULL,
	[IsActive] [varchar](15) NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_PM_Maintenance_Plan_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Maint_PlanID] ASC,
	[Dept_Code] ASC,
	[Equipment_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PM_Operation_Master]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PM_Operation_Master](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[OPER_ID] [varchar](200) NOT NULL,
	[OPER_Name] [nvarchar](200) NOT NULL,
	[OPER_Desc] [nvarchar](200) NOT NULL,
	[IsActive] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_date] [datetime] NOT NULL,
 CONSTRAINT [PK_PM_Operation_Master] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[OPER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_StoreBillEntry]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_StoreBillEntry](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[Entry_No] [bigint] NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Unit_Name] [varchar](150) NOT NULL,
	[Dept_Name] [varchar](50) NULL,
	[inv_No] [varchar](100) NULL,
	[inv_Date] [datetime] NULL,
	[Party_Name] [varchar](150) NOT NULL,
	[GRB_NO] [varchar](150) NOT NULL,
	[Invoice_Value] [numeric](18, 2) NULL,
	[Remarks] [varchar](500) NULL,
	[Closed] [int] NOT NULL,
	[Closed_date] [datetime] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_StoreBillEntry] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Fin_Year_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_StoreLedgerPosting]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_StoreLedgerPosting](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[Entry_No] [varchar](max) NULL,
	[Entry_Date] [datetime] NULL,
	[invoice_No] [varchar](max) NULL,
	[invoice_Date] [datetime] NULL,
	[ledgerName] [varchar](max) NULL,
	[Narration] [varchar](max) NULL,
	[debit] [decimal](18, 5) NULL,
	[credit] [decimal](18, 5) NULL,
	[Refaccountname] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_StorePaymentEntry]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_StorePaymentEntry](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[Entry_No] [varchar](200) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[inv_No] [nvarchar](200) NULL,
	[inv_Date] [datetime] NULL,
	[particulars] [varchar](50) NOT NULL,
	[totalAmount] [decimal](18, 5) NULL,
	[Narration] [varchar](255) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_StorePaymentEntry_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_StorePaymentEntry_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[Entry_No] [varchar](200) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[SNo] [int] NOT NULL,
	[particulars] [varchar](50) NOT NULL,
	[Narration] [varchar](255) NULL,
	[debit] [numeric](12, 2) NOT NULL,
	[credit] [numeric](12, 2) NOT NULL,
	[status] [char](1) NOT NULL,
	[updatefrom] [varchar](100) NULL,
	[refaccountname] [varchar](500) NULL,
	[Ref_inv_No] [varchar](100) NULL,
	[Ref_inv_Date] [datetime] NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_StorePaymentEntry_old]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_StorePaymentEntry_old](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[Entry_No] [varchar](20) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Unit_Name] [varchar](150) NOT NULL,
	[Party_Name] [varchar](150) NOT NULL,
	[Narration] [varchar](max) NULL,
	[inv_No] [varchar](100) NULL,
	[inv_Date] [datetime] NULL,
	[Paid_Amount] [numeric](18, 2) NULL,
	[Refaccountname] [varchar](max) NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_StorePaymentEntry] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Fin_Year_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_VehicleFuelBillEntry]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_VehicleFuelBillEntry](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Fin_Year_Code] [int] NOT NULL,
	[Entry_No] [bigint] NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Unit_Name] [varchar](150) NOT NULL,
	[Party_Name] [varchar](150) NOT NULL,
	[inv_No] [varchar](100) NULL,
	[inv_Date] [datetime] NULL,
	[Indent_NO] [varchar](150) NOT NULL,
	[Vehicle_no] [varchar](50) NOT NULL,
	[Fuel_Type] [varchar](50) NOT NULL,
	[Start_Reading] [bigint] NOT NULL,
	[End_Reading] [bigint] NOT NULL,
	[Running_Kms] [bigint] NOT NULL,
	[Fuel_Qty] [numeric](18, 2) NOT NULL,
	[Rate_Per_Ltr] [numeric](18, 3) NOT NULL,
	[Bill_Amt] [numeric](18, 2) NULL,
	[Mileage_Kmphr] [numeric](18, 2) NULL,
	[Driver_Name] [varchar](500) NULL,
	[Remarks] [varchar](500) NULL,
	[IsActive] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_VehicleFuelBillEntry] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Fin_Year_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[Fun_STORELedger_Statement]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		K.Rajkumar
-- Create date: 04-06-2020
-- Description:	<Description,,>
-- =============================================


--  select * from Fun_STORELedger_Statement ('100','MAIN UNIT','1','','2022-04-01','2022-04-30')   

CREATE FUNCTION  [dbo].[Fun_STORELedger_Statement] (
@comp_code as varchar(30)
,@location_code as varchar(30)
,@fin_year_code as varchar(30)
,@count as varchar(300)

,@Fromdate as datetime
,@Todate as datetime

) 
returns Table  
return  
(  


select   

p.location_code,p.ledgerName     ,p.trans_date  as Entry_Date
 
, sum(open_Qty) as OPENING   

 ,sum(debit) as DEBIT    ,sum(credit) as CREDIT  
,sum(Closing)  as CLOSING   
 , p.Refaccountname   
,p.invoice_No ,p.invoice_date,p.Narration     
--,((sum(Closing)+sum(debit) )   -(sum(credit) ))  as Closing   
,sum(Closing)  as OpeningQty 

,(sum(debit)  )  
as debit_VALUE
,(sum(credit)   )  as Credit_VALUE  

from  (      
	
select   M.location_code , Trans_date  , m.ledgerName  
 ,0 as Open_Qty,0 as   debit   
,0 as   credit ,(Sum(opening)+Sum(debit) )- ( Sum(  credit ))  as Closing
  ,m.Refaccountname, M.invoice_No ,M.invoice_date,M.Narration 


	from (
	
	select    a.location_code,a.Fin_Year_Code  , @Fromdate  as Trans_date  
	, a.ledgerName  
, 0 as opening,0 as   debit ,0 as credit,0   as Closing
,A.Refaccountname,''  AS invoice_No ,''  AS invoice_date,'' AS Narration 

	from  tbl_StoreLedgerPosting a   
	
	  where a.Location_Code =@location_code  
	  and  a.Comp_Code  =@comp_code 
	-----and a.Fin_Year_Code  =@fin_year_code 
	--and trans_type='Opening' 
	 --and a.Fin_Year_Code  =2          
	  and a.Entry_Date  > ='2022-04-01' 
	And a.Entry_Date <=@Fromdate
	and a.Refaccountname=@count
	Group By  a.comp_code,a.location_code  ,a.Fin_Year_Code ,a.ledgerName ,A.Refaccountname   
	  ,A.invoice_No ,A.invoice_Date,A.Narration
	 
	union all     

select    a.location_code,a.Fin_Year_Code    ,@Fromdate  as Trans_date   
, a.ledgerName  
, 0 as opening,sum(a.debit)debit    ,sum(a.credit) as credit ,0 as Closing    
,A.Refaccountname,''  AS invoice_No, ''  AS invoice_Date ,'' AS Narration 

from  tbl_StoreLedgerPosting a   
where a.Location_Code =@location_code  
	and  a.Comp_Code  =@comp_code 
	--and a.Fin_Year_Code  =@fin_year_code
	 and a.Entry_Date  > ='2022-04-01' 
	And a.Entry_Date <@Fromdate
	--and a.Refaccountname=@count
Group By  a.comp_code,a.location_code ,a.Fin_Year_Code  ,a.ledgerName ,A.Refaccountname  

	) m Group By m.ledgerName,m.Refaccountname,m.location_code,m.Fin_Year_Code,m.Trans_date        
	 ,M.invoice_No ,M.invoice_date,M.Narration 

	union all    
	select    a.location_code ,a.Entry_Date   
	 ,a.ledgerName
    
, 0 as opening,sum(a.debit)debit    ,sum(a.credit) as credit ,0 as Closing  
	,Refaccountname	    ,A.invoice_No,A.invoice_Date ,A.Narration  
	
	   from  tbl_StoreLedgerPosting a   
		      where a.Location_Code =@location_code
	and  a.Comp_Code  =@comp_code 
	--and a.Fin_Year_Code  =@fin_year_code
	And a.Entry_Date >=@Fromdate And a.Entry_Date <=@Todate
	--and a.Refaccountname=@count
	Group By a.ledgerName,A.Refaccountname     ,a.comp_code,a.location_code,a.Fin_Year_Code,a.Entry_Date 
	  ,A.invoice_No ,A.invoice_Date ,A.Narration 
	)as p   
	group by      p.location_code    ,p.ledgerName,p.Refaccountname    ,p.Trans_date   
			    ,P.invoice_No ,p.invoice_date ,P.Narration 
	  having sum(Closing) >0  or sum(debit) >0  or   sum(credit ) >0     
	--order by p.Prod_Code,p.Prod_Desc  
	)



GO
/****** Object:  UserDefinedFunction [dbo].[Fun_UpdateStoreBillLedgerPosting]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- select * from Fun_UpdatePurchaseLedgerPosting ('','','PO/0001/22-23')

CREATE function [dbo].[Fun_UpdateStoreBillLedgerPosting] (
@Comp_Code    Varchar(20),    
 @Location_Code		Varchar(20),
 @Entry_No		Varchar(20)

 )  returns Table
 
return    
(    
    --------Purchase Ledger Posting 


select 
a.Comp_Code      ,[Location_Code]      ,[Fin_Year_Code]
      ,Entry_No ,Entry_Date ,inv_No ,inv_Date 
  ,  Party_Name
 ,'Material Purchased as Per inv no:'+inv_No +' ,Dt:-' +  CONVERT(varchar(10), CAST(inv_Date as date), 103)  as Narration
 
,0 as Debit
, Invoice_Value as Credit
,'Purchase Account' as Refaccountname
from  tbl_StoreBillEntry as a
 


 where  Entry_No=@Entry_No    
 

union all
select 
a.Comp_Code       ,[Location_Code]      ,[Fin_Year_Code]
     ,Entry_No ,Entry_Date ,inv_No ,inv_Date 
    ,  'Purchase Account'
 ,'Material Purchased as Per inv no:'+inv_No +' ,Dt:-' +  CONVERT(varchar(10), CAST(inv_Date as date), 103)  as Narration
,  Invoice_Value as Debit
,0 as Credit
,Party_Name as Refaccountname
from  tbl_StoreBillEntry as a

 where  Entry_No=@Entry_No    
   
    

)






GO
/****** Object:  View [dbo].[View_Party_details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Party_details]
AS
SELECT DISTINCT a.Delivered_To, b.Party_Name
FROM            dbo.GEN_DeliveryChallan_Main AS a INNER JOIN
                         DB_Common.dbo.Party_Details AS b ON a.Delivered_To = b.Party_Code



GO
ALTER TABLE [dbo].[GEN_VehiclepassOUT_Line] ADD  CONSTRAINT [DF_GEN_VehiclepassOUT_Line_Prod_Type]  DEFAULT ((0)) FOR [Net_Meters]
GO
ALTER TABLE [dbo].[GEN_VehiclepassOUT_Line_old] ADD  CONSTRAINT [DF_GEN_VehiclepassOUT_Line_Net_Meters]  DEFAULT ((0)) FOR [Prod_Type]
GO
ALTER TABLE [dbo].[GEN_VehiclepassOUT_Line_old] ADD  CONSTRAINT [DF_GEN_VehiclepassOUT_Line_old_Net_Meters]  DEFAULT ((0)) FOR [Net_Meters]
GO
/****** Object:  StoredProcedure [dbo].[sp_GEN_Deliverychallan_Report]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==============================================================  
-- Author  : krk  
-- Create date :24-05-2022 
-- Description : Get SGatepass Transaction  Details)  
-- ===============================================================  
-- Grant Execute On [sp_GetGatepassTrans_Details] To Public  
-- select * from GEN_MaterialpassOUT_Line  
-- select * from GEN_MaterialpassOUT_Main  
-- select * from GEN_MaterialpassIN_Line  
-- exec [sp_GEN_Deliverychallan_Report] '100','MAIN UNIT','1','','ALL','','','SPINNING','2022-07-01','2022-07-31','','Delivery Challan Report'  
-- exec [sp_GEN_Deliverychallan_Report] '100','THENI','1','','ALL','','','','2022-04-01','2022-06-30','','DC ITC Report'  
-- exec [sp_GEN_Deliverychallan_Report] '100','THENI','1','','ALL','','','','','2022-04-01','2022-06-30','','Productwise Abstract Report'  

-- exec [sp_GEN_Deliverychallan_Report] '100','THENI','1','','ALL','','','','2022-04-01','2022-05-30','','Return'  
-- exec [sp_GEN_Deliverychallan_Report] '100','THENI','1','','ALL','','','','2022-04-01','2022-05-30','','NOT-Return'  
-- exec [sp_GEN_Deliverychallan_Report] '100','THENI','1','','ALL','','','','2022-04-01','2022-05-30','','VehiclepassIN'  
-- exec [sp_GEN_Deliverychallan_Report] '100','MAIN UNIT','1','','ALL','','','','','2022-04-01','2023-03-30','','Delivery Challan MIS Report'  

  
CREATE Proc [dbo].[sp_GEN_Deliverychallan_Report]  
(  
@Comp_Code    Varchar(10),  
@Location_Code   Varchar(10),  
@Fin_Year_Code   Varchar(10),  
@Mmbilledto    Varchar(100),  
@mmmshipto     Varchar(100),  
@prodname     Varchar(100),  
@vehicleno     Varchar(20),
@mTranstype     Varchar(100),
@mpartytype		varchar(100),  
@from_Date           varchar(50),  
@To_Date           varchar(50), 
@Filter     Varchar(100),  
@Mode     Varchar(100)  
)   



as  
BEGIN  
set nocount on  
set dateformat ymd  
Declare @sqlstr varchar(8000)  
print @Comp_Code  
Declare @mLocation_Code Varchar(10)  
Set @mLocation_Code=''  

Declare @Transtype Varchar(100)  
Set @Transtype=''  
Declare @billedto Varchar(100)  
Set @billedto =''  
Declare @shipto  Varchar(100)  
Set @shipto =''  
Declare @mproduct_code Varchar(100)  
Set @mproduct_code ='' 

Declare @mVehicleno Varchar(100)  
Set @mVehicleno =''  
Declare @mtype Varchar(100)  
Set @mtype =''  



 
  
IF LTRIM(RTRIM(@Location_Code))='ALL'  
BEGIN  
Set @mLocation_Code='%'  
END  
ELSE  
BEGIN  
Set @mLocation_Code=@Location_Code   
END  
  
IF LTRIM(RTRIM(@mTranstype))='ALL' or LTRIM(RTRIM(@mTranstype ))=''  
BEGIN  
Set @Transtype ='%'  
END  
ELSE  
BEGIN  
Set @Transtype=@mTranstype  
END  
  
IF LTRIM(RTRIM(@Mmbilledto  ))='ALL' or LTRIM(RTRIM(@Mmbilledto ))=''  
BEGIN  
Set @billedto  ='%'  
END  
ELSE  
BEGIN  
Set @billedto=@Mmbilledto  
END  
  
IF LTRIM(RTRIM(@mmmshipto  ))='ALL' or LTRIM(RTRIM(@mmmshipto ))=''  
BEGIN  
Set @shipto   ='%'  
END  
ELSE  
BEGIN  
Set @shipto=@mmmshipto   
END  



IF LTRIM(RTRIM(@prodname  ))='ALL' or LTRIM(RTRIM(@prodname ))=''  
BEGIN  
Set @mproduct_code  ='%'  
END  
ELSE  
BEGIN  
Set @mproduct_code=@prodname  
END  
  
IF LTRIM(RTRIM(@vehicleno  ))='ALL' or LTRIM(RTRIM(@vehicleno ))=''  
BEGIN  
Set @mVehicleno   ='%'  
END  
ELSE  
BEGIN  
Set @mVehicleno=@vehicleno   
END  

IF LTRIM(RTRIM(@mpartytype  ))='ALL' or LTRIM(RTRIM(@mpartytype ))=''  
BEGIN  
Set @mtype   ='%'  
END  
ELSE  
BEGIN  
Set @mtype=@mpartytype   
END  

  
IF   
(   
ltrim(rtrim(@mode))= 'Delivery Challan Report'   
    
)  
  
BEGIN  
  
         
select @sqlstr= 'Select '   

select @sqlstr = @sqlstr + ' a.DC_No,a.DC_Date   '
select @sqlstr = @sqlstr + ' ,a.Party_Name   '
select @sqlstr = @sqlstr + ' ,a.Delivered_To,a.Place_Of_Supply,a.Department,a.Lorry_no   '
select @sqlstr = @sqlstr + ' ,a.Ref_Doc_No,a.Ref_Doc_Date,a.Others_Desc    '
select @sqlstr = @sqlstr + '      ,a.Tot_Taxable_Value    , a.Tot_CGST    , a.Tot_SGST   '
select @sqlstr = @sqlstr + '  , a.Tot_IGST    , a.Tot_GST_Value    ,a. Invoice_Value   '
select @sqlstr = @sqlstr + ' ,b.SNo,b.Prod_Code,b.Prod_Desc,b.ID_Mark   '
select @sqlstr = @sqlstr + ' ,b.HSN_Code,b.Packing_Mode,b.UOM_Code   '
select @sqlstr = @sqlstr + ' ,b.Net_Meters,b.No_Of_Bags,b.Net_Wt    ' 
select @sqlstr = @sqlstr + '    ,b.Rate_Per_Qty,b.Line_Total   '              
select @sqlstr = @sqlstr + '    	,b. GST_per ,b. CGST ,b. SGST ,b. IGST ,b. Tot_GST ,b. HSN_Code   ' 
  
select @sqlstr = @sqlstr + '    ,c.Party_Name as  ShipTo_Name   '

select @sqlstr = @sqlstr + '          ,c.Party_Add1 as Shipto_Add1,c.Party_Add2 as Shipto_Add2 ,c.Party_Add3 as Shipto_Add3   '
select @sqlstr = @sqlstr + '        ,c.Party_city as  Shipto_city,c.Party_State as  Shipto_State '
select @sqlstr = @sqlstr + '        , c.Party_Pincode as   Shipto_Pincode  ,c.Party_Mob_No as  Shipto_Mob_No  '
select @sqlstr = @sqlstr + '        ,c.GST_NO  as Shipto_GST_NO      '
select @sqlstr = @sqlstr + '    ,d.Party_Name as  DeliveredTo_Name   '
select @sqlstr = @sqlstr + '          ,d.Party_Add1 as DeliveredTo_Add1,d.Party_Add2 as DeliveredTo_Add2 ,d.Party_Add3 as DeliveredTo_Add3   '
select @sqlstr = @sqlstr + '        ,d.Party_city as  DeliveredTo_city,d.Party_State as  DeliveredTo_State '
select @sqlstr = @sqlstr + '        , d.Party_Pincode as   DeliveredTo_Pincode  ,d.Party_Mob_No as  DeliveredTo_Mob_No  '
select @sqlstr = @sqlstr + '        ,d.GST_NO  as GST_NO     '


--select @sqlstr = @sqlstr + '        ,c.Sup_Add1,c.Sup_Add2 ,c.Sup_Add3   '
--    select @sqlstr = @sqlstr + '       ,c.Sup_City,c.Sup_State  , c.Sup_Pincode  ,c.Sup_Mob_No,c.Sup_Others_1 as GST_NO   '



select @sqlstr = @sqlstr + ' 	FROM GEN_DeliveryChallan_Main as a '
select @sqlstr = @sqlstr + ' left join GEN_DeliveryChallan_Line as b on b.DC_No=a.DC_No and b.DC_Date =a.DC_Date  '
          
select @sqlstr = @sqlstr + ' Left  Join  DB_Common..Party_Details c On    c.Party_Code=a.Party_Code And a.Party_Code Is Not Null'    
select @sqlstr = @sqlstr + ' Left  Join  DB_Common..Party_Details d On    d.Party_Code=a.Delivered_To And a.Party_Code Is Not Null'    
    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + '''' 
Select @sqlstr = @sqlstr + ' and a.Party_Name like ' + ''''  + @billedto   + ''''       
--Select @sqlstr = @sqlstr + ' and a.Delivered_To like ' + ''''  + @shipto    + ''''      
Select @sqlstr = @sqlstr + ' and d.party_name like ' + ''''  + @shipto    + ''''      
Select @sqlstr = @sqlstr + ' and b.Prod_Code like ' + ''''  + @mproduct_code    + '''' 
Select @sqlstr = @sqlstr + ' and a.Lorry_no like ' + ''''  + @mVehicleno    + '''' 
Select @sqlstr = @sqlstr + ' and a.department like ' + ''''  + @Transtype    + '''' 

IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.DC_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.DC_Date <='+ '''' + @To_Date+ ''''  
   
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'      
        
select @sqlstr = @sqlstr + ' Order by a.Created_Date, a.DC_Date desc '
end   
end   

ELSE IF   
(   
ltrim(rtrim(@mode))= 'Delivery Challan Report-Details'   
    
)  
  
BEGIN  
  
         
select @sqlstr= 'Select '   

select @sqlstr = @sqlstr + ' a.DC_No,a.DC_Date   '
select @sqlstr = @sqlstr + ' ,a.Party_Name   '
select @sqlstr = @sqlstr + ' ,a.Delivered_To,a.Place_Of_Supply,a.Department,a.Lorry_no   '
select @sqlstr = @sqlstr + ' ,a.Ref_Doc_No,a.Ref_Doc_Date,a.Others_Desc    '
select @sqlstr = @sqlstr + '      ,a.Tot_Taxable_Value    , a.Tot_CGST    , a.Tot_SGST   '
select @sqlstr = @sqlstr + '  , a.Tot_IGST    , a.Tot_GST_Value    ,a. Invoice_Value   '
select @sqlstr = @sqlstr + ' ,b.SNo,b.Prod_Code,b.Prod_Desc,b.ID_Mark   '
select @sqlstr = @sqlstr + ' ,b.HSN_Code,b.Packing_Mode,b.UOM_Code   '
select @sqlstr = @sqlstr + ' ,b.Net_Meters,b.No_Of_Bags,b.Net_Wt    ' 
select @sqlstr = @sqlstr + '    ,b.Rate_Per_Qty,b.Line_Total   '              
select @sqlstr = @sqlstr + '    	,b. GST_per ,b. CGST ,b. SGST ,b. IGST ,b. Tot_GST ,b. HSN_Code   ' 
  
select @sqlstr = @sqlstr + '    ,c.Party_Name as  ShipTo_Name   '

select @sqlstr = @sqlstr + '          ,c.Party_Add1 as Shipto_Add1,c.Party_Add2 as Shipto_Add2 ,c.Party_Add3 as Shipto_Add3   '
select @sqlstr = @sqlstr + '        ,c.Party_city as  Shipto_city,c.Party_State as  Shipto_State '
select @sqlstr = @sqlstr + '        , c.Party_Pincode as   Shipto_Pincode  ,c.Party_Mob_No as  Shipto_Mob_No  '
select @sqlstr = @sqlstr + '        ,c.GST_NO  as Shipto_GST_NO      '
select @sqlstr = @sqlstr + '    ,d.Party_Name as  DeliveredTo_Name   '
select @sqlstr = @sqlstr + '          ,d.Party_Add1 as DeliveredTo_Add1,d.Party_Add2 as DeliveredTo_Add2 ,d.Party_Add3 as DeliveredTo_Add3   '
select @sqlstr = @sqlstr + '        ,d.Party_city as  DeliveredTo_city,d.Party_State as  DeliveredTo_State '
select @sqlstr = @sqlstr + '        , d.Party_Pincode as   DeliveredTo_Pincode  ,d.Party_Mob_No as  DeliveredTo_Mob_No  '
select @sqlstr = @sqlstr + '        ,d.GST_NO  as GST_NO     '


--select @sqlstr = @sqlstr + '        ,c.Sup_Add1,c.Sup_Add2 ,c.Sup_Add3   '
--    select @sqlstr = @sqlstr + '       ,c.Sup_City,c.Sup_State  , c.Sup_Pincode  ,c.Sup_Mob_No,c.Sup_Others_1 as GST_NO   '



select @sqlstr = @sqlstr + ' 	FROM GEN_DeliveryChallan_Main as a '
select @sqlstr = @sqlstr + ' left join GEN_DeliveryChallan_Line as b on b.DC_No=a.DC_No and b.DC_Date =a.DC_Date  '
          
select @sqlstr = @sqlstr + ' Left  Join  DB_Common..Party_Details c On    c.Party_Code=a.Party_Code And a.Party_Code Is Not Null'    
select @sqlstr = @sqlstr + ' Left  Join  DB_Common..Party_Details d On    d.Party_Code=a.Delivered_To And a.Party_Code Is Not Null'    
    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + '''' 
Select @sqlstr = @sqlstr + ' and a.Party_Name like ' + ''''  + @billedto   + ''''       
--Select @sqlstr = @sqlstr + ' and a.Delivered_To like ' + ''''  + @shipto    + ''''      
Select @sqlstr = @sqlstr + ' and d.party_name like ' + ''''  + @shipto    + ''''      
Select @sqlstr = @sqlstr + ' and b.Prod_Code like ' + ''''  + @mproduct_code    + '''' 
Select @sqlstr = @sqlstr + ' and a.Lorry_no like ' + ''''  + @mVehicleno    + '''' 
Select @sqlstr = @sqlstr + ' and a.department like ' + ''''  + @Transtype    + '''' 

IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.DC_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.DC_Date <='+ '''' + @To_Date+ ''''  
   
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'      
        
select @sqlstr = @sqlstr + ' Order by a.Created_Date, a.DC_Date desc '
end   
end   
       
ELSE IF   
(   
ltrim(rtrim(@mode))= 'Delivery Challan Report-Simple'   
    
)  
  
BEGIN  
  
         
select @sqlstr= 'Select '   

select @sqlstr = @sqlstr + ' a.DC_No,a.DC_Date   '

select @sqlstr = @sqlstr + ' ,a.Place_Of_Supply,a.Department'

select @sqlstr = @sqlstr + ' ,b.SNo,b.Prod_Code,b.ID_Mark   '
select @sqlstr = @sqlstr + ' ,b.No_Of_Bags,b.Packing_Mode,b.Net_Meters,b.UOM_Code,b.Net_Wt    '


select @sqlstr = @sqlstr + ' 	FROM GEN_DeliveryChallan_Main as a '
select @sqlstr = @sqlstr + ' left join GEN_DeliveryChallan_Line as b on b.DC_No=a.DC_No and b.DC_Date =a.DC_Date  '
          
select @sqlstr = @sqlstr + ' Left  Join  DB_Common..Party_Details c On    c.Party_Code=a.Party_Code And a.Party_Code Is Not Null'    
select @sqlstr = @sqlstr + ' Left  Join  DB_Common..Party_Details d On    d.Party_Code=a.Delivered_To And a.Party_Code Is Not Null'    
    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + '''' 
Select @sqlstr = @sqlstr + ' and a.Party_Name like ' + ''''  + @billedto   + ''''       
--Select @sqlstr = @sqlstr + ' and a.Delivered_To like ' + ''''  + @shipto    + ''''      
Select @sqlstr = @sqlstr + ' and d.party_name like ' + ''''  + @shipto    + ''''      
Select @sqlstr = @sqlstr + ' and b.Prod_Code like ' + ''''  + @mproduct_code    + '''' 
Select @sqlstr = @sqlstr + ' and a.Lorry_no like ' + ''''  + @mVehicleno    + '''' 
Select @sqlstr = @sqlstr + ' and a.department like ' + ''''  + @Transtype    + '''' 

IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.DC_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.DC_Date <='+ '''' + @To_Date+ ''''  
   
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'      
        
select @sqlstr = @sqlstr + ' Order by a.Created_Date, a.DC_Date desc '
end   
end   

ELSE IF   
(   
ltrim(rtrim(@mode))= 'DC ITC Report'   
    
)  
  
BEGIN  
  
         
select @sqlstr= 'Select '   


select @sqlstr = @sqlstr + ' c.party_type,c.gst_no,c.party_name,c.Party_state  '
select @sqlstr = @sqlstr + ' ,''NON SEZ'' as job_workers_type,a.dc_no,a.dc_date  '
select @sqlstr = @sqlstr + ' ,b.prod_desc,b.uom_code,net_wt,b.taxable_amt,''INPUTS'' as type_of_goods  '
select @sqlstr = @sqlstr + ' ,b.gst_per/2 as cgst,b.gst_per/2 as sgst   '
select @sqlstr = @sqlstr + '    	  ,b. CGST AS CGST_Amt ,b. SGST as SGST_Amt ,b. IGST as IGST_Amt  '
select @sqlstr = @sqlstr + '  ,b. Tot_GST ,b. HSN_Code   ' 

select @sqlstr = @sqlstr + '  from db_general..GEN_DeliveryChallan_Main a  '

 
select @sqlstr = @sqlstr + ' left join db_general..GEN_DeliveryChallan_Line as b on b.DC_No=a.DC_No and b.DC_Date =a.DC_Date  '
          
select @sqlstr = @sqlstr + ' Left  Join  DB_Common..Party_Details c On    c.Party_Code=a.Party_Code And a.Party_Code Is Not Null'    
select @sqlstr = @sqlstr + ' Left  Join  DB_Common..Party_Details d On    d.Party_Code=a.Delivered_To And a.Party_Code Is Not Null'
 
 
    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
--select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''        
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + '''' 
--Select @sqlstr = @sqlstr + 'and a.Party_Name like ' + ''''  + @billedto   + ''''       
--Select @sqlstr = @sqlstr + 'and a.Delivered_To like ' + ''''  + @shipto    + ''''      
--Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + '''' 
--Select @sqlstr = @sqlstr + 'and a.Lorry_no like ' + ''''  + @mVehicleno    + '''' 
Select @sqlstr = @sqlstr + 'and c.party_type like ' + ''''  + @mtype    + '''' 

IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.DC_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.DC_Date <='+ '''' + @To_Date+ ''''  
   
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'      
        
select @sqlstr = @sqlstr + ' order by a.dc_date,a.dc_no   '
end   
end  

   
else IF   
(   
ltrim(rtrim(@mode))= 'Delivery Challan MIS Report'   
    
)  
  
BEGIN  
  
      
select @sqlstr= 'Select '   
   
 

select @sqlstr = @sqlstr + 'a.Location_Code, a.DC_No,a.DC_Date   '
select @sqlstr = @sqlstr + ' ,a.Party_Name   '
select @sqlstr = @sqlstr + ' ,a.Lorry_no   '
select @sqlstr = @sqlstr + ' ,a.Ref_Doc_No,a.Ref_Doc_Date    '
select @sqlstr = @sqlstr + ' ,b.SNo,b.Prod_Code,b.Prod_Desc,b.ID_Mark   '
select @sqlstr = @sqlstr + ' ,b.HSN_Code,b.Packing_Mode,b.UOM_Code   '
select @sqlstr = @sqlstr + ' ,b.Net_Meters,b.No_Of_Bags,b.Net_Wt    ' 
select @sqlstr = @sqlstr + '    ,b.Rate_Per_Qty,b.Line_Total   '              
select @sqlstr = @sqlstr + '    	,b. GST_per ,b. CGST ,b. SGST ,b. IGST ,b. Tot_GST    ' 
  
select @sqlstr = @sqlstr + '    ,c.Party_Name as  ShipTo_Name   '
select @sqlstr = @sqlstr + '      ,a.Tot_Taxable_Value    , a.Tot_CGST    , a.Tot_SGST   '
select @sqlstr = @sqlstr + '  , a.Tot_IGST    , a.Tot_GST_Value    ,a. Invoice_Value   '


select @sqlstr = @sqlstr + '  ,c.Party_Add1 as Shipto_Add1,c.Party_Add2 as Shipto_Add2 ,c.Party_Add3 as Shipto_Add3   '
select @sqlstr = @sqlstr + '   ,c.Party_city as  Shipto_city,c.Party_State as  Shipto_State '
select @sqlstr = @sqlstr + '    , c.Party_Pincode as   Shipto_Pincode  ,c.Party_Mob_No as  Shipto_Mob_No  '
select @sqlstr = @sqlstr + '    ,c.GST_NO  as Shipto_GST_NO      '
select @sqlstr = @sqlstr + '  ,d.Party_Name as  DeliveredTo_Name   '
select @sqlstr = @sqlstr + '  ,d.Party_Add1 as DeliveredTo_Add1,d.Party_Add2 as DeliveredTo_Add2 ,d.Party_Add3 as DeliveredTo_Add3   '
select @sqlstr = @sqlstr + '    ,d.Party_city as  DeliveredTo_city,d.Party_State as  DeliveredTo_State '
select @sqlstr = @sqlstr + '    , d.Party_Pincode as   DeliveredTo_Pincode  ,d.Party_Mob_No as  DeliveredTo_Mob_No  '
select @sqlstr = @sqlstr + '   ,d.GST_NO  as GST_NO     '
 
select @sqlstr = @sqlstr + ' 	FROM GEN_DeliveryChallan_Main as a '
select @sqlstr = @sqlstr + ' left join GEN_DeliveryChallan_Line as b on b.DC_No=a.DC_No and b.DC_Date =a.DC_Date  '
    
select @sqlstr = @sqlstr + ' Left  Join  DB_Common..Party_Details c On    c.Party_Code=a.Party_Code And a.Party_Code Is Not Null'    
select @sqlstr = @sqlstr + ' Left  Join  DB_Common..Party_Details d On    d.Party_Code=a.Delivered_To And a.Party_Code Is Not Null'    
    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''   
Select @sqlstr = @sqlstr + 'and a.Location_Code like ' + ''''  + @mLocation_Code   + ''''    
   
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + '''' 
Select @sqlstr = @sqlstr + 'and d.Party_Name like ' + ''''  + @billedto   + ''''    
--Select @sqlstr = @sqlstr + 'and a.Delivered_To like ' + ''''  + @shipto    + ''''   
Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + '''' 
Select @sqlstr = @sqlstr + 'and a.Lorry_no like ' + ''''  + @mVehicleno    + '''' 

IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.DC_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.DC_Date <='+ '''' + @To_Date+ ''''  
   
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'   
     
select @sqlstr = @sqlstr + ' Order by a.Created_Date, a.DC_Date desc '
end   
end   
 
ELSE IF   
(   
ltrim(rtrim(@mode))= 'Productwise Abstract Report'   
    
)  
  
BEGIN  
  
         
select @sqlstr= 'Select '   


 
select @sqlstr = @sqlstr + ' b.Trans_Type,b.Prod_Code,b.Prod_Desc   '
select @sqlstr = @sqlstr + ' ,b.HSN_Code,b.Packing_Mode,b.UOM_Code,  '
select @sqlstr = @sqlstr + ' sum(b.No_Of_Bags) as No_Of_Bags ,sum(b.Net_Meters) as Net_Meters  '
select @sqlstr = @sqlstr + ' ,sum(b.Net_Wt) as Net_Wt,b.Rate_Per_Qty,sum(b.Line_Total) as Line_Total  '
select @sqlstr = @sqlstr + ' ,sum(b.Lorry_Frieght) as Lorry_Frieght,sum(b.Taxable_Amt) as Taxable_Amt  '
select @sqlstr = @sqlstr + ' ,b.GST_per,sum(b.CGST) as CGST,sum(b.SGST) as SGST,sum(b.IGST) as IGST,sum(b.Tot_GST) as Tot_GST  '
select @sqlstr = @sqlstr + ' FROM DB_General.dbo.GEN_DeliveryChallan_Main as a  '
select @sqlstr = @sqlstr + ' left join DB_General.dbo.GEN_DeliveryChallan_Line as b on b.DC_No =a.DC_No and b.DC_Date =a.DC_Date   '


    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
--select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''        
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + '''' 
--Select @sqlstr = @sqlstr + 'and a.Party_Name like ' + ''''  + @billedto   + ''''       
--Select @sqlstr = @sqlstr + 'and a.Delivered_To like ' + ''''  + @shipto    + ''''      
--Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + '''' 
--Select @sqlstr = @sqlstr + 'and a.Lorry_no like ' + ''''  + @mVehicleno    + '''' 
--Select @sqlstr = @sqlstr + 'and c.party_type like ' + ''''  + @mtype    + '''' 

IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.DC_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.DC_Date <='+ '''' + @To_Date+ ''''  
   
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'      
select @sqlstr = @sqlstr + ' group by  b.Trans_Type,b.Prod_Code,b.Prod_Desc   '
select @sqlstr = @sqlstr + ' ,b.HSN_Code,b.Packing_Mode,b.UOM_Code   '
select @sqlstr = @sqlstr + ' ,b.Rate_Per_Qty,b.GST_per  '
select @sqlstr = @sqlstr + ' order by Prod_Code   '
end   
end   
 
print (@sqlstr)  
exec(@sqlstr)  
END  



GO
/****** Object:  StoredProcedure [dbo].[sp_GEN_GetDeliveryChallan_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
     
        
        
       
        
CREATE  PROC [dbo].[sp_GEN_GetDeliveryChallan_Details]        
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
        
print (@sqlstr)        
exec(@sqlstr)        
END        
        
        
        
        





GO
/****** Object:  StoredProcedure [dbo].[sp_Gen_GetGatepassOUT_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_Gen_GetGatepassOUT_Details]  
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
   @Filter_Data = ''  
  And @GatepassOut_No   <> ''  
 )  
BEGIN  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.GatePass_OUT_No,a.GatePass_OUT_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.Issued_Company,a.Recd_Company,a.Delivered_By,b.Return_Type,a.Total_Items,a.Remarks'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code,b.UOM_Code,b.No_Of_Qty'  
select @sqlstr = @sqlstr + ',a.Modified_Date as [Modified_Date],a.Modified_By,a.Created_Date,a.Created_By'  
  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_GatepassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_GatepassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code = b.Fin_Year_Code And a.GatePass_OUT_No=b.GatePass_OUT_No '  
select @sqlstr = @sqlstr + ' And a.GatePass_OUT_Date=b.GatePass_OUT_Date'  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.GatePass_OUT_No='    + '''' + @GatepassOut_No    + ''''  

--Select @sqlstr = @sqlstr + 'and a.Authorize like '	+ ''''  + @Filter_Data  		+ ''''   



--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
select @sqlstr = @sqlstr + ' Order by b.SNo'  
  
END  
  
ELSE IF @Filter_Data <> ''  
BEGIN  
select @sqlstr = 'Select  Comp_Code,Location_Code,Fin_Year_Code,GatePass_OUT_No,GatePass_OUT_Date,DC_No,DC_Date'  
select @sqlstr = @sqlstr + ',Issued_Company,Recd_Company,Delivered_By,Total_Items,Remarks'  
select @sqlstr = @sqlstr + ',Authorize as [Authorize]'  
select @sqlstr = @sqlstr + ',Modified_Date as [Modified_Date],Modified_By,Created_Date,Created_By'  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_GatepassOUT_Main  '  
select @sqlstr = @sqlstr + ' Where Comp_Code='   + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And Location_Code='   + '''' + @Location_Code  + ''''  
select @sqlstr = @sqlstr + ' And Fin_Year_Code='   + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And Delete_Mode=0'  
  
select @sqlstr = @sqlstr + ' Order by Created_Date desc'  
END  
  
print (@sqlstr)  
exec(@sqlstr)  
END  



GO
/****** Object:  StoredProcedure [dbo].[sp_GEN_GetMaterialOUTNOTReturn_Details]    Script Date: 25/04/2023 16:39:56 ******/
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
select @sqlstr = @sqlstr + ' ,a.Total_Items,A.Total_Netwt,a.Remarks'   
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
select @sqlstr = @sqlstr + ',From_Company,To_Company,Delivered_By,Total_Items,Remarks'  
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
select @sqlstr = @sqlstr + ' ,a.Total_Items,A.Total_Netwt,a.Remarks'   
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
select @sqlstr = @sqlstr + ' ,a.Total_Items,A.Total_Netwt,a.Remarks'   
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
/****** Object:  StoredProcedure [dbo].[sp_GEN_GetMaterialpass_Report]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================  
-- Author  : krk  
-- Create date :24-05-2022 
-- Description : Get SGatepass Transaction  Details)  
-- ===============================================================  
-- Grant Execute On [sp_GetGatepassTrans_Details] To Public  
-- select * from GEN_MaterialpassOUT_Line  
-- select * from GEN_MaterialpassOUT_Main  
-- select * from GEN_MaterialpassIN_Line  
-- exec [sp_GEN_GetMaterialpass_Report] '100','THENI','1','','ALL','','','','2022-04-01','2022-05-30','','Monthly_checkList'  
-- exec [sp_GEN_GetMaterialpass_Report] '100','THENI','1','','ALL','','','','2022-04-01','2022-05-30','','Monthly_ReturnList'  
-- exec [sp_GEN_GetMaterialpass_Report] '100','THENI','1','','ALL','','','','2022-04-01','2022-05-30','','Return'  
-- exec [sp_GEN_GetMaterialpass_Report] '100','THENI','1','','ALL','','','','2022-04-01','2022-05-30','','NOT-Return'  
-- exec [sp_GEN_GetMaterialpass_Report] '100','THENI','1','','ALL','','','','2022-04-01','2022-05-30','','VehiclepassIN'  
-- exec [sp_GEN_GetMaterialpass_Report] '100','THENI','1','','ALL','','','','2022-04-01','2022-05-30','','Gatepass Pending list'  


  
CREATE Proc [dbo].[sp_GEN_GetMaterialpass_Report]  
(  
@Comp_Code    Varchar(10),  
@Location_Code   Varchar(10),  
@Fin_Year_Code   Varchar(10),  
@Issued_Dept     Varchar(100),  
@fromcompany     Varchar(100),  
@tocompany     Varchar(100),  
@prodname     Varchar(100),  
@vehicleno     Varchar(100),  
@from_Date           varchar(50),  
@To_Date           varchar(50), 
@Filter     Varchar(100),  
 @Mode     Varchar(100)  
)   



as  
BEGIN  
set nocount on  
set dateformat ymd  
Declare @sqlstr varchar(8000)  
print @Comp_Code  
Declare @mLocation_Code Varchar(10)  
Set @mLocation_Code=''  

Declare @mdeptname Varchar(100)  
Set @mdeptname=''  
Declare @mfromcompany Varchar(100)  
Set @mfromcompany =''  
Declare @mtocompany Varchar(100)  
Set @mtocompany =''  
Declare @mproduct_code Varchar(100)  
Set @mproduct_code ='' 

Declare @mVehicleno Varchar(100)  
Set @mVehicleno =''  
Declare @mtype Varchar(100)  
Set @mtype =''  



 
  
IF LTRIM(RTRIM(@Location_Code))='ALL'  or LTRIM(RTRIM(@Location_Code ))=''  
BEGIN  
Set @mLocation_Code='%'  
END  
ELSE  
BEGIN  
Set @mLocation_Code=@Location_Code   
END  
  
IF LTRIM(RTRIM(@Issued_Dept))='ALL' or LTRIM(RTRIM(@Issued_Dept ))=''  
BEGIN  
Set @mdeptname ='%'  
END  
ELSE  
BEGIN  
Set @mdeptname=@Issued_Dept  
END  
  
IF LTRIM(RTRIM(@fromcompany  ))='ALL' or LTRIM(RTRIM(@fromcompany ))=''  
BEGIN  
Set @mfromcompany  ='%'  
END  
ELSE  
BEGIN  
Set @mfromcompany=@fromcompany  
END  
  
IF LTRIM(RTRIM(@tocompany  ))='ALL' or LTRIM(RTRIM(@tocompany ))=''  
BEGIN  
Set @mtocompany   ='%'  
END  
ELSE  
BEGIN  
Set @mtocompany=@tocompany   
END  



IF LTRIM(RTRIM(@prodname  ))='ALL' or LTRIM(RTRIM(@prodname ))=''  
BEGIN  
Set @mproduct_code  ='%'  
END  
ELSE  
BEGIN  
Set @mproduct_code=@prodname  
END  
  
IF LTRIM(RTRIM(@vehicleno  ))='ALL' or LTRIM(RTRIM(@vehicleno ))=''  
BEGIN  
Set @mVehicleno   ='%'  
END  
ELSE  
BEGIN  
Set @mVehicleno=@vehicleno   
END  



  
IF   
 (   
  ltrim(rtrim(@mode))= 'Monthly_checkList'   
    
  )  
  
BEGIN  
  
  
select @sqlstr = 'select a.Gpass_No as GatepassOUT_No,a.Gpass_Date as GatepassOUT_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ' , a.Ref_Inv_No as Ref_Inv_No,a.Ref_Inv_Date as Ref_Inv_Date '  
select @sqlstr = @sqlstr + ' , a.Department AS Department '  
select @sqlstr = @sqlstr + ' , a.Vehicle_no AS Vehicle_no ,A.Delivery_Location'  

select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as To_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Product_Desc,b.UOM_Code as UOM_Code,b.No_Of_Qty as Send_Qty'  
select @sqlstr = @sqlstr + ',b.Net_wt'  

select @sqlstr = @sqlstr + ',isnull(sum(C.No_Of_Qty),''0'') as All_Recd_Qty'  
select @sqlstr = @sqlstr + ',isnull(b.IS_Closed ,''0'') as IS_Closed'  
 select @sqlstr = @sqlstr + ', a.Comp_Code,a.Location_Code,a.Fin_Year_Code '
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialpassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + '  And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
select @sqlstr = @sqlstr + '  And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
Select @sqlstr = @sqlstr + 'and a.To_Company like ' + ''''  + @mtocompany   + ''''       
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mfromcompany    + ''''      
Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + ''''       
Select @sqlstr = @sqlstr + 'and a.department like ' + ''''  + @mdeptname    + ''''     
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.Gpass_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_Date <='+ '''' + @To_Date+ ''''  
   
   
select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date '
select @sqlstr = @sqlstr + ' , a.Ref_Inv_No ,a.Ref_Inv_Date  '  
select @sqlstr = @sqlstr + ' , a.Department  '  

select @sqlstr = @sqlstr + ' ,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty,b.IS_Closed'  
  select @sqlstr = @sqlstr + ' , a.Vehicle_no  ,A.Delivery_Location'  
select @sqlstr = @sqlstr + ',b.Net_wt'  
end   
end   
  
  
else IF   
 (   
  ltrim(rtrim(@mode))= 'Monthly_ReturnList'   
    
  )  
  
BEGIN  
  
  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as Gpass_No ,a.Gpass_Date as Gpass_Date ,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as To_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Prod_Code ,b.UOM_Code as UOM_Code,b.No_Of_Qty as No_Of_Qty'  
--select @sqlstr = @sqlstr + ',isnull(sum(C.No_Of_Qty),''0'') as Gin_No_Of_Qty'  
select @sqlstr = @sqlstr + ',isnull((C.No_Of_Qty),''0'') as Gin_No_Of_Qty'  
  
select @sqlstr = @sqlstr + ',isnull(b.IS_Closed ,''0'') as IS_Closed,c.GatePass_IN_No as GatePass_IN_No  ,c.GatePass_IN_Date as GatePass_IN_Date   '  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialpassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' left Join DB_General..GEN_MaterialpassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + ' And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
  
select @sqlstr = @sqlstr + ' Right Join DB_General..GEN_MaterialpassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
select @sqlstr = @sqlstr + '  And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
Select @sqlstr = @sqlstr + 'and a.To_Company like ' + ''''  + @mtocompany   + ''''       
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mfromcompany    + ''''      
Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + ''''       
   
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.Gpass_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_Date <='+ '''' + @To_Date+ ''''  
   
   
select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty,C.No_Of_Qty,b.IS_Closed,c.GatePass_IN_No ,c.GatePass_IN_Date '  
select @sqlstr = @sqlstr + ' Order by c.GatePass_IN_No ,c.GatePass_IN_Date '  
  
end   
end   
  
  
else IF   
 (   
  ltrim(rtrim(@mode))= 'RETURNABLE'   
    
  )  
  
BEGIN  
  
  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as Gpass_No,a.Gpass_Date as Gpass_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as To_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Prod_Code,b.UOM_Code as UOM_Code,b.No_Of_Qty as No_Of_Qty'  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialpassOUT_Main a'  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code = b.Fin_Year_Code And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
Select @sqlstr = @sqlstr + 'and a.To_Company like ' + ''''  + @mtocompany   + ''''       
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mfromcompany    + ''''      
Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + ''''       
Select @sqlstr = @sqlstr + 'and b.Return_Type=' + '''' + 'RETURNABLE' + ''''  
  
   
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.Gpass_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_Date <='+ '''' + @To_Date+ ''''  
 select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty,b.IS_Closed '  
  
end   
end   
  
  
else IF   
 (   
  ltrim(rtrim(@mode))= 'NOT-Return'   
    
  )  
  
BEGIN  
  
  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as Gpass_No,a.Gpass_Date as Gpass_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as To_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Prod_Code,b.UOM_Code as UOM_Code,b.No_Of_Qty as No_Of_Qty' 
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialpassOUT_Main a'  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code = b.Fin_Year_Code And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
Select @sqlstr = @sqlstr + 'and a.To_Company like ' + ''''  + @mtocompany   + ''''       
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mfromcompany    + ''''      
Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + ''''       
 Select @sqlstr = @sqlstr + 'and b.Return_Type=' + '''' + 'NOT RETURN' + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.Gpass_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_Date <='+ '''' + @To_Date+ ''''  
 select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty,b.IS_Closed '  
  
end   
end   
  
  
else IF   
 (   
  ltrim(rtrim(@mode))= 'VehiclepassIN'   
    
  )  
  
BEGIN  
  
  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.GatePass_IN_No as Gpass_No ,a.GatePass_IN_Date as Gpass_Date'  
select @sqlstr = @sqlstr + ',a.From_Company as To_Company,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Prod_Code,b.UOM_Code as UOM_Code,b.No_Of_Qty as No_Of_Qty'  
select @sqlstr = @sqlstr + ',c.From_Company ,c.Delivered_By'  
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialpassIN_Main a'  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassIN_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code = b.Fin_Year_Code And a.GatePass_IN_No=b.GatePass_IN_No '  
select @sqlstr = @sqlstr + ' And a.GatePass_IN_Date=b.GatePass_IN_Date'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassOUT_Main c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
--select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mtocompany   + ''''       
Select @sqlstr = @sqlstr + 'and c.From_Company like ' + ''''  + @mfromcompany    + ''''      
Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + ''''       
 --Select @sqlstr = @sqlstr + 'and b.Return_Type=' + '''' + 'RETURN' + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.GatePass_IN_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.GatePass_IN_Date <='+ '''' + @To_Date+ ''''  
 select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.GatePass_IN_No ,a.GatePass_IN_Date ,a.From_Company,c.From_Company ,c.Delivered_By,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty '  
  
end   
end   

else IF   
 (   
  ltrim(rtrim(@mode))= 'Gatepass Pending list'   
    
  )  
  
BEGIN  
  
  select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as Gpass_No,a.Gpass_Date as GatepassOUT_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as To_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Product_Desc,b.UOM_Code as UOM_Code,b.No_Of_Qty as Send_Qty'  
select @sqlstr = @sqlstr + ',isnull(sum(C.No_Of_Qty),''0'') as All_Recd_Qty '  
select @sqlstr = @sqlstr + ',(b.No_Of_Qty-isnull(sum(C.No_Of_Qty),''0'')) as Pending_Qty '  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialpassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + '  And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
  
select @sqlstr = @sqlstr + '  And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
Select @sqlstr = @sqlstr + 'and a.To_Company like ' + ''''  + @mtocompany   + ''''       
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mfromcompany    + ''''       
select @sqlstr = @sqlstr + ' And b.Return_Type='      + '''' + 'RETURNABLE'  + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
--select @sqlstr = @sqlstr + ' And a.Gpass_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_Date <='+ '''' + @To_Date+ ''''  
  
select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty'  
  
end  
end


else IF   
 (   
  ltrim(rtrim(@mode))= 'Material Gatepass'   
    
  )  
  
BEGIN  
  
  
select @sqlstr = 'select a.Location_Code,a.Gpass_No as GatepassOUT_No,a.Gpass_Date as GatepassOUT_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ' , a.Ref_Inv_No as Ref_Inv_No,a.Ref_Inv_Date as Ref_Inv_Date '  
select @sqlstr = @sqlstr + ' , a.Department AS Department '  
select @sqlstr = @sqlstr + ' , a.Vehicle_no AS Vehicle_no ,A.Delivery_Location'  

select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as To_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Product_Desc,b.UOM_Code as UOM_Code,b.No_Of_Qty as Send_Qty'  
select @sqlstr = @sqlstr + ',b.Net_wt'  

select @sqlstr = @sqlstr + ',isnull(sum(C.No_Of_Qty),''0'') as All_Recd_Qty'  
select @sqlstr = @sqlstr + ',isnull(b.IS_Closed ,''0'') as IS_Closed'  

select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialpassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + '  And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
select @sqlstr = @sqlstr + '  And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
Select @sqlstr = @sqlstr + 'and a.Location_Code like ' + ''''  + @mLocation_Code   + ''''       
 
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
Select @sqlstr = @sqlstr + 'and a.To_Company like ' + ''''  + @mtocompany   + ''''       
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mfromcompany    + ''''      
Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + ''''       
   
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.Gpass_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_Date <='+ '''' + @To_Date+ ''''  
   
   
select @sqlstr = @sqlstr + ' group by  a.Location_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date '
select @sqlstr = @sqlstr + ' , a.Ref_Inv_No ,a.Ref_Inv_Date  '  
select @sqlstr = @sqlstr + ' , a.Department  '  

select @sqlstr = @sqlstr + ' ,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty,b.IS_Closed'  
  select @sqlstr = @sqlstr + ' , a.Vehicle_no  ,A.Delivery_Location'  
select @sqlstr = @sqlstr + ',b.Net_wt'  
end   
end   

  
print (@sqlstr)  
exec(@sqlstr)  
END  



GO
/****** Object:  StoredProcedure [dbo].[sp_GEN_GetMaterialpassIN_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================  
-- Author  : krk  
-- Create date :24-05-2022 
-- Description : Get Gatepass IN transaction Details Weaving)  
-- ===============================================================  
-- Grant Execute On [sp_GEN_GetMaterialpassIN_Details] To Public  
-- select * from GEN_MaterialpassIN_Line  
-- select * from GEN_MaterialpassIN_Main  
-- exec [sp_GEN_GetMaterialpassIN_Details] '100','THENI','1','VGR/0002/22-23',''  
  
create Proc [dbo].[sp_GEN_GetMaterialpassIN_Details]  
(  
@Comp_Code    Varchar(10),  
@Location_Code   Varchar(10),  
@Fin_Year_Code   Varchar(10),  
@GatepassIN_No    Varchar(100),  
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
   @Filter_Data = ''  
  And @GatepassIN_No   <> ''  
 )  
BEGIN  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.GatePass_IN_No,a.GatePass_IN_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.Total_Items,a.Remarks'  
select @sqlstr = @sqlstr + ',b.Gpass_No,b.Gpass_Date,b.SNo,b.Prod_Code as  Product_Desc,b.UOM_Code'  
select @sqlstr = @sqlstr + ',isnull(b.No_Of_Qty,''0'')as All_Recd_Qty,isnull(C.No_Of_Qty,''0'') as Send_Qty'  
  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialpassIN_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassIN_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code = b.Fin_Year_Code And a.GatePass_IN_No=b.GatePass_IN_No '  
select @sqlstr = @sqlstr + ' And a.GatePass_IN_Date=b.GatePass_IN_Date'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassOUT_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
--select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code  '  
select @sqlstr = @sqlstr + ' And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.GatePass_IN_No='    + '''' + @GatepassIN_No    + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'  
END  
  
ELSE IF @Filter_Data <> ''  
BEGIN  
select @sqlstr = 'Select  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.GatePass_IN_No,a.GatePass_IN_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.Total_Items,a.Remarks'  
select @sqlstr = @sqlstr + ',Authorize as [Authorize]'  
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialpassIN_Main as a  '  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='   + '''' + @Location_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'  
select @sqlstr = @sqlstr + ' Order by a.Created_Date desc'  
END  
  
print (@sqlstr)  
exec(@sqlstr)  
END  

GO
/****** Object:  StoredProcedure [dbo].[sp_GEN_GetMaterialpassOUT_Details]    Script Date: 25/04/2023 16:39:56 ******/
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
-- select * from GEN_MaterialpassOUT_Line  
-- select * from GEN_MaterialpassOUT_Main  
---exec sp_GEN_GetMaterialpassOUT_Details '100','THENI','1','','ALL'
  
CREATE Proc [dbo].[sp_GEN_GetMaterialpassOUT_Details]  
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
select @sqlstr = @sqlstr + ' ,a.Total_Items,A.Total_Netwt,a.Remarks'   
select @sqlstr = @sqlstr + ' ,A.Ref_Inv_No,A.Ref_Inv_Date,A.Department,A.Vehicle_no,A.Delivery_Location  '

select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code,b.UOM_Code,b.No_Of_Qty,b.Net_wt'  
select @sqlstr = @sqlstr + ', a.Comp_Code,a.Location_Code,a.Fin_Year_Code'  
   
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialpassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassOUT_Line b'  
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


select @sqlstr = @sqlstr + ',From_Company,To_Company,Delivered_By,Total_Items,Remarks'  
select @sqlstr = @sqlstr + ' ,Ref_Inv_No,Ref_Inv_Date,Department,Vehicle_no,Delivery_Location  '
select @sqlstr = @sqlstr + ',Authorize as [Authorize]'  

  
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialpassOUT_Main  '  
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
select @sqlstr = @sqlstr + ' ,a.Total_Items,A.Total_Netwt,a.Remarks'   
select @sqlstr = @sqlstr + ' ,A.Ref_Inv_No,A.Ref_Inv_Date,A.Department,A.Vehicle_no,A.Delivery_Location  '

select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code,b.UOM_Code,b.No_Of_Qty,b.Net_wt'  
select @sqlstr = @sqlstr + ', a.Comp_Code,a.Location_Code,a.Fin_Year_Code'  
select @sqlstr = @sqlstr + ',a.Modified_Date as [Modified_Date],a.Modified_By,a.Created_Date,a.Created_By'  

   
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialpassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassOUT_Line b'  
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
select @sqlstr = @sqlstr + ' ,a.Total_Items,A.Total_Netwt,a.Remarks'   
select @sqlstr = @sqlstr + ' ,A.Ref_Inv_No,A.Ref_Inv_Date,A.Department,A.Vehicle_no,A.Delivery_Location  '

select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code,b.UOM_Code,b.No_Of_Qty,b.Net_wt'  
select @sqlstr = @sqlstr + ', a.Comp_Code,a.Location_Code,a.Fin_Year_Code'  
select @sqlstr = @sqlstr + ',a.Modified_Date as [Modified_Date],a.Modified_By,a.Created_Date,a.Created_By'  

   
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialpassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassOUT_Line b'  
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
/****** Object:  StoredProcedure [dbo].[sp_GEN_GetMaterialpassTrans_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================  
-- Author  : Rajkumar  
-- Create date : 28/05/2022  
-- Description : Get SGatepass Transaction  Details)  
-- ===============================================================  
-- Grant Execute On [sp_GetGatepassTrans_Details] To Public  
-- select * from GEN_MaterialpassOUT_Line  
-- select * from GEN_MaterialpassOUT_Main  
-- select * from GEN_MaterialpassIN_Line  
-- exec [sp_GEN_GetMaterialpassTrans_Details] '100','theni','1','','ASHVADHIYA MOTORS, THENI.',''  
---exec [sp_GEN_GetMaterialpassTrans_Details] '100','theni','1','','Green Pearal Electronics Pvt Ltd,Kattankulathur',''  
  
CREATE Proc [dbo].[sp_GEN_GetMaterialpassTrans_Details]  
(  
@Comp_Code    Varchar(10),  
@Location_Code   Varchar(10),  
@Fin_Year_Code   Varchar(10),  
@Trans_No     Varchar(100),  
@From_Company     Varchar(100),  
@Filter_Data   Varchar(30)  
)  
as  
BEGIN  
set nocount on  
set dateformat ymd  
Declare @sqlstr varchar(8000)  
  
IF   
 (  
   @Filter_Data = ''  
   And @From_Company =''  
  And @Trans_No   <> ''  
 )  
BEGIN  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as GatepassOUT_No,a.Gpass_Date as GatepassOUT_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as From_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Product_Desc,b.UOM_Code as UOM_Code,b.No_Of_Qty as Send_Qty'  
select @sqlstr = @sqlstr + ',isnull(sum(C.No_Of_Qty),''0'') as All_Recd_Qty '  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialpassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code = b.Fin_Year_Code '  
select @sqlstr = @sqlstr + '  And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
--select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code '  
select @sqlstr = @sqlstr + '  And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_No='    + '''' + @Trans_No    + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,a.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty'  
END  
  
  
  
ELSE IF   
 (  
   @Filter_Data = ''  
  And @Trans_No   = ''  
   And @From_Company <>''  
    
 )  
BEGIN  
select @sqlstr = 'selecT a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as GatepassOUT_No,a.Gpass_Date as GatepassOUT_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as From_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Product_Desc,b.UOM_Code as UOM_Code,b.No_Of_Qty as Send_Qty'  
select @sqlstr = @sqlstr + ',isnull(sum(C.No_Of_Qty),''0'') as All_Recd_Qty '  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialpassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
--select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code '  
select @sqlstr = @sqlstr + '  And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
--select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code '  
select @sqlstr = @sqlstr + ' And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
--select @sqlstr = @sqlstr + ' And b.No_Of_Qty<> C.No_Of_Qty'  
  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.To_Company='    + '''' + @From_Company    + ''''  
select @sqlstr = @sqlstr + ' And b.Return_Type ='+ '''' + 'RETURNABLE' + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'  
select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty'  
END  
  
  
ELSE IF   
 (  
   @Filter_Data = ''  
  And @Trans_No   <> ''  
   And @From_Company <>''  
    
 )  
BEGIN  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as GatepassOUT_No,a.Gpass_Date as GatepassOUT_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as From_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Product_Desc,b.UOM_Code as UOM_Code,b.No_Of_Qty as Send_Qty'  
select @sqlstr = @sqlstr + ',isnull(sum(C.No_Of_Qty),''0'') as All_Recd_Qty '  
  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialpassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
--select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code '  
select @sqlstr = @sqlstr + ' And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
--select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code '  
select @sqlstr = @sqlstr + '  And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_No='    + '''' + @Trans_No    + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'  
select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,a.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty '  
  
END  
  
  
  
ELSE IF @Filter_Data <> ''  
BEGIN  
  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as GatepassOUT_No,a.Gpass_Date as GatepassOUT_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as From_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Product_Desc,b.UOM_Code as UOM_Code,b.No_Of_Qty as Send_Qty'  
select @sqlstr = @sqlstr + ',isnull(C.No_Of_Qty,''0'')  as All_Recd_Qty '  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_MaterialpassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
--select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code '  
select @sqlstr = @sqlstr + 'And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_MaterialpassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code '  
select @sqlstr = @sqlstr + ' And b.Gpass_No=c.Gpass_No '  
  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'  
select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
select @sqlstr = @sqlstr + ' Order by a.Gpass_Date'  
END  
  
print (@sqlstr)  
exec(@sqlstr)  
END  

GO
/****** Object:  StoredProcedure [dbo].[sp_Gen_GetParty_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author		:	KRK
-- Create date	:	09/05/2022

-- Description	:	Get Gatepass party Details
-- =============================================
-- Grant Execute On [[sp_GetGPparty_Details]] To Public
-- Execute [sp_GetGPparty_Details] 'LS MILLS','','',''
--exec [sp_GetGPparty_Details] 'LS MILLS','','','''

CREATE Proc [dbo].[sp_Gen_GetParty_Details]

(
@Comp_Code				Varchar(10),
@Party_Name					Varchar(100),
@Filter_Data			Varchar(30)
)
as
BEGIN
set nocount on
set dateformat ymd
Declare @sqlstr varchar(8000)

IF 
	(
			@Filter_Data	= 'ALL'
		--And @Party_Name 			<> ''
	)
BEGIN

select @sqlstr = 'select Party_Code,Sender_Recvr_Name,Type'
select @sqlstr = @sqlstr + ''
select @sqlstr = @sqlstr + ' from DB_General..GEN_Party_Master '
select @sqlstr = @sqlstr + ' Where Comp_Code='		+ '''' + @Comp_Code			+ ''''
select @sqlstr = @sqlstr + ' Order by Sender_Recvr_Name'

END

ELSE IF @Filter_Data = 'Sender'
BEGIN
select @sqlstr = 'Select Comp_Code,Party_Code,Sender_Recvr_Name,Type'
select @sqlstr = @sqlstr + ' ,Created_By,Created_Date,Modified_By,Modified_Date'
select @sqlstr = @sqlstr + ' from GEN_Party_Master'
select @sqlstr = @sqlstr + ' Where Comp_Code='			+ '''' + @Comp_Code			+ ''''
select @sqlstr = @sqlstr + ' and Type='+ '''' + 'Sender' + ''''

select @sqlstr = @sqlstr + ' Order by Sender_Recvr_Name'
END

print (@sqlstr)
exec(@sqlstr)
END




GO
/****** Object:  StoredProcedure [dbo].[sp_GEN_GetVehicleExpenses_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================        
-- Author		:	KRK
-- Create date	:	01/08/2022
-- Modified date	:	01/08/2022
-- Description : Get Vehicle Expense Detail Details       
-- =====================================================================        
-- Grant Execute On sp_GEN_VehicleExpenses_Details To Public        
 
-- exec [sp_GEN_VehicleExpenses_Details] '100','THENI','1','','0','','ALL'     
-- exec [sp_GEN_VehicleExpenses_Details] '100','THENI','1','DC/0002122-23','','','SPECIFY'     
 
-- exec [sp_GEN_VehicleExpenses_Details] '100','THENI','1','DC/0002122-23','','','Delivery_Challan'        
       
CREATE  PROC [dbo].[sp_GEN_GetVehicleExpenses_Details]        
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

select @sqlstr = @sqlstr + ' a.Entry_No,a.Entry_Date  ,A.Expense_Type  '
select @sqlstr = @sqlstr + ' ,a.Vehicle_no,a.Bill_From    '
select @sqlstr = @sqlstr + ' ,a.Ref_Inv_No,a.Ref_Inv_Date,a.Total_Invoice_Value    '
select @sqlstr = @sqlstr + ',a.Remarks   '

 select @sqlstr = @sqlstr + ' ,a.Comp_Code,a.Location_Code,a.Fin_Year_Code   '
select @sqlstr = @sqlstr + ' 	FROM GEN_VehicleExpenses_Main as a '
select @sqlstr = @sqlstr + ' left join GEN_VehicleExpenses_Line as b on b.Entry_No=a.Entry_No and b.Entry_Date =a.Entry_Date  ' 
 
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='   + '''' + @Location_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
        
		
select @sqlstr = @sqlstr + ' group by    '
select @sqlstr = @sqlstr + ' a.Entry_No,a.Entry_Date   ,A.Expense_Type '
select @sqlstr = @sqlstr + ' ,a.Vehicle_no ,a.Bill_From   '
select @sqlstr = @sqlstr + ' ,a.Ref_Inv_No,a.Ref_Inv_Date,a.Total_Invoice_Value    '
select @sqlstr = @sqlstr + ',a.Remarks   '
 
select @sqlstr = @sqlstr + ' ,a.Comp_Code,a.Location_Code,a.Fin_Year_Code    '
select @sqlstr = @sqlstr + ' Order by  a.Entry_Date desc, a.Entry_No'        
END    

          
              
else IF               
(               
             
 ltrim(rtrim(@Authorize))= '0'               
and ltrim(rtrim(@Filter_Data))='ALL'       
)              
BEGIN   
       
select @sqlstr= 'Select '   

select @sqlstr = @sqlstr + ' a.Entry_No,a.Entry_Date   ,A.Expense_Type '
select @sqlstr = @sqlstr + ' ,a.Vehicle_no,a.Bill_From    '
select @sqlstr = @sqlstr + ' ,a.Ref_Inv_No,a.Ref_Inv_Date,a.Total_Invoice_Value    '
select @sqlstr = @sqlstr + ',a.Remarks   '

 select @sqlstr = @sqlstr + ' ,a.Comp_Code,a.Location_Code,a.Fin_Year_Code   '
select @sqlstr = @sqlstr + ' 	FROM GEN_VehicleExpenses_Main as a '
select @sqlstr = @sqlstr + ' left join GEN_VehicleExpenses_Line as b on b.Entry_No=a.Entry_No and b.Entry_Date =a.Entry_Date  ' 
 
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='   + '''' + @Location_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
             select @sqlstr = @sqlstr + ' And a.Authorize=0'   
		
select @sqlstr = @sqlstr + ' group by     '
select @sqlstr = @sqlstr + ' a.Entry_No,a.Entry_Date ,A.Expense_Type   '
select @sqlstr = @sqlstr + ' ,a.Vehicle_no ,a.Bill_From   '
select @sqlstr = @sqlstr + ' ,a.Ref_Inv_No,a.Ref_Inv_Date,a.Total_Invoice_Value    '
select @sqlstr = @sqlstr + ',a.Remarks   '
 
select @sqlstr = @sqlstr + ' ,a.Comp_Code,a.Location_Code,a.Fin_Year_Code    '
select @sqlstr = @sqlstr + ' Order by  a.Entry_Date desc, a.Entry_No' 
 

END    
         
ELSE IF         
(        
ltrim(rtrim(@Entry_No)) <>''        
        
and LTRIM(rtrim(@Filter_Data))='SPECIFY'        
        
)        
BEGIN        
        
select @sqlstr= 'Select '    
     
select @sqlstr = @sqlstr + ' a.Entry_No,a.Entry_Date  ,A.Expense_Type  '
select @sqlstr = @sqlstr + ' ,a.Vehicle_no,a.Bill_From    '
select @sqlstr = @sqlstr + ' ,a.Ref_Inv_No,a.Ref_Inv_Date,a.Total_Invoice_Value    '
select @sqlstr = @sqlstr + ',a.Remarks   '
select @sqlstr = @sqlstr + ' ,B.SNo,b.Description,B.Qty,b.Invoice_Value ,b.Others_Desc   '


 select @sqlstr = @sqlstr + ' 	FROM GEN_VehicleExpenses_Main as a '
select @sqlstr = @sqlstr + ' left join GEN_VehicleExpenses_Line as b on b.Entry_No=a.Entry_No and b.Entry_Date =a.Entry_Date  ' 
    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + '''' 
select @sqlstr = @sqlstr + ' And a.Entry_No='   + '''' + @Entry_No  + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
        
select @sqlstr = @sqlstr + ' Order by a.Created_Date, a.Entry_Date desc '        
        
        
        
END        
         
        
print (@sqlstr)        
exec(@sqlstr)        
END        
        
        
        
        







GO
/****** Object:  StoredProcedure [dbo].[sp_GEN_GetVehiclepass_Report]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================  
-- Author  : krk  
-- Create date :24-05-2022 
-- Description : Get SGatepass Transaction  Details)  
-- ===============================================================  
-- Grant Execute On [sp_GetGatepassTrans_Details] To Public  
-- select * from GEN_VehiclepassOUT_Line  
-- select * from GEN_VehiclepassOUT_Main  
-- select * from GEN_VehiclepassIN_Line  
-- exec [sp_GEN_GetVehiclepass_Report] '100','THENI','1','','ALL','','','','2022-04-01','2022-05-30','','Monthly_checkList'  
-- exec [sp_GEN_GetVehiclepass_Report] '100','THENI','1','','ALL','','','','2022-04-01','2022-05-30','','Monthly_ReturnList'  
-- exec [sp_GEN_GetVehiclepass_Report] '100','THENI','1','','ALL','','','','2022-04-01','2022-05-30','','Return'  
-- exec [sp_GEN_GetVehiclepass_Report] '100','THENI','1','','ALL','','','','2022-04-01','2022-05-30','','NOT-Return'  
-- exec [sp_GEN_GetVehiclepass_Report] '100','THENI','1','','ALL','','','','2022-04-01','2022-05-30','','VehiclepassIN'  
-- exec [sp_GEN_GetVehiclepass_Report] '100','THENI','1','','ALL','','','','2022-04-01','2022-05-30','','Gatepass Pending list'  

-- exec [sp_GEN_GetVehiclepass_Report] '100','MAIN UNIT','1','','ALL','','','','2022-06-01','2022-06-30','','Vehicle Utilisation Report'  


  
CREATE Proc [dbo].[sp_GEN_GetVehiclepass_Report]  
(  
@Comp_Code    Varchar(10),  
@Location_Code   Varchar(10),  
@Fin_Year_Code   Varchar(10),  
@Issued_Dept     Varchar(100),  
@fromcompany     Varchar(100),  
@tocompany     Varchar(100),  
@prodname     Varchar(100),  
@vehicleno     Varchar(100),  
@from_Date           varchar(50),  
@To_Date           varchar(50), 
@Filter     Varchar(100),  
 @Mode     Varchar(100)  
)   



as  
BEGIN  
set nocount on  
set dateformat ymd  
Declare @sqlstr varchar(8000)  
print @Comp_Code  
Declare @mLocation_Code Varchar(10)  
Set @mLocation_Code=''  

Declare @mdeptname Varchar(100)  
Set @mdeptname=''  
Declare @mfromcompany Varchar(100)  
Set @mfromcompany =''  
Declare @mtocompany Varchar(100)  
Set @mtocompany =''  
Declare @mproduct_code Varchar(100)  
Set @mproduct_code ='' 

Declare @mVehicleno Varchar(100)  
Set @mVehicleno =''  
Declare @mtype Varchar(100)  
Set @mtype =''  



 
  
IF LTRIM(RTRIM(@Location_Code))='ALL'  or LTRIM(RTRIM(@Location_Code ))=''  
BEGIN  
Set @mLocation_Code='%'  
END  
ELSE  
BEGIN  
Set @mLocation_Code=@Location_Code   
END  
  
IF LTRIM(RTRIM(@Issued_Dept))='ALL' or LTRIM(RTRIM(@Issued_Dept ))=''  
BEGIN  
Set @mdeptname ='%'  
END  
ELSE  
BEGIN  
Set @mdeptname=@Issued_Dept  
END  
  
IF LTRIM(RTRIM(@fromcompany  ))='ALL' or LTRIM(RTRIM(@fromcompany ))=''  
BEGIN  
Set @mfromcompany  ='%'  
END  
ELSE  
BEGIN  
Set @mfromcompany=@fromcompany  
END  
  
IF LTRIM(RTRIM(@tocompany  ))='ALL' or LTRIM(RTRIM(@tocompany ))=''  
BEGIN  
Set @mtocompany   ='%'  
END  
ELSE  
BEGIN  
Set @mtocompany=@tocompany   
END  



IF LTRIM(RTRIM(@prodname  ))='ALL' or LTRIM(RTRIM(@prodname ))=''  
BEGIN  
Set @mproduct_code  ='%'  
END  
ELSE  
BEGIN  
Set @mproduct_code=@prodname  
END  
  
IF LTRIM(RTRIM(@vehicleno  ))='ALL' or LTRIM(RTRIM(@vehicleno ))=''  
BEGIN  
Set @mVehicleno   ='%'  
END  
ELSE  
BEGIN  
Set @mVehicleno=@vehicleno   
END  



  
IF   
 (   
  ltrim(rtrim(@mode))= 'Monthly_checkList'   
    
  )  
  
BEGIN  
  
  
select @sqlstr = 'select a.Gpass_No as GatepassOUT_No,a.Gpass_Date as GatepassOUT_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ' , a.Ref_Inv_No as Ref_Inv_No,a.Ref_Inv_Date as Ref_Inv_Date '  
select @sqlstr = @sqlstr + ' , a.Department AS Department '  
select @sqlstr = @sqlstr + ' , a.Vehicle_no AS Vehicle_no ,A.Delivery_Location'  

select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as To_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Product_Desc,b.UOM_Code as UOM_Code,b.No_Of_Qty as Send_Qty'  
select @sqlstr = @sqlstr + ',b.Net_wt'  

select @sqlstr = @sqlstr + ',isnull(sum(C.No_Of_Qty),''0'') as All_Recd_Qty'  
select @sqlstr = @sqlstr + ',isnull(b.IS_Closed ,''0'') as IS_Closed'  
 select @sqlstr = @sqlstr + ', a.Comp_Code,a.Location_Code,a.Fin_Year_Code '
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + '  And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
select @sqlstr = @sqlstr + '  And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.department Like '  + '''' + @mdeptname  + '''' 
Select @sqlstr = @sqlstr + 'and a.To_Company like ' + ''''  + @mtocompany   + ''''       
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mfromcompany    + ''''      
Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + ''''       
   
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.Gpass_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_Date <='+ '''' + @To_Date+ ''''  
   
   
select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date '
select @sqlstr = @sqlstr + ' , a.Ref_Inv_No ,a.Ref_Inv_Date  '  
select @sqlstr = @sqlstr + ' , a.Department  '  

select @sqlstr = @sqlstr + ' ,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty,b.IS_Closed'  
  select @sqlstr = @sqlstr + ' , a.Vehicle_no  ,A.Delivery_Location'  
select @sqlstr = @sqlstr + ',b.Net_wt'  
end   
end   
  
  
else IF   
 (   
  ltrim(rtrim(@mode))= 'Monthly_ReturnList'   
    
  )  
  
BEGIN  
  
  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as Gpass_No ,a.Gpass_Date as Gpass_Date ,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as To_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Prod_Code ,b.UOM_Code as UOM_Code,b.No_Of_Qty as No_Of_Qty'  
--select @sqlstr = @sqlstr + ',isnull(sum(C.No_Of_Qty),''0'') as Gin_No_Of_Qty'  
select @sqlstr = @sqlstr + ',isnull((C.No_Of_Qty),''0'') as Gin_No_Of_Qty'  
  
select @sqlstr = @sqlstr + ',isnull(b.IS_Closed ,''0'') as IS_Closed,c.GatePass_IN_No as GatePass_IN_No  ,c.GatePass_IN_Date as GatePass_IN_Date   '  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' left Join DB_General..GEN_VehiclepassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + ' And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
  
select @sqlstr = @sqlstr + ' Right Join DB_General..GEN_VehiclepassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
select @sqlstr = @sqlstr + '  And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.department Like '  + '''' + @mdeptname  + '''' 
Select @sqlstr = @sqlstr + 'and a.To_Company like ' + ''''  + @mtocompany   + ''''       
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mfromcompany    + ''''      
Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + ''''       
   
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.Gpass_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_Date <='+ '''' + @To_Date+ ''''  
   
   
select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty,C.No_Of_Qty,b.IS_Closed,c.GatePass_IN_No ,c.GatePass_IN_Date '  
select @sqlstr = @sqlstr + ' Order by c.GatePass_IN_No ,c.GatePass_IN_Date '  
  
end   
end   
  
  
else IF   
 (   
  ltrim(rtrim(@mode))= 'Return'   
    
  )  
  
BEGIN  
  
  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as Gpass_No,a.Gpass_Date as Gpass_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as To_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Prod_Code,b.UOM_Code as UOM_Code,b.No_Of_Qty as No_Of_Qty'  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code = b.Fin_Year_Code And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.department Like '  + '''' + @mdeptname  + '''' 
Select @sqlstr = @sqlstr + 'and a.To_Company like ' + ''''  + @mtocompany   + ''''       
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mfromcompany    + ''''      
Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + ''''       
Select @sqlstr = @sqlstr + 'and b.Return_Type=' + '''' + 'RETURN' + ''''  
  
   
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.Gpass_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_Date <='+ '''' + @To_Date+ ''''  
 select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty,b.IS_Closed '  
  
end   
end   
  
  
else IF   
 (   
  ltrim(rtrim(@mode))= 'NOT-Return'   
    
  )  
  
BEGIN  
  
  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as Gpass_No,a.Gpass_Date as Gpass_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as To_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Prod_Code,b.UOM_Code as UOM_Code,b.No_Of_Qty as No_Of_Qty'  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code = b.Fin_Year_Code And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.department Like '  + '''' + @mdeptname  + '''' 
Select @sqlstr = @sqlstr + 'and a.To_Company like ' + ''''  + @mtocompany   + ''''       
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mfromcompany    + ''''      
Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + ''''       
 Select @sqlstr = @sqlstr + 'and b.Return_Type=' + '''' + 'NOT RETURN' + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.Gpass_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_Date <='+ '''' + @To_Date+ ''''  
 select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty,b.IS_Closed '  
  
end   
end   
  
  
else IF   
 (   
  ltrim(rtrim(@mode))= 'VehiclepassIN'   
    
  )  
  
BEGIN  
  
  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.GatePass_IN_No as Gpass_No ,a.GatePass_IN_Date as Gpass_Date'  
select @sqlstr = @sqlstr + ',a.From_Company as To_Company,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Prod_Code,b.UOM_Code as UOM_Code,b.No_Of_Qty as No_Of_Qty'  
select @sqlstr = @sqlstr + ',c.From_Company ,c.Delivered_By'  
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassIN_Main a'  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassIN_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code = b.Fin_Year_Code And a.GatePass_IN_No=b.GatePass_IN_No '  
select @sqlstr = @sqlstr + ' And a.GatePass_IN_Date=b.GatePass_IN_Date'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Main c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
--select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mtocompany   + ''''       
Select @sqlstr = @sqlstr + 'and c.From_Company like ' + ''''  + @mfromcompany    + ''''      
Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + ''''       
 --Select @sqlstr = @sqlstr + 'and b.Return_Type=' + '''' + 'RETURN' + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.GatePass_IN_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.GatePass_IN_Date <='+ '''' + @To_Date+ ''''  
 select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.GatePass_IN_No ,a.GatePass_IN_Date ,a.From_Company,c.From_Company ,c.Delivered_By,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty '  
  
end   
end   

else IF   
 (   
  ltrim(rtrim(@mode))= 'Gatepass Pending list'   
    
  )  
  
BEGIN  
  
  select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as Gpass_No,a.Gpass_Date as GatepassOUT_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as To_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Product_Desc,b.UOM_Code as UOM_Code,b.No_Of_Qty as Send_Qty'  
select @sqlstr = @sqlstr + ',isnull(sum(C.No_Of_Qty),''0'') as All_Recd_Qty '  
select @sqlstr = @sqlstr + ',(b.No_Of_Qty-isnull(sum(C.No_Of_Qty),''0'')) as Pending_Qty '  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + '  And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
  
select @sqlstr = @sqlstr + '  And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.department Like '  + '''' + @mdeptname  + '''' 
Select @sqlstr = @sqlstr + 'and a.To_Company like ' + ''''  + @mtocompany   + ''''       
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mfromcompany    + ''''       
select @sqlstr = @sqlstr + ' And b.Return_Type='      + '''' + 'RETURN'  + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
--select @sqlstr = @sqlstr + ' And a.Gpass_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_Date <='+ '''' + @To_Date+ ''''  
  
select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty'  
  
end  
end




else IF   
 (   
  ltrim(rtrim(@mode))= 'Vehicle Utilisation Report'   
    
  )  
  
BEGIN  

  
  select @sqlstr = 'select   '
   select @sqlstr = @sqlstr + ' a.gpass_date,a.vehicle_no,b.capacity as L_capacity   '
select @sqlstr = @sqlstr + ',sum(a.total_netwt) as Loaded_wt   '
select @sqlstr = @sqlstr + ', CAST(Round((sum(a.total_netwt)/b.capacity)*100,2) AS numeric(10,2)) as Util  '
select @sqlstr = @sqlstr + 'from db_general..[GEN_VehiclepassOUT_Main] a  '
select @sqlstr = @sqlstr + 'Left   Join db_common..[Vehicle_Master] b on  b.vehicle_no=a.Vehicle_no   '
 
   
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
 
select @sqlstr = @sqlstr + ' And capacity>0 '  
  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.Gpass_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_Date <='+ '''' + @To_Date+ ''''  
  
select @sqlstr = @sqlstr + ' group by a.gpass_date,a.vehicle_no,b.capacity  '

  
end  
end

ELSE IF   
 (   
  ltrim(rtrim(@mode))= 'Vehicle Gatepass'   
    
  )  
  
BEGIN  
  
  
select @sqlstr = 'select a.Location_Code,a.Gpass_No as GatepassOUT_No,a.Gpass_Date as GatepassOUT_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ' , a.Ref_Inv_No as Ref_Inv_No,a.Ref_Inv_Date as Ref_Inv_Date '  
select @sqlstr = @sqlstr + ' , a.Department AS Department '  
select @sqlstr = @sqlstr + ' , a.Vehicle_no AS Vehicle_no ,A.Delivery_Location'  

select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as To_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Product_Desc,b.UOM_Code as UOM_Code,b.No_Of_Qty as Send_Qty'  
select @sqlstr = @sqlstr + ',b.Net_wt'  

select @sqlstr = @sqlstr + ',isnull(sum(C.No_Of_Qty),''0'') as All_Recd_Qty'  
select @sqlstr = @sqlstr + ',isnull(b.IS_Closed ,''0'') as IS_Closed'  
 select @sqlstr = @sqlstr + ', a.Comp_Code,a.Fin_Year_Code '
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + '  And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
select @sqlstr = @sqlstr + '  And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
Select @sqlstr = @sqlstr + 'and a.Location_Code like ' + ''''  + @mLocation_Code   + ''''       

 
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.department Like '  + '''' + @mdeptname  + '''' 
Select @sqlstr = @sqlstr + 'and a.To_Company like ' + ''''  + @mtocompany   + ''''       
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mfromcompany    + ''''      
Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + ''''       
   
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.Gpass_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_Date <='+ '''' + @To_Date+ ''''  
   
   
select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date '
select @sqlstr = @sqlstr + ' , a.Ref_Inv_No ,a.Ref_Inv_Date  '  
select @sqlstr = @sqlstr + ' , a.Department  '  

select @sqlstr = @sqlstr + ' ,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty,b.IS_Closed'  
  select @sqlstr = @sqlstr + ' , a.Vehicle_no  ,A.Delivery_Location'  
select @sqlstr = @sqlstr + ',b.Net_wt'  
end   
end   
  
print (@sqlstr)  
exec(@sqlstr)  
END  



GO
/****** Object:  StoredProcedure [dbo].[sp_GEN_GetVehiclepassIN_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================  
-- Author  : krk  
-- Create date :24-05-2022 
-- Description : Get Gatepass IN transaction Details Weaving)  
-- ===============================================================  
-- Grant Execute On [[sp_GetGatepassIN_Details]] To Public  
-- select * from GEN_VehiclepassIN_Line  
-- select * from GEN_VehiclepassIN_Main  
-- exec [sp_GEN_GetVehiclepassIN_Details] '100','THENI','1','VGR/0002/22-23',''  
  
CREATE Proc [dbo].[sp_GEN_GetVehiclepassIN_Details]  
(  
@Comp_Code    Varchar(10),  
@Location_Code   Varchar(10),  
@Fin_Year_Code   Varchar(10),  
@GatepassIN_No    Varchar(100),  
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
   @Filter_Data = ''  
  And @GatepassIN_No   <> ''  
 )  
BEGIN  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.GatePass_IN_No,a.GatePass_IN_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.Total_Items,a.Remarks'  
select @sqlstr = @sqlstr + ',b.Gpass_No,b.Gpass_Date,b.SNo,b.Prod_Code as  Product_Desc,b.UOM_Code'  
select @sqlstr = @sqlstr + ',isnull(b.No_Of_Qty,''0'')as All_Recd_Qty,isnull(C.No_Of_Qty,''0'') as Send_Qty'  
  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassIN_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassIN_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code = b.Fin_Year_Code And a.GatePass_IN_No=b.GatePass_IN_No '  
select @sqlstr = @sqlstr + ' And a.GatePass_IN_Date=b.GatePass_IN_Date'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
--select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code  '  
select @sqlstr = @sqlstr + ' And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.GatePass_IN_No='    + '''' + @GatepassIN_No    + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'  
END  
  
ELSE IF @Filter_Data <> ''  
BEGIN  
select @sqlstr = 'Select  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.GatePass_IN_No,a.GatePass_IN_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.Total_Items,a.Remarks'  
select @sqlstr = @sqlstr + ',Authorize as [Authorize]'  
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassIN_Main as a  '  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='   + '''' + @Location_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'  
select @sqlstr = @sqlstr + ' Order by a.Created_Date desc'  
END  
  
print (@sqlstr)  
exec(@sqlstr)  
END  

GO
/****** Object:  StoredProcedure [dbo].[sp_GEN_GetVehiclepassOUT_Details]    Script Date: 25/04/2023 16:39:56 ******/
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
-- select * from GEN_VehiclepassOUT_lINE  
-- select * from GEN_VehiclepassOUT_Main  
---exec sp_GEN_GetVehiclepassOUT_Details '100','THENI','1','','ALL'
---exec sp_GEN_GetVehiclepassOUT_Details '100','THENI','1','VGP/0002/22-23','SPECIFY'
  
CREATE Proc [dbo].[sp_GEN_GetVehiclepassOUT_Details]  
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
select @sqlstr = @sqlstr + ' ,a.Total_Items,A.Total_Netwt,a.Remarks'   
select @sqlstr = @sqlstr + ' ,A.Ref_Inv_No,A.Ref_Inv_Date,A.Department,A.Vehicle_no,A.Delivery_Location  '

select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code,b.Net_Meters,b.UOM_Code,b.No_Of_Qty,b.Net_wt'  
select @sqlstr = @sqlstr + ', a.Comp_Code,a.Location_Code,a.Fin_Year_Code'  
   
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
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


select @sqlstr = @sqlstr + ',From_Company,To_Company,Delivered_By,Total_Items,Remarks'  
select @sqlstr = @sqlstr + ' ,Ref_Inv_No,Ref_Inv_Date,Department,Vehicle_no,Delivery_Location  '
select @sqlstr = @sqlstr + ',Authorize as [Authorize]'  

  
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main  '  
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
select @sqlstr = @sqlstr + ' ,a.Total_Items,A.Total_Netwt,a.Remarks'   
select @sqlstr = @sqlstr + ' ,A.Ref_Inv_No,A.Ref_Inv_Date,A.Department,A.Vehicle_no,A.Delivery_Location  '

select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code,b.Net_Meters,b.UOM_Code,b.No_Of_Qty,b.Net_wt'  
select @sqlstr = @sqlstr + ', a.Comp_Code,a.Location_Code,a.Fin_Year_Code'  
select @sqlstr = @sqlstr + ',a.Modified_Date as [Modified_Date],a.Modified_By,a.Created_Date,a.Created_By'  

   
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
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
select @sqlstr = @sqlstr + ' ,a.Total_Items,A.Total_Netwt,a.Remarks'   
select @sqlstr = @sqlstr + ' ,A.Ref_Inv_No,A.Ref_Inv_Date,A.Department,A.Vehicle_no,A.Delivery_Location  '

select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code,b.Net_Meters,b.UOM_Code,b.No_Of_Qty,b.Net_wt'  
select @sqlstr = @sqlstr + ', a.Comp_Code,a.Location_Code,a.Fin_Year_Code'  
select @sqlstr = @sqlstr + ',a.Modified_Date as [Modified_Date],a.Modified_By,a.Created_Date,a.Created_By'  

   
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
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
/****** Object:  StoredProcedure [dbo].[sp_GEN_GetVehiclepassPendingList]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author  : krk  
-- Create date :24-05-2022 
-- Description: < Get Gatepass pending list ,,>  
-- =============================================  
--  exec [sp_GEN_GetVehiclepassPendingList] 'LS MILLS','2','UNIT A','','all','2014/01/01','2014/04/01'  
CREATE ProcEDURE [dbo].[sp_GEN_GetVehiclepassPendingList]  
(  
@Comp_Code    Varchar(10),  
@Fin_Year_Code   Varchar(10),  
@Location_Code   Varchar(10),  
@Partyname   Varchar(250),  
@IssuedDept   Varchar(250),  
@From_Date    Varchar(50),  
@To_Date    Varchar(50)  
  
)  
  
as  
BEGIN  
set nocount on  
set dateformat ymd  
Declare @sqlstr varchar(8000)  
print @Comp_Code  
Declare @mLocation_Code Varchar(10)  
Set @mLocation_Code=''  
Declare @mPartyname Varchar(100)  
Set @mPartyname=''  
  
Declare @mIssueddept Varchar(100)  
Set @mIssueddept =''  
  
  
IF LTRIM(RTRIM(@Location_Code))='ALL'  
BEGIN  
Set @mLocation_Code='%'  
END  
ELSE  
BEGIN  
Set @mLocation_Code=@Location_Code   
END  
  
IF LTRIM(RTRIM(@Partyname ))='ALL' or LTRIM(RTRIM(@Partyname ))=''  
BEGIN  
Set @mPartyname ='%'  
END  
ELSE  
BEGIN  
Set @mPartyname=@Partyname  
END  
  
IF LTRIM(RTRIM(@IssuedDept  ))='ALL'  
BEGIN  
Set @mIssueddept  ='%'  
END  
ELSE  
BEGIN  
Set @mIssueddept=@IssuedDept  
END  
  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as Gpass_No,a.Gpass_Date as GatepassOUT_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as To_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Product_Desc,b.UOM_Code as UOM_Code,b.No_Of_Qty as Send_Qty'  
select @sqlstr = @sqlstr + ',isnull(sum(C.No_Of_Qty),''0'') as All_Recd_Qty '  
select @sqlstr = @sqlstr + ',(b.No_Of_Qty-isnull(sum(C.No_Of_Qty),''0'')) as Pending_Qty '  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + '  And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
  
select @sqlstr = @sqlstr + '  And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
Select @sqlstr = @sqlstr + 'and a.To_Company like ' + ''''  + @mPartyname   + ''''       
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mIssueddept    + ''''       
select @sqlstr = @sqlstr + ' And b.Return_Type='      + '''' + 'RETURN'  + ''''  
select @sqlstr = @sqlstr + ' OR b.Return_Type='      + '''' + 'RETURNABLE'  + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
--select @sqlstr = @sqlstr + ' And a.Gpass_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_Date <='+ '''' + @To_Date+ ''''  
  
select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty'  
  
end   
  
print (@sqlstr)  
exec(@sqlstr)  
END  
   
  


GO
/****** Object:  StoredProcedure [dbo].[sp_GEN_GetVehiclepassTrans_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================  
-- Author  : Rajkumar  
-- Create date : 28/05/2022  
-- Description : Get SGatepass Transaction  Details)  
-- ===============================================================  
-- Grant Execute On [sp_GetGatepassTrans_Details] To Public  
-- select * from GEN_VehiclepassOUT_Line  
-- select * from GEN_VehiclepassOUT_Main  
-- select * from GEN_VehiclepassIN_Line  
-- exec [sp_GEN_GetVehiclepassTrans_Details] '100','theni','1','','ASHVADHIYA MOTORS, THENI.',''  
---exec [sp_GEN_GetVehiclepassTrans_Details] '100','theni','1','','Green Pearal Electronics Pvt Ltd,Kattankulathur',''  
  
create Proc [dbo].[sp_GEN_GetVehiclepassTrans_Details]  
(  
@Comp_Code    Varchar(10),  
@Location_Code   Varchar(10),  
@Fin_Year_Code   Varchar(10),  
@Trans_No     Varchar(100),  
@From_Company     Varchar(100),  
@Filter_Data   Varchar(30)  
)  
as  
BEGIN  
set nocount on  
set dateformat ymd  
Declare @sqlstr varchar(8000)  
  
IF   
 (  
   @Filter_Data = ''  
   And @From_Company =''  
  And @Trans_No   <> ''  
 )  
BEGIN  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as GatepassOUT_No,a.Gpass_Date as GatepassOUT_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as From_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Product_Desc,b.UOM_Code as UOM_Code,b.No_Of_Qty as Send_Qty'  
select @sqlstr = @sqlstr + ',isnull(sum(C.No_Of_Qty),''0'') as All_Recd_Qty '  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code = b.Fin_Year_Code '  
select @sqlstr = @sqlstr + '  And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
--select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code '  
select @sqlstr = @sqlstr + '  And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_No='    + '''' + @Trans_No    + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,a.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty'  
END  
  
  
  
ELSE IF   
 (  
   @Filter_Data = ''  
  And @Trans_No   = ''  
   And @From_Company <>''  
    
 )  
BEGIN  
select @sqlstr = 'selecT a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as GatepassOUT_No,a.Gpass_Date as GatepassOUT_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as From_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Product_Desc,b.UOM_Code as UOM_Code,b.No_Of_Qty as Send_Qty'  
select @sqlstr = @sqlstr + ',isnull(sum(C.No_Of_Qty),''0'') as All_Recd_Qty '  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
--select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code '  
select @sqlstr = @sqlstr + '  And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
--select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code '  
select @sqlstr = @sqlstr + ' And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
--select @sqlstr = @sqlstr + ' And b.No_Of_Qty<> C.No_Of_Qty'  
  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.To_Company='    + '''' + @From_Company    + ''''  
select @sqlstr = @sqlstr + ' And b.Return_Type ='+ '''' + 'RETURN' + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'  
select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty'  
END  
  
  
ELSE IF   
 (  
   @Filter_Data = ''  
  And @Trans_No   <> ''  
   And @From_Company <>''  
    
 )  
BEGIN  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as GatepassOUT_No,a.Gpass_Date as GatepassOUT_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as From_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Product_Desc,b.UOM_Code as UOM_Code,b.No_Of_Qty as Send_Qty'  
select @sqlstr = @sqlstr + ',isnull(sum(C.No_Of_Qty),''0'') as All_Recd_Qty '  
  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
--select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code '  
select @sqlstr = @sqlstr + ' And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
--select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code '  
select @sqlstr = @sqlstr + '  And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_No='    + '''' + @Trans_No    + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'  
select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,a.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty '  
  
END  
  
  
  
ELSE IF @Filter_Data <> ''  
BEGIN  
  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as GatepassOUT_No,a.Gpass_Date as GatepassOUT_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as From_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Product_Desc,b.UOM_Code as UOM_Code,b.No_Of_Qty as Send_Qty'  
select @sqlstr = @sqlstr + ',isnull(C.No_Of_Qty,''0'')  as All_Recd_Qty '  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
--select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code '  
select @sqlstr = @sqlstr + 'And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code '  
select @sqlstr = @sqlstr + ' And b.Gpass_No=c.Gpass_No '  
  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'  
select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
select @sqlstr = @sqlstr + ' Order by a.Gpass_Date'  
END  
  
print (@sqlstr)  
exec(@sqlstr)  
END  

GO
/****** Object:  StoredProcedure [dbo].[sp_GEN_GetVehiclFuelEntry_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================        
-- Author		:	KRK
-- Create date	:	11/08/2022
-- Modified date	:	01/08/2022
-- Description : Get Vehicle Expense Detail Details       
-- =====================================================================        
-- Grant Execute On sp_GEN_VehicleFuelEntry_Details To Public        
 
-- exec [sp_GEN_GetVehiclFuelEntry_Details] '100','THENI','1','','0','','ALL'     
-- exec [sp_GEN_GetVehiclFuelEntry_Details] '100','THENI','1','DC/0002122-23','','','SPECIFY'     
 -- exec [sp_GEN_GetVehiclFuelEntry_Details] '100','THENI','1','DC/0002122-23','','','Delivery_Challan'        

CREATE  PROC [dbo].[sp_GEN_GetVehiclFuelEntry_Details]        
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

select @sqlstr = @sqlstr + ' a.Entry_No,a.Entry_Date   '
select @sqlstr = @sqlstr + ' ,a.Vehicle_no   '
select @sqlstr = @sqlstr + ' ,a.Ref_Inv_No,a.Ref_Inv_Date,a.Total_Invoice_Value    '
select @sqlstr = @sqlstr + ',a.Remarks   '

 select @sqlstr = @sqlstr + ' ,a.Comp_Code,a.Location_Code,a.Fin_Year_Code   '
select @sqlstr = @sqlstr + ' 	FROM GEN_VehicleFuelEntry_Main as a '
select @sqlstr = @sqlstr + ' left join GEN_VehicleFuelEntry_Line as b on b.Entry_No=a.Entry_No and b.Entry_Date =a.Entry_Date  ' 
 
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='   + '''' + @Location_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
        
		
select @sqlstr = @sqlstr + ' group by    '
select @sqlstr = @sqlstr + ' a.Entry_No,a.Entry_Date   '
select @sqlstr = @sqlstr + ' ,a.Vehicle_no   '
select @sqlstr = @sqlstr + ' ,a.Ref_Inv_No,a.Ref_Inv_Date,a.Total_Invoice_Value    '
select @sqlstr = @sqlstr + ',a.Remarks   '
 
select @sqlstr = @sqlstr + ' ,a.Comp_Code,a.Location_Code,a.Fin_Year_Code    '
select @sqlstr = @sqlstr + ' Order by  a.Entry_Date desc, a.Entry_No'        
END    

          
              
else IF               
(               
             
 ltrim(rtrim(@Authorize))= '0'               
and ltrim(rtrim(@Filter_Data))='ALL'       
)              
BEGIN   
       
select @sqlstr= 'Select '   

select @sqlstr = @sqlstr + ' a.Entry_No,a.Entry_Date   '
select @sqlstr = @sqlstr + ' ,a.Vehicle_no   '
select @sqlstr = @sqlstr + ' ,a.Ref_Inv_No,a.Ref_Inv_Date,a.Total_Invoice_Value    '
select @sqlstr = @sqlstr + ',a.Remarks   '

 select @sqlstr = @sqlstr + ' ,a.Comp_Code,a.Location_Code,a.Fin_Year_Code   '
select @sqlstr = @sqlstr + ' 	FROM GEN_VehicleFuelEntry_Main as a '
select @sqlstr = @sqlstr + ' left join GEN_VehicleFuelEntry_Line as b on b.Entry_No=a.Entry_No and b.Entry_Date =a.Entry_Date  ' 
 
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='   + '''' + @Location_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
             select @sqlstr = @sqlstr + ' And a.Authorize=0'   
		
select @sqlstr = @sqlstr + ' group by     '
select @sqlstr = @sqlstr + ' a.Entry_No,a.Entry_Date   '
select @sqlstr = @sqlstr + ' ,a.Vehicle_no   '
select @sqlstr = @sqlstr + ' ,a.Ref_Inv_No,a.Ref_Inv_Date,a.Total_Invoice_Value    '
select @sqlstr = @sqlstr + ',a.Remarks   '
 
select @sqlstr = @sqlstr + ' ,a.Comp_Code,a.Location_Code,a.Fin_Year_Code    '
select @sqlstr = @sqlstr + ' Order by  a.Entry_Date desc, a.Entry_No' 
 

END    
         
ELSE IF         
(        
ltrim(rtrim(@Entry_No)) <>''        
        
and LTRIM(rtrim(@Filter_Data))='SPECIFY'        
        
)        
BEGIN        
        
select @sqlstr= 'Select '    
     
select @sqlstr = @sqlstr + ' a.Entry_No,a.Entry_Date   '
select @sqlstr = @sqlstr + ' ,a.Vehicle_no   '
select @sqlstr = @sqlstr + ' ,a.Ref_Inv_No,a.Ref_Inv_Date,a.Total_Invoice_Value    '
select @sqlstr = @sqlstr + ',a.Remarks   '
select @sqlstr = @sqlstr + ' ,B.SNo,b.Expense_Type,b.Description,b.Invoice_Value    '
select @sqlstr = @sqlstr + ' , b.UOM , b.Start_Reading , b.End_Reading , b.Fuel_Qty , b.Fuel_Cost  '

 select @sqlstr = @sqlstr + ' 	FROM GEN_VehicleFuelEntry_Main as a '
select @sqlstr = @sqlstr + ' left join GEN_VehicleFuelEntry_Line as b on b.Entry_No=a.Entry_No and b.Entry_Date =a.Entry_Date  ' 
    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''        
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + '''' 
select @sqlstr = @sqlstr + ' And a.Entry_No='   + '''' + @Entry_No  + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
        
select @sqlstr = @sqlstr + ' Order by a.Created_Date, a.Entry_Date desc '        
        
        
        
END        
         
        
print (@sqlstr)        
exec(@sqlstr)        
END        
        
        
        
        






GO
/****** Object:  StoredProcedure [dbo].[sp_GEN_SaveDeliveryChallan_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================  
-- Author  : KRK  
-- Create date : 07/06/2022  
-- Description : Save Delivery Challan   Line (Insert / Update)  
--     Delete GEN_DeliveryChallan_line  
-- ==================================================================  
-- Grant Execute On GST_CreditNote_line To Public  
-- Select * from [GEN_DeliveryChallan_Main]  
-- Select * from GEN_DeliveryChallan_Line  
  
CREATE Proc [dbo].[sp_GEN_SaveDeliveryChallan_Line]  
(  
@Comp_Code     Varchar(10),  
@Location_Code    Varchar(10),  
@Fin_Year_Code    Varchar(10),  
@DC_No     varchar(100),  
@DC_Date     varchar(100),  
@SNo      Varchar(3),  
@Trans_Type    varchar(300),  

@Prod_Code    varchar(300),  
@Prod_Desc     varchar(300),  
@ID_Mark     varchar(100),  
@HSN_Code     varchar(300),  
@UOM_Code     varchar(100),  
@Packing_Mode     varchar(1000),  
@Bag_Weight     varchar(100),  
@No_Of_Bags    varchar(100),  
@Net_Wt    varchar(100),  
@Rate_Per_Qty    Varchar(20),
@Line_Total     Varchar(20),  
@Lorry_Freight    varchar(100), 
@Taxable_Amt     varchar(100),
@GST_Pers    Varchar(100), 
@CGST     Varchar(100), 
@SGST     Varchar(100), 
@IGST     Varchar(100), 
@Tot_GST     Varchar(100), 
   
@Authorize     Varchar(1),  
@Delete_Mode    Varchar(1),  
@Screen_Mode    Varchar(20),  
@User_Code     Varchar(15),  
@iSuccessFlag       bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iServerDate Varchar(19)  
  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
BEGIN TRAN TRAN1  
  
select @sqlstr=''  
select @sqlstr = 'Insert into GEN_DeliveryChallan_Line Values('  
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@DC_No  ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@DC_Date))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@SNo  ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Trans_Type      ))      + ''''  

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Prod_Code      ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Prod_Desc     ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@ID_Mark      ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@HSN_Code     ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Packing_Mode    ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@UOM_Code      ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Bag_Weight     ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@No_Of_Bags      ))      + ''''  
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Net_Wt        ))  + ''''  

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Rate_Per_Qty ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Line_Total))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Lorry_Freight     ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Taxable_Amt))   + ''''   
    	
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GST_Pers))   + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@CGST))   + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@SGST))   + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@IGST))   + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Tot_GST))   + ''''   

   
--select @sqlstr= @sqlstr + ',''0'''  
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @User_Code      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate      + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @User_Code      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate      + '''' + ')'  
print (@sqlstr)  
exec(@sqlstr )  
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
/****** Object:  StoredProcedure [dbo].[sp_GEN_SaveDeliveryChallan_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================  
-- Author  : RAJKUMAR  
-- Create date : 07/06/2022  
-- Description : Save GEN_DeliveryChallan_Main
--     Delete Delivery Challan Line Items  
-- ==============================================================================  
-- Grant Execute On sp_GEN_DeliveryChallan_Main To Public  
-- Select * from GEN_DeliveryChallan_Main  
  
CREATE Proc [dbo].[sp_GEN_SaveDeliveryChallan_Main]  
(  
@Comp_Code     Varchar(20),  
@Location_Code    Varchar(20),  
@Fin_Year_Code    Varchar(10),  
@DC_No     Varchar(100),  
@DC_Date    Varchar(10),  
@DC_Type    Varchar(100),  
@Party_Code     Varchar(20),  
@Party_Name     Varchar(200),  
@Delivered_To     Varchar(3000), 
@Place_Of_Supply     Varchar(100), 
 
@Department    Varchar(10),   
@Lorry_no    Varchar(30),   
@Ref_Doc_No    Varchar(10),   
@Ref_Doc_Date    Varchar(10),   
 @lorry_fr   varchar(50),    
 @Tot_Taxable_Value     Varchar(100), 
@Tot_CGST     Varchar(100), 
@Tot_SGST     Varchar(100), 
@Tot_IGST     Varchar(100), 
@Tot_GST     Varchar(100), 
@Round_Off varchar(20),   
@Invoice_Value     Varchar(100), 



@Other_Details    Varchar(1000),  
@Gst_type    Varchar(1000),  

@Authorize     Varchar(1),  
@Delete_Mode    Varchar(1),  
@Screen_Mode    Varchar(20),  
@User_Code     Varchar(15),  
@iSuccessFlag       bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iMode   Numeric(18,0)  
Declare @iServerDate Varchar(19)  
  
Set @iMode=(Select Count(DC_No) from GEN_DeliveryChallan_Main   
Where Comp_Code  = @Comp_Code   
And  Location_Code = @Location_Code  
And  Fin_Year_Code = @Fin_Year_Code  
And  DC_No  = @DC_No  
And  DC_Date = @DC_Date  
)  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
BEGIN TRAN TRAN1  
select @sqlstr=''  
IF @iMode<=0   
BEGIN  
select @sqlstr = 'Insert into GEN_DeliveryChallan_Main Values('  
select @sqlstr= @sqlstr + '''' + ltrim(rtrim(@Comp_Code))     + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Location_Code))   + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Fin_Year_Code))   + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@DC_No))   + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@DC_Date))   + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@DC_Type))   + ''''
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Party_Code))   + ''''  
  

select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Party_Name))    + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Delivered_To))    + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Place_Of_Supply))   + ''''   
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Department))   + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Lorry_no ))   + ''''   
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Ref_Doc_No ))   + ''''   
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Ref_Doc_Date ))   + ''''   
select @sqlstr= @sqlstr + ','+ ''''+ ltrim(rtrim(@lorry_fr))      + ''''  
  select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Tot_Taxable_Value))   + ''''   
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Tot_CGST))   + ''''   
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Tot_SGST))   + ''''   
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Tot_IGST))   + ''''   
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Tot_GST))   + ''''   
select @sqlstr= @sqlstr + ','+ ''''+ ltrim(rtrim(@Round_Off))      + '''' 
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Invoice_Value))   + ''''   
--select @sqlstr = @sqlstr + ' ,'' '''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Other_Details))   + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Gst_type))   + ''''  

select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Authorize))    + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Delete_Mode))   + ''''  
select @sqlstr= @sqlstr + ',' + '''' + @User_Code       + ''''  
select @sqlstr= @sqlstr + ',' + '''' + @iServerDate       + ''''   
select @sqlstr= @sqlstr + ',' + '''' + @User_Code       + ''''  
select @sqlstr= @sqlstr + ',' + '''' + @iServerDate       + '''' + ')'  
END  
ELSE IF @iMode=1  
BEGIN  
select @sqlstr = 'Update GEN_DeliveryChallan_Main Set '  
select @sqlstr= @sqlstr + ' DC_Type='   + '''' + ltrim(rtrim(@DC_Type))  + ''''   
select @sqlstr= @sqlstr + ',Party_Code='    + '''' + ltrim(rtrim(@Party_Code))   + ''''  

select @sqlstr= @sqlstr + ',Party_Name='    + '''' + ltrim(rtrim(@Party_Name))   + ''''  
select @sqlstr= @sqlstr + ',Delivered_To='    + '''' + ltrim(rtrim(@Delivered_To))   + ''''   
select @sqlstr= @sqlstr + ',Place_Of_Supply='   + '''' + ltrim(rtrim(@Place_Of_Supply))   + ''''  
select @sqlstr= @sqlstr + ',Department='   + '''' + ltrim(rtrim(@Department))  + ''''  

select @sqlstr= @sqlstr + ',Lorry_no='   + '''' + ltrim(rtrim(@Lorry_no))  + ''''  
select @sqlstr= @sqlstr + ',Ref_Doc_No='   + '''' + ltrim(rtrim(@Ref_Doc_No))  + ''''  
select @sqlstr= @sqlstr + ',Ref_Doc_Date='   + '''' + ltrim(rtrim(@Ref_Doc_Date))  + ''''  
select  @sqlstr= @sqlstr + ',Lorry_fr='        + '''' + ltrim(rtrim(@lorry_fr))     + ''''  
select @sqlstr= @sqlstr + ',Tot_Taxable_Value='   + '''' + ltrim(rtrim(@Tot_Taxable_Value))  + ''''  
select @sqlstr= @sqlstr + ',Tot_CGST='   + '''' + ltrim(rtrim(@Tot_CGST))  + ''''  
select @sqlstr= @sqlstr + ',Tot_SGST='   + '''' + ltrim(rtrim(@Tot_SGST))  + ''''  
select @sqlstr= @sqlstr + ',Tot_IGST='   + '''' + ltrim(rtrim(@Tot_IGST))  + ''''  
select @sqlstr= @sqlstr + ',Tot_GST_Value='   + '''' + ltrim(rtrim(@Tot_GST))  + ''''  
select  @sqlstr= @sqlstr + ',Round_Off='        + '''' + ltrim(rtrim(@Round_Off ))     + ''''  
select @sqlstr= @sqlstr + ',Invoice_Value='   + '''' + ltrim(rtrim(@Invoice_Value))  + ''''  

  
select @sqlstr= @sqlstr + ',Others_Desc='   + '''' + ltrim(rtrim(@Other_Details))  + ''''  
select @sqlstr= @sqlstr + ',Authorize='    + '''' + ltrim(rtrim(@Authorize))   + ''''  
select @sqlstr= @sqlstr + ',Delete_Mode='   + '''' + ltrim(rtrim(@Delete_Mode))   + ''''  
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))   + ''''  
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate      + ''''  
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code       + ''''  
select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + @Location_Code      + ''''    
select @sqlstr= @sqlstr +  ' And Fin_Year_Code=' + '''' + @Fin_Year_Code      + ''''    
select @sqlstr= @sqlstr +  ' And DC_No='  + '''' + @DC_No      + ''''    
select @sqlstr= @sqlstr +  ' And DC_Date='  + '''' + @DC_Date      + ''''    
END  
exec(@sqlstr )  
print @sqlstr  
IF @iMode=1  
BEGIN  
select @sqlstr = 'Delete from GEN_DeliveryChallan_Line'  
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code + ''''  
select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + @Location_Code + ''''    
select @sqlstr= @sqlstr +  ' And Fin_Year_Code=' + '''' + @Fin_Year_Code + ''''    
select @sqlstr= @sqlstr +  ' And DC_No='  + '''' + @DC_No + ''''    
select @sqlstr= @sqlstr +  ' And DC_Date='  + '''' + @DC_Date + ''''    
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveGatepassOUT_Line]    Script Date: 25/04/2023 16:39:56 ******/
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
-- Select * from GEN_GatepassOUT_Line

CREATE Proc [dbo].[sp_Gen_SaveGatepassOUT_Line]
(
@Comp_Code					Varchar(10),
@Location_Code				Varchar(10),
@Fin_Year_Code				Varchar(10),
@GatePass_OUT_No					Varchar(100),
@GatePass_OUT_Date				Varchar(10),
@SNo						Varchar(3),
@Prod_Code					Varchar(500),
@UOM_Code					Varchar(10),
@Return_Type		Varchar(50),
@Return_Mode		Varchar(10),
@IS_Closed		Varchar(10),
@Close_Reason 	Varchar(150),
@No_Of_QTY                 Varchar(10),
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
				Select Count(GatePass_OUT_No) from GEN_GatepassOUT_Line 
				Where	Comp_Code		=	@Comp_Code 
				And		Location_Code	=	@Location_Code
				--And		Fin_Year_Code	=	@Fin_Year_Code
				And		GatePass_OUT_No			=	@GatePass_OUT_No 
				And	 GatePass_OUT_Date 		=	@GatePass_OUT_Date
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
select @sqlstr = 'Insert into GEN_GatepassOUT_Line Values('
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))		+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))		+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_OUT_No ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_OUT_Date ))			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@SNo))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Prod_Code))			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@UOM_Code  ))			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Return_Type))			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Return_Mode  ))			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@IS_Closed))			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + 	''	+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@No_Of_QTY ))		+ ''''

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))		+ ''''
select @sqlstr= @sqlstr + ','+''''+ @User_Code							+ ''''
select @sqlstr= @sqlstr + ','+''''+ @iServerDate						+ '''' 
select @sqlstr= @sqlstr + ','+''''+ @User_Code							+ ''''
select @sqlstr= @sqlstr + ','+''''+ @iServerDate						+ '''' + ')'
END
ELSE IF @iMode=1
BEGIN
select @sqlstr = 'UpdatE GEN_GatepassOUT_Line Set '
select @sqlstr= @sqlstr + 'IS_Closed='				+ '''' + ltrim(rtrim(@IS_Closed))				+ ''''
select @sqlstr= @sqlstr + ',Close_Reason='				+ '''' + @Close_Reason	+ ''''
select @sqlstr= @sqlstr + ',Modified_By='			+ '''' + ltrim(rtrim(@User_Code))				+ ''''
select @sqlstr= @sqlstr + ',Modified_Date='			+ '''' + @iServerDate							+ ''''
select @sqlstr= @sqlstr +  ' Where Comp_Code='		+ '''' + @Comp_Code								+ ''''
select @sqlstr= @sqlstr +  ' And Location_Code='	+ '''' + @Location_Code							+ ''''  
--select @sqlstr= @sqlstr +  ' And Fin_Year_Code='	+ '''' + @Fin_Year_Code							+ ''''  
select @sqlstr= @sqlstr +  ' And GatePass_OUT_No	='			+ '''' + @GatePass_OUT_No 									+ ''''  
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveGatepassOUT_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Author		:	KRK
-- Create date	:	09/05/2022
-- Description	:	Save  Gatepass out receipt  Main (Insert / Update)
--					Delete Gatepass Out  Receipt Line
-- ==================================================================
-- Grant Execute On [sp_SaveGatepassOUTReceipt_Main] To Public
-- Select * from GEN_GatepassOUT_Main
-- Select * from GEN_GatepassOUT_Line

CREATE Proc [dbo].[sp_Gen_SaveGatepassOUT_Main]
(
@Comp_Code					Varchar(10),
@Location_Code				Varchar(10),
@Fin_Year_Code				Varchar(10),
@GatePass_OUT_No					Varchar(100),
@GatePass_OUT_Date				Varchar(10),
@DC_No					Varchar(100),
@DC_Date					Varchar(10),
@Issued_Company				Varchar(250),
@Recd_Company				Varchar(250),
@Delivered_By				Varchar(250),
@Remarks		Varchar(1000),

@Total_Items		Varchar(10),
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
				Select Count(GatePass_OUT_No) from GEN_GatepassOUT_Main 
				Where	Comp_Code		=	@Comp_Code 
				And		Location_Code	=	@Location_Code
				And		Fin_Year_Code	=	@Fin_Year_Code
				And		GatePass_OUT_No			=	@GatePass_OUT_No 
				And	 GatePass_OUT_Date 		=	@GatePass_OUT_Date
			)

Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))

BEGIN TRAN TRAN1
select @sqlstr=''
IF @iMode<=0 
BEGIN
select @sqlstr = 'Insert into GEN_GatepassOUT_Main Values('
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))						+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_OUT_No ))						+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_OUT_Date ))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@DC_No))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@DC_Date))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Issued_Company))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Recd_Company))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delivered_By ))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Remarks ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Total_Items  ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate								+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate								+ '''' + ')'
END
ELSE IF @iMode=1
BEGIN
select @sqlstr = 'Update GEN_GatepassOUT_Main Set '
select @sqlstr= @sqlstr + 'DC_No='				+ '''' + ltrim(rtrim(@DC_No))				+ ''''
select @sqlstr= @sqlstr + ',DC_Date='				+ '''' + ltrim(rtrim(@DC_Date))				+ ''''
select @sqlstr= @sqlstr + ',Issued_Company='				+ '''' + ltrim(rtrim(@Issued_Company))				+ ''''
select @sqlstr= @sqlstr + ',Recd_Company='			+ '''' + ltrim(rtrim(@Recd_Company ))				+ ''''
select @sqlstr= @sqlstr + ',Delivered_By='			+ '''' + ltrim(rtrim(@Delivered_By))			+ ''''
select @sqlstr= @sqlstr + ',Remarks='			+ '''' + ltrim(rtrim(@Remarks  ))				+ ''''
select @sqlstr= @sqlstr + ',Total_Items='			+ '''' + ltrim(rtrim(@Total_Items  ))			+ ''''

select @sqlstr= @sqlstr + ',Authorize='				+ '''' + ltrim(rtrim(@Authorize))				+ ''''
select @sqlstr= @sqlstr + ',Delete_Mode='			+ '''' + ltrim(rtrim(@Delete_Mode))				+ ''''
select @sqlstr= @sqlstr + ',Modified_By='			+ '''' + ltrim(rtrim(@User_Code))				+ ''''
select @sqlstr= @sqlstr + ',Modified_Date='			+ '''' + @iServerDate							+ ''''
select @sqlstr= @sqlstr +  ' Where Comp_Code='		+ '''' + @Comp_Code								+ ''''
select @sqlstr= @sqlstr +  ' And Location_Code='	+ '''' + @Location_Code							+ ''''  
select @sqlstr= @sqlstr +  ' And Fin_Year_Code='	+ '''' + @Fin_Year_Code							+ ''''  
select @sqlstr= @sqlstr +  ' And GatePass_OUT_No	='			+ '''' + @GatePass_OUT_No 									+ ''''  
select @sqlstr= @sqlstr +  ' And GatePass_OUT_Date='			+ '''' + @GatePass_OUT_Date 								+ ''''  
END
exec(@sqlstr )
print @sqlstr
IF @iMode=1
BEGIN
select @sqlstr = 'Delete from GEN_GatepassOUT_Line'
select @sqlstr= @sqlstr +  ' Where Comp_Code='		+ '''' + @Comp_Code			+ ''''
select @sqlstr= @sqlstr +  ' And Location_Code='	+ '''' + @Location_Code		+ ''''  
select @sqlstr= @sqlstr +  ' And Fin_Year_Code='	+ '''' + @Fin_Year_Code		+ ''''  
select @sqlstr= @sqlstr +  ' And GatePass_OUT_No='			+ '''' +  @GatePass_OUT_No 			+ ''''  
select @sqlstr= @sqlstr +  ' And GatePass_OUT_Date='			+ '''' + @GatePass_OUT_Date 			+ ''''  
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveGEN_MaterialOUTNOTReturn_Line]    Script Date: 25/04/2023 16:39:56 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveGEN_MaterialOUTNOTReturn_Main]    Script Date: 25/04/2023 16:39:56 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveGEN_MaterialpassIN_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================  
-- Author  : krk  
-- Create date :24-05-2022
-- Description : Save  Gatepass Return receipt  LINE (Insert / Update)  
--     Delete Gatepass Return  Receipt Line  
-- ========================================================  
-- Grant Execute On [sp_SaveGatepassINReceipt_Line] To Public  
-- Select * from GEN_VehiclepassIN_Line  
  
create Proc [dbo].[sp_Gen_SaveGEN_MaterialpassIN_Line]  
(  
@Comp_Code     Varchar(10),  
@Location_Code    Varchar(10),  
@Fin_Year_Code    Varchar(10),  
@GatePass_IN_No     Varchar(100),  
@GatePass_IN_Date    Varchar(10),  
@SNo      Varchar(3),  
@GatePass_OUT_No     Varchar(100),  
@GatePass_OUT_Date    Varchar(10),  
@Prod_Code     Varchar(500),  
@UOM_Code     Varchar(10),  
@No_Of_QTY                 Varchar(10),  
@Authorize     Varchar(1),  
@Delete_Mode    Varchar(1),  
@Screen_Mode    Varchar(20),  
@User_Code     Varchar(15),  
@iSuccessFlag       bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iServerDate Varchar(19)  
  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
BEGIN TRAN TRAN1  
  
select @sqlstr=''  
select @sqlstr = 'Insert into GEN_MaterialpassIN_Line Values('  
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_IN_No ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_IN_Date ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@SNo))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_OUT_No ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_OUT_Date ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Prod_Code))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@UOM_Code  ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@No_Of_QTY ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))  + ''''  
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''  
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + ''''   
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''  
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + '''' + ')'  
print (@sqlstr)  
exec(@sqlstr )  
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveGEN_MaterialpassIN_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================  
-- Author  : krk  
-- Create date :24-05-2022
-- Description : Save  Gatepass Return receipt  Main (Insert / Update)  
--     Delete Gatepass Return  Receipt Line  
-- ==================================================================  
-- Grant Execute On [sp_Gen_SaveGEN_VehiclepassIN_Line] To Public  
-- Select * from GEN_VehiclepassIN_Main  
-- Select * from GEN_VehiclepassIN_Line  
  
create Proc [dbo].[sp_Gen_SaveGEN_MaterialpassIN_Main]  
(  
@Comp_Code     Varchar(10),  
@Location_Code    Varchar(10),  
@Fin_Year_Code    Varchar(10),  
@GatePass_IN_No     Varchar(100),  
@GatePass_IN_Date    Varchar(10),  
@From_Company    Varchar(100),  
@Total_Items  Varchar(10),  
@Remarks   Varchar(1000),  
@Authorize     Varchar(1),  
@Delete_Mode    Varchar(1),  
@Screen_Mode    Varchar(20),  
@User_Code     Varchar(15),  
@iSuccessFlag       bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iMode   Numeric(18,0)  
Declare @iServerDate Varchar(19)  
  
Set @iMode=(  
    Select Count(GatePass_IN_No) from GEN_MaterialpassIN_Main   
    Where Comp_Code  = @Comp_Code   
    And  Location_Code = @Location_Code  
    And  Fin_Year_Code = @Fin_Year_Code  
    And  GatePass_IN_No   = @GatePass_IN_No   
    And  GatePass_IN_Date   = @GatePass_IN_Date  
   )  
  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
BEGIN TRAN TRAN1  
select @sqlstr=''  
IF @iMode<=0   
BEGIN  
select @sqlstr = 'Insert into GEN_MaterialpassIN_Main Values('  
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_IN_No ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_IN_Date  ))     + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@From_Company ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Total_Items  ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Remarks   ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))     + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + '''' + ')'  
END  
ELSE IF @iMode=1  
BEGIN  
select @sqlstr = 'Update GEN_MaterialpassIN_Main Set '  
select @sqlstr= @sqlstr + 'From_Company='    + '''' + ltrim(rtrim(@From_Company))    + ''''  
select @sqlstr= @sqlstr + ',Total_Items='   + '''' + ltrim(rtrim(@Total_Items  ))   + ''''  
  
select @sqlstr= @sqlstr + ',Remarks='    + '''' + ltrim(rtrim(@Remarks ))    + ''''  
select @sqlstr= @sqlstr + ',Authorize='    + '''' + ltrim(rtrim(@Authorize))    + ''''  
select @sqlstr= @sqlstr + ',Delete_Mode='   + '''' + ltrim(rtrim(@Delete_Mode))    + ''''  
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))    + ''''  
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate       + ''''  
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code        + ''''  
select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + @Location_Code       + ''''    
select @sqlstr= @sqlstr +  ' And Fin_Year_Code=' + '''' + @Fin_Year_Code       + ''''    
select @sqlstr= @sqlstr +  ' And GatePass_IN_No ='   + '''' + @GatePass_IN_No          + ''''    
select @sqlstr= @sqlstr +  ' And GatePass_IN_Date='   + '''' + @GatePass_IN_Date         + ''''    
END  
exec(@sqlstr )  
print @sqlstr  
IF @iMode=1  
BEGIN  
select @sqlstr = 'Delete from GEN_MaterialpassIN_Line'  
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + @Location_Code  + ''''    
select @sqlstr= @sqlstr +  ' And Fin_Year_Code=' + '''' + @Fin_Year_Code  + ''''    
select @sqlstr= @sqlstr +  ' And GatePass_IN_No='   + '''' +  @GatePass_IN_No    + ''''    
select @sqlstr= @sqlstr +  ' And GatePass_IN_Date='   + '''' + @GatePass_IN_Date    + ''''    
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveGEN_MaterialpassOUT_Line]    Script Date: 25/04/2023 16:39:56 ******/
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
-- Select * from GEN_MaterialpassOUT_Line

CREATE Proc [dbo].[sp_Gen_SaveGEN_MaterialpassOUT_Line]
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
				Select Count(Gpass_No) from GEN_MaterialpassOUT_Line 
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
select @sqlstr = 'Insert into GEN_MaterialpassOUT_Line Values('
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
select @sqlstr = 'UpdatE GEN_MaterialpassOUT_Line Set '
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveGEN_MaterialpassOUT_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Author		:	KRK
-- Create date	:	09/05/2022
-- Description	:	Save  Gatepass out receipt  Main (Insert / Update)
--					Delete Gatepass Out  Receipt Line
-- ==================================================================
-- Grant Execute On [sp_Gen_SaveGEN_VehiclepassOUT_Main] To Public
-- Select * from GEN_MaterialpassOUT_Main
-- Select * from GEN_MaterialpassOUT_Line

CREATE Proc [dbo].[sp_Gen_SaveGEN_MaterialpassOUT_Main]
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
				Select Count(Gpass_No) from GEN_MaterialpassOUT_Main 
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
select @sqlstr = 'Insert into GEN_MaterialpassOUT_Main Values('
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

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate								+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate								+ '''' + ')'
END
ELSE IF @iMode=1
BEGIN
select @sqlstr = 'Update GEN_MaterialpassOUT_Main Set '
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
select @sqlstr = 'Delete from GEN_MaterialpassOUT_Line'
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveGEN_VehicleExpenses_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================
-- Author		:	KRK
-- Create date	:	01/08/2022
-- Modified date	:	11/11/2022

-- Description	:	Save  Vehicle Expenses  LINE (Insert / Update)
--		Delete Vehicle Expenses  Line
-- ========================================================
-- Grant Execute On [sp_Gen_SaveGEN_VehicleExpenses_Line] To Public
-- Select * from GEN_VehicleExpenses_Line

create Proc [dbo].[sp_Gen_SaveGEN_VehicleExpenses_Line]
(  
@Comp_Code					Varchar(10),
@Location_Code				Varchar(10),
@Fin_Year_Code				Varchar(10),
@Entry_No					Varchar(20),
@Entry_Date				Varchar(10),
@SNo						Varchar(3),

@Description				Varchar(500),
@Qty					Varchar(50),
@Invoice_Value                 Varchar(10),
@Others_Desc                 Varchar(100),


   
@Authorize     Varchar(1),  
@Delete_Mode    Varchar(1),  
@Screen_Mode    Varchar(20),  
@User_Code     Varchar(15),  
@iSuccessFlag       bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iServerDate Varchar(19)  
  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
BEGIN TRAN TRAN1  
  
select @sqlstr=''  
select @sqlstr = 'Insert into GEN_VehicleExpenses_Line Values('  
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No  ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@SNo  ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Description      ))      + ''''  

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Qty      ))      + ''''  

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Invoice_Value     ))      + '''' 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Others_Desc     ))      + ''''   
  
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @User_Code      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate      + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @User_Code      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate      + '''' + ')'  
print (@sqlstr)  
exec(@sqlstr )  
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveGEN_VehicleFuelEntry_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================
-- Author			:	KRK
-- Create date		:	10/08/2022
-- Modified date	:	12/08/2022

-- Description	:	Save  Vehicle Fuel Entry  LINE (Insert / Update)
--		Delete Vehicle Fuel Entry  Line
-- ========================================================
-- Grant Execute On [sp_Gen_SaveGEN_VehicleFuelEntry_Line] To Public
-- Select * from GEN_VehicleFuelEntry_Line

CREATE Proc [dbo].[sp_Gen_SaveGEN_VehicleFuelEntry_Line]
(  
@Comp_Code					Varchar(10),
@Location_Code				Varchar(10),
@Fin_Year_Code				Varchar(10),
@Entry_No					Varchar(20),
@Entry_Date				Varchar(10),
@SNo						Varchar(3),
@Expense_Type					Varchar(50),
@Description				Varchar(500),
@UOM                 Varchar(10),

@Start_Reading                Varchar(10),
@End_Reading                 Varchar(10),
@Fuel_Qty               Varchar(10),
@Fuel_Cost                 Varchar(10),
@Invoice_Value                 Varchar(10),


   
@Authorize     Varchar(1),  
@Delete_Mode    Varchar(1),  
@Screen_Mode    Varchar(20),  
@User_Code     Varchar(15),  
@iSuccessFlag       bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iServerDate Varchar(19)  
  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
BEGIN TRAN TRAN1  
  
select @sqlstr=''  
select @sqlstr = 'Insert into GEN_VehicleFuelEntry_Line Values('  
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No  ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@SNo  ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Expense_Type      ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Description      ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@UOM      ))      + ''''  

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Start_Reading      ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@End_Reading      ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fuel_Qty      ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fuel_Cost      ))      + ''''  

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Invoice_Value     ))      + ''''   
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @User_Code      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate      + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @User_Code      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate      + '''' + ')'  
print (@sqlstr)  
exec(@sqlstr )  
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveGEN_VehicleFuelEntry_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================
-- Author		:	KRK
-- Create date	:	11/08/2022
-- Modified date	:	01/08/2022

-- Description	:	Save  Vehicle Fuel  Main (Insert / Update)
--		Delete Vehicle Fuel  Main
-- ========================================================
-- Grant Execute On [sp_Gen_SaveGEN_VehicleExpenses_Main] To Public
-- Select * from GEN_VehicleFuelEntry_Main
-- Select * from GEN_VehicleFuelEntry_Line



CREATE Proc [dbo].[sp_Gen_SaveGEN_VehicleFuelEntry_Main]  
(  
@Comp_Code     Varchar(20),  
@Location_Code    Varchar(20),  
@Fin_Year_Code    Varchar(10),  
@Entry_No					Varchar(20),
@Entry_Date				Varchar(10),
@Vehicle_no				Varchar(50),
@Ref_Inv_No    Varchar(100),   
@Ref_Inv_Date    Varchar(10),   
@Tot_Invoice_Value     Varchar(100), 
 


@Remarks    Varchar(1000),  
 
@Authorize     Varchar(1),  
@Delete_Mode    Varchar(1),  
@Screen_Mode    Varchar(20),  
@User_Code     Varchar(15),  
@iSuccessFlag       bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iMode   Numeric(18,0)  
Declare @iServerDate Varchar(19)  
  
Set @iMode=(Select Count(Entry_No) from GEN_VehicleFuelEntry_Main   
Where Comp_Code  = @Comp_Code   
And  Location_Code = @Location_Code  
And  Fin_Year_Code = @Fin_Year_Code  
And  Entry_No  = @Entry_No  
And  Entry_Date = @Entry_Date  
)  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
BEGIN TRAN TRAN1  
select @sqlstr=''  
IF @iMode<=0   
BEGIN  
select @sqlstr = 'Insert into GEN_VehicleFuelEntry_Main Values('  
select @sqlstr= @sqlstr + '''' + ltrim(rtrim(@Comp_Code))     + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Location_Code))   + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Fin_Year_Code))   + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Entry_No))   + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Entry_Date))   + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Vehicle_no))   + ''''
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Ref_Inv_No))   + ''''  
  

select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Ref_Inv_Date))    + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Tot_Invoice_Value))    + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Remarks))   + ''''    
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Authorize))    + ''''  
select @sqlstr= @sqlstr + ',' + '''' + ltrim(rtrim(@Delete_Mode))   + ''''  
select @sqlstr= @sqlstr + ',' + '''' + @User_Code       + ''''  
select @sqlstr= @sqlstr + ',' + '''' + @iServerDate       + ''''   
select @sqlstr= @sqlstr + ',' + '''' + @User_Code       + ''''  
select @sqlstr= @sqlstr + ',' + '''' + @iServerDate       + '''' + ')'  
END  
ELSE IF @iMode=1  
BEGIN  
select @sqlstr = 'Update GEN_VehicleFuelEntry_Main Set '  
select @sqlstr= @sqlstr + ' Vehicle_no='   + '''' + ltrim(rtrim(@Vehicle_no))  + ''''   
select @sqlstr= @sqlstr + ',Ref_Inv_No='    + '''' + ltrim(rtrim(@Ref_Inv_No))   + ''''  

select @sqlstr= @sqlstr + ',Ref_Inv_Date='    + '''' + ltrim(rtrim(@Ref_Inv_Date))   + ''''  
select @sqlstr= @sqlstr + ',Total_Invoice_Value='    + '''' + ltrim(rtrim(@Tot_Invoice_Value))   + ''''   
select @sqlstr= @sqlstr + ',Remarks='   + '''' + ltrim(rtrim(@Remarks))   + ''''   
select @sqlstr= @sqlstr + ',Authorize='    + '''' + ltrim(rtrim(@Authorize))   + ''''  
select @sqlstr= @sqlstr + ',Delete_Mode='   + '''' + ltrim(rtrim(@Delete_Mode))   + ''''  
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))   + ''''  
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate      + ''''  
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code       + ''''  
select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + @Location_Code      + ''''    
select @sqlstr= @sqlstr +  ' And Fin_Year_Code=' + '''' + @Fin_Year_Code      + ''''    
select @sqlstr= @sqlstr +  ' And Entry_No='  + '''' + @Entry_No      + ''''    
select @sqlstr= @sqlstr +  ' And Entry_Date='  + '''' + @Entry_Date      + ''''    
END  
exec(@sqlstr )  
print @sqlstr  
IF @iMode=1  
BEGIN  
select @sqlstr = 'Delete from GEN_VehicleFuelEntry_Line'  
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code + ''''  
select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + @Location_Code + ''''    
select @sqlstr= @sqlstr +  ' And Fin_Year_Code=' + '''' + @Fin_Year_Code + ''''    
select @sqlstr= @sqlstr +  ' And Entry_No='  + '''' + @Entry_No + ''''    
select @sqlstr= @sqlstr +  ' And Entry_Date='  + '''' + @Entry_Date + ''''    
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveGEN_VehiclepassIN_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================  
-- Author  : krk  
-- Create date :24-05-2022
-- Description : Save  Gatepass Return receipt  LINE (Insert / Update)  
--     Delete Gatepass Return  Receipt Line  
-- ========================================================  
-- Grant Execute On [sp_SaveGatepassINReceipt_Line] To Public  
-- Select * from GEN_VehiclepassIN_Line  
  
CREATE Proc [dbo].[sp_Gen_SaveGEN_VehiclepassIN_Line]  
(  
@Comp_Code     Varchar(10),  
@Location_Code    Varchar(10),  
@Fin_Year_Code    Varchar(10),  
@GatePass_IN_No     Varchar(100),  
@GatePass_IN_Date    Varchar(10),  
@SNo      Varchar(3),  
@GatePass_OUT_No     Varchar(100),  
@GatePass_OUT_Date    Varchar(10),  
@Prod_Code     Varchar(500),  
@UOM_Code     Varchar(10),  
@No_Of_QTY                 Varchar(10),  
@Authorize     Varchar(1),  
@Delete_Mode    Varchar(1),  
@Screen_Mode    Varchar(20),  
@User_Code     Varchar(15),  
@iSuccessFlag       bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iServerDate Varchar(19)  
  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
BEGIN TRAN TRAN1  
  
select @sqlstr=''  
select @sqlstr = 'Insert into GEN_VehiclepassIN_Line Values('  
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_IN_No ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_IN_Date ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@SNo))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_OUT_No ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_OUT_Date ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Prod_Code))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@UOM_Code  ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@No_Of_QTY ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))  + ''''  
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''  
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + ''''   
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''  
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + '''' + ')'  
print (@sqlstr)  
exec(@sqlstr )  
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveGEN_VehiclepassIN_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================  
-- Author  : krk  
-- Create date :24-05-2022
-- Description : Save  Gatepass Return receipt  Main (Insert / Update)  
--     Delete Gatepass Return  Receipt Line  
-- ==================================================================  
-- Grant Execute On [sp_Gen_SaveGEN_VehiclepassIN_Line] To Public  
-- Select * from GEN_VehiclepassIN_Main  
-- Select * from GEN_VehiclepassIN_Line  
  
CREATE Proc [dbo].[sp_Gen_SaveGEN_VehiclepassIN_Main]  
(  
@Comp_Code     Varchar(10),  
@Location_Code    Varchar(10),  
@Fin_Year_Code    Varchar(10),  
@GatePass_IN_No     Varchar(100),  
@GatePass_IN_Date    Varchar(10),  
@From_Company    Varchar(100),  
@Total_Items  Varchar(10),  
@Remarks   Varchar(1000),  
@Authorize     Varchar(1),  
@Delete_Mode    Varchar(1),  
@Screen_Mode    Varchar(20),  
@User_Code     Varchar(15),  
@iSuccessFlag       bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iMode   Numeric(18,0)  
Declare @iServerDate Varchar(19)  
  
Set @iMode=(  
    Select Count(GatePass_IN_No) from GEN_VehiclepassIN_Main   
    Where Comp_Code  = @Comp_Code   
    And  Location_Code = @Location_Code  
    And  Fin_Year_Code = @Fin_Year_Code  
    And  GatePass_IN_No   = @GatePass_IN_No   
    And  GatePass_IN_Date   = @GatePass_IN_Date  
   )  
  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
BEGIN TRAN TRAN1  
select @sqlstr=''  
IF @iMode<=0   
BEGIN  
select @sqlstr = 'Insert into GEN_VehiclepassIN_Main Values('  
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_IN_No ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_IN_Date  ))     + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@From_Company ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Total_Items  ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Remarks   ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))     + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + '''' + ')'  
END  
ELSE IF @iMode=1  
BEGIN  
select @sqlstr = 'Update GEN_VehiclepassIN_Main Set '  
select @sqlstr= @sqlstr + 'From_Company='    + '''' + ltrim(rtrim(@From_Company))    + ''''  
select @sqlstr= @sqlstr + ',Total_Items='   + '''' + ltrim(rtrim(@Total_Items  ))   + ''''  
  
select @sqlstr= @sqlstr + ',Remarks='    + '''' + ltrim(rtrim(@Remarks ))    + ''''  
select @sqlstr= @sqlstr + ',Authorize='    + '''' + ltrim(rtrim(@Authorize))    + ''''  
select @sqlstr= @sqlstr + ',Delete_Mode='   + '''' + ltrim(rtrim(@Delete_Mode))    + ''''  
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))    + ''''  
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate       + ''''  
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code        + ''''  
select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + @Location_Code       + ''''    
select @sqlstr= @sqlstr +  ' And Fin_Year_Code=' + '''' + @Fin_Year_Code       + ''''    
select @sqlstr= @sqlstr +  ' And GatePass_IN_No ='   + '''' + @GatePass_IN_No          + ''''    
select @sqlstr= @sqlstr +  ' And GatePass_IN_Date='   + '''' + @GatePass_IN_Date         + ''''    
END  
exec(@sqlstr )  
print @sqlstr  
IF @iMode=1  
BEGIN  
select @sqlstr = 'Delete from GEN_VehiclepassIN_Line'  
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + @Location_Code  + ''''    
select @sqlstr= @sqlstr +  ' And Fin_Year_Code=' + '''' + @Fin_Year_Code  + ''''    
select @sqlstr= @sqlstr +  ' And GatePass_IN_No='   + '''' +  @GatePass_IN_No    + ''''    
select @sqlstr= @sqlstr +  ' And GatePass_IN_Date='   + '''' + @GatePass_IN_Date    + ''''    
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveGEN_VehiclepassOUT_Line]    Script Date: 25/04/2023 16:39:56 ******/
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
-- Select * from GEN_VehiclepassOUT_Line

CREATE Proc [dbo].[sp_Gen_SaveGEN_VehiclepassOUT_Line]
(
@Comp_Code					Varchar(10),
@Location_Code				Varchar(10),
@Fin_Year_Code				Varchar(10),
@Gpass_No					Varchar(100),
@Gpass_Date				Varchar(10),
@SNo						Varchar(3),
@Prod_Code					Varchar(500),
@Net_Meters					Varchar(50),

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
				Select Count(Gpass_No) from GEN_VehiclepassOUT_Line 
				Where	Comp_Code		=	@Comp_Code 
				And		Location_Code	=	@Location_Code
				--And		Fin_Year_Code	=	@Fin_Year_Code
				And		Gpass_No			=	@Gpass_No 
				And	 Gpass_Date 		=	@Gpass_Date
				And	 Prod_Code 		=	@Prod_Code
				And  UOM_Code		=   @UOM_Code
			)

Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))

BEGIN TRAN TRAN1
select @sqlstr=''
IF @iMode<=0 
BEGIN

--Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))

--BEGIN TRAN TRAN1

select @sqlstr=''
select @sqlstr = 'Insert into GEN_VehiclepassOUT_Line Values('
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))		+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))		+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Gpass_No ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Gpass_Date ))			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@SNo))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Prod_Code))			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Net_Meters))			+ ''''

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
select @sqlstr = 'UpdatE GEN_VehiclepassOUT_Line Set '
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveGEN_VehiclepassOUT_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Author		:	KRK
-- Create date	:	09/05/2022
-- Description	:	Save  Gatepass out receipt  Main (Insert / Update)
--					Delete Gatepass Out  Receipt Line
-- ==================================================================
-- Grant Execute On [sp_Gen_SaveGEN_VehiclepassOUT_Main] To Public
-- Select * from GEN_VehiclepassOUT_Main
-- Select * from GEN_VehiclepassOUT_Line

CREATE Proc [dbo].[sp_Gen_SaveGEN_VehiclepassOUT_Main]
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
				Select Count(Gpass_No) from GEN_VehiclepassOUT_Main 
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
select @sqlstr = 'Insert into GEN_VehiclepassOUT_Main Values('
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

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate								+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate								+ '''' + ')'
END
ELSE IF @iMode=1
BEGIN
select @sqlstr = 'Update GEN_VehiclepassOUT_Main Set '
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
select @sqlstr = 'Delete from GEN_VehiclepassOUT_Line'
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveMaterialpassIN_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================  
-- Author  : krk  
-- Create date :24-05-2022
-- Description : Save  Gatepass Return receipt  LINE (Insert / Update)  
--     Delete Gatepass Return  Receipt Line  
-- ========================================================  
-- Grant Execute On [sp_Gen_SaveMaterialpassIN_Line] To Public  
-- Select * from GEN_MaterialpassIN_Line  
  
create Proc [dbo].[sp_Gen_SaveMaterialpassIN_Line]  
(  
@Comp_Code     Varchar(10),  
@Location_Code    Varchar(10),  
@Fin_Year_Code    Varchar(10),  
@GatePass_IN_No     Varchar(100),  
@GatePass_IN_Date    Varchar(10),  
@SNo      Varchar(3),  
@GatePass_OUT_No     Varchar(100),  
@GatePass_OUT_Date    Varchar(10),  
@Prod_Code     Varchar(500),  
@UOM_Code     Varchar(10),  
@No_Of_QTY                 Varchar(10),  
@Authorize     Varchar(1),  
@Delete_Mode    Varchar(1),  
@Screen_Mode    Varchar(20),  
@User_Code     Varchar(15),  
@iSuccessFlag       bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iServerDate Varchar(19)  
  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
BEGIN TRAN TRAN1  
  
select @sqlstr=''  
select @sqlstr = 'Insert into GEN_MaterialpassIN_Line Values('  
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_IN_No ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_IN_Date ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@SNo))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_OUT_No ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_OUT_Date ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Prod_Code))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@UOM_Code  ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@No_Of_QTY ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))  + ''''  
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''  
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + ''''   
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''  
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + '''' + ')'  
print (@sqlstr)  
exec(@sqlstr )  
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveMaterialpassIN_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================  
-- Author  : krk  
-- Create date :24-05-2022
-- Description : Save  Gatepass Return receipt  Main (Insert / Update)  
--     Delete Gatepass Return  Receipt Line  
-- ==================================================================  
-- Grant Execute On [sp_Gen_SaveGEN_MaterialpassIN_Line] To Public  
-- Select * from GEN_MaterialpassIN_Main  
-- Select * from GEN_MaterialpassIN_Line  
  
create Proc [dbo].[sp_Gen_SaveMaterialpassIN_Main]  
(  
@Comp_Code     Varchar(10),  
@Location_Code    Varchar(10),  
@Fin_Year_Code    Varchar(10),  
@GatePass_IN_No     Varchar(100),  
@GatePass_IN_Date    Varchar(10),  
@From_Company    Varchar(100),  
@Total_Items  Varchar(10),  
@Remarks   Varchar(1000),  
@Authorize     Varchar(1),  
@Delete_Mode    Varchar(1),  
@Screen_Mode    Varchar(20),  
@User_Code     Varchar(15),  
@iSuccessFlag       bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iMode   Numeric(18,0)  
Declare @iServerDate Varchar(19)  
  
Set @iMode=(  
    Select Count(GatePass_IN_No) from GEN_MaterialpassIN_Main   
    Where Comp_Code  = @Comp_Code   
    And  Location_Code = @Location_Code  
    And  Fin_Year_Code = @Fin_Year_Code  
    And  GatePass_IN_No   = @GatePass_IN_No   
    And  GatePass_IN_Date   = @GatePass_IN_Date  
   )  
  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
BEGIN TRAN TRAN1  
select @sqlstr=''  
IF @iMode<=0   
BEGIN  
select @sqlstr = 'Insert into GEN_MaterialpassIN_Main Values('  
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_IN_No ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_IN_Date  ))     + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@From_Company ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Total_Items  ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Remarks   ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))     + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + '''' + ')'  
END  
ELSE IF @iMode=1  
BEGIN  
select @sqlstr = 'Update GEN_MaterialpassIN_Main Set '  
select @sqlstr= @sqlstr + 'From_Company='    + '''' + ltrim(rtrim(@From_Company))    + ''''  
select @sqlstr= @sqlstr + ',Total_Items='   + '''' + ltrim(rtrim(@Total_Items  ))   + ''''  
  
select @sqlstr= @sqlstr + ',Remarks='    + '''' + ltrim(rtrim(@Remarks ))    + ''''  
select @sqlstr= @sqlstr + ',Authorize='    + '''' + ltrim(rtrim(@Authorize))    + ''''  
select @sqlstr= @sqlstr + ',Delete_Mode='   + '''' + ltrim(rtrim(@Delete_Mode))    + ''''  
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))    + ''''  
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate       + ''''  
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code        + ''''  
select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + @Location_Code       + ''''    
select @sqlstr= @sqlstr +  ' And Fin_Year_Code=' + '''' + @Fin_Year_Code       + ''''    
select @sqlstr= @sqlstr +  ' And GatePass_IN_No ='   + '''' + @GatePass_IN_No          + ''''    
select @sqlstr= @sqlstr +  ' And GatePass_IN_Date='   + '''' + @GatePass_IN_Date         + ''''    
END  
exec(@sqlstr )  
print @sqlstr  
IF @iMode=1  
BEGIN  
select @sqlstr = 'Delete from GEN_MaterialpassIN_Line'  
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + @Location_Code  + ''''    
select @sqlstr= @sqlstr +  ' And Fin_Year_Code=' + '''' + @Fin_Year_Code  + ''''    
select @sqlstr= @sqlstr +  ' And GatePass_IN_No='   + '''' +  @GatePass_IN_No    + ''''    
select @sqlstr= @sqlstr +  ' And GatePass_IN_Date='   + '''' + @GatePass_IN_Date    + ''''    
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_Saveparty_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================
-- Author		:	KRK
-- Create date	:27/05/2022
-- Modify date	:	27/02/2014
-- Description	:	Save Gatepass party  (Insert / Update)
-- ========================================================
-- Grant Execute On [[sp_SaveGpparty_Details]] To Public
-- Select * from GP_Party_Master

CREATE Proc [dbo].[sp_Gen_Saveparty_Details]
(

@Comp_Code					Varchar(10),
@Party_Code				Varchar(50),

@Sender_Recvr_Name				Varchar(300),
@Type			Varchar(300),
@IsActive    varchar(200), 
@Screen_Mode	Varchar(20),
@User_Code					Varchar(15),
@iSuccessFlag			    Bit	output
)
as
set nocount on
set dateformat ymd
Declare @sqlstr varchar(8000)
Declare @iMode  numeric(18,0)
Declare @iServerDate Varchar(19)
Declare @iNew_Code		Varchar(10)


Set @iMode=(Select Count(Sender_Recvr_Name) from DB_General ..GEN_Party_Master
Where Comp_Code=@Comp_Code And Party_Code=@Party_Code )

Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))

IF @Party_Code	 ='' 
BEGIN
	Set @iNew_Code=(Select Substring(@Sender_Recvr_Name	,1,3) 
					+(Select RIGHT('000000'+ CONVERT(VARCHAR(7),Count(Party_Code)+1),7) 
						From GEN_Party_Master))
END
ELSE
BEGIN
	Set @iNew_Code=@Party_Code
END

BEGIN TRAN TRAN1
select @sqlstr=''
IF @iMode<=0 
BEGIN
select @sqlstr = 'Insert into GEN_Party_Master Values('
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))	+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iNew_Code			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @Sender_Recvr_Name			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @Type 			+ ''''

select @sqlstr= @sqlstr + ','+ '''' + @IsActive 			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @User_Code			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate			+'''' 
select @sqlstr= @sqlstr + ','+ '''' + @User_Code			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate			+'''' + ')'
END
ELSE IF @iMode=1
BEGIN
select @sqlstr = 'Update GEN_Party_Master Set '

select @sqlstr= @sqlstr + 'Sender_Recvr_Name='	+ '''' + @Sender_Recvr_Name 				+ ''''
select @sqlstr= @sqlstr + ',Type='	+ '''' + @Type  				+ ''''
select @sqlstr= @sqlstr + ',Modified_By='	+ '''' + ltrim(rtrim(@User_Code))	+ ''''
select @sqlstr= @sqlstr + ',Modified_Date='	+ '''' + @iServerDate				+ ''''
select @sqlstr= @sqlstr + ' Where Comp_Code='+ '''' + @Comp_Code					+ '''' 
select @sqlstr= @sqlstr + ' And Party_Code='	+ '''' + @iNew_Code 					+ '''' 
END
--exec(@sqlstr )
--IF (@@error <> 0) goto ErrHand
--COMMIT TRAN TRAN1
----select @iSuccessFlag=1

--select @Party_Code =@iNew_Code
--return
--ErrHand:
--BEGIN
--	ROLLBACK TRAN TRAN1
----	select @Party_Code =@iNew_Code
--select @iSuccessFlag=0
	
--END

exec(@sqlstr )
print (@sqlstr)
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveVehiclepassIN_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================  
-- Author  : krk  
-- Create date :24-05-2022
-- Description : Save  Gatepass Return receipt  LINE (Insert / Update)  
--     Delete Gatepass Return  Receipt Line  
-- ========================================================  
-- Grant Execute On [sp_SaveGatepassINReceipt_Line] To Public  
-- Select * from GEN_VehiclepassIN_Line  
  
create Proc [dbo].[sp_Gen_SaveVehiclepassIN_Line]  
(  
@Comp_Code     Varchar(10),  
@Location_Code    Varchar(10),  
@Fin_Year_Code    Varchar(10),  
@GatePass_IN_No     Varchar(100),  
@GatePass_IN_Date    Varchar(10),  
@SNo      Varchar(3),  
@GatePass_OUT_No     Varchar(100),  
@GatePass_OUT_Date    Varchar(10),  
@Prod_Code     Varchar(500),  
@UOM_Code     Varchar(10),  
@No_Of_QTY                 Varchar(10),  
@Authorize     Varchar(1),  
@Delete_Mode    Varchar(1),  
@Screen_Mode    Varchar(20),  
@User_Code     Varchar(15),  
@iSuccessFlag       bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iServerDate Varchar(19)  
  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
BEGIN TRAN TRAN1  
  
select @sqlstr=''  
select @sqlstr = 'Insert into GEN_VehiclepassIN_Line Values('  
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_IN_No ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_IN_Date ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@SNo))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_OUT_No ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_OUT_Date ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Prod_Code))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@UOM_Code  ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@No_Of_QTY ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))  + ''''  
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''  
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + ''''   
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''  
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + '''' + ')'  
print (@sqlstr)  
exec(@sqlstr )  
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
/****** Object:  StoredProcedure [dbo].[sp_Gen_SaveVehiclepassIN_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================  
-- Author  : krk  
-- Create date :24-05-2022
-- Description : Save  Gatepass Return receipt  Main (Insert / Update)  
--     Delete Gatepass Return  Receipt Line  
-- ==================================================================  
-- Grant Execute On [sp_Gen_SaveGEN_VehiclepassIN_Line] To Public  
-- Select * from GEN_VehiclepassIN_Main  
-- Select * from GEN_VehiclepassIN_Line  
  
create Proc [dbo].[sp_Gen_SaveVehiclepassIN_Main]  
(  
@Comp_Code     Varchar(10),  
@Location_Code    Varchar(10),  
@Fin_Year_Code    Varchar(10),  
@GatePass_IN_No     Varchar(100),  
@GatePass_IN_Date    Varchar(10),  
@From_Company    Varchar(100),  
@Total_Items  Varchar(10),  
@Remarks   Varchar(1000),  
@Authorize     Varchar(1),  
@Delete_Mode    Varchar(1),  
@Screen_Mode    Varchar(20),  
@User_Code     Varchar(15),  
@iSuccessFlag       bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iMode   Numeric(18,0)  
Declare @iServerDate Varchar(19)  
  
Set @iMode=(  
    Select Count(GatePass_IN_No) from GEN_VehiclepassIN_Main   
    Where Comp_Code  = @Comp_Code   
    And  Location_Code = @Location_Code  
    And  Fin_Year_Code = @Fin_Year_Code  
    And  GatePass_IN_No   = @GatePass_IN_No   
    And  GatePass_IN_Date   = @GatePass_IN_Date  
   )  
  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
BEGIN TRAN TRAN1  
select @sqlstr=''  
IF @iMode<=0   
BEGIN  
select @sqlstr = 'Insert into GEN_VehiclepassIN_Main Values('  
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_IN_No ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GatePass_IN_Date  ))     + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@From_Company ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Total_Items  ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Remarks   ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))     + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + '''' + ')'  
END  
ELSE IF @iMode=1  
BEGIN  
select @sqlstr = 'Update GEN_VehiclepassIN_Main Set '  
select @sqlstr= @sqlstr + 'From_Company='    + '''' + ltrim(rtrim(@From_Company))    + ''''  
select @sqlstr= @sqlstr + ',Total_Items='   + '''' + ltrim(rtrim(@Total_Items  ))   + ''''  
  
select @sqlstr= @sqlstr + ',Remarks='    + '''' + ltrim(rtrim(@Remarks ))    + ''''  
select @sqlstr= @sqlstr + ',Authorize='    + '''' + ltrim(rtrim(@Authorize))    + ''''  
select @sqlstr= @sqlstr + ',Delete_Mode='   + '''' + ltrim(rtrim(@Delete_Mode))    + ''''  
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))    + ''''  
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate       + ''''  
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code        + ''''  
select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + @Location_Code       + ''''    
select @sqlstr= @sqlstr +  ' And Fin_Year_Code=' + '''' + @Fin_Year_Code       + ''''    
select @sqlstr= @sqlstr +  ' And GatePass_IN_No ='   + '''' + @GatePass_IN_No          + ''''    
select @sqlstr= @sqlstr +  ' And GatePass_IN_Date='   + '''' + @GatePass_IN_Date         + ''''    
END  
exec(@sqlstr )  
print @sqlstr  
IF @iMode=1  
BEGIN  
select @sqlstr = 'Delete from GEN_VehiclepassIN_Line'  
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + @Location_Code  + ''''    
select @sqlstr= @sqlstr +  ' And Fin_Year_Code=' + '''' + @Fin_Year_Code  + ''''    
select @sqlstr= @sqlstr +  ' And GatePass_IN_No='   + '''' +  @GatePass_IN_No    + ''''    
select @sqlstr= @sqlstr +  ' And GatePass_IN_Date='   + '''' + @GatePass_IN_Date    + ''''    
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
/****** Object:  StoredProcedure [dbo].[sp_GEN_VehiclepassOUT_Details]    Script Date: 25/04/2023 16:39:56 ******/
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
-- select * from GEN_VehiclepassOUT_lINE  
-- select * from GEN_VehiclepassOUT_Main  
---exec sp_GEN_VehiclepassOUT_Details '100','THENI','1','','ALL'
  
CREATE Proc [dbo].[sp_GEN_VehiclepassOUT_Details]  
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
select @sqlstr = @sqlstr + ' ,a.Total_Items,A.Total_Netwt,a.Remarks'   
select @sqlstr = @sqlstr + ' ,A.Ref_Inv_No,A.Ref_Inv_Date,A.Department,A.Vehicle_no,A.Delivery_Location  '

select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code,b.UOM_Code,b.No_Of_Qty,b.Net_wt'  
select @sqlstr = @sqlstr + ', a.Comp_Code,a.Location_Code,a.Fin_Year_Code'  
   
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
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


select @sqlstr = @sqlstr + ',From_Company,To_Company,Delivered_By,Total_Items,Remarks'  
select @sqlstr = @sqlstr + ' ,Ref_Inv_No,Ref_Inv_Date,Department,Vehicle_no,Delivery_Location  '
select @sqlstr = @sqlstr + ',Authorize as [Authorize]'  

  
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main  '  
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
select @sqlstr = @sqlstr + ' ,a.Total_Items,A.Total_Netwt,a.Remarks'   
select @sqlstr = @sqlstr + ' ,A.Ref_Inv_No,A.Ref_Inv_Date,A.Department,A.Vehicle_no,A.Delivery_Location  '

select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code,b.UOM_Code,b.No_Of_Qty,b.Net_wt'  
select @sqlstr = @sqlstr + ', a.Comp_Code,a.Location_Code,a.Fin_Year_Code'  
select @sqlstr = @sqlstr + ',a.Modified_Date as [Modified_Date],a.Modified_By,a.Created_Date,a.Created_By'  

   
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
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
select @sqlstr = @sqlstr + ' ,a.Total_Items,A.Total_Netwt,a.Remarks'   
select @sqlstr = @sqlstr + ' ,A.Ref_Inv_No,A.Ref_Inv_Date,A.Department,A.Vehicle_no,A.Delivery_Location  '

select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code,b.UOM_Code,b.No_Of_Qty,b.Net_wt'  
select @sqlstr = @sqlstr + ', a.Comp_Code,a.Location_Code,a.Fin_Year_Code'  
select @sqlstr = @sqlstr + ',a.Modified_Date as [Modified_Date],a.Modified_By,a.Created_Date,a.Created_By'  

   
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
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
/****** Object:  StoredProcedure [dbo].[sp_GetVehiclepassCheckList_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================  
-- Author  : krk  
-- Create date :24-05-2022 
-- Description : Get SGatepass Transaction  Details)  
-- ===============================================================  
-- Grant Execute On [sp_GetGatepassTrans_Details] To Public  
-- select * from GEN_VehiclepassOUT_Line  
-- select * from GEN_VehiclepassOUT_Main  
-- select * from GEN_VehiclepassIN_Line  
-- exec [sp_GetVehiclepassCheckList_Details] 'LS MILLS','WEAVING','3','','ALL','','2014-04-01','2014-04-30','Monthly_ReturnList'  
  
CREATE Proc [dbo].[sp_GetVehiclepassCheckList_Details]  
(  
@Comp_Code    Varchar(10),  
@Location_Code   Varchar(10),  
@Fin_Year_Code   Varchar(10),  
@Issued_Dept     Varchar(100),  
@Party_Name     Varchar(100),  
@Product_name     Varchar(100),  
@from_Date           varchar(50),  
@To_Date           varchar(50),  
@Mode     Varchar(100)  
)  
  
as  
BEGIN  
set nocount on  
set dateformat ymd  
Declare @sqlstr varchar(8000)  
print @Comp_Code  
Declare @mLocation_Code Varchar(10)  
Set @mLocation_Code=''  
Declare @mPartyname Varchar(100)  
Set @mPartyname=''  
Declare @mIssueddept Varchar(100)  
Set @mIssueddept =''  
Declare @mproduct_code Varchar(100)  
Set @mproduct_code =''  
  
IF LTRIM(RTRIM(@Location_Code))='ALL'  
BEGIN  
Set @mLocation_Code='%'  
END  
ELSE  
BEGIN  
Set @mLocation_Code=@Location_Code   
END  
  
IF LTRIM(RTRIM(@Party_Name ))='ALL' or LTRIM(RTRIM(@Party_Name ))=''  
BEGIN  
Set @mPartyname ='%'  
END  
ELSE  
BEGIN  
Set @mPartyname=@Party_Name  
END  
  
IF LTRIM(RTRIM(@Issued_Dept  ))='ALL' or LTRIM(RTRIM(@Issued_Dept ))=''  
BEGIN  
Set @mIssueddept  ='%'  
END  
ELSE  
BEGIN  
Set @mIssueddept=@Issued_Dept  
END  
  
IF LTRIM(RTRIM(@Product_name  ))='ALL' or LTRIM(RTRIM(@Product_name ))=''  
BEGIN  
Set @mproduct_code   ='%'  
END  
ELSE  
BEGIN  
Set @mproduct_code=@Product_name   
END  
  
IF   
 (   
  ltrim(rtrim(@mode))= 'Monthly_checkList'   
    
  )  
  
BEGIN  
  
  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as GatepassOUT_No,a.Gpass_Date as GatepassOUT_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as To_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Product_Desc,b.UOM_Code as UOM_Code,b.No_Of_Qty as Send_Qty'  
select @sqlstr = @sqlstr + ',isnull(sum(C.No_Of_Qty),''0'') as All_Recd_Qty'  
select @sqlstr = @sqlstr + ',isnull(b.IS_Closed ,''0'') as IS_Closed'  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + '  And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
select @sqlstr = @sqlstr + '  And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
Select @sqlstr = @sqlstr + 'and a.To_Company like ' + ''''  + @mPartyname   + ''''       
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mIssueddept    + ''''      
Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + ''''       
   
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.Gpass_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_Date <='+ '''' + @To_Date+ ''''  
   
   
select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty,b.IS_Closed'  
  
end   
end   
  
  
IF   
 (   
  ltrim(rtrim(@mode))= 'Monthly_ReturnList'   
    
  )  
  
BEGIN  
  
  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as Gpass_No ,a.Gpass_Date as Gpass_Date ,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as To_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Prod_Code ,b.UOM_Code as UOM_Code,b.No_Of_Qty as No_Of_Qty'  
--select @sqlstr = @sqlstr + ',isnull(sum(C.No_Of_Qty),''0'') as Gin_No_Of_Qty'  
select @sqlstr = @sqlstr + ',isnull((C.No_Of_Qty),''0'') as Gin_No_Of_Qty'  
  
select @sqlstr = @sqlstr + ',isnull(b.IS_Closed ,''0'') as IS_Closed,c.GatePass_IN_No as GatePass_IN_No  ,c.GatePass_IN_Date as GatePass_IN_Date   '  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
  
select @sqlstr = @sqlstr + ' left Join DB_General..GEN_VehiclepassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + ' And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
  
select @sqlstr = @sqlstr + ' Right Join DB_General..GEN_VehiclepassIN_Line c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
select @sqlstr = @sqlstr + '  And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
Select @sqlstr = @sqlstr + 'and a.To_Company like ' + ''''  + @mPartyname   + ''''       
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mIssueddept    + ''''      
Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + ''''       
   
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.Gpass_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_Date <='+ '''' + @To_Date+ ''''  
   
   
select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty,C.No_Of_Qty,b.IS_Closed,c.GatePass_IN_No ,c.GatePass_IN_Date '  
select @sqlstr = @sqlstr + ' Order by c.GatePass_IN_No ,c.GatePass_IN_Date '  
  
end   
end   
  
  
IF   
 (   
  ltrim(rtrim(@mode))= 'Return'   
    
  )  
  
BEGIN  
  
  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as Gpass_No,a.Gpass_Date as Gpass_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as To_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Prod_Code,b.UOM_Code as UOM_Code,b.No_Of_Qty as No_Of_Qty'  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code = b.Fin_Year_Code And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
Select @sqlstr = @sqlstr + 'and a.To_Company like ' + ''''  + @mPartyname   + ''''       
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mIssueddept    + ''''      
Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + ''''       
Select @sqlstr = @sqlstr + 'and b.Return_Type=' + '''' + 'RETURN' + ''''  
  
   
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.Gpass_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_Date <='+ '''' + @To_Date+ ''''  
 select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty,b.IS_Closed '  
  
end   
end   
  
  
IF   
 (   
  ltrim(rtrim(@mode))= 'NOT-Return'   
    
  )  
  
BEGIN  
  
  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No as Gpass_No,a.Gpass_Date as Gpass_Date,a.DC_No,a.DC_Date'  
select @sqlstr = @sqlstr + ',a.From_Company,a.To_Company as To_Company,a.Delivered_By,b.Return_Type,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Prod_Code,b.UOM_Code as UOM_Code,b.No_Of_Qty as No_Of_Qty'  
  
select @sqlstr = @sqlstr + ' from DB_General..GEN_VehiclepassOUT_Main a'  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code = b.Fin_Year_Code And a.Gpass_No=b.Gpass_No '  
select @sqlstr = @sqlstr + ' And a.Gpass_Date=b.Gpass_Date'  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
Select @sqlstr = @sqlstr + 'and a.To_Company like ' + ''''  + @mPartyname   + ''''       
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mIssueddept    + ''''      
Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + ''''       
 Select @sqlstr = @sqlstr + 'and b.Return_Type=' + '''' + 'NOT RETURN' + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.Gpass_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.Gpass_Date <='+ '''' + @To_Date+ ''''  
 select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.Gpass_No ,a.Gpass_Date ,a.DC_No,a.DC_Date,a.From_Company,a.To_Company ,a.Delivered_By,b.Return_Type,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty,b.IS_Closed '  
  
end   
end   
  
  
IF   
 (   
  ltrim(rtrim(@mode))= 'GatepassIN'   
    
  )  
  
BEGIN  
  
  
select @sqlstr = 'select a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.GatePass_IN_No as Gpass_No ,a.GatePass_IN_Date as Gpass_Date'  
select @sqlstr = @sqlstr + ',a.From_Company as To_Company,a.Total_Items'  
select @sqlstr = @sqlstr + ',b.SNo,b.Prod_Code as Prod_Code,b.UOM_Code as UOM_Code,b.No_Of_Qty as No_Of_Qty'  
select @sqlstr = @sqlstr + ',c.From_Company ,c.Delivered_By'  
select @sqlstr = @sqlstr + ' from DB_General..GEN_GatepassIN_Main a'  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassIN_Line b'  
select @sqlstr = @sqlstr + ' On a.Comp_Code=b.Comp_Code And a.Location_Code = b.Location_Code'  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code = b.Fin_Year_Code And a.GatePass_IN_No=b.GatePass_IN_No '  
select @sqlstr = @sqlstr + ' And a.GatePass_IN_Date=b.GatePass_IN_Date'  
  
select @sqlstr = @sqlstr + ' Left Outer Join DB_General..GEN_VehiclepassOUT_Main c'  
select @sqlstr = @sqlstr + ' On b.Comp_Code=c.Comp_Code And b.Location_Code = c.Location_Code'  
select @sqlstr = @sqlstr + ' And b.Fin_Year_Code = c.Fin_Year_Code And b.Gpass_No=c.Gpass_No '  
--select @sqlstr = @sqlstr + ' And b.Gpass_Date=c.Gpass_Date'  
--select @sqlstr = @sqlstr + ' And b.Prod_Code=c.Prod_Code'  
  
  
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''  
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''  
Select @sqlstr = @sqlstr + 'and a.From_Company like ' + ''''  + @mPartyname   + ''''       
Select @sqlstr = @sqlstr + 'and c.From_Company like ' + ''''  + @mIssueddept    + ''''      
Select @sqlstr = @sqlstr + 'and b.Prod_Code like ' + ''''  + @mproduct_code    + ''''       
 --Select @sqlstr = @sqlstr + 'and b.Return_Type=' + '''' + 'RETURN' + ''''  
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '  
--select @sqlstr = @sqlstr + ' And b.IS_Closed=0'  
  
IF ltrim(rtrim(@From_Date)) <> '' And ltrim(rtrim(@To_Date)) <> ''  
BEGIN  
select @sqlstr = @sqlstr + ' And a.GatePass_IN_Date >='+ '''' + @From_Date+ ''''  
select @sqlstr = @sqlstr + ' And a.GatePass_IN_Date <='+ '''' + @To_Date+ ''''  
 select @sqlstr = @sqlstr + ' group by  a.Comp_Code,a.Location_Code,a.Fin_Year_Code,a.GatePass_IN_No ,a.GatePass_IN_Date ,a.From_Company,c.From_Company ,c.Delivered_By,a.Total_Items,b.SNo'  
select @sqlstr = @sqlstr + ' ,b.Prod_Code ,b.UOM_Code ,b.No_Of_Qty '  
  
end   
end   
  
  
print (@sqlstr)  
exec(@sqlstr)  
END  


GO
/****** Object:  StoredProcedure [dbo].[sp_PM_GetActivity_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author  : Rajkumr    
-- Create date : 12/06/2020    
    
-- Description : Get YArn COunt  Details    
-- =============================================    
-- Grant Execute On [[sp_GetGPparty_Details]] To Public    
-- Execute [sp_GetGPparty_Details] 'LS MILLS','','',''    
-- exec [sp_PM_GetActivity_Details] '100','THENI','1','Specific'    
    
CREATE Proc [dbo].[sp_PM_GetActivity_Details]    
    
(    
@Comp_Code    Varchar(10),    
@Location_Code    Varchar(10),    
  
@Act_ID     Varchar(100),    
@Filter_Data   Varchar(30)    
)    
as    
BEGIN    
set nocount on    
set dateformat ymd    
Declare @sqlstr varchar(8000)    
    
IF     
 (    
   @Filter_Data = 'ALL'    
  --And @Party_Name    <> ''    
 )    
BEGIN    
    
select @sqlstr = 'select Comp_Code,Location_Code '  
  
  
select @sqlstr = @sqlstr + ' ,ACT_ID,Dept_Code,Dept_Name   '  
select @sqlstr = @sqlstr + ' ,Act_Type_ID,Act_Type,OPER_ID,OPER_Name   '  
select @sqlstr = @sqlstr + ' ,Frequency,Duaration,Persons_involved,Tollerance   '  
select @sqlstr = @sqlstr + ' ,Remarks,IsActive   '  
  
  
select @sqlstr = @sqlstr + ' from  [PM_Activity_Master]'    
select @sqlstr = @sqlstr + ' Where Comp_Code='  + '''' + @Comp_Code   + ''''    
select @sqlstr = @sqlstr + ' Order by Act_ID'    
    
END    
    
ELSE IF @Filter_Data = 'Specify'    
BEGIN    
select @sqlstr = 'select Comp_Code,Location_Code '  
  
select @sqlstr = @sqlstr + ' ,ACT_ID,Dept_Code,Dept_Name   '  
select @sqlstr = @sqlstr + ' ,Act_Type_ID,Act_Type,OPER_ID,OPER_Name   '  
select @sqlstr = @sqlstr + ' ,Frequency,Duaration,Persons_involved,Tollerance   '  
select @sqlstr = @sqlstr + ' ,Remarks,IsActive   '  
select @sqlstr = @sqlstr + ' ,Created_By,Created_Date,Modified_By,Modified_Date'    
select @sqlstr = @sqlstr + ' from  [PM_Activity_Master]'    
select @sqlstr = @sqlstr + ' Where Comp_Code='   + '''' + @Comp_Code   + '''' 
select @sqlstr = @sqlstr + ' and Act_ID='   + '''' + @Act_ID   + ''''    

    
    
select @sqlstr = @sqlstr + ' Order by Act_ID'    
END    
    
print (@sqlstr)    
exec(@sqlstr)    
END



GO
/****** Object:  StoredProcedure [dbo].[sp_PM_GetActivity_Report]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================          
-- Author  : Rajkumr          
-- Create date : 12/06/2020          
          
-- Description : Get YArn COunt  Details          
-- =============================================          
-- Grant Execute On [[sp_GetGPparty_Details]] To Public          
-- Execute [sp_PM_GetActivity_Report] '100','THENI','BLOWROOM','','','Deptwise_Activity'     
-- exec [sp_PM_GetActivity_Report] '100','THENI','1','Specific'          
          
CREATE Proc [dbo].[sp_PM_GetActivity_Report]          
          
(          
@Comp_Code    Varchar(10),          
@Location_Code    Varchar(10),          
@Dept_Name    Varchar(100),          
        
@Act_Type     Varchar(100),     
@Act_ID    Varchar(100),     
@Filter_Data   Varchar(100)          
)          
as          
BEGIN          
set nocount on          
set dateformat ymd          
Declare @sqlstr varchar(8000)          
    Declare @mDeptname Varchar(100)      
Set @mDeptname=''      
Declare @mAct_Type Varchar(100)      
Set @mAct_Type=''      
    
    
IF LTRIM(RTRIM(@Dept_Name))='ALL'   or LTRIM(RTRIM(@Dept_Name))=''      
BEGIN      
Set @mDeptname='%'      
END      
ELSE      
BEGIN      
Set @mDeptname=@Dept_Name       
END      
      
      
IF LTRIM(RTRIM(@Act_Type  ))='ALL' or LTRIM(RTRIM(@Act_Type ))=''      
BEGIN      
Set @mAct_Type ='%'      
END      
ELSE      
BEGIN      
Set @mAct_Type =@Act_Type        
END      
      
    
    
    
IF           
 (          
   @Filter_Data = 'Deptwise_Activity'          
  --And @Party_Name    <> ''          
 )          
BEGIN          
          
select @sqlstr = 'select  '        
        
select @sqlstr = @sqlstr + ' Dept_Name,Act_Type,OPER_Name   '        
        
select @sqlstr = @sqlstr + ' ,Frequency,Duaration,Persons_involved,Tollerance   '        
select @sqlstr = @sqlstr + ' ,Act_Type_ID,ACT_ID,OPER_ID,Dept_Code   '        
    
select @sqlstr = @sqlstr + ' ,Remarks,IsActive  Comp_Code,Location_Code  '        
        
        
select @sqlstr = @sqlstr + ' from  [PM_Activity_Master]'          
select @sqlstr = @sqlstr + ' Where Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' and Dept_Name='  + '''' + @mDeptname   + ''''       

--Select @sqlstr = @sqlstr + ' and Dept_Name like ' + '''' + @mDeptname +''''      
Select @sqlstr = @sqlstr + ' and Act_Type like ' + '''' + @mAct_Type +''''      
select @sqlstr = @sqlstr + ' Order by Act_Type, Act_ID'          
          
END          
          
ELSE IF @Filter_Data = 'Specify'          
BEGIN          
select @sqlstr = 'select Comp_Code,Location_Code '        
        
select @sqlstr = @sqlstr + ' ,ACT_ID,Dept_Code,Dept_Name   '        
select @sqlstr = @sqlstr + ' ,Act_Type_ID,Act_Type,OPER_ID,OPER_Name   '        
select @sqlstr = @sqlstr + ' ,Frequency,Duaration,Persons_involved,Tollerance   '        
select @sqlstr = @sqlstr + ' ,Remarks,IsActive   '        
select @sqlstr = @sqlstr + ' ,Created_By,Created_Date,Modified_By,Modified_Date'          
select @sqlstr = @sqlstr + ' from [eMaintenance].[dbo].[PM_Activity_Master]'          
select @sqlstr = @sqlstr + ' Where Comp_Code='   + '''' + @Comp_Code   + ''''       
--select @sqlstr = @sqlstr + ' and Act_ID='   + '''' + @Act_ID   + ''''          
      
          
          
select @sqlstr = @sqlstr + ' Order by Act_ID'          
END          
          
print (@sqlstr)          
exec(@sqlstr)          
END



GO
/****** Object:  StoredProcedure [dbo].[sp_PM_GetActivityType_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author  : Rajkumr  
-- Create date : 12/06/2020  
  
-- Description : Get YArn COunt  Details  
-- =============================================  
-- Grant Execute On [[sp_GetGPparty_Details]] To Public  
-- Execute [sp_GetGPparty_Details] 'LS MILLS','','',''  
--exec [sp_GetGPparty_Details] 'LS MILLS','','','''  
  
CREATE Proc [dbo].[sp_PM_GetActivityType_Details]  
  
(  
@Comp_Code    Varchar(10),  
@Location_Code    Varchar(10),  

@Count_Name     Varchar(100),  
@Filter_Data   Varchar(30)  
)  
as  
BEGIN  
set nocount on  
set dateformat ymd  
Declare @sqlstr varchar(8000)  
  
IF   
 (  
   @Filter_Data = 'ALL'  
  --And @Party_Name    <> ''  
 )  
BEGIN  
  
select @sqlstr = 'select Comp_Code,Location_Code '
select @sqlstr = @sqlstr + ' ,Act_Type_ID,Act_Type,Act_Desc,IsActive '  

select @sqlstr = @sqlstr + ' from  [PM_ActivityType_Master]'  
select @sqlstr = @sqlstr + ' Where Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' Order by Act_Type_ID'  
  
END  
  
ELSE IF @Filter_Data = 'Specific'  
BEGIN  
select @sqlstr = 'select Comp_Code,Location_Code '
select @sqlstr = @sqlstr + ' ,Act_Type_ID,Act_Type,Act_Desc,IsActive '  
select @sqlstr = @sqlstr + ' ,Created_By,Created_Date,Modified_By,Modified_Date'  
select @sqlstr = @sqlstr + ' from  [PM_ActivityType_Master]'  
select @sqlstr = @sqlstr + ' Where Comp_Code='   + '''' + @Comp_Code   + ''''  
  
  
select @sqlstr = @sqlstr + ' Order by Act_Type_ID'  
END  
  
print (@sqlstr)  
exec(@sqlstr)  
END



GO
/****** Object:  StoredProcedure [dbo].[sp_PM_GetExistingMaintPlan_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
            
-- =============================================            
-- Author  : Rajkumar.K            
-- Create date : 17/07/2020            
-- Description : Get Existing Task  Details            
-- =============================================            
-- Grant Execute On [sp_PM_GetTaskActivity_Details] To Public            
-- exec [sp_PM_GetExistingMaintPlan_Details] '100','','','','','ALL'            
-- exec [sp_PM_GetExistingMaintPlan_Details] '100','','','Carding','2021-07-30','2021-07-30','Pending'            
            
create Proc [dbo].[sp_PM_GetExistingMaintPlan_Details]            
(            
@Comp_Code     Varchar(20),            
@Location_Code    Varchar(20),            
@PlanID     Varchar(50),            
            
            
@Department     Varchar(50),            
@From_Date    Varchar(50),            
@To_Date    Varchar(50),            
@Filter_Data   Varchar(100)            
            
)            
as            
BEGIN            
set nocount on            
set dateformat ymd            
Declare @sqlstr varchar(8000)          
      
Declare @mDept Varchar(100)              
Set @mDept=''         
IF LTRIM(RTRIM(@Department ))='ALL'     OR  LTRIM(RTRIM(@Department ))=''              
BEGIN              
Set @mDept=''              
END              
ELSE              
BEGIN              
Set @mDept =  @Department              
END         
            
        IF                   
 (                  
   @Filter_Data = 'Pending'                  
                    
 )                  
BEGIN                  
select @sqlstr = 'Select '                  
            
select @sqlstr = @sqlstr + ' a.Comp_Code ,a.Location_Code      ,a.Maint_PlanID   '            
select @sqlstr = @sqlstr + ' ,a.Ref_NO      ,a.Ref_Date   '            
select @sqlstr = @sqlstr + ' ,a.Dept_Code      ,a.Dept_Name      ,a.Equipment_No          '      
select @sqlstr = @sqlstr + ' ,d.Machine_Code  ,D.Machine_Name '    
select @sqlstr = @sqlstr + ' ,a.Remarks      ,a.IsActive   '            
select @sqlstr = @sqlstr + ' ,B.SNO,b.ACT_ID,b.Act_Type_ID,b.Act_Type   '            
select @sqlstr = @sqlstr + ' ,b.OPER_ID,b.OPER_Name ,c.Frequency  '            
select @sqlstr = @sqlstr + ' ,b.Start_Date,b.Last_DoneDate,b.Next_DueDate,b.Remarks   '            
        
select @sqlstr = @sqlstr + '   ,d.Installed_Date    '        
        
select @sqlstr = @sqlstr + ' FROM  PM_Maintenance_Plan_Main as a   '            
select @sqlstr = @sqlstr + ' left join  PM_Maintenance_Plan_Line as b    '            
select @sqlstr = @sqlstr + ' on b.Maint_PlanID =a.Maint_PlanID and b.Location_Code =a.Location_Code   '            
select @sqlstr = @sqlstr + ' left join  PM_Activity_Master as c    '            
select @sqlstr = @sqlstr + ' on c.ACT_ID =b.ACT_ID and c.Location_Code =b.Location_Code   '            
select @sqlstr = @sqlstr + '  and c.OPER_ID =b.OPER_ID   '            
select @sqlstr = @sqlstr + ' LEFT JOIN  Machine_Master  AS d ON d.Equipment_No =A.Equipment_No    '            
            
            
select @sqlstr = @sqlstr + ' Where A.Comp_Code='  + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And b.Next_DueDate <='+ '''' + @To_Date+ ''''          
select @sqlstr = @sqlstr + ' And a.Dept_Name ='+ '''' + @mDept+ ''''          
 select @sqlstr = @sqlstr + '    and   a.IsActive =''1''   '  
--Select @sqlstr = @sqlstr + 'and a.Dept_Name like' + '''' + @mDept +''''           
             
--select @sqlstr = @sqlstr + ' Order by a.Equipment_No   Asc'                  
      
      
                
---select @sqlstr = @sqlstr + ' And a.Maint_PlanID='    + '''' + @planid   + ''''                  
--select @sqlstr = @sqlstr + ' And a.IsActive=0'                  
END                  
                  
ELSE IF @Filter_Data = 'ALL'                  
BEGIN                  
select @sqlstr = 'Select '                  
            
select @sqlstr = @sqlstr + ' a.Comp_Code ,a.Location_Code      ,a.Maint_PlanID   '            
select @sqlstr = @sqlstr + ' ,a.Ref_NO      ,a.Ref_Date   '   
select @sqlstr = @sqlstr + ' ,a.Dept_Code      ,a.Dept_Name      ,a.Equipment_No         '        
select @sqlstr = @sqlstr + ' ,b.Machine_Code  ,b.Machine_Name '    
select @sqlstr = @sqlstr + ' ,a.Remarks      ,a.IsActive   '               
select @sqlstr = @sqlstr + ' ,B.Machine_Name ,B.Installed_Date    '        
--select @sqlstr = @sqlstr + ' ,b.ACT_ID,b.Act_Type_ID,b.Act_Type   '            
--select @sqlstr = @sqlstr + ' ,b.OPER_ID,b.OPER_Name   '            
--select @sqlstr = @sqlstr + ' ,b.Start_Date,b.Last_DoneDate,b.Next_DueDate,b.Remarks   '            
select @sqlstr = @sqlstr + ' FROM  PM_Maintenance_Plan_Main as a   '            
select @sqlstr = @sqlstr + ' LEFT JOIN  Machine_Master  AS B ON B.Equipment_No =A.Equipment_No    '            
        
--select @sqlstr = @sqlstr + ' left join eMaintenance.dbo.PM_Maintenance_Plan_Line as b    '            
            
--select @sqlstr = @sqlstr + ' on b.Maint_PlanID =a.Maint_PlanID and b.Location_Code =a.Location_Code   '            
            
            
            
            
                 
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''                  
                   
--select @sqlstr = @sqlstr + ' And a.IsActive=0'                  
                   
select @sqlstr = @sqlstr + ' Order by a.Maint_PlanID desc'                  
END                  
                  
exec (@sqlstr)            
print (@sqlstr)            
END 


GO
/****** Object:  StoredProcedure [dbo].[sp_PM_GetMaintanance_Report]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---==============================================================    
-- Author  : Rajkumar    
-- Create date : 05/02/2014    
-- Description : Get SGatepass Transaction  Details)    
-- ===============================================================    
  
---  exec [sp_PMGetMaintanance_Report] '100','THENI','1','','','','','',' ','Get_PMActivityDetails_Report'    
---  exec [sp_PMGetMaintanance_Report] '100','THENI','1','','','','','',' ','Get_PMMachineDetails_Report'    
  
  
---  exec [sp_PMGetMaintanance_Report] '100','THENI','1','','',' ','Get_PMMaintenancePlanDetails_Report'  
---  exec [sp_PMGetMaintanance_Report] '100','THENI','1','','',' ','Get_PMExistingSchedules_Report'  
---  exec [sp_PMGetMaintanance_Report] '100','THENI','1','','',' ','Get_PMExistingPlanwork_Report'    
  
  
  
  
    
CREATE Proc [dbo].[sp_PM_GetMaintanance_Report]    
(    
@Comp_Code    Varchar(10),    
@Location_Code   Varchar(10),    
@Fin_Year_Code   Varchar(10),    
@Dept_name  Varchar(100),    
@Activity  Varchar(100),    
@Operation  Varchar(100),    
@Machine  Varchar(100),    
  
@From_Date     Varchar(100),    
@To_Date     Varchar(100),    
@Mode   Varchar(300)    
)    
as    
BEGIN    
set nocount on    
set dateformat ymd    
Declare @sqlstr varchar(8000)    
    
IF     
 (    
   @mode = 'Get_PMActivityDetails_Report'    
     
 )    
BEGIN    
   
select @sqlstr = ' SELECT  a.Comp_Code ,a.Location_Code '  
select @sqlstr = @sqlstr + ' ,a.ACT_ID,a.Dept_Code,a.Dept_Name '  
select @sqlstr = @sqlstr + ' ,a.Act_Type_ID,a.Act_Type '  
select @sqlstr = @sqlstr + ' ,a.OPER_ID,a.OPER_Name '  
select @sqlstr = @sqlstr + ' ,a.Frequency,a.Duaration,a.Persons_involved,a.Tollerance '  
select @sqlstr = @sqlstr + ' ,a.Remarks,a.IsActive '  
 select @sqlstr = @sqlstr + ' FROM PM_Activity_Master as a  '  
select @sqlstr = @sqlstr + ' left join PM_ActivityType_Master as b on b.Act_Type_ID =a.Act_Type_ID  '  
select @sqlstr = @sqlstr + ' left join PM_Operation_Master as c on c.OPER_ID  =a.OPER_ID   '  
select @sqlstr = @sqlstr + '  order by a.Dept_code,a.Act_Type '  
END    
    
  IF ltrim(rtrim(@Mode))='Get_PMMachineDetails_Report'     
BEGIN    
select @sqlstr = 'SELECT * FROM Machine_Master'    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + ltrim(rtrim(@Comp_Code))   + ''''    
select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + ltrim(rtrim(@Location_code))  + ''''    
   
    
END  
     
    
  
  IF     
 (    
   @mode = 'Get_PMMaintenancePlanDetails_Report'    
     
 )    
BEGIN   
  
 select @sqlstr = '  SELECT  a.Comp_Code ,a.Location_Code  '  
select @sqlstr= @sqlstr +  ' ,a.Maint_PlanID,a.Ref_NO,a.Ref_Date  '  
select @sqlstr= @sqlstr +  ' ,a.Dept_Code,a.Dept_Name,a.Equipment_No   '  
select @sqlstr= @sqlstr +  '  ,a.Machine_Code,c.Machine_Name ,a.Remarks,a.IsActive  '  
 select @sqlstr= @sqlstr +  '  ,b.ACT_ID,b.Act_Type_ID,b.Act_Type,b.OPER_ID,b.OPER_Name  '  
select @sqlstr= @sqlstr +  ' ,b.Start_Date,b.Last_DoneDate,b.Next_DueDate,b.Remarks  '  
   
select @sqlstr= @sqlstr +  ' FROM PM_Maintenance_Plan_Main as a  '  
select @sqlstr= @sqlstr +  ' left join  PM_Maintenance_Plan_Line as b '  
select @sqlstr= @sqlstr +  '  on b.Maint_PlanID =a.Maint_PlanID   '  
select @sqlstr= @sqlstr +  ' left join  Machine_Master as c on c.Equipment_No =a.Equipment_No   '  
select @sqlstr= @sqlstr +  ' Where a.Comp_Code='  + '''' + ltrim(rtrim(@Comp_Code))   + ''''    
select @sqlstr= @sqlstr +  ' And a.Location_Code=' + '''' + ltrim(rtrim(@Location_code))  + ''''    
select @sqlstr= @sqlstr +  ' order by Maint_PlanID ,Dept_Code ,Act_Type_ID ,OPER_ID   '  
  
END  
  
  
  
  IF     
 (    
   @mode = 'Get_PMExistingSchedules_Report'    
     
 )    
BEGIN   
  
 select @sqlstr = '  SELECT '  
select @sqlstr= @sqlstr +  ' a.Comp_Code ,a.Location_Code,a.Fin_year_code  '  
select @sqlstr= @sqlstr +  ' ,a.Entry_No ,a.Entry_Date  '  
select @sqlstr= @sqlstr +  ' ,a.Dept_Code,a.Dept_Name,a.Schedule_Date,a.Remarks  '  
select @sqlstr= @sqlstr +  ' ,b.SNO,b.Maint_PlanID,b.Dept_code,b.Dept_Name  '  
select @sqlstr= @sqlstr +  ' ,b.Equip_No,b.Machine_name  '  
select @sqlstr= @sqlstr +  ' ,b.Act_Type_ID,b.ACT_ID,b.Act_Type  '  
select @sqlstr= @sqlstr +  ' ,b.OPER_ID,b.OPER_Name,b.Last_Done  '  
select @sqlstr= @sqlstr +  ' ,b.Due_Date,b.Done_Date,b.Date_Delays,b.Reason  '  
    
select @sqlstr= @sqlstr +  ' FROM PM_Maintenance_Entry_Main as a  '  
select @sqlstr= @sqlstr +  ' left join PM_Maintenance_Entry_Line as b  '   
select @sqlstr= @sqlstr +  ' on b.Entry_No =a.Entry_No and  b.Entry_Date =a.Entry_Date  '  
  
  
end  
  
  
  IF     
 (    
   @mode = 'Get_PMExistingPlanwork_Report'    
     
 )    
BEGIN  
  
 select @sqlstr = '  SELECT '  
select @sqlstr= @sqlstr +  '  a.Comp_Code ,a.Location_Code,a.Fin_year_code '  
select @sqlstr= @sqlstr +  ' ,a.Entry_No ,a.Entry_Date '  
select @sqlstr= @sqlstr +  ' ,a.Dept_Code,a.Dept_Name,a.Schedule_Date,a.Remarks '  
select @sqlstr= @sqlstr +  ' ,b.Maint_PlanID,b.Dept_code,b.Dept_Name '  
select @sqlstr= @sqlstr +  ' ,b.Equip_No ,c.Machine_Code ,c.Machine_Name  '  
select @sqlstr= @sqlstr +  ' ,b.Act_Type_ID,b.ACT_ID,b.Act_Type '  
select @sqlstr= @sqlstr +  ' ,b.OPER_ID,b.OPER_Name,b.Last_Done '  
select @sqlstr= @sqlstr +  ' ,b.Due_Date,b.Done_Date,b.Date_Delays,b.Reason '  
select @sqlstr= @sqlstr +  ' ,d.Duaration,d.Frequency  '  
  select @sqlstr= @sqlstr +  ' FROM PM_Maintenance_Entry_Main as a '  
select @sqlstr= @sqlstr +  ' left join PM_Maintenance_Entry_Line as b  '  
select @sqlstr= @sqlstr +  ' on b.Entry_No =a.Entry_No and  b.Entry_Date =a.Entry_Date  '  
select @sqlstr= @sqlstr +  ' left join  Machine_Master as c on c.Equipment_No =b.Equip_No  '  
select @sqlstr= @sqlstr +  ' left join PM_Activity_Master as d on d.ACT_ID  =b.ACT_ID  '   
select @sqlstr= @sqlstr +  ' left join PM_Operation_Master as e on e.OPER_ID  =b.OPER_ID   '  
select @sqlstr= @sqlstr +  ' order by  Equip_No  ,Act_Type_ID ,OPER_ID   '  
  
  
end   
  
  
  
print (@sqlstr)    
exec(@sqlstr)    
END 


GO
/****** Object:  StoredProcedure [dbo].[sp_PM_GetMaintenanceEntry_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================    
-- Author  : Rajkumar.K    
-- Create date : 21/07/2020  
-- Description : Get  Maintenance Entry  Main (Insert / Update)    
--     Delete Maintenance Entry  Line    
-- ==================================================================    
-- Grant Execute On [sp_SaveGatepassINReceipt_Main] To Public    
-- Select * from PM_Maintenance_Entry_Main    
-- Select * from PM_Maintenance_Entry_Line    
    
-- exec [sp_PM_GetMaintenanceEntry_Details] '100','THENI','1','','ALL'   
-- exec [sp_PM_GetMaintenanceEntry_Details] '100','THENI','1','PME/0002/20-21','Specify'    
  
    
CREATE Proc [dbo].[sp_PM_GetMaintenanceEntry_Details]    
(    
@Comp_Code    Varchar(10),    
@Location_Code   Varchar(10),    
@Fin_Year_Code   Varchar(10),    
@Entry_No    Varchar(100),    
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
   @Filter_Data = 'ALL'    
   
 )    
BEGIN    
select @sqlstr = 'select '    
  
  
select @sqlstr = @sqlstr + '   a.Entry_No,a.Entry_Date,a.Ref_NO,a.Ref_Date    '  
select @sqlstr = @sqlstr + '   ,a.Dept_Code,a.Dept_Name    '  
select @sqlstr = @sqlstr + '   ,a.Schedule_Date,a.Remarks    '  
  
select @sqlstr = @sqlstr + '   ,a.Authorize,a.Delete_Mode    '  
select @sqlstr = @sqlstr + '   ,a.Comp_Code,a.Location_Code,a.Fin_year_code    '  

--select @sqlstr = @sqlstr + '   ,b.SNO,b.Maint_PlanID    '  
--select @sqlstr = @sqlstr + '   ,b.Dept_code,b.Dept_Name    '  
--select @sqlstr = @sqlstr + '   ,b.Equip_No,b.Machine_name    '  
--select @sqlstr = @sqlstr + '   ,b.Act_Type_ID,b.ACT_ID,b.Act_Type    '  
--select @sqlstr = @sqlstr + '   ,b.OPER_ID,b.OPER_Name    '  
--select @sqlstr = @sqlstr + '   ,b.Last_Done,b.Due_Date,b.Done_Date,b.Date_Delays,b.Reason    '  
--select @sqlstr = @sqlstr + '   ,c.Dept_Code ,c.Dept_Name     '  
--select @sqlstr = @sqlstr + '   ,c.Act_Type_ID ,c.Act_Type ,c.Frequency,Duaration,Persons_involved,Tollerance    '  
select @sqlstr = @sqlstr + '   FROM  PM_Maintenance_Entry_Main as a    '  
select @sqlstr = @sqlstr + '   left join  PM_Maintenance_Entry_Line as b     '  
select @sqlstr = @sqlstr + '   on b.Entry_No =a.Entry_No and b.Entry_Date =a.Entry_Date     '  
select @sqlstr = @sqlstr + '   left join  PM_Activity_Master as c      '  
select @sqlstr = @sqlstr + '   on c.ACT_ID =b.ACT_ID    '  
  
  
    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''    
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''    
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''    
--select @sqlstr = @sqlstr + ' And a.Entry_No='    + '''' + @Entry_No    + ''''    
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'    
  
select @sqlstr = @sqlstr + ' group by '    
select @sqlstr = @sqlstr + '   a.Comp_Code,a.Location_Code,a.Fin_year_code    '  
select @sqlstr = @sqlstr + '   ,a.Entry_No,a.Entry_Date,a.Ref_NO,a.Ref_Date    '  
select @sqlstr = @sqlstr + '   ,a.Dept_Code,a.Dept_Name    '  
select @sqlstr = @sqlstr + '   ,a.Schedule_Date,a.Remarks    '  
select @sqlstr = @sqlstr + '   ,a.Authorize,a.Delete_Mode    '  
select @sqlstr = @sqlstr + ' Order by a.Entry_Date desc'    

  
END    
    
ELSE IF @Filter_Data = 'Specify'    
BEGIN    
  
select @sqlstr = 'select '    
  
  
select @sqlstr = @sqlstr + '   a.Comp_Code,a.Location_Code,a.Fin_year_code    '  
select @sqlstr = @sqlstr + '   ,a.Entry_No,a.Entry_Date,a.Ref_NO,a.Ref_Date    '  
select @sqlstr = @sqlstr + '   ,a.Dept_Code,a.Dept_Name    '  
select @sqlstr = @sqlstr + '   ,a.Schedule_Date,a.Remarks    '  
select @sqlstr = @sqlstr + '   ,a.Authorize,a.Delete_Mode    '  
select @sqlstr = @sqlstr + '   ,b.SNO,b.Maint_PlanID    '  
select @sqlstr = @sqlstr + '   ,b.Dept_code,b.Dept_Name    '  
select @sqlstr = @sqlstr + '   ,b.Equip_No, d.Machine_Name,d.Machine_Code    '  
select @sqlstr = @sqlstr + '   ,b.Act_Type_ID,b.ACT_ID,b.Act_Type    '  
select @sqlstr = @sqlstr + '   ,b.OPER_ID,b.OPER_Name    '  
select @sqlstr = @sqlstr + '   ,b.Last_Done,b.Due_Date,b.Done_Date,b.Date_Delays,b.Reason    '  
select @sqlstr = @sqlstr + '   ,c.Dept_Code ,c.Dept_Name     '  
select @sqlstr = @sqlstr + '   ,c.Act_Type_ID ,c.Act_Type ,c.Frequency,Duaration,Persons_involved,Tollerance    '  
select @sqlstr = @sqlstr + '   FROM  PM_Maintenance_Entry_Main as a    '  
select @sqlstr = @sqlstr + '   left join  PM_Maintenance_Entry_Line as b     '  
select @sqlstr = @sqlstr + '   on b.Entry_No =a.Entry_No and b.Entry_Date =a.Entry_Date     '  
select @sqlstr = @sqlstr + '   left join  PM_Activity_Master as c      '  
select @sqlstr = @sqlstr + '   on c.ACT_ID =b.ACT_ID    '  
  
select @sqlstr = @sqlstr + '   left join  Esp_Machine_Master as d      '  
select @sqlstr = @sqlstr + '   on d.Equipment_No =b.Equip_No      '  
    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''    
select @sqlstr = @sqlstr + ' And a.Location_Code='  + '''' + @Location_Code  + ''''    
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='  + '''' + @Fin_Year_Code  + ''''    
select @sqlstr = @sqlstr + ' And a.Entry_No='    + '''' + @Entry_No    + ''''    
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'    
select @sqlstr = @sqlstr + ' Order by a.Created_Date desc'    
END    
    
print (@sqlstr)    
exec(@sqlstr)    
END 



GO
/****** Object:  StoredProcedure [dbo].[sp_PM_GetMaintenancePlan_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
          
-- =============================================          
-- Author  : Rajkumar.K          
-- Create date : 01/04/2020          
-- Description : Get Task  Details          
-- =============================================          
-- Grant Execute On [sp_PM_GetTaskActivity_Details] To Public          
-- exec [sp_PM_GetMaintenancePlan_Details] '100','','','','','ALL'          
-- exec [sp_PM_GetMaintenancePlan_Details] '100','','MPLAN/0004','','','Specify'          
          
CREATE Proc [dbo].[sp_PM_GetMaintenancePlan_Details]          
(          
@Comp_Code     Varchar(10),          
@Location_Code    Varchar(10),          
@PlanID     Varchar(50),          
          
          
@IsActive     Varchar(5),          
@Delete_Mode    Varchar(50),          
@Filter_Data   Varchar(100)          
          
)          
as          
BEGIN          
set nocount on          
set dateformat ymd          
Declare @sqlstr varchar(8000)          
          
            
IF                 
 (                
   @Filter_Data = 'Specify'                
      And @PlanID    <> ''                
 )                
BEGIN                
select @sqlstr = 'Select '                
          
select @sqlstr = @sqlstr + ' a.Comp_Code ,a.Location_Code      ,a.Maint_PlanID   '          
select @sqlstr = @sqlstr + ' ,a.Ref_NO      ,a.Ref_Date   '          
select @sqlstr = @sqlstr + ' ,a.Dept_Code      ,a.Dept_Name      ,a.Equipment_No         '     
select @sqlstr = @sqlstr + ' ,d.Machine_Code  ,D.Machine_Name '          
select @sqlstr = @sqlstr + ' ,a.Remarks      ,a.IsActive   '          
select @sqlstr = @sqlstr + ' ,B.SNO,b.ACT_ID,b.Act_Type_ID,b.Act_Type   '          
select @sqlstr = @sqlstr + ' ,b.OPER_ID,b.OPER_Name ,c.Frequency  '          
select @sqlstr = @sqlstr + ' ,b.Start_Date,b.Last_DoneDate,b.Next_DueDate,b.Remarks   '          
select @sqlstr = @sqlstr + ' ,d.Installed_Date    '      
select @sqlstr = @sqlstr + ' FROM  PM_Maintenance_Plan_Main as a   '          
select @sqlstr = @sqlstr + ' left join  PM_Maintenance_Plan_Line as b    '          
select @sqlstr = @sqlstr + ' on b.Maint_PlanID =a.Maint_PlanID and b.Location_Code =a.Location_Code   '          
select @sqlstr = @sqlstr + ' left join  PM_Activity_Master as c    '          
select @sqlstr = @sqlstr + ' on c.ACT_ID =b.ACT_ID and c.Location_Code =b.Location_Code   '          
select @sqlstr = @sqlstr + '  and c.OPER_ID =b.OPER_ID   '          
    select @sqlstr = @sqlstr + ' LEFT JOIN  Machine_Master  AS d ON d.Equipment_No =A.Equipment_No    '        
          
select @sqlstr = @sqlstr + ' Where A.Comp_Code='  + '''' + @Comp_Code   + ''''                
              
select @sqlstr = @sqlstr + ' And a.Maint_PlanID='    + '''' + @planid   + ''''                
--select @sqlstr = @sqlstr + ' And a.IsActive=0'                
END                
        
        
else IF                 
 (                
   @Filter_Data = 'Pending'                
                  
 )                
BEGIN                
select @sqlstr = 'Select '                
          
select @sqlstr = @sqlstr + ' a.Comp_Code ,a.Location_Code      ,a.Maint_PlanID   '          
select @sqlstr = @sqlstr + ' ,a.Ref_NO      ,a.Ref_Date   '          
select @sqlstr = @sqlstr + ' ,a.Dept_Code      ,a.Dept_Name      ,a.Equipment_No      ,a.Machine_Code   '          
select @sqlstr = @sqlstr + ' ,a.Remarks      ,a.IsActive   '          
select @sqlstr = @sqlstr + ' ,B.SNO,b.ACT_ID,b.Act_Type_ID,b.Act_Type   '          
select @sqlstr = @sqlstr + ' ,b.OPER_ID,b.OPER_Name ,c.Frequency  '          
select @sqlstr = @sqlstr + ' ,b.Start_Date,b.Last_DoneDate,b.Next_DueDate,b.Remarks   '          
      
select @sqlstr = @sqlstr + ' ,D.Machine_Name ,d.Installed_Date    '      
      
select @sqlstr = @sqlstr + ' FROM  PM_Maintenance_Plan_Main as a   '          
select @sqlstr = @sqlstr + ' left join PM_Maintenance_Plan_Line as b    '          
select @sqlstr = @sqlstr + ' on b.Maint_PlanID =a.Maint_PlanID and b.Location_Code =a.Location_Code   '          
select @sqlstr = @sqlstr + ' left join  PM_Activity_Master as c    '          
select @sqlstr = @sqlstr + ' on c.ACT_ID =b.ACT_ID and c.Location_Code =b.Location_Code   '          
select @sqlstr = @sqlstr + '  and c.OPER_ID =b.OPER_ID   '          
select @sqlstr = @sqlstr + ' LEFT JOIN  Machine_Master  AS d ON d.Equipment_No =A.Equipment_No    '          
          
          
select @sqlstr = @sqlstr + ' Where A.Comp_Code='  + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and b.Next_DueDate <= ''2020-07-31''   '       
--select @sqlstr = @sqlstr + ' and A.Dept_Name= ''CARDING''   '             
    
    
              
---select @sqlstr = @sqlstr + ' And a.Maint_PlanID='    + '''' + @planid   + ''''                
--select @sqlstr = @sqlstr + ' And a.IsActive=0'                
END                
                
ELSE IF @Filter_Data = 'ALL'                
BEGIN                
select @sqlstr = 'Select '                
          
select @sqlstr = @sqlstr + ' a.Comp_Code ,a.Location_Code      ,a.Maint_PlanID   '          
select @sqlstr = @sqlstr + ' ,a.Ref_NO      ,a.Ref_Date   '          
select @sqlstr = @sqlstr + ' ,a.Dept_Code      ,a.Dept_Name      ,a.Equipment_No         '      
  select @sqlstr = @sqlstr + ' ,b.Machine_Code  ,b.Machine_Name '       
select @sqlstr = @sqlstr + ' ,a.Remarks      ,a.IsActive   '       
      
select @sqlstr = @sqlstr + ' ,B.Machine_Name ,B.Installed_Date    '      
--select @sqlstr = @sqlstr + ' ,b.ACT_ID,b.Act_Type_ID,b.Act_Type   '          
--select @sqlstr = @sqlstr + ' ,b.OPER_ID,b.OPER_Name   '          
--select @sqlstr = @sqlstr + ' ,b.Start_Date,b.Last_DoneDate,b.Next_DueDate,b.Remarks   '          
select @sqlstr = @sqlstr + ' FROM  PM_Maintenance_Plan_Main as a   '          
select @sqlstr = @sqlstr + ' LEFT JOIN Machine_Master  AS B ON B.Equipment_No =A.Equipment_No    '          
      
--select @sqlstr = @sqlstr + ' left join eMaintenance.dbo.PM_Maintenance_Plan_Line as b    '          
          
--select @sqlstr = @sqlstr + ' on b.Maint_PlanID =a.Maint_PlanID and b.Location_Code =a.Location_Code   '          
          
          
          
          
               
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''                
                 
select @sqlstr = @sqlstr + ' And a.IsActive=1'                
                 
select @sqlstr = @sqlstr + ' Order by a.Maint_PlanID desc'                
END                
                
exec (@sqlstr)          
print (@sqlstr)          
END 


GO
/****** Object:  StoredProcedure [dbo].[sp_PM_GetOperation_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author  : Rajkumr  
-- Create date : 12/06/2020  
  
-- Description : Get YArn COunt  Details  
-- =============================================  
-- Grant Execute On [[sp_GetGPparty_Details]] To Public  
-- Execute [sp_GetGPparty_Details] 'LS MILLS','','',''  
--  exec [sp_PM_GetOperation_Details] '100','','','ALL'  
  
CREATE Proc [dbo].[sp_PM_GetOperation_Details]  
  
(  
@Comp_Code    Varchar(10),  
@Location_Code    Varchar(10),  

@Count_Name     Varchar(100),  
@Filter_Data   Varchar(30)  
)  
as  
BEGIN  
set nocount on  
set dateformat ymd  
Declare @sqlstr varchar(8000)  
  
IF   
 (  
   @Filter_Data = 'ALL'  
  --And @Party_Name    <> ''  
 )  
BEGIN  
  
select @sqlstr = 'select Comp_Code,Location_Code '
select @sqlstr = @sqlstr + ' ,OPER_ID,OPER_Name,OPER_Desc,IsActive '  

select @sqlstr = @sqlstr + ' from  [PM_Operation_Master]'  
select @sqlstr = @sqlstr + ' Where Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr = @sqlstr + ' Order by OPER_ID'  
  
END  
  
ELSE IF @Filter_Data = 'Specific'  
BEGIN  
select @sqlstr = 'select Comp_Code,Location_Code '
select @sqlstr = @sqlstr + ' ,OPER_ID,OPER_Name,OPER_Desc,IsActive '  
select @sqlstr = @sqlstr + ' ,Created_By,Created_Date,Modified_By,Modified_Date'  
select @sqlstr = @sqlstr + ' from  [PM_Operation_Master]'  
select @sqlstr = @sqlstr + ' Where Comp_Code='   + '''' + @Comp_Code   + ''''  
  
  
select @sqlstr = @sqlstr + ' Order by OPER_ID'  
END  
  
print (@sqlstr)  
exec(@sqlstr)  
END



GO
/****** Object:  StoredProcedure [dbo].[sp_PM_SaveActivity_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================  
-- Author  : K.Rajkumar   
-- Create date : 01/04/2020  
-- Description : Save Task Activity  Master Details (Insert / Update)  
-- ========================================================  
-- Grant Execute On [sp_PM_SaveTaskActivity_Details] To Public  
-- Select * from PM_Task_Details  
  
create Proc [dbo].[sp_PM_SaveActivity_Details]  
(  
@Comp_Code     Varchar(10),  
@Location_Code     Varchar(10),  
@ACT_ID        Varchar(50),  
@Dept_Code        Varchar(50),  
@Dept_Name        Varchar(50),  
@Act_Type_ID        Varchar(50),  
@Act_Type        Varchar(50),  
@OPER_ID        Varchar(50),  
@OPER_Name        Varchar(50),  
@Frequency        Varchar(50),  
@Duaration        Varchar(50),  
@Persons_involved        Varchar(50),  
@Tollerance        Varchar(50),  
@Remarks        Varchar(50),  
@IsActive     Varchar(1),  
@User_Code     Varchar(15),  
@iSuccessFlag       Bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr varchar(8000)  
Declare @iMode  numeric(18,0)  
Declare @iServerDate Varchar(19)  
Declare @iNew_Code  Varchar(10)  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
Set @iMode=(Select Count(ACT_ID) from PM_Activity_Master  
Where Comp_Code=@Comp_Code And ACT_ID=@ACT_ID)  
  
  
  
IF @ACT_ID  =''   
BEGIN  
 Set @iNew_Code=( select Count(ACT_ID)+1 from PM_Activity_Master)  
END  
ELSE  
BEGIN  
 Set @iNew_Code=@ACT_ID  
END  
  
  
BEGIN TRAN TRAN1  
select @sqlstr=''  
IF @iMode<=0   
BEGIN  
select @sqlstr = 'Insert into PM_Activity_Master Values('  
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code)) + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @Location_Code    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iNew_Code   + ''''  
  
--select @sqlstr= @sqlstr + ','+ '''' + @Art_ID    + ''''  
  
select @sqlstr= @sqlstr + ','+ '''' + @Dept_Code   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @Dept_Name   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @Act_Type_ID   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @Act_Type  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @OPER_ID  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @OPER_Name  + ''''  
  
select @sqlstr= @sqlstr + ','+ '''' + @Frequency     + ''''  
  
select @sqlstr= @sqlstr + ','+ '''' + @Duaration      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @Persons_involved      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @Tollerance      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @Remarks       + ''''  
  
  
  
  
select @sqlstr= @sqlstr + ','+ '''' + @IsActive    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @User_Code   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate   +''''   
select @sqlstr= @sqlstr + ','+ '''' + @User_Code   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate   +'''' + ')'  
END  
ELSE IF @iMode=1  
BEGIN  
select @sqlstr = 'Update PM_Activity_Master Set '  
select @sqlstr= @sqlstr + ' Dept_Code='   + '''' + @Dept_Code     + ''''  
select @sqlstr= @sqlstr + ',Dept_Name='   + '''' + @Dept_Name    + ''''  
select @sqlstr= @sqlstr + ',Act_Type_ID='  + '''' + @Act_Type_ID   + ''''  
select @sqlstr= @sqlstr + ',Act_Type='   + '''' + @Act_Type     + ''''  
select @sqlstr= @sqlstr + ',OPER_ID='   + '''' + @OPER_ID    + ''''  
select @sqlstr= @sqlstr + ',OPER_Name='   + '''' + @OPER_Name    + ''''  
select @sqlstr= @sqlstr + ',Frequency='   + '''' + @Frequency    + ''''  
  
select @sqlstr= @sqlstr + ',Duaration='   + '''' + @Duaration     + ''''  
select @sqlstr= @sqlstr + ',Persons_involved=' + '''' + @Persons_involved    + ''''  
select @sqlstr= @sqlstr + ',Tollerance='  + '''' + @Tollerance    + ''''  
  
select @sqlstr= @sqlstr + ',Remarks='   + '''' + @Remarks     + ''''  
  
  
select @sqlstr= @sqlstr + ',IsActive='   + '''' + @IsActive     + ''''  
select @sqlstr= @sqlstr + ',Modified_By='  + '''' + ltrim(rtrim(@User_Code)) + ''''  
select @sqlstr= @sqlstr + ',Modified_Date='  + '''' + @iServerDate    + ''''  
select @sqlstr= @sqlstr + ' Where Comp_Code=' + '''' + @Comp_Code     + ''''   
select @sqlstr= @sqlstr + ' And ACT_ID='  + '''' + @ACT_ID     + ''''   
  
END  
  
exec(@sqlstr )  
print (@sqlstr)  
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
/****** Object:  StoredProcedure [dbo].[sp_PM_SaveActivityType_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================
-- Author		:	Rajkumar
-- Create date	:27/02/2014
-- Modify date	:	27/02/2014
-- Description	:	Save Gatepass party  (Insert / Update)
-- ========================================================
-- Grant Execute On [[sp_SaveGpparty_Details]] To Public
-- Select * from GP_Party_Master

--  exec sp_SaveQC_ProcessMaster_Details '100','','D6on','1','admin',1

CREATE Proc [dbo].[sp_PM_SaveActivityType_Details]
(

@Comp_Code					varchar(10),
@Location_Code					varchar(10),
@Act_Type_ID				varchar(200),
@Act_Type				varchar(200),
@Act_Desc				varchar(200),

@IsActive					varchar(200),
@User_Code					varchar(15),			
@iSuccessFlag			    bit	output


)
as
set nocount on
set dateformat ymd
Declare @sqlstr varchar(8000)
Declare @iMode  numeric(18,0)
Declare @iServerDate Varchar(19)
Declare @iNew_Code		Varchar(10)


Set @iMode=(Select Count(@Act_Type) from  [PM_ActivityType_Master]
Where Comp_Code=@Comp_Code And Act_Type_ID=@Act_Type_ID )

Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))

IF @Act_Type_ID	 ='' 
BEGIN
	Set @iNew_Code=( select Count(@Act_Type)+1 from [PM_ActivityType_Master])
END
ELSE
BEGIN
	Set @iNew_Code=@Act_Type_ID
END

BEGIN TRAN TRAN1
select @sqlstr=''
IF @iMode<=0 
BEGIN
select @sqlstr = 'Insert into [PM_ActivityType_Master] Values('
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))	+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @Location_Code			+ ''''

select @sqlstr= @sqlstr + ','+ '''' + @iNew_Code			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @Act_Type			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @Act_Desc			+ ''''

select @sqlstr= @sqlstr + ','+ '''' + @IsActive			+ ''''


select @sqlstr= @sqlstr + ','+ '''' + @User_Code			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate			+'''' 
select @sqlstr= @sqlstr + ','+ '''' + @User_Code			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate			+'''' + ')'
END
ELSE IF @iMode=1
BEGIN
select @sqlstr = 'Update [PM_ActivityType_Master] Set '

select @sqlstr= @sqlstr + 'Act_Type='	+ '''' + @Act_Type 				+ ''''
select @sqlstr= @sqlstr + ',Act_Desc='	+ '''' + @Act_Desc	+ ''''

select @sqlstr= @sqlstr + ',Modified_By='	+ '''' + ltrim(rtrim(@User_Code))	+ ''''
select @sqlstr= @sqlstr + ',Modified_Date='	+ '''' + @iServerDate				+ ''''
select @sqlstr= @sqlstr + ' Where Comp_Code='+ '''' + @Comp_Code					+ '''' 
select @sqlstr= @sqlstr + ' And Act_Type_ID='	+ '''' + @iNew_Code 					+ '''' 
END
--exec(@sqlstr )
--IF (@@error <> 0) goto ErrHand
--COMMIT TRAN TRAN1
----select @iSuccessFlag=1

--select @Party_Code =@iNew_Code
--return
--ErrHand:
--BEGIN
--	ROLLBACK TRAN TRAN1
----	select @Party_Code =@iNew_Code
--select @iSuccessFlag=0
	
--END

exec(@sqlstr )
print (@sqlstr)
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
/****** Object:  StoredProcedure [dbo].[sp_PM_SaveMaintenanceEntry_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================  
-- Author  : Rajkumar.K  
-- Create date : 21/07/2020
-- Description : Save  Maintenance Entry  Main (Insert / Update)  
--     Delete Maintenance Entry  Line  
-- ==================================================================  
-- Grant Execute On [sp_SaveGatepassINReceipt_Main] To Public  
-- Select * from PM_Maintenance_Entry_Main  
-- Select * from PM_Maintenance_Entry_Line  
  
  
CREATE Proc [dbo].[sp_PM_SaveMaintenanceEntry_Line]  
(  
@Comp_Code     Varchar(10),  
@Location_Code    Varchar(10),  
@Fin_Year_Code    Varchar(10),  
@Entry_No    Varchar(100),  
@Entry_Date    Varchar(10),  
@SNo      Varchar(3),  
@Maint_PlanID     Varchar(100),  
@Dept_code    Varchar(100),  
@Dept_Name     Varchar(100),  
@Equip_No     Varchar(50),  
@Machine_name    Varchar(150),  
@Act_Type_ID     Varchar(50),  
@ACT_ID     Varchar(50),  
@Act_Type     Varchar(50),  
@OPER_ID     Varchar(50),  
@OPER_Name     Varchar(500),  
@Last_Done     Varchar(500),  
@Due_Date     Varchar(50),  
@Done_Date     Varchar(50),  
@Date_Delay     Varchar(50),  
@Reason                 Varchar(100),  
@Authorize     Varchar(1),  
@Delete_Mode    Varchar(1),  
@Screen_Mode    Varchar(20),  
@User_Code     Varchar(15),  
@iSuccessFlag       bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iServerDate Varchar(19)  
  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
BEGIN TRAN TRAN1  
  
select @sqlstr=''  
select @sqlstr = 'Insert into PM_Maintenance_Entry_Line Values('  
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@SNo))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Maint_PlanID ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Dept_code ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Dept_Name))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Equip_No  ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Machine_name ))  + ''''  

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Act_Type_ID ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@ACT_ID ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Act_Type ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@OPER_ID ))  + ''''  

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@OPER_Name ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Last_Done ))  + '''' 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Due_Date ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Done_Date ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Date_Delay  ))  + ''''  

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Reason   ))  + ''''  




select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))  + ''''  
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''  
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + ''''   
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''  
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + '''' + ')'  
print (@sqlstr)  
exec(@sqlstr )  
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
/****** Object:  StoredProcedure [dbo].[sp_PM_SaveMaintenanceEntry_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================  
-- Author  : Rajkumar.K  
-- Create date : 21/07/2020
-- Description : Save  Maintenance Entry  Main (Insert / Update)  
--     Delete Maintenance Entry  Line  
-- ==================================================================  
-- Grant Execute On [sp_SaveGatepassINReceipt_Main] To Public  
-- Select * from PM_Maintenance_Entry_Main  
-- Select * from PM_Maintenance_Entry_Line  
  
CREATE Proc [dbo].[sp_PM_SaveMaintenanceEntry_Main]  
(  
@Comp_Code     Varchar(10),  
@Location_Code    Varchar(10),  
@Fin_Year_Code    Varchar(10),  
@Entry_No     Varchar(100),  
@Entry_Date    Varchar(10),  
@Ref_NO    Varchar(100),  
@Ref_Date    Varchar(10),  
@Dept_code    Varchar(100),  
@Dept_name    Varchar(100),  
@Schedule_Date    Varchar(10),  
 
@Remarks   Varchar(1000),  
@Authorize     Varchar(1),  
@Delete_Mode    Varchar(1),  
@Screen_Mode    Varchar(20),  
@User_Code     Varchar(15),  
@iSuccessFlag       bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iMode   Numeric(18,0)  
Declare @iServerDate Varchar(19)  
  
Set @iMode=(  
    Select Count(Entry_No) from PM_Maintenance_Entry_Main   
    Where Comp_Code  = @Comp_Code   
    And  Location_Code = @Location_Code  
   -- And  Fin_Year_Code = @Fin_Year_Code  
    And  Entry_No   = @Entry_No   
    And  Entry_Date   = @Entry_Date  
   )  
  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
BEGIN TRAN TRAN1  
select @sqlstr=''  
IF @iMode<=0   
BEGIN  
select @sqlstr = 'Insert into PM_Maintenance_Entry_Main Values('  
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date  ))     + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Ref_NO ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Ref_Date   ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Dept_code   ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Dept_name   ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Schedule_Date   ))    + ''''  

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Remarks   ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))     + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + '''' + ')'  
END  
ELSE IF @iMode=1  
BEGIN  
select @sqlstr = 'Update PM_Maintenance_Entry_Main Set '  
select @sqlstr= @sqlstr + 'Ref_NO='    + '''' + ltrim(rtrim(@Ref_NO))    + ''''  
select @sqlstr= @sqlstr + ',Ref_Date='   + '''' + ltrim(rtrim(@Ref_Date  ))   + ''''
select @sqlstr= @sqlstr + ',Dept_Code='   + '''' + ltrim(rtrim(@Dept_code   ))   + ''''  
select @sqlstr= @sqlstr + ',Dept_Name='   + '''' + ltrim(rtrim(@Dept_name  ))   + ''''  
select @sqlstr= @sqlstr + ',Schedule_Date='   + '''' + ltrim(rtrim(@Schedule_Date  ))   + ''''  


  
select @sqlstr= @sqlstr + ',Remarks='    + '''' + ltrim(rtrim(@Remarks ))    + ''''  
select @sqlstr= @sqlstr + ',Authorize='    + '''' + ltrim(rtrim(@Authorize))    + ''''  
select @sqlstr= @sqlstr + ',Delete_Mode='   + '''' + ltrim(rtrim(@Delete_Mode))    + ''''  
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))    + ''''  
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate       + ''''  
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code        + ''''  
select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + @Location_Code       + ''''    
select @sqlstr= @sqlstr +  ' And Fin_Year_Code=' + '''' + @Fin_Year_Code       + ''''    
select @sqlstr= @sqlstr +  ' And Entry_No ='   + '''' + @Entry_No          + ''''    
select @sqlstr= @sqlstr +  ' And Entry_Date='   + '''' + @Entry_Date         + ''''    
END  
exec(@sqlstr )  
print @sqlstr  
IF @iMode=1  
BEGIN  
select @sqlstr = 'Delete from PM_Maintenance_Entry_Line'  
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + @Location_Code  + ''''    
--select @sqlstr= @sqlstr +  ' And Fin_Year_Code=' + '''' + @Fin_Year_Code  + ''''    
select @sqlstr= @sqlstr +  ' And Entry_No='   + '''' +  @Entry_No    + ''''    
select @sqlstr= @sqlstr +  ' And Entry_Date='   + '''' + @Entry_Date    + ''''    
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
/****** Object:  StoredProcedure [dbo].[sp_PM_SaveMaintenancePlan_Line]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================  
-- Author  : RAJKUMAR  
-- Create date : 28/08/2017  
-- Description : Save GST Delivery Challan Line (Insert / Update)  
--     Delete Processing Invoice Line  
-- ==================================================================  
-- Grant Execute On GST_CreditNote_line To Public  
-- Select * from [GST_DeliveryChallan_Main]  
-- Select * from GST_DeliveryChallan_line  
  
CREATE Proc [dbo].[sp_PM_SaveMaintenancePlan_Line]  
(  
@Comp_Code     Varchar(10),  
@Location_Code    Varchar(10),  
  
@Maint_PlanID  Varchar(100),  
@SNo      Varchar(3),  
@ACT_ID    varchar(300),  
@Act_Type_ID    varchar(100),  
@Act_Type    varchar(100),  
@OPER_ID   varchar(300),  
@OPER_Name     varchar(1000),  
@Start_Date    varchar(100),  
@Last_DoneDate     varchar(100),  
@Next_DueDate   varchar(100),  
@Remarks    varchar(100),  
@is_active     Varchar(1),  
  
@Screen_Mode    Varchar(20),  
@User_Code     Varchar(15),  
@iSuccessFlag       bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iServerDate Varchar(19)  
  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
BEGIN TRAN TRAN1  
  
select @sqlstr=''  
select @sqlstr = 'Insert into PM_Maintenance_Plan_Line Values('  
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))  + ''''  
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Maint_PlanID  ))    + ''''  
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@SNo  ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@ACT_ID      ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Act_Type_ID     ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Act_Type      ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@OPER_ID     ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@OPER_Name    ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Start_Date      ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Last_DoneDate     ))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Next_DueDate      ))      + ''''  
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Remarks        ))  + ''''  
  
  
  
--select @sqlstr= @sqlstr + ',''0'''  
  
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@is_active))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @User_Code      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate      + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @User_Code      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate      + '''' + ')'  
print (@sqlstr)  
exec(@sqlstr )  
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
/****** Object:  StoredProcedure [dbo].[sp_PM_SaveMaintenancePlan_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================  
-- Author  : Rajkumar.K  
-- Create date : 6/12/2014  
-- Description : Save  Employee Details   Main (Insert / Update)  
--     Delete Employee Setails  
-- ==================================================================  
-- Grant Execute On [sp_SaveEmployeeMaster_Details] To Public  
-- Select * from Employee_Master  
-- Select * from Employee_Master  
  
CREATE Proc [dbo].[sp_PM_SaveMaintenancePlan_Main]  (   
@Comp_Code  Varchar(10),  
@Location_Code  Varchar(10),  
  
@Maint_PlanID  Varchar(100),  
@Ref_NO   Varchar(100),  
@Ref_Date   Varchar(100),  
@Dept_Code     Varchar(100),  
@Dept_Name   Varchar(100),  
@Equipment_No Varchar(100),  
@Machine_Code    Varchar(100),  
@Remarks   Varchar(100),  
        
@IsActive     Varchar(1),  
@Screen_Mode    Varchar(20),  
@User_Code     Varchar(15),  
@iSuccessFlag       Varchar(10) output  
--@iEMP_Code    Varchar(20) output  
       
)  
as  
  
  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iMode   Numeric(18,0)  
Declare @iServerDate Varchar(19)  
  
Set @iMode=(  
    Select Count(Maint_PlanID) from PM_Maintenance_Plan_Main   
    Where Comp_Code  = @Comp_Code   
    And  Location_Code = @Location_Code  
     
    And  Maint_PlanID   = @Maint_PlanID   
     
   )  
  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
  
  
--Set @iMode=(Select Count(Maint_PlanID) from PM_Maintenance_Plan_Main   
--Where Comp_Code=@Comp_Code And Maint_PlanID=@Maint_PlanID)  
  
--Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
  
--IF @Maint_PlanID =''   
--BEGIN  
  
  
--  --Select Substring('MP' ,1,5)   
--  --   +(Select RIGHT('000'+ CONVERT(VARCHAR(7),ISNULL(MAX(RIGHT(Maint_PlanID, 2)),'0') + 1 ),5)   
--  --    From PM_Maintenance_Plan_Main)  
        
  
--Set @iNew_Code=(Select Substring(@prefix ,1,5)   
-- +(Select RIGHT('000'+ CONVERT(VARCHAR(7),ISNULL(MAX(RIGHT(Maint_PlanID, 2)),'0') + 1 ),5)   
--  From PM_Maintenance_Plan_Main))  
--END  
--ELSE  
--BEGIN  
--Set @iNew_Code=@Maint_PlanID  
--END  
  
  
BEGIN TRAN TRAN1  
select @sqlstr=''  
IF @iMode<=0   
BEGIN  
select @sqlstr = 'InserT into PM_Maintenance_Plan_Main Values('  
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))      + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))      + ''''  
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Maint_PlanID  ))       + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Ref_NO    ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Ref_Date    ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Dept_Code    ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Dept_Name    ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Equipment_No    ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Machine_Code    ))   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Remarks    ))     + ''''  
      
        
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@IsActive))     + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + '''' + ')'  
END  
ELSE IF @iMode=1  
BEGIN  
select @sqlstr = 'Update PM_Maintenance_Plan_Main Set '  
  
select @sqlstr= @sqlstr + 'Ref_NO  ='    + '''' +ltrim(rtrim(@Ref_NO    )) + ''''  
        
select @sqlstr= @sqlstr + ',Ref_Date   ='    + '''' + ltrim(rtrim(@Ref_Date    ))  + ''''  
select @sqlstr= @sqlstr + ',Dept_Code  ='    + '''' +ltrim(rtrim(@Dept_Code    ))  + ''''  
select @sqlstr= @sqlstr + ',Dept_Name       ='    + '''' + ltrim(rtrim(@Dept_Name    ))  + ''''  
select @sqlstr= @sqlstr + ',Equipment_No   ='    + '''' +ltrim(rtrim(@Equipment_No    ))  + ''''  
select @sqlstr= @sqlstr + ',Machine_Code   ='    + '''' +ltrim(rtrim(@Machine_Code    ))  + ''''  
select @sqlstr= @sqlstr + ',Remarks    =' + '''' +ltrim(rtrim(@Remarks    )) + ''''  
  
select @sqlstr= @sqlstr + ',IsActive='    + '''' + ltrim(rtrim(@IsActive))    + ''''  
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))    + ''''  
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate       + ''''  
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code        + ''''  
--select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + @Location_Code       + ''''    
--select @sqlstr= @sqlstr +  ' And Fin_Year_Code=' + '''' + @Fin_Year_Code       + ''''    
select @sqlstr= @sqlstr +  ' And Maint_PlanID ='  + '''' + @Maint_PlanID        + ''''    
--select @sqlstr= @sqlstr +  ' And Trans_Date='  + '''' + @Trans_Date         + ''''    
END  
exec(@sqlstr )  
print @sqlstr  
IF @iMode=1  
BEGIN  
select @sqlstr = 'Delete from PM_Maintenance_Plan_LINE'  
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code   + ''''  
select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + @Location_Code  + ''''    
  
select @sqlstr= @sqlstr +  ' And Maint_PlanID='   + '''' +  @Maint_PlanID    + ''''    
  
exec(@sqlstr )  
END  
  
--IF (@@error <> 0) goto ErrHand  
--COMMIT TRAN TRAN1  
--select @iEMP_Code=@iNew_Code  
--select @iSuccessFlag=1  
--return  
--ErrHand:  
--BEGIN  
--ROLLBACK TRAN TRAN1  
--select @iEMP_Code=@iNew_Code  
--select @iSuccessFlag=0  
--END  
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
/****** Object:  StoredProcedure [dbo].[sp_PM_SaveOperation_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================
-- Author		:	Rajkumar
-- Create date	:27/02/2014
-- Modify date	:	27/02/2014
-- Description	:	Save Gatepass party  (Insert / Update)
-- ========================================================
-- Grant Execute On [[sp_SaveGpparty_Details]] To Public
-- Select * from GP_Party_Master

--  exec sp_SaveQC_ProcessMaster_Details '100','','D6on','1','admin',1

CREATE Proc [dbo].[sp_PM_SaveOperation_Details]
(

@Comp_Code					varchar(10),
@Location_Code					varchar(10),
@OPER_ID				varchar(200),
@OPER_Name				varchar(200),
@OPER_Desc				varchar(200),

@IsActive					varchar(200),
@User_Code					varchar(15),			
@iSuccessFlag			    bit	output


)
as
set nocount on
set dateformat ymd
Declare @sqlstr varchar(8000)
Declare @iMode  numeric(18,0)
Declare @iServerDate Varchar(19)
Declare @iNew_Code		Varchar(10)


Set @iMode=(Select Count(@OPER_Name) from PM_Operation_Master
Where Comp_Code=@Comp_Code And OPER_ID=@OPER_ID )

Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))

IF @OPER_ID	 ='' 
BEGIN
	Set @iNew_Code=( select Count(@OPER_Name)+1 from PM_Operation_Master)
END
ELSE
BEGIN
	Set @iNew_Code=@OPER_ID
END

BEGIN TRAN TRAN1
select @sqlstr=''
IF @iMode<=0 
BEGIN
select @sqlstr = 'Insert into [PM_Operation_Master] Values('
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))	+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @Location_Code			+ ''''

select @sqlstr= @sqlstr + ','+ '''' + @iNew_Code			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @OPER_Name			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @OPER_Desc			+ ''''

select @sqlstr= @sqlstr + ','+ '''' + @IsActive			+ ''''


select @sqlstr= @sqlstr + ','+ '''' + @User_Code			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate			+'''' 
select @sqlstr= @sqlstr + ','+ '''' + @User_Code			+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate			+'''' + ')'
END
ELSE IF @iMode=1
BEGIN
select @sqlstr = 'Update [PM_Operation_Master] Set '

select @sqlstr= @sqlstr + 'OPER_Name='	+ '''' + @OPER_Name 				+ ''''
select @sqlstr= @sqlstr + ',OPER_Desc='	+ '''' + @OPER_Desc	+ ''''

select @sqlstr= @sqlstr + ',Modified_By='	+ '''' + ltrim(rtrim(@User_Code))	+ ''''
select @sqlstr= @sqlstr + ',Modified_Date='	+ '''' + @iServerDate				+ ''''
select @sqlstr= @sqlstr + ' Where Comp_Code='+ '''' + @Comp_Code					+ '''' 
select @sqlstr= @sqlstr + ' And OPER_ID='	+ '''' + @iNew_Code 					+ '''' 
END
--exec(@sqlstr )
--IF (@@error <> 0) goto ErrHand
--COMMIT TRAN TRAN1
----select @iSuccessFlag=1

--select @Party_Code =@iNew_Code
--return
--ErrHand:
--BEGIN
--	ROLLBACK TRAN TRAN1
----	select @Party_Code =@iNew_Code
--select @iSuccessFlag=0
	
--END

exec(@sqlstr )
print (@sqlstr)
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
/****** Object:  StoredProcedure [dbo].[sp_PM_SaveScheduledupdate]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
        
        
-- ==========================================================================            
-- Author   : Rajkumar.K      
-- Create Date  : 01/04/2020         
-- Modified  Date  : 01/04/2020           
          
-- Description  : Save Stock Transaction Ledger - Weaving Division            
-- =========================================================================            
-- select * from esales..RG_YarnStockTransaction_Ledger            
-- select * from esales..IV_YarnStock_Ledger            
-- delete from RG_YarnStockTransaction_Ledger            
-- delete from IV_YarnStock_Ledger            
-- Grant Execute On sp_RG_SaveYarnStkTrans_Ledger To Public            
-- Exec sp_RG_SaveYarnStkTrans_Ledger '100','THENI','1','RYI/0018/20-21','Sales(local)'            
        
-- Exec sp_RG_SaveYarnStkTrans_Ledger '100','THENI','1','RYR/0009/20-21','Parallel IN'            
-- Exec sp_PM_SaveScheduledupdate '100','THENI','3','PME/00070/22-23','Parallel IN'            
            
    
      
CREATE Proc [dbo].[sp_PM_SaveScheduledupdate]            
(            
@Comp_Code    Varchar(10),            
@Location_Code   Varchar(10),            
@Fin_Year_Code   Varchar(2),            
@Tran_No    Varchar(100),            
@Tran_Type    Varchar(50)            
)            
AS            
SET NOCOUNT ON            
SET DATEFORMAT ymd              
Declare @sqlstr varchar(8000)            
Declare @iServerDate Varchar(19)            
            
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))             
            
BEGIN TRAN TRAN1             
     UPDATE    [PM_Maintenance_Plan_Line]    
SET    
[Last_DoneDate]=c.Done_Date    
,[Next_DueDate]= DATEADD(day, d.Frequency, c.Done_Date)     
   
FROM    [PM_Maintenance_Plan_main]  AS a    
left join  [PM_Maintenance_Plan_Line]  AS b  on b.Maint_PlanID=a.Maint_PlanID     
left join  PM_Maintenance_Entry_Line as c  
ON c.Maint_PlanID  =a.Maint_PlanID   and c.ACT_ID  =c.ACT_ID       and c.OPER_ID =B.OPER_ID     
left join PM_Activity_Master as d on d.ACT_ID =b.ACT_ID  and d.OPER_ID =b.OPER_ID     
   where c.Entry_No =@Tran_No    
      
      
print(@sqlstr)            
exec (@sqlstr)        
      
      
IF (@@error <> 0) goto ErrHand            
COMMIT TRAN TRAN1            
return            
ErrHand:            
BEGIN            
 ROLLBACK TRAN TRAN1            
END            
            
            
            
            
            


GO
/****** Object:  StoredProcedure [dbo].[sp_StoreLedger_Report]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author  : KRK  
-- mODIFIED  :KRK  
-- Create date : 01/08/2022  
-- Modified date : 10/08/2022  

-- Description : Get Accounts Details  
-- =============================================  
-- Grant Execute On sp_GetParty_Details To Public  
-- Execute sp_Ledger_Report '100','1','','','ALL'  
-- Execute sp_StoreLedger_Report '100','MAIN UNIT','1', 'YAANESH STORES (CBE)'  ,'2022-04-01','2022-10-01'
CREATE PROCEDURE [dbo].[sp_StoreLedger_Report]
 @Comp_Code Varchar(10),   
@Location_Code   Varchar(10),   
@Fin_Year_Code   Varchar(10),  

@AccountName VARCHAR(MAX)  
,@Fromdate as datetime
,@Todate as datetime
AS

declare @table table
(
entrydate datetime,
ledgerName 	Varchar(100),
openingbal decimal(15,3),
debit decimal(15,3),
credit decimal(15,3),
closingbal decimal(15,3),

Refaccountname  	Varchar(100),
invoice_No   	Varchar(100),
Invoice_date	datetime,
Narration  	Varchar(100)


)
 
IF             
(             
            
 @AccountName='All' 
                   
)            
BEGIN 
insert into @table
select Entry_Date ,[ledgerName],0 as opening, [debit],[credit],0 as Closing ,[Refaccountname]
,invoice_No ,invoice_Date,Narration 
from Fun_STORELedger_Statement (@Comp_Code,@Location_Code,@Fin_Year_Code,'',@Fromdate,@Todate)  
--option (maxrecursion 0)
--SELECT voucher_Date ,[ledgerName],0 as opening, [debit],[credit],0 as Closing ,[Narration],[Refaccountname]
--FROM ACC_LedgerPosting
--where Refaccountname='KANNAN ENTERPRISES'

;
with cte as(  select *,  ROW_NUMBER()over (order by entrydate)rid from @table
), cte1 as(
select entrydate,Refaccountname, openingbal, credit, debit, cast(openingbal + credit - debit as decimal(15,3)) as closingbal
--,ledgerName
,invoice_No ,Invoice_date,Narration 
, rid
from cte where rid = 1
union all
select curr.entrydate,curr.Refaccountname, cast(prev.closingbal as decimal(15,3)), curr.credit, curr.debit, 
cast(prev.closingbal + curr.credit - curr.debit as decimal(15,3)) as closingbal
--,curr.ledgerName 
,curr.invoice_No ,curr.Invoice_date,curr.Narration 
, curr.rid
from cte curr inner join cte1 prev on curr.rid = prev.rid + 1
)
select *
from cte1
order by entrydate
END 
else 
IF             
(             
            
  @AccountName !='All'        
)  
insert into @table
select Entry_Date ,[ledgerName],0 as opening, [debit],[credit],0 as Closing  ,[Refaccountname]
,invoice_No ,Invoice_date,Narration 
from Fun_STORELedger_Statement (@Comp_Code,@Location_Code,@Fin_Year_Code,'',@Fromdate,@Todate) 
--SELECT voucher_Date ,[ledgerName],0 as opening, [debit],[credit],0 as Closing ,[Narration],[Refaccountname]
--FROM ACC_LedgerPosting
--where Refaccountname like '%' + @AccountName +'%'
where ledgerName like '%' + @AccountName +'%'
;
with cte as(  select *,  ROW_NUMBER()over (order by entrydate)rid from @table
), cte1 as(
select entrydate,Refaccountname, openingbal, credit, debit, cast(openingbal + credit - debit as decimal(15,3)) as closingbal
--,ledgerName

,invoice_No ,Invoice_date,Narration 
, rid
from cte where rid = 1
union all
select curr.entrydate,curr.Refaccountname, cast(prev.closingbal as decimal(15,3)), curr.credit, curr.debit, 
cast(prev.closingbal + curr.credit - curr.debit as decimal(15,3)) as closingbal
--,curr.ledgerName 
,curr.invoice_No ,curr.Invoice_date,curr.Narration 
, curr.rid
from cte curr inner join cte1 prev on curr.rid = prev.rid + 1
)
select *
from cte1
order by entrydate
option (maxrecursion 0)
 

GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_GetStoreBillEntry_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================      
-- Create date	:	05-08-2022
-- modified date	:	12-08-2022   
      
-- Description : Get Activity Details  Details      
-- =============================================      
-- Grant Execute On [sp_tbl_GetStoreBillEntry_Details] To Public      
-- Execute [sp_tbl_GetStoreBillEntry_Details] '100','','','ALL'      
-- exec [sp_tbl_GetStoreBillEntry_Details] '100','SPINNING','1','Specific'      
      
CREATE Proc [dbo].[sp_tbl_GetStoreBillEntry_Details]      
      
(      
@Comp_Code    Varchar(10),      
@Location_Code    Varchar(10),      
    
@Act_ID     Varchar(100),      
@Filter_Data   Varchar(30)      
)      
as      
BEGIN      
set nocount on      
set dateformat ymd      
Declare @sqlstr varchar(8000)      
      
IF       
 (      
   @Filter_Data = 'ALL'      
  --And @Party_Name    <> ''      
 )      
BEGIN      
      
select @sqlstr = 'select '    
    
select @sqlstr = @sqlstr + '   Entry_No,Entry_Date  '
select @sqlstr = @sqlstr + ' ,Unit_Name,Dept_Name ,inv_No,inv_Date,Party_Name,GRB_NO,Invoice_Value,Remarks  '
select @sqlstr = @sqlstr + ' ,Closed,Closed_date  ' 
   --select @sqlstr = @sqlstr + ' , Comp_Code,Location_Code  '
    
select @sqlstr = @sqlstr + ' from  tbl_StoreBillEntry'      
select @sqlstr = @sqlstr + ' Where Comp_Code='  + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and Location_Code='   + '''' + @Location_Code   + ''''      

select @sqlstr = @sqlstr + ' Order by Entry_No'      
      
END      
      
ELSE IF @Filter_Data = 'Specify'      
BEGIN      
select @sqlstr = 'select Comp_Code,Location_Code '    
    
select @sqlstr = @sqlstr + '   Entry_No,Entry_Date  '
select @sqlstr = @sqlstr + ' ,Unit_Name,Dept_Name ,inv_No,inv_Date,Party_Name,GRB_NO,Invoice_Value,Remarks  '
select @sqlstr = @sqlstr + ' ,Closed,Closed_date  '   
select @sqlstr = @sqlstr + ' ,Created_By,Created_Date,Modified_By,Modified_Date'      
select @sqlstr = @sqlstr + ' from  tbl_StoreBillEntry'      
select @sqlstr = @sqlstr + ' Where Comp_Code='   + '''' + @Comp_Code   + ''''   
select @sqlstr = @sqlstr + ' and Location_Code='   + '''' + @Location_Code   + ''''      

select @sqlstr = @sqlstr + ' and Entry_No='   + '''' + @Act_ID   + ''''      
  
      
      
select @sqlstr = @sqlstr + ' Order by Entry_No'      
END      
      
print (@sqlstr)      
exec(@sqlstr)      
END



GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_GetStoreLedger_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================  
-- Author  : krk  
-- Create date :24-05-2022 
-- Description : Get SGatepass Transaction  Details)  
-- ===============================================================  
-- Grant Execute On [sp_GetGatepassTrans_Details] To Public  
-- select * from GEN_MaterialpassOUT_Line  
-- select * from GEN_MaterialpassOUT_Main  
-- select * from GEN_MaterialpassIN_Line  
  


CREATE Proc [dbo].[sp_tbl_GetStoreLedger_Details]    
    
(    
-- Author: <Cybrosys Technologies>
-- Create date:<01-March-2013>
-- Description: <Stored procedure to use search all the details of a account group>
@Comp_Code    Varchar(10),  
@Location_Code   Varchar(10),  
@Fin_Year_Code   Varchar(10),  
@acc_name     Varchar(100),  
  
@from_Date           varchar(50),  
@To_Date           varchar(50)
)
AS

IF @acc_name='All' 
declare @table table
(
entrydate datetime,
ledgerName 	Varchar(100),
openingbal decimal(15,3),
debit decimal(15,3),
credit decimal(15,3),
closingbal decimal(15,3),
Narration  	Varchar(100),
Refaccountname  	Varchar(100)

)
insert into @table
SELECT [Entry_Date] ,[ledgerName],0 as opening, [debit],[credit],0 as Closing ,[Narration],[Refaccountname]
FROM [DB_General].[dbo].[tbl_StoreLedgerPosting]
where ledgerName like @acc_name 
--where Refaccountname like @acc_name 
--IF ltrim(rtrim(@acc_name)) <> '' And ltrim(rtrim(@acc_name)) <> 'ALL'  
--BEGIN  
--where Refaccountname='KANNAN ENTERPRISES'

   

  
--end 

--select * from @table
;
with cte as(  select *,  ROW_NUMBER()over (order by entrydate)rid from @table
), cte1 as(
select entrydate,Refaccountname, openingbal, credit, debit, cast(openingbal + credit - debit as decimal(15,3)) as closingbal,ledgerName, rid
from cte where rid = 1
union all
select curr.entrydate,curr.Refaccountname, cast(prev.closingbal as decimal(15,3)), curr.credit, curr.debit, 
cast(prev.closingbal + curr.credit - curr.debit as decimal(15,3)) as closingbal,curr.ledgerName , curr.rid
from cte curr inner join cte1 prev on curr.rid = prev.rid + 1
)
select *
from cte1
order by entrydate


GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_GetStorePaymentEntry_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_tbl_GetStorePaymentEntry_Details]      
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
ltrim(rtrim(@Entry_No))= ''       
and ltrim(rtrim(@Authorize))= ''       
and ltrim(rtrim(@Delete_Mode))=''      
and LTRIM(rtrim(@Filter_Data))='ALL'      
      
)      
BEGIN      
select @sqlstr= 'Select '      
  
select @sqlstr = @sqlstr + ' a.Entry_No, a.Entry_Date   '  
select @sqlstr = @sqlstr + ' , a.inv_No, a.inv_Date, a.particulars, a.totalAmount   '  
select @sqlstr = @sqlstr + ' , a.Narration   '  
 
select @sqlstr = @sqlstr + ' , a.Comp_Code, a.Location_Code, a.Fin_Year_Code   '  
  
select @sqlstr = @sqlstr +  ' FROM  tbl_StorePaymentEntry as a   '  
    
      
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' And a.Location_Code='   + '''' + @Location_Code  + ''''      
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + ''''      
    
      
select @sqlstr = @sqlstr + ' Order by Entry_No,Entry_Date desc'      
END      
      
ELSE IF       
(      
ltrim(rtrim(@Entry_No)) <>''      
and ltrim(rtrim(@Authorize))= ''       
and ltrim(rtrim(@Delete_Mode))=''      
and LTRIM(rtrim(@Filter_Data))='SPECIFY'      
      
)      
BEGIN      
      
select @sqlstr= 'Select '      
  
  
  
select @sqlstr = @sqlstr + '  a.Entry_No,a.Entry_Date  '  
select @sqlstr = @sqlstr + '  ,a.inv_No,a.inv_Date,a.particulars as Credit_to ,a.totalAmount  '  
select @sqlstr = @sqlstr + '  ,a.Narration  '  
select @sqlstr = @sqlstr + '  ,b.SNo,b.particulars,b.Narration as Narrations,b.credit,b.debit,b.status  '  
select @sqlstr = @sqlstr + '  ,b.updatefrom,b.refaccountname  '  
 select @sqlstr = @sqlstr + '   ,b.Ref_inv_No,b.Ref_inv_Date  '
select @sqlstr = @sqlstr + '  FROM  tbl_StorePaymentEntry as a  '  
select @sqlstr = @sqlstr + '  left join  tbl_StorePaymentEntry_Main as b  '  
select @sqlstr = @sqlstr + '  on b.Entry_No = a.Entry_No and b.Entry_Date =a.Entry_Date  '  
   
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' And a.Location_Code='   + '''' + @Location_Code  + ''''      
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code='   + '''' + @Fin_Year_Code  + ''''      
select @sqlstr = @sqlstr + ' And a.Entry_No='   + '''' + @Entry_No  + ''''      
      
      
select @sqlstr = @sqlstr + ' Order by a.Created_Date, a.Entry_Date desc '      
      
      
      
END      
       
print (@sqlstr)      
exec(@sqlstr)      
END      
      
      
      
      
      



GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_GetVehicleFuelBillEntry_Details]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================      
-- Create date	:	05-08-2022
-- modified date	:	12-08-2022   
      
-- Description : Get Activity Details  Details      
-- =============================================      
-- Grant Execute On [sp_tbl_GetVehicleFuelBillEntry_Details] To Public      
-- Execute [sp_tbl_GetVehicleFuelBillEntry_Details] '100','','','ALL'      
-- exec [sp_tbl_GetVehicleFuelBillEntry_Details] '100','SPINNING','1','Specific'      
      
CREATE Proc [dbo].[sp_tbl_GetVehicleFuelBillEntry_Details]      
      
(      
@Comp_Code    Varchar(10),      
@Location_Code    Varchar(10),      
    
@Act_ID     Varchar(100),      
@Filter_Data   Varchar(30)      
)      
as      
BEGIN      
set nocount on      
set dateformat ymd      
Declare @sqlstr varchar(8000)      
      
IF       
 (      
   @Filter_Data = 'ALL'      
  --And @Party_Name    <> ''      
 )      
BEGIN      
      
select @sqlstr = 'select '    
    
select @sqlstr = @sqlstr + '   Entry_No,Entry_Date  '
select @sqlstr = @sqlstr + '  ,Party_Name  '
select @sqlstr = @sqlstr + ',inv_No,inv_Date,Indent_NO '
select @sqlstr = @sqlstr + ',Vehicle_no,Fuel_Type '
--select @sqlstr = @sqlstr + ' ,Start_Reading,End_Reading,Running_Kms  '
--select @sqlstr = @sqlstr + ',Fuel_Qty,Rate_Per_Ltr ,Mileage_Kmphr,Driver_Name,IsActive  '
 select @sqlstr = @sqlstr + ',Bill_Amt ,Remarks '
   --select @sqlstr = @sqlstr + ' , Comp_Code,Location_Code  '
    
select @sqlstr = @sqlstr + ' from  tbl_VehicleFuelBillEntry'      
select @sqlstr = @sqlstr + ' Where Comp_Code='  + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and Location_Code='   + '''' + @Location_Code   + ''''      

select @sqlstr = @sqlstr + ' Order by Entry_No'      
      
END      
      
ELSE IF @Filter_Data = 'Specify'      
BEGIN      
select @sqlstr = 'select Comp_Code,Location_Code '    
    
select @sqlstr = @sqlstr + '   Entry_No,Entry_Date  '
select @sqlstr = @sqlstr + ' ,Unit_Name,Party_Name  '
select @sqlstr = @sqlstr + ',inv_No,inv_Date,Indent_NO '
select @sqlstr = @sqlstr + ',Vehicle_no,Fuel_Type,Start_Reading,End_Reading,Running_Kms  '
select @sqlstr = @sqlstr + ',Fuel_Qty,Rate_Per_Ltr,Bill_Amt,Mileage_Kmphr,Driver_Name,Remarks,IsActive  '
select @sqlstr = @sqlstr + ' ,Created_By,Created_Date,Modified_By,Modified_Date'      
select @sqlstr = @sqlstr + ' from  tbl_VehicleFuelBillEntry'      
select @sqlstr = @sqlstr + ' Where Comp_Code='   + '''' + @Comp_Code   + ''''   
select @sqlstr = @sqlstr + ' and Location_Code='   + '''' + @Location_Code   + ''''      

select @sqlstr = @sqlstr + ' and Entry_No='   + '''' + @Act_ID   + ''''      
  
      
      
select @sqlstr = @sqlstr + ' Order by Entry_No'      
END      
      
print (@sqlstr)      
exec(@sqlstr)      
END





GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_SaveStoreLedgerPosting]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================            
-- Author  : KRK  
-- Create date : 01/08/2022           
          
-- Description  : Save Stock Transaction Ledger -             
-- =========================================================================            
-- select * from esales..RG_YarnStockTransaction_Ledger            
-- select * from esales..IV_YarnStock_Ledger            
-- delete from RG_YarnStockTransaction_Ledger            
-- delete from IV_YarnStock_Ledger            
         
-- Exec [sp_tbl_SaveStoreLedgerPosting] '100','MAIN UNIT','1','1','Store Bill Posting'    
-- Exec [sp_tbl_SaveStoreLedgerPosting] '100','MAIN UNIT','1','PUR/0002/22-23','Store Payment Entry'            
        
        
-- Exec [sp_tbl_SaveStoreLedgerPosting] '100','Salem','1','SI/0002/22-23','Sales Posting'       
-- Exec [sp_tbl_SaveStoreLedgerPosting] '100','Salem','1','PO/0002/22-23','Receipt Posting'           
    
          
  
      --  select * from Fun_UpdatePurchaseLedgerPosting ('','','PO/0001/22-23')

            
         
      
      
CREATE Proc [dbo].[sp_tbl_SaveStoreLedgerPosting]            
(            
@Comp_Code    Varchar(10),            
@Location_Code   Varchar(10),            
@Fin_Year_Code   Varchar(2),            
@Tran_No    Varchar(50),            
@Tran_Type    Varchar(500)            
)            
AS            
SET NOCOUNT ON            
SET DATEFORMAT ymd              
Declare @sqlstr varchar(8000)            
Declare @iServerDate Varchar(19)            
            
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))             
            
BEGIN TRAN TRAN1             
            
select @sqlstr =''            
        
select @sqlstr='Delete from tbl_StoreLedgerPosting'            
select @sqlstr = @sqlstr + ' Where Comp_Code='  + '''' + ltrim(rtrim(@Comp_Code))   + ''''            
select @sqlstr = @sqlstr + ' And Location_Code=' + '''' + ltrim(rtrim(@Location_Code))  + ''''            
select @sqlstr = @sqlstr + ' And Fin_Year_Code=' + '''' + ltrim(rtrim(@Fin_Year_Code))  + ''''            
select @sqlstr = @sqlstr + ' And Entry_No='   + '''' + ltrim(rtrim(@Tran_No  )) + ''''       
print(@sqlstr)            
exec (@sqlstr)       
      
--IF (@@error <> 0) goto ErrHand          
--COMMIT TRAN TRAN1          
--END      
          
select @sqlstr =''            
select @sqlstr = 'Insert into tbl_StoreLedgerPosting'            
            
IF (            
 @Tran_Type ='Store Bill Posting'         
       
        
 )            
           
          
BEGIN            


 

select @sqlstr = @sqlstr + ' Select a.Comp_Code,a.Location_Code,a.Fin_Year_Code ' 
  select @sqlstr = @sqlstr + '  ,a.Entry_No ,a.Entry_Date ,a.inv_No ,a.inv_Date  '
 select @sqlstr = @sqlstr + '   ,a.Party_Name ,a.Narration,a.debit ,a.credit  '
select @sqlstr = @sqlstr + ' 	,a.refaccountname  '
select @sqlstr = @sqlstr + '  from  Fun_UpdateStoreBillLedgerPosting'                             
                                     
                        
select @sqlstr = @sqlstr + '  ( ' + '''' + @Comp_Code  +''' , '+ '''' + @Location_Code   +''', '+ '''' + @Tran_No   +''') as a'    
 


 
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + ltrim(rtrim(@Comp_Code))   + ''''            
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + ltrim(rtrim(@Location_Code))  + ''''            
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code=' + '''' + ltrim(rtrim(@Fin_Year_Code))  + ''''            
select @sqlstr = @sqlstr + ' And a.Entry_No='  + '''' + ltrim(rtrim(@Tran_No )) + ''''  
 
 

           
select @sqlstr = @sqlstr + ' Group By '
 select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code,a.Fin_Year_Code   '
 select @sqlstr = @sqlstr + ' ,a.Entry_No ,a.Entry_Date ,a.inv_No ,a.inv_Date '
 select @sqlstr = @sqlstr + '  ,a.Party_Name ,a.Narration,a.debit ,a.credit  '
select @sqlstr = @sqlstr + ' 	,a.refaccountname  '   
select @sqlstr = @sqlstr + ' 	having  (a.debit <>0 or a.credit<>0)       '
print(@sqlstr)           
exec (@sqlstr)           
IF (@@error <> 0) goto ErrHand          
COMMIT TRAN TRAN1          
END     
      
else IF (            
 @Tran_Type ='Store Payment Entry'         
       
        
 )            
           
          
BEGIN            
 

select @sqlstr = @sqlstr + ' Select a.Comp_Code,a.Location_Code,a.Fin_Year_Code ' 
  select @sqlstr = @sqlstr + '   ,a.Entry_No ,a.Entry_Date ,b.Ref_inv_No ,b.Ref_inv_Date  '
 select @sqlstr = @sqlstr + '  ,b.particulars ,b.Narration,b.debit ,b.credit  '
select @sqlstr = @sqlstr + ' 	,b.refaccountname  '
select @sqlstr = @sqlstr + ' 	FROM  tbl_StorePaymentEntry as a  '
select @sqlstr = @sqlstr + ' 	left join  tbl_StorePaymentEntry_Main as b  '
	select @sqlstr = @sqlstr + '  on b.Entry_No =a.Entry_No and b.Entry_Date =a.Entry_Date   '



 
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + ltrim(rtrim(@Comp_Code))   + ''''            
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + ltrim(rtrim(@Location_Code))  + ''''            
select @sqlstr = @sqlstr + ' And a.Fin_Year_Code=' + '''' + ltrim(rtrim(@Fin_Year_Code))  + ''''            
select @sqlstr = @sqlstr + ' And a.Entry_No='  + '''' + ltrim(rtrim(@Tran_No))    + '''' 
--select @sqlstr = @sqlstr + ' And a.voucher_Type=''Payment'' '

           
select @sqlstr = @sqlstr + ' Group By '
 select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code,a.Fin_Year_Code   '
 select @sqlstr = @sqlstr + ' ,a.Entry_No ,a.Entry_Date ,b.Ref_inv_No ,b.Ref_inv_Date  '
 select @sqlstr = @sqlstr + '  ,b.particulars ,b.Narration,b.debit ,b.credit  '
select @sqlstr = @sqlstr + ' 	,b.refaccountname  '         
print(@sqlstr)          
exec (@sqlstr)           
IF (@@error <> 0) goto ErrHand          
COMMIT TRAN TRAN1          
END     

 
       
      
           
return          
ErrHand:          
BEGIN          
 ROLLBACK TRAN TRAN1          
END      
            
            





GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_Savetbl_StoreBillEntry]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Author		:	KRK
-- Create date	:	05-05-2022
-- Modified date : 12/08/2022      

-- Description	:	Save Activity MAster  (Insert / Update)
-- ==================================================================
--select * from Category_Master
--exec sp_tbl_Savetbl_StoreBillEntry '100','13','krk','0','ADD','ADMIN','0',1
CREATE Proc [dbo].[sp_tbl_Savetbl_StoreBillEntry]
(
@Comp_Code		Varchar(20),
@Location_Code		Varchar(20),
@Fin_Year_Code		Varchar(20),

@Entry_No		varchar(50),
@Entry_Date    Varchar(10), 
@Unit_Name        Varchar(50),  
@Dept_Name        Varchar(50),    
@inv_No       Varchar(50),    
@inv_Date        Varchar(50),  
@Party_Name        Varchar(50),    
  @GRB_NO     Varchar(50),    
@Invoice_Value       Varchar(50),   
@Remarks        Varchar(50), 

@Closed       Varchar(50),   
@Closed_Date      Varchar(50),   
@IsActive    varchar(200), 


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
	Select Count(Entry_No ) from  tbl_StoreBillEntry 
	Where	Comp_Code  =	@Comp_Code 
			And		Location_Code 		=	@Location_Code
	And		Entry_No		=	@Entry_No  
				
)
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))
BEGIN TRAN TRAN1
select @sqlstr=''
IF @iMode<=0 
BEGIN
select @sqlstr = 'Insert into tbl_StoreBillEntry Values('
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code    ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code    ))				+ ''''
 
select @sqlstr= @sqlstr + ','+ '''' + @Entry_No   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @Entry_Date   + ''''  
 
select @sqlstr= @sqlstr + ','+ '''' + @Unit_Name   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @Dept_Name   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @inv_No   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @inv_Date  + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @Party_Name   + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @GRB_NO   + ''''    
   
select @sqlstr= @sqlstr + ','+ '''' + @Invoice_Value  + ''''     
select @sqlstr= @sqlstr + ','+ '''' + @Remarks       + '''' 
select @sqlstr= @sqlstr + ','+ '''' + @Closed       + '''' 
select @sqlstr= @sqlstr + ','+ '''' + @Closed_Date       + '''' 


  

 
--select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Isactive ))				+ ''''
--select @sqlstr= @sqlstr + ',0'

select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate							+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate							+ '''' + ')'
END
ELSE IF @iMode=1
BEGIN
select @sqlstr = 'Update tbl_StoreBillEntry Set '

select @sqlstr= @sqlstr + ' Unit_Name='   + '''' + @Unit_Name     + ''''    
select @sqlstr= @sqlstr + ',Party_Name='   + '''' + @Party_Name    + ''''    
select @sqlstr= @sqlstr + ',inv_No='  + '''' + @inv_No   + ''''    
select @sqlstr= @sqlstr + ',inv_Date='   + '''' + @inv_Date     + ''''    
select @sqlstr= @sqlstr + ',Invoice_Value='   + '''' + @Invoice_Value    + ''''     
select @sqlstr= @sqlstr + ',GRB_NO='   + '''' + @GRB_NO    + ''''      
select @sqlstr= @sqlstr + ', Dept_Name='   + '''' + @Dept_Name    + ''''      
 
select @sqlstr= @sqlstr + ',Remarks='   + '''' + @Remarks     + ''''    
 
--select @sqlstr= @sqlstr + ',IsActive='				+ '''' + ltrim(rtrim(@Isactive))		+ ''''
select @sqlstr= @sqlstr + ',Modified_By='			+ '''' + ltrim(rtrim(@User_Code))	+ ''''
select @sqlstr= @sqlstr + ',Modified_Date='			+ '''' + @iServerDate				+ ''''
select @sqlstr= @sqlstr +  ' Where Comp_Code='		+ '''' + @Comp_Code					+ ''''
select @sqlstr= @sqlstr +  ' and Location_Code='		+ '''' + @Location_Code					+ ''''
select @sqlstr= @sqlstr +  ' And Entry_No	='	+ '''' + @Entry_No				+ ''''  

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
/****** Object:  StoredProcedure [dbo].[sp_tbl_Savetbl_VehicleFuelBillEntry]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Author		:	KRK
-- Create date	:	05-10-2022
-- Modified date : 12/10/2022      

-- Description	:	Save Vehilcle Fuel bill Entry  (Insert / Update)
-- ==================================================================
--select * from Category_Master
--exec sp_tbl_Savetbl_StoreBillEntry '100','13','krk','0','ADD','ADMIN','0',1
create Proc [dbo].[sp_tbl_Savetbl_VehicleFuelBillEntry]
(
@Comp_Code		Varchar(20),
@Location_Code		Varchar(20),
@Fin_Year_Code		Varchar(20),

@Entry_No		varchar(50),
@Entry_Date    Varchar(10), 
@Unit_Name        Varchar(50), 
@Party_Name        Varchar(50),    
@inv_No       Varchar(50),    
@inv_Date        Varchar(50),  
@Indent_NO     Varchar(50),    
@Vehicle_no    Varchar(50),    
@Fuel_Type     Varchar(50),    
@Start_Reading                Varchar(10),
@End_Reading                 Varchar(10),
@Running_Kms                Varchar(10),
@Fuel_Qty             Varchar(10),
@Rate_Per_Ltr             Varchar(10),
@Bill_Amt                Varchar(10),
@mileage_Kmphr             Varchar(10),
@Driver_Name              Varchar(10),
@Remarks        Varchar(50), 
@IsActive    varchar(200), 
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
	Select Count(Entry_No ) from  tbl_VehicleFuelBillEntry 
	Where	Comp_Code  =	@Comp_Code 
			And		Location_Code 		=	@Location_Code
	And		Entry_No		=	@Entry_No  
				
)
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))
BEGIN TRAN TRAN1
select @sqlstr=''
IF @iMode<=0 
BEGIN
select @sqlstr = 'Insert into tbl_VehicleFuelBillEntry Values('
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))					+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code    ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code    ))				+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @Entry_No   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @Entry_Date   + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @Unit_Name   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @Party_Name   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @inv_No   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @inv_Date  + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @Indent_NO   + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @Vehicle_no   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @Fuel_Type   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @Start_Reading   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @End_Reading   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @Running_Kms   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @Fuel_Qty   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @Rate_Per_Ltr   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @Bill_Amt   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @mileage_Kmphr   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @Driver_Name   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @Remarks       + '''' 
  
--select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Isactive ))				+ ''''
select @sqlstr= @sqlstr + ',0		'

select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate							+ '''' 
select @sqlstr= @sqlstr + ','+ '''' + @User_Code								+ ''''
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate							+ '''' + ')'
END
ELSE IF @iMode=1
BEGIN
select @sqlstr = 'Update tbl_VehicleFuelBillEntry Set '

select @sqlstr= @sqlstr + ' Unit_Name='   + '''' + @Unit_Name     + ''''    
select @sqlstr= @sqlstr + ',Party_Name='   + '''' + @Party_Name    + ''''    
select @sqlstr= @sqlstr + ',inv_No='  + '''' + @inv_No   + ''''    
select @sqlstr= @sqlstr + ',inv_Date='   + '''' + @inv_Date     + ''''    
select @sqlstr= @sqlstr + ',Indent_NO='   + '''' + @Indent_NO    + ''''      

select @sqlstr= @sqlstr + ',Vehicle_no='   + '''' + @Vehicle_no    + ''''     
select @sqlstr= @sqlstr + ',Fuel_Type='   + '''' + @Fuel_Type    + ''''     
select @sqlstr= @sqlstr + ',Start_Reading='   + '''' + @Start_Reading    + ''''     
select @sqlstr= @sqlstr + ',End_Reading='   + '''' + @End_Reading    + ''''     
select @sqlstr= @sqlstr + ',Running_Kms='   + '''' + @Running_Kms    + ''''     
select @sqlstr= @sqlstr + ',Fuel_Qty='   + '''' + @Fuel_Qty    + ''''    

select @sqlstr= @sqlstr + ',Rate_Per_Ltr='   + '''' + @Rate_Per_Ltr    + ''''     
select @sqlstr= @sqlstr + ',Bill_Amt='   + '''' + @Bill_Amt    + ''''     
select @sqlstr= @sqlstr + ',Mileage_Kmphr='   + '''' + @mileage_Kmphr    + ''''     
select @sqlstr= @sqlstr + ',Driver_Name='   + '''' + @Driver_Name    + ''''     
select @sqlstr= @sqlstr + ',Remarks='   + '''' + @Remarks     + ''''    
--select @sqlstr= @sqlstr + ',IsActive='				+ '''' + ltrim(rtrim(@Isactive))		+ ''''
select @sqlstr= @sqlstr + ',Modified_By='			+ '''' + ltrim(rtrim(@User_Code))	+ ''''
select @sqlstr= @sqlstr + ',Modified_Date='			+ '''' + @iServerDate				+ ''''
select @sqlstr= @sqlstr +  ' Where Comp_Code='		+ '''' + @Comp_Code					+ ''''
select @sqlstr= @sqlstr +  ' and Location_Code='		+ '''' + @Location_Code					+ ''''
select @sqlstr= @sqlstr +  ' And Entry_No	='	+ '''' + @Entry_No				+ ''''  

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
/****** Object:  StoredProcedure [dbo].[sp_tbl_SavetblStorePaymentEntry]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_tbl_SavetblStorePaymentEntry]    
(    
@Comp_Code     Varchar(10),    
@Location_Code    Varchar(10),    
@Fin_Year_Code    Varchar(10),    
@Entry_No     varchar(100),    
@Entry_Date     Varchar(10),    
@Ref_Inv_No   varchar(100),    
@Ref_Inv_Date   varchar(10),   
  
@Credit_To     varchar(100),    
@Total_Amount    varchar(100),    
    
   
@Narration   varchar(1000),    
     
@Authorize     Varchar(1),    
@Delete_Mode    Varchar(1),    
@Screen_Mode    Varchar(20),    
@User_Code     Varchar(15),    
@iSuccessFlag       bit output    
)    
as    
set nocount on    
set dateformat ymd    
Declare @sqlstr   Varchar(8000)    
Declare @iMode   Numeric(18,0)    
Declare @iServerDate Varchar(19)    
    
Set @iMode=(    
    Select Count(Entry_No) from tbl_StorePaymentEntry     
    Where Comp_Code  = @Comp_Code     
    And  Location_Code = @Location_Code    
    And  Fin_Year_Code = @Fin_Year_Code    
    And  Entry_No   = @Entry_No     
    And  Entry_Date  = @Entry_Date    
   )    
    
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))    
    
BEGIN TRAN TRAN1    
select @sqlstr=''    
IF @iMode<=0     
BEGIN    
select @sqlstr = 'Insert into tbl_StorePaymentEntry Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))      + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date))     + ''''   

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Ref_Inv_No))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Ref_Inv_Date ))    + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Credit_To  ))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Total_Amount))     + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Narration   ))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + ''''     
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + '''' + ')'    
END    
ELSE IF @iMode=1    
BEGIN    
select @sqlstr = 'Update tbl_StorePaymentEntry Set '    
    
    
select @sqlstr= @sqlstr + 'particulars='  + '''' + ltrim(rtrim(@Credit_To  ))    + ''''    
 
select @sqlstr= @sqlstr + ',inv_No=' + '''' + ltrim(rtrim(@Ref_Inv_No))    + ''''    
select @sqlstr= @sqlstr + ',inv_Date=' + '''' + ltrim(rtrim(@Ref_Inv_Date))   + ''''    
    
select @sqlstr= @sqlstr + ',totalAmount='  + '''' + ltrim(rtrim(@Total_Amount))   + ''''    
  
select @sqlstr= @sqlstr + ',Narration='  + '''' + ltrim(rtrim(@Narration ))    + ''''     
select @sqlstr= @sqlstr + ',Authorize='    + '''' + ltrim(rtrim(@Authorize))     + ''''    
select @sqlstr= @sqlstr + ',Delete_Mode='   + '''' + ltrim(rtrim(@Delete_Mode))     + ''''    
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))     + ''''    
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate        + ''''    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code         + ''''    
select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + @Location_Code        + ''''      
select @sqlstr= @sqlstr +  ' And Fin_Year_Code=' + '''' + @Fin_Year_Code        + ''''      
select @sqlstr= @sqlstr +  ' And Entry_No='   + '''' + @Entry_No         + ''''      
select @sqlstr= @sqlstr +  ' And Entry_Date='  + '''' + @Entry_Date        + ''''      
END    
exec(@sqlstr )    
print @sqlstr    
    
IF @iMode=1    
BEGIN    
select @sqlstr = 'Delete from tbl_StorePaymentEntry_Main'    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code   + ''''    
select @sqlstr= @sqlstr +  ' And Location_Code=' + '''' + @Location_Code  + ''''      
select @sqlstr= @sqlstr +  ' And Fin_Year_Code=' + '''' + @Fin_Year_Code  + ''''      
select @sqlstr= @sqlstr +  ' And Entry_No='  + '''' + @Entry_No  + ''''      
select @sqlstr= @sqlstr +  ' And Entry_Date=' + '''' + @Entry_Date + ''''      
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
/****** Object:  StoredProcedure [dbo].[sp_tbl_SavetblStorePaymentEntry_Main]    Script Date: 25/04/2023 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
-- =================================================================    
-- Author  : KRK    
-- Create date : 23/06/2022    
-- Description : Save Payment Voucher Entry Main (Insert / Update)    
-- Save Payment Voucher Entry 
-- ==================================================================    
-- Grant Execute On GST_JournalEntry_line To Public    
-- Select * from ACC_PaymentVoucher    
-- Select * from ACC_PaymentVoucher_Main    
    
CREATE Proc [dbo].[sp_tbl_SavetblStorePaymentEntry_Main]    
(    
@Comp_Code     Varchar(10),    
@Location_Code    Varchar(10),    
@Fin_Year_Code    Varchar(10),    
@voucher_No     varchar(100),    
@voucher_Date     Varchar(10),     
@SNo      Varchar(3),    
    
@particulars    varchar(1000),    
    
@Narration     varchar(100),    
    @debit      varchar(20),
@credit      varchar(20),    
    
    
@status      varchar(20),    
@updatefrom      varchar(20),    
@refaccountname      varchar(20),  
@Ref_inv_No    Varchar(10),   
@Ref_inv_Date    Varchar(10),     
@Authorize     Varchar(1),    
@Delete_Mode    Varchar(1),    
@Screen_Mode    Varchar(20),    
@User_Code     Varchar(15),    
@iSuccessFlag       bit output    
)    
as    
set nocount on    
set dateformat ymd    
Declare @sqlstr   Varchar(8000)    
Declare @iServerDate Varchar(19)    
    
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))    
    
BEGIN TRAN TRAN1    
    
select @sqlstr=''    
select @sqlstr = 'Insert into tbl_StorePaymentEntry_Main Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fin_Year_Code))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@voucher_No  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@voucher_Date))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@SNo  ))   + ''''    
    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@particulars     ))      + ''''    
    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Narration       ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@debit         )) + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@credit         ))+ ''''    
 
    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@status          )) + ''''    
    
    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@updatefrom    )) + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@refaccountname     )) + ''''     
    select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Ref_inv_No     )) + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Ref_inv_Date     )) + ''''  
    
--select @sqlstr= @sqlstr + ',''0'''    
    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @User_Code      + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate      + ''''     
select @sqlstr= @sqlstr + ','+ '''' + @User_Code      + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate      + '''' + ')'    
print (@sqlstr)    
exec(@sqlstr )    
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
USE [master]
GO
ALTER DATABASE [DB_General] SET  READ_WRITE 
GO
