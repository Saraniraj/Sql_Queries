USE [Powersoft_YASOTHA]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_SparesincentiveEntry_Main]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_SparesincentiveEntry_Main]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_SparesincentiveEntry_Line]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_SparesincentiveEntry_Line]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_SecurityIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_SecurityIncentiveEntry_Main]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_SecurityIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_SecurityIncentiveEntry_Line]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_SalesIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_SalesIncentiveEntry_Main]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_SalesIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_SalesIncentiveEntry_Line]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_OtherIncentive_Master]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_OtherIncentive_Master]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_MechanicIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_MechanicIncentiveEntry_Main]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_MechanicIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_MechanicIncentiveEntry_Line]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_MechanicIncentive_Master]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_MechanicIncentive_Master]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_Mechanic_HelperLink_Main]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_Mechanic_HelperLink_Main]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_Mechanic_HelperLink_Line]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_Mechanic_HelperLink_Line]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_JobcardIncentive_Master]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_JobcardIncentive_Master]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_IncentiveType_Master]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_IncentiveType_Master]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_Incentive_Master]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_Incentive_Master]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_HSKPGIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_HSKPGIncentiveEntry_Main]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_HSKPGIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_HSKPGIncentiveEntry_Line]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_AdvisorIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_AdvisorIncentiveEntry_Main]
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_AdvisorIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_Save_Ins_AdvisorIncentiveEntry_Line]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_SparesIncentive_Details]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_GetIns_SparesIncentive_Details]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_SecurityIncentive_Details]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_GetIns_SecurityIncentive_Details]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_SalesIncentive_Details]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_GetIns_SalesIncentive_Details]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_OtherIncentive_Master]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_GetIns_OtherIncentive_Master]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_MechanicIncentive_Master]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_GetIns_MechanicIncentive_Master]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_MechanicIncentive_Details]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_GetIns_MechanicIncentive_Details]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_Mechanic_HelperLink_Details]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_GetIns_Mechanic_HelperLink_Details]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_JobcardIncentive_Master]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_GetIns_JobcardIncentive_Master]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_IncentiveType_Master]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_GetIns_IncentiveType_Master]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_Incentive_Master]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_GetIns_Incentive_Master]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_HSKPGIncentive_Details]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_GetIns_HSKPGIncentive_Details]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_AdvisorIncentive_Details]    Script Date: 24/03/2023 23:10:10 ******/
DROP PROCEDURE [dbo].[sp_GetIns_AdvisorIncentive_Details]
GO
/****** Object:  Table [dbo].[Ins_SparesincentiveEntry_Main]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_SparesincentiveEntry_Main]
GO
/****** Object:  Table [dbo].[Ins_SparesincentiveEntry_Line]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_SparesincentiveEntry_Line]
GO
/****** Object:  Table [dbo].[Ins_SecurityIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_SecurityIncentiveEntry_Main]
GO
/****** Object:  Table [dbo].[Ins_SecurityIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_SecurityIncentiveEntry_Line]
GO
/****** Object:  Table [dbo].[Ins_SalesIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_SalesIncentiveEntry_Main]
GO
/****** Object:  Table [dbo].[Ins_SalesIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_SalesIncentiveEntry_Line]
GO
/****** Object:  Table [dbo].[Ins_OtherIncentive_Master]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_OtherIncentive_Master]
GO
/****** Object:  Table [dbo].[Ins_MechanicIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_MechanicIncentiveEntry_Main]
GO
/****** Object:  Table [dbo].[Ins_MechanicIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_MechanicIncentiveEntry_Line]
GO
/****** Object:  Table [dbo].[Ins_MechanicIncentive_Master]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_MechanicIncentive_Master]
GO
/****** Object:  Table [dbo].[Ins_Mechanic_HelperLink_Main]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_Mechanic_HelperLink_Main]
GO
/****** Object:  Table [dbo].[Ins_Mechanic_HelperLink_Line]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_Mechanic_HelperLink_Line]
GO
/****** Object:  Table [dbo].[Ins_JobcardIncentive_Master]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_JobcardIncentive_Master]
GO
/****** Object:  Table [dbo].[Ins_IncentiveType_Master]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_IncentiveType_Master]
GO
/****** Object:  Table [dbo].[Ins_Incentive_Master]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_Incentive_Master]
GO
/****** Object:  Table [dbo].[Ins_HSKPGIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_HSKPGIncentiveEntry_Main]
GO
/****** Object:  Table [dbo].[Ins_HSKPGIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_HSKPGIncentiveEntry_Line]
GO
/****** Object:  Table [dbo].[Ins_AdvisorIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_AdvisorIncentiveEntry_Main]
GO
/****** Object:  Table [dbo].[Ins_AdvisorIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:10 ******/
DROP TABLE [dbo].[Ins_AdvisorIncentiveEntry_Line]
GO
/****** Object:  Table [dbo].[Ins_AdvisorIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ins_AdvisorIncentiveEntry_Line](
	[Comp_Code] [nvarchar](100) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [nvarchar](150) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Sno] [varchar](10) NOT NULL,
	[EmpCode] [nvarchar](15) NOT NULL,
	[EmpID] [nvarchar](15) NULL,
	[EmpName] [nvarchar](150) NOT NULL,
	[FreeService] [float] NOT NULL,
	[PaidService] [float] NOT NULL,
	[GeneralService] [float] NOT NULL,
	[MJ_AW] [float] NOT NULL,
	[PS_AMC] [float] NOT NULL,
	[Synth_Oil_Sales] [float] NOT NULL,
	[Carbon_Cleaning] [float] NOT NULL,
	[Wax_Polish] [float] NOT NULL,
	[Wax_Coating] [float] NOT NULL,
	[INSURANCE] [float] NOT NULL,
	[LABOUR] [float] NOT NULL,
	[Spares] [float] NOT NULL,
	[Incentive] [float] NULL,
	[Final_Incentive] [float] NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Ins_AdvisorIncentiveEntry_Line] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Sno] ASC,
	[EmpCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ins_AdvisorIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ins_AdvisorIncentiveEntry_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [varchar](100) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Deptcode] [nvarchar](150) NOT NULL,
	[DeptName] [nvarchar](150) NOT NULL,
	[Tot_Amount] [float] NOT NULL,
	[Others_Desc] [nvarchar](150) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Ins_AdvisorIncentiveEntry_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Deptcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ins_HSKPGIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Ins_HSKPGIncentiveEntry_Line](
	[Comp_Code] [nvarchar](100) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [nvarchar](150) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Sno] [varchar](10) NOT NULL,
	[EmpCode] [nvarchar](15) NOT NULL,
	[EmpID] [nvarchar](15) NULL,
	[EmpName] [nvarchar](150) NOT NULL,
	[Fixed_Incentive] [float] NOT NULL,
	[Leave] [float] NOT NULL,
	[Incentive] [float] NOT NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Ins_HSKPGIncentiveEntry_Line] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Sno] ASC,
	[EmpCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ins_HSKPGIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ins_HSKPGIncentiveEntry_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [varchar](100) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Deptcode] [nvarchar](150) NOT NULL,
	[DeptName] [nvarchar](150) NOT NULL,
	[Allow_Name] [nvarchar](50) NOT NULL,
	[Tot_Amount] [float] NOT NULL,
	[Others_Desc] [nvarchar](150) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Ins_HSKPGIncentiveEntry_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Deptcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ins_Incentive_Master]    Script Date: 24/03/2023 23:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ins_Incentive_Master](
	[Comp_code] [varchar](50) NOT NULL,
	[Location_Code] [varchar](20) NOT NULL,
	[Inc_Code] [bigint] NOT NULL,
	[Inc_Name] [varchar](50) NULL,
	[Inc_Desc] [varchar](250) NULL,
	[Inctype_Name] [varchar](50) NOT NULL,
	[Target] [nvarchar](50) NOT NULL,
	[Incentive_Amount] [numeric](18, 0) NULL,
	[IS_Active] [int] NULL,
	[Created_By] [varchar](15) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](15) NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Ins_Incentive_Master] PRIMARY KEY CLUSTERED 
(
	[Comp_code] ASC,
	[Location_Code] ASC,
	[Target] ASC,
	[Inctype_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ins_IncentiveType_Master]    Script Date: 24/03/2023 23:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ins_IncentiveType_Master](
	[Comp_code] [varchar](50) NULL,
	[Location_Code] [varchar](20) NULL,
	[Inctype_Code] [bigint] NOT NULL,
	[Inctype_Name] [varchar](50) NULL,
	[IS_Active] [int] NULL,
	[Created_By] [varchar](15) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](15) NULL,
	[Modified_Date] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ins_JobcardIncentive_Master]    Script Date: 24/03/2023 23:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ins_JobcardIncentive_Master](
	[Comp_code] [varchar](50) NULL,
	[Location_Code] [varchar](20) NULL,
	[JOB_Code] [bigint] NOT NULL,
	[JOB_Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[Incentive_Amount] [numeric](18, 3) NULL,
	[IS_Active] [int] NULL,
	[Created_By] [varchar](15) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](15) NULL,
	[Modified_Date] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ins_Mechanic_HelperLink_Line]    Script Date: 24/03/2023 23:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ins_Mechanic_HelperLink_Line](
	[Comp_Code] [nvarchar](100) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [nvarchar](150) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Sno] [varchar](10) NOT NULL,
	[Mech_EmpCode] [nvarchar](15) NOT NULL,
	[Mech_EmpID] [nvarchar](15) NULL,
	[Mech_EmpName] [nvarchar](150) NOT NULL,
	[Mech_Percentage] [float] NULL,
	[Helper_EmpCode] [nvarchar](15) NOT NULL,
	[Helper_EmpID] [nvarchar](15) NULL,
	[Helper_EmpName] [nvarchar](150) NOT NULL,
	[Helper_Percentage] [float] NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Ins_Mechanic_HelperLink_Line] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Sno] ASC,
	[Mech_EmpCode] ASC,
	[Helper_EmpCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ins_Mechanic_HelperLink_Main]    Script Date: 24/03/2023 23:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ins_Mechanic_HelperLink_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [varchar](100) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Deptcode] [nvarchar](150) NOT NULL,
	[DeptName] [nvarchar](150) NOT NULL,
	[Tot_Amount] [float] NOT NULL,
	[Others_Desc] [nvarchar](150) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Ins_Mechanic_HelperLink_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Deptcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ins_MechanicIncentive_Master]    Script Date: 24/03/2023 23:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ins_MechanicIncentive_Master](
	[Comp_Code] [varchar](20) NOT NULL,
	[Location_Code] [varchar](20) NOT NULL,
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DeptCode] [bigint] NOT NULL,
	[Dept_Name] [varchar](15) NULL,
	[FreeService] [float] NOT NULL,
	[PaidService] [float] NOT NULL,
	[GeneralService] [float] NOT NULL,
	[MinorJOB] [float] NOT NULL,
	[AccidentWork] [float] NOT NULL,
	[PDI] [float] NOT NULL,
	[Fit] [float] NOT NULL,
	[WaterService] [float] NOT NULL,
	[Demo] [float] NOT NULL,
	[Labour] [float] NOT NULL,
	[Spares] [float] NOT NULL,
	[Effect_from] [datetime] NULL,
	[Effect_To] [datetime] NULL,
	[IS_Active] [int] NULL,
	[Created_By] [varchar](15) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](15) NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Ins_MechanicIncentive_Master] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[ID] ASC,
	[DeptCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ins_MechanicIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ins_MechanicIncentiveEntry_Line](
	[Comp_Code] [nvarchar](100) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [nvarchar](150) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Sno] [varchar](10) NOT NULL,
	[EmpCode] [nvarchar](15) NOT NULL,
	[EmpID] [nvarchar](15) NULL,
	[EmpName] [nvarchar](150) NOT NULL,
	[FreeService] [float] NOT NULL,
	[PaidService] [float] NOT NULL,
	[GeneralService] [float] NOT NULL,
	[MinorJOB] [float] NOT NULL,
	[AccidentWork] [float] NOT NULL,
	[PDI] [float] NOT NULL,
	[Fit] [float] NOT NULL,
	[WaterService] [float] NOT NULL,
	[Demo] [float] NOT NULL,
	[TOTAL] [float] NOT NULL,
	[Labour] [float] NOT NULL,
	[Spares] [float] NOT NULL,
	[Incentive] [float] NULL,
	[Final_Incentive] [float] NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Ins_MechanicIncentiveEntry_Line] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Sno] ASC,
	[EmpCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ins_MechanicIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ins_MechanicIncentiveEntry_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [varchar](100) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Deptcode] [nvarchar](150) NOT NULL,
	[DeptName] [nvarchar](150) NOT NULL,
	[Tot_Amount] [float] NOT NULL,
	[Others_Desc] [nvarchar](150) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Ins_MechanicIncentiveEntry_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Deptcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ins_OtherIncentive_Master]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ins_OtherIncentive_Master](
	[Comp_code] [varchar](50) NULL,
	[Location_Code] [varchar](20) NULL,
	[JOB_Code] [bigint] NOT NULL,
	[JOB_Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[Slab1] [varchar](50) NULL,
	[Slab2] [varchar](50) NULL,
	[Slab3] [varchar](50) NULL,
	[Slab1_Amount] [numeric](18, 2) NULL,
	[Slab2_Amount] [numeric](18, 2) NULL,
	[Slab3_Amount] [numeric](18, 2) NULL,
	[IS_Active] [int] NULL,
	[Created_By] [varchar](15) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](15) NULL,
	[Modified_Date] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ins_SalesIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Ins_SalesIncentiveEntry_Line](
	[Comp_Code] [nvarchar](100) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [nvarchar](150) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Sno] [varchar](10) NOT NULL,
	[EmpCode] [nvarchar](15) NOT NULL,
	[EmpID] [nvarchar](15) NULL,
	[EmpName] [nvarchar](150) NOT NULL,
	[Fixed_Incentive] [float] NOT NULL,
	[Leave] [float] NOT NULL,
	[Incentive] [float] NOT NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Ins_SalesIncentiveEntry_Line] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Sno] ASC,
	[EmpCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ins_SalesIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ins_SalesIncentiveEntry_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [varchar](100) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Deptcode] [nvarchar](150) NOT NULL,
	[DeptName] [nvarchar](150) NOT NULL,
	[Allow_Name] [nvarchar](50) NOT NULL,
	[Tot_Amount] [float] NOT NULL,
	[Others_Desc] [nvarchar](150) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Ins_SalesIncentiveEntry_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Deptcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ins_SecurityIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Ins_SecurityIncentiveEntry_Line](
	[Comp_Code] [nvarchar](100) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [nvarchar](150) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Sno] [varchar](10) NOT NULL,
	[EmpCode] [nvarchar](15) NOT NULL,
	[EmpID] [nvarchar](15) NULL,
	[EmpName] [nvarchar](150) NOT NULL,
	[Fixed_Incentive] [float] NOT NULL,
	[Leave] [float] NOT NULL,
	[Incentive] [float] NOT NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Ins_SecurityIncentiveEntry_Line] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Sno] ASC,
	[EmpCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ins_SecurityIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ins_SecurityIncentiveEntry_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [varchar](100) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Deptcode] [nvarchar](150) NOT NULL,
	[DeptName] [nvarchar](150) NOT NULL,
	[Allow_Name] [nvarchar](50) NOT NULL,
	[Tot_Amount] [float] NOT NULL,
	[Others_Desc] [nvarchar](150) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Ins_SecurityIncentiveEntry_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Deptcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ins_SparesincentiveEntry_Line]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Ins_SparesincentiveEntry_Line](
	[Comp_Code] [nvarchar](100) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [nvarchar](150) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Sno] [varchar](10) NOT NULL,
	[EmpCode] [nvarchar](15) NOT NULL,
	[EmpID] [nvarchar](15) NULL,
	[EmpName] [nvarchar](150) NOT NULL,
	[Fixed_Incentive] [float] NOT NULL,
	[Leave] [float] NOT NULL,
	[Incentive] [float] NOT NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Ins_SparesincentiveEntry_Line] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Sno] ASC,
	[EmpCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ins_SparesincentiveEntry_Main]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ins_SparesincentiveEntry_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [varchar](100) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Deptcode] [nvarchar](150) NOT NULL,
	[DeptName] [nvarchar](150) NOT NULL,
	[Allow_Name] [nvarchar](50) NOT NULL,
	[Tot_Amount] [float] NOT NULL,
	[Others_Desc] [nvarchar](150) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Ins_SparesincentiveEntry_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Deptcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Ins_Incentive_Master] ([Comp_code], [Location_Code], [Inc_Code], [Inc_Name], [Inc_Desc], [Inctype_Name], [Target], [Incentive_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 1, N'SYNTHETIC OIL SALES', N'SYNTHETIC OIL SALES', N'', N'0 TO 9', CAST(10 AS Numeric(18, 0)), 1, N'ADMIN', CAST(N'2023-03-21 22:57:21.000' AS DateTime), N'ADMIN', CAST(N'2023-03-21 22:57:21.000' AS DateTime))
GO
INSERT [dbo].[Ins_JobcardIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Incentive_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 1, N'FS', N'Free Service', CAST(0.000 AS Numeric(18, 3)), 1, N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Ins_JobcardIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Incentive_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 2, N'PS', N'Paid Service', CAST(0.000 AS Numeric(18, 3)), 1, N'ADMIN', CAST(N'2023-03-22 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Ins_JobcardIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Incentive_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 3, N'GS', N'General Service', CAST(0.000 AS Numeric(18, 3)), 1, N'ADMIN', CAST(N'2023-03-23 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-23 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Ins_JobcardIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Incentive_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 4, N'MJ', N'', CAST(0.000 AS Numeric(18, 3)), 1, N'ADMIN', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Ins_JobcardIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Incentive_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 5, N'AW', N'', CAST(0.000 AS Numeric(18, 3)), 1, N'ADMIN', CAST(N'2023-03-25 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-25 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Ins_JobcardIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Incentive_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 6, N'PDI', N'', CAST(5.000 AS Numeric(18, 3)), 1, N'ADMIN', CAST(N'2023-03-26 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-26 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Ins_JobcardIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Incentive_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 7, N'FIT', N'', CAST(12.000 AS Numeric(18, 3)), 1, N'ADMIN', CAST(N'2023-03-27 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-27 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Ins_JobcardIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Incentive_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 8, N'W/S', N'', CAST(3.500 AS Numeric(18, 3)), 1, N'ADMIN', CAST(N'2023-03-28 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-28 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Ins_JobcardIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Incentive_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 9, N'DEMO', N'', CAST(20.000 AS Numeric(18, 3)), 1, N'ADMIN', CAST(N'2023-03-29 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-29 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Ins_JobcardIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Incentive_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 10, N'LABOUR', N'', CAST(2.300 AS Numeric(18, 3)), 1, N'ADMIN', CAST(N'2023-03-30 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-30 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Ins_JobcardIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Incentive_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 11, N'SPARES', N'', CAST(1.300 AS Numeric(18, 3)), 1, N'ADMIN', CAST(N'2023-03-31 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:27:22.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'1', N'YM17', N'1019', N'DINESH KUMAR A', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'10', N'YM27', N'1029', N'KARUPPASAMY A', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'11', N'YM28', N'1030', N'SELVAKUMAR S', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'12', N'YM29', N'1031', N'SERMAN ARUNACHALAM K', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'13', N'YM30', N'1032', N'BALU A', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'14', N'YM31', N'1033', N'SURESH K', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'15', N'YM32', N'1034', N'SURENDRAN K', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'16', N'YM33', N'1035', N'THANGA PANDI C', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'17', N'YM34', N'1036', N'GOKUL G', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'18', N'YM35', N'1037', N'AZARUDEEN A', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'19', N'YM36', N'1038', N'KALIDASS P', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'2', N'YM18', N'1020', N'SHANMUGAMANI M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'20', N'YM37', N'1039', N'VENKATESH KANNAN M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'21', N'YM38', N'1040', N'BAGAVATHIRAJA  P', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'22', N'YM39', N'1041', N'PANDEESWARAN R', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'23', N'YM40', N'1042', N'BOOPESH P', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'24', N'YM42', N'1044', N'RAJESH M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'25', N'YM43', N'1045', N'ESWARAN M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'26', N'YM44', N'1046', N'AJITH KUMAR S', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'27', N'YM54', N'1056', N'NAVEEN R', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'28', N'YM68', N'1070', N'KISHORE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'3', N'YM19', N'1021', N'ARUNKUMAR A', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'4', N'YM21', N'1023', N'VEERA BABU T', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'5', N'YM22', N'1024', N'MONISHA S', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'6', N'YM23', N'1025', N'DHANALAKSHMI K', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'7', N'YM24', N'1026', N'GOPINATH P', 23, 16, 4, 17, 1, 0, 0, 0, 0, 61, 34780, 118604, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'8', N'YM25', N'1027', N'RAMESH P', 15, 18, 5, 17, 2, 0, 0, 0, 0, 57, 41020, 129673, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Line] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Sno], [EmpCode], [EmpID], [EmpName], [FreeService], [PaidService], [GeneralService], [MinorJOB], [AccidentWork], [PDI], [Fit], [WaterService], [Demo], [TOTAL], [Labour], [Spares], [Incentive], [Final_Incentive], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'9', N'YM26', N'1028', N'GANESAN V', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_MechanicIncentiveEntry_Main] ([Comp_Code], [Location_Code], [Entry_No], [Entry_Date], [Deptcode], [DeptName], [Tot_Amount], [Others_Desc], [Authorize], [Delete_Mode], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', N'MI/00001/22-23', CAST(N'2023-03-24 00:00:00.000' AS DateTime), N'3', N'SERVICE', 34, N'', 0, 0, N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime), N'ADMIN', CAST(N'2023-03-24 22:56:31.000' AS DateTime))
GO
INSERT [dbo].[Ins_OtherIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Slab1], [Slab2], [Slab3], [Slab1_Amount], [Slab2_Amount], [Slab3_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 1, N'SYNTHETIC OIL SALES', N'SYNTHETIC OIL SALES', N'0 TO 9', N'10 TO 25', N'ABOVE 26', CAST(0.00 AS Numeric(18, 2)), CAST(5.00 AS Numeric(18, 2)), CAST(8.00 AS Numeric(18, 2)), 1, N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Ins_OtherIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Slab1], [Slab2], [Slab3], [Slab1_Amount], [Slab2_Amount], [Slab3_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 2, N'PS AMC INC ', N'PS AMC INC ', N'0 TO 9', N'10 TO 20', N'ABOVE 21', CAST(30.00 AS Numeric(18, 2)), CAST(10.00 AS Numeric(18, 2)), CAST(20.00 AS Numeric(18, 2)), 1, N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Ins_OtherIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Slab1], [Slab2], [Slab3], [Slab1_Amount], [Slab2_Amount], [Slab3_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 3, N'CARBON CLEANING', N'CARBON CLEANING', N'0 TO 25', N'26 TO 50', N'ABOVE 50', CAST(10.00 AS Numeric(18, 2)), CAST(20.00 AS Numeric(18, 2)), CAST(30.00 AS Numeric(18, 2)), 1, N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Ins_OtherIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Slab1], [Slab2], [Slab3], [Slab1_Amount], [Slab2_Amount], [Slab3_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 4, N'WAX POLISH', N'WAX POLISH', N'0 TO 14', N'15 TO 50', N'ABOVE 50', CAST(0.00 AS Numeric(18, 2)), CAST(5.00 AS Numeric(18, 2)), CAST(8.00 AS Numeric(18, 2)), 1, N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Ins_OtherIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Slab1], [Slab2], [Slab3], [Slab1_Amount], [Slab2_Amount], [Slab3_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 5, N'WAX COATING', N'WAX COATING', N'0 TO 9', N'10 TO 20', N'ABOVE 20', CAST(0.00 AS Numeric(18, 2)), CAST(10.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), 1, N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Ins_OtherIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Slab1], [Slab2], [Slab3], [Slab1_Amount], [Slab2_Amount], [Slab3_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 6, N'INSURANCE', N'INSURANCE', N'0 TO 4', N'5 TO 15', N'ABOVE 15', CAST(0.00 AS Numeric(18, 2)), CAST(20.00 AS Numeric(18, 2)), CAST(30.00 AS Numeric(18, 2)), 1, N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Ins_OtherIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Slab1], [Slab2], [Slab3], [Slab1_Amount], [Slab2_Amount], [Slab3_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 7, N'GS INC', N'GS INC', N'(0 TO 24) ', N' (25 TO 50)', N'(ABOVE 50)', CAST(0.00 AS Numeric(18, 2)), CAST(10.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), 1, N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Ins_OtherIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Slab1], [Slab2], [Slab3], [Slab1_Amount], [Slab2_Amount], [Slab3_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 8, N'LABOUR', N'LABOUR', N'0 TO .6L', N'0.61L TO 1.25L', N'ABOVE 1.25L', CAST(0.00 AS Numeric(18, 2)), CAST(0.50 AS Numeric(18, 2)), CAST(0.75 AS Numeric(18, 2)), 1, N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Ins_OtherIncentive_Master] ([Comp_code], [Location_Code], [JOB_Code], [JOB_Name], [Description], [Slab1], [Slab2], [Slab3], [Slab1_Amount], [Slab2_Amount], [Slab3_Amount], [IS_Active], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'100', N'THENI', 9, N'SPARES', N'SPARES', N'0 TO 0.99L', N'1.0 L TO 1.75 L', N'ABOVE 1.75 L', CAST(0.00 AS Numeric(18, 2)), CAST(0.40 AS Numeric(18, 2)), CAST(0.60 AS Numeric(18, 2)), 1, N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime), N'ADMIN', CAST(N'2023-03-21 00:00:00.000' AS DateTime))
GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_AdvisorIncentive_Details]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================        
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :23-03-2023   
-- Description : Get Ins_Advisor  Keeping Incentive ENTRY    
-- ===============================================================        
-- Grant Execute On  To Public        
 --select * from   Ins_AdvisorIncentiveEntry_Main
 --select * from   Ins_AdvisorIncentiveEntry_Line   
      
-- exec [sp_GetIns_AdvisorIncentive_Details] '100','THENI','AI/00001/22-23','' ,'Specify'      
--- exec [sp_GetIns_AdvisorIncentive_Details] '100','THENI','2020-07-02' ,'Increment Report'      
-- exec [sp_GetIns_AdvisorIncentive_Details] '100','THENI',' ','' ,'aLL'      
 
create Proc [dbo].[sp_GetIns_AdvisorIncentive_Details]        
(        
@Comp_Code    Varchar(20),        
@Location_Code   Varchar(20),        
@Trans_No     Varchar(100),        
@Att_date    Varchar(100),         
@Filter_Data   Varchar(30)        
)        
as        
BEGIN        
set nocount on        
set dateformat ymd        
Declare @sqlstr varchar(8000)        
        
IF         
 (        
   @Filter_Data = 'Specify'        
          
 )        
BEGIN        
select @sqlstr = 'SELECT  '        
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code '        
select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.Deptcode,d.Deptname ,a.Others_Desc '   
select @sqlstr = @sqlstr + ' ,Tot_Amount '             
select @sqlstr = @sqlstr + ' ,b.Entry_No,b.Entry_Date '        
select @sqlstr = @sqlstr + ' ,b.Sno,b.EmpCode,b.EmpID '        
select @sqlstr = @sqlstr + ' ,b.EmpName '         
select @sqlstr = @sqlstr + '  ,b.FreeService,b.PaidService,b.GeneralService,b.MJ_AW,b.PS_AMC '
select @sqlstr = @sqlstr + ',b.Synth_Oil_Sales,b.Carbon_Cleaning,b.Wax_Polish,b.Wax_Coating,b.INSURANCE,b.LABOUR,b.Spares '
select @sqlstr = @sqlstr + ',b.Incentive,b.Final_Incentive '        
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  Ins_AdvisorIncentiveEntry_Main as a '        
select @sqlstr = @sqlstr + ' left join  Ins_AdvisorIncentiveEntry_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =h.Catcode '        
select @sqlstr = @sqlstr + ' left join Deptmaster as d  '        
select @sqlstr = @sqlstr + ' on d.Location_Code =b.location_code and d.DeptCode =h.Deptcode  '        
select @sqlstr = @sqlstr + ' left join Designation as e  '        
select @sqlstr = @sqlstr + ' on e.Location_Code =b.location_code and e.DesgnCode =h.Desgncode  '     
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_No='   + '''' + @Trans_No  + ''''        
--select @sqlstr = @sqlstr + ' and a.Att_date='   + '''' + @Att_date  + ''''        
      
      
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code=' + '''' + @Fin_Year_Code + ''''        
--select @sqlstr = @sqlstr + ' And a.EntryId='   + '''' + @Trans_No  + ''''        
--select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '    
select @sqlstr = @sqlstr + ' Order by h.Empid asc'         
END       
      
else IF         
 (        
   @Filter_Data = 'Other Earning Report'        
          
 )        
BEGIN        
       
select @sqlstr = 'SELECT  '        
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code '        
select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.DeptCode,d.Deptname ,a.Others_Desc '        
select @sqlstr = @sqlstr + ' ,b.Sno,b.EmpCode,b.EmpID '        
select @sqlstr = @sqlstr + ' ,b.FreeService,b.PaidService,b.GeneralService,b.MinorJOB,b.AccidentWork,b.PDI,b.Fit '
select @sqlstr = @sqlstr + '  ,b.WaterService,b.Demo,b.TOTAL,b.Labour,b.Spares,b.Incentive,b.Final_Incentive  '    
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  Ins_AdvisorIncentiveEntry_Main as a '        
select @sqlstr = @sqlstr + ' left join  Ins_AdvisorIncentiveEntry_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '    
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =h.cat_code '        
select @sqlstr = @sqlstr + ' left join Deptmaster as d  '        
select @sqlstr = @sqlstr + ' on d.Location_Code =b.location_code and d.DeptCode =h.Deptcode  '        
select @sqlstr = @sqlstr + ' left join Designation as e  '        
select @sqlstr = @sqlstr + ' on e.Location_Code =b.location_code and e.DesgnCode =h.Desgncode  '    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_No='   + '''' + @Trans_No  + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_Date='   + '''' + @Att_date  + ''''       
END       
        
ELSE IF @Filter_Data  = 'All'        
BEGIN        
select @sqlstr = ' SELECT '        
      
select @sqlstr = @sqlstr + '  a.Comp_Code,a.Location_Code  '        
select @sqlstr = @sqlstr + '  ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + '   '  
select @sqlstr = @sqlstr + '  ,a.DeptCode,b.Deptname ,a.Others_Desc '        
select @sqlstr = @sqlstr + '   ,a.Tot_Amount  '        
select @sqlstr = @sqlstr + '  FROM  Ins_AdvisorIncentiveEntry_Main as a '        
select @sqlstr = @sqlstr + '  left join Deptmaster as b  '        
select @sqlstr = @sqlstr + ' on b.Location_Code =a.location_code and b.DeptCode =a.DeptCode '             
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='   +  '''' + @Location_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
--select @sqlstr = @sqlstr + ' And a.Authorize=1  '        
        
select @sqlstr = @sqlstr + ' Order by a.Entry_Date desc'        
END        
        
print (@sqlstr)        
exec(@sqlstr)        
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_HSKPGIncentive_Details]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================        
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023 
-- Description : Get House Keeping Incentive ENTRY    
-- ===============================================================        
-- Grant Execute On  To Public        
 --select * from   Ins_HSKPGIncentiveEntry_Main
 --select * from   Ins_HSKPGIncentiveEntry_Line   
      
-- exec [sp_GetIns_HSKPGIncentive_Details] '100','SPINNING','INC/00008/20-21','' ,'Specify'      
--- exec [sp_GetIns_HSKPGIncentive_Details] '100','SPINNING','2020-07-02' ,'Increment Report'      
-- exec [sp_GetIns_HSKPGIncentive_Details] '100','SPINNING',' ','' ,'aLL'      
 
CREATE Proc [dbo].[sp_GetIns_HSKPGIncentive_Details]        
(        
@Comp_Code    Varchar(20),        
@Location_Code   Varchar(20),        
@Trans_No     Varchar(100),        
@Att_date    Varchar(100),         
@Filter_Data   Varchar(30)        
)        
as        
BEGIN        
set nocount on        
set dateformat ymd        
Declare @sqlstr varchar(8000)        
        
IF         
 (        
   @Filter_Data = 'Specify'        
          
 )        
BEGIN        
select @sqlstr = 'SELECT  '        
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code '        
select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.Deptcode,d.Deptname ,a.Others_Desc '   
select @sqlstr = @sqlstr + ' ,a.Allow_Name,Tot_Amount '             
select @sqlstr = @sqlstr + ' ,b.Entry_No,b.Entry_Date '        
select @sqlstr = @sqlstr + ' ,b.Sno,b.EmpCode,b.EmpID '        
select @sqlstr = @sqlstr + ' ,b.EmpName '        
select @sqlstr = @sqlstr + ' ,b.Fixed_Incentive,b.incentive  '        
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  Ins_HSKPGIncentiveEntry_Main as a '        
select @sqlstr = @sqlstr + ' left join  Ins_HSKPGIncentiveEntry_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =h.Catcode '        
select @sqlstr = @sqlstr + ' left join Deptmaster as d  '        
select @sqlstr = @sqlstr + ' on d.Location_Code =b.location_code and d.DeptCode =h.Deptcode  '        
select @sqlstr = @sqlstr + ' left join Designation as e  '        
select @sqlstr = @sqlstr + ' on e.Location_Code =b.location_code and e.DesgnCode =h.Desgncode  '     
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_No='   + '''' + @Trans_No  + ''''        
--select @sqlstr = @sqlstr + ' and a.Att_date='   + '''' + @Att_date  + ''''        
      
      
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code=' + '''' + @Fin_Year_Code + ''''        
--select @sqlstr = @sqlstr + ' And a.EntryId='   + '''' + @Trans_No  + ''''        
--select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '    
select @sqlstr = @sqlstr + ' Order by h.Empid asc'         
END       
      
else IF         
 (        
   @Filter_Data = 'Other Earning Report'        
          
 )        
BEGIN        
       
select @sqlstr = 'SELECT  '        
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code '        
select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.DeptCode,d.Deptname ,A.Allow_Name,a.Others_Desc '        
select @sqlstr = @sqlstr + ' ,b.Sno,b.EmpCode,b.EmpID '        
select @sqlstr = @sqlstr + ' ,b.Fixed_Incentive,b.incentive  '        
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  Ins_HSKPGIncentiveEntry_Main as a '        
select @sqlstr = @sqlstr + ' left join  Ins_HSKPGIncentiveEntry_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '    
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =h.cat_code '        
select @sqlstr = @sqlstr + ' left join Deptmaster as d  '        
select @sqlstr = @sqlstr + ' on d.Location_Code =b.location_code and d.DeptCode =h.Deptcode  '        
select @sqlstr = @sqlstr + ' left join Designation as e  '        
select @sqlstr = @sqlstr + ' on e.Location_Code =b.location_code and e.DesgnCode =h.Desgncode  '    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_No='   + '''' + @Trans_No  + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_Date='   + '''' + @Att_date  + ''''       
END       
        
ELSE IF @Filter_Data  = 'All'        
BEGIN        
select @sqlstr = ' SELECT '        
      
select @sqlstr = @sqlstr + '  a.Comp_Code,a.Location_Code  '        
select @sqlstr = @sqlstr + '  ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.Allow_Name  '  
select @sqlstr = @sqlstr + '  ,a.DeptCode,b.Deptname ,a.Others_Desc '        
select @sqlstr = @sqlstr + '   ,a.Tot_Amount  '        
select @sqlstr = @sqlstr + '  FROM  Ins_HSKPGIncentiveEntry_Main as a '        
select @sqlstr = @sqlstr + '  left join Deptmaster as b  '        
select @sqlstr = @sqlstr + ' on b.Location_Code =a.location_code and b.DeptCode =a.DeptCode '             
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='   +  '''' + @Location_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
--select @sqlstr = @sqlstr + ' And a.Authorize=1  '        
        
select @sqlstr = @sqlstr + ' Order by a.Entry_Date desc'        
END        
        
print (@sqlstr)        
exec(@sqlstr)        
END  

GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_Incentive_Master]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================        
-- Author  : KRK       
-- Create date :16-03-2023
-- Modified date :16-03-2023       
-- Description : Get Incentive   Master Details       
-- =============================================================        
-- Grant Execute On [sp_Get_Ins_IncentiveType_Master] To Public     
-- select * from Ins_Incentive_Master
--  exec [sp_Get_Ins_Incentive_Master] '100','5',''
create Proc [dbo].[sp_GetIns_Incentive_Master]        
(        
@Comp_Code    Varchar(20),  
@Location_Code		Varchar(20),
@Code   Varchar(100),        
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
  ltrim(rtrim(@Filter_Data))='ALL'        
)        
BEGIN  
select @sqlstr= 'Select a.Inc_Code,a.Inc_Name,a.Inc_Desc,a.Inctype_Name,a.IS_Active   '        
select @sqlstr = @sqlstr + ' from Ins_Incentive_Master as a '     
  select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''  
select @sqlstr = @sqlstr + ' and Inc_Code<>0 '    

        
END
    
 ELSE IF         
(        
ltrim(rtrim(@Code ))<> ''         
      
and ltrim(rtrim(@Filter_Data))='SPECIFY'        
)        
BEGIN        
select @sqlstr= 'selecT  a.Inc_Code,a.Inc_Name,a.Inc_Desc,a.Inctype_Name,a.IS_Active     '        
select @sqlstr = @sqlstr + ' from Ins_Incentive_Master as a '     
select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''  
select @sqlstr = @sqlstr + ' And Inc_Code='    + '''' + @Code    + ''''         
select @sqlstr = @sqlstr + '  '        
END           
print (@sqlstr)        
exec(@sqlstr)        
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_IncentiveType_Master]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================        
-- Author  : KRK       
-- Create date :16-03-2023
-- Modified date :16-03-2023       
-- Description : Get Incentive Type Master Details       
-- =============================================================        
-- Grant Execute On [sp_Get_Ins_IncentiveType_Master] To Public     
-- select * from Ins_IncentiveType_Master
--  exec [sp_GetIns_IncentiveType_Master] '100','5',''
CREATE Proc [dbo].[sp_GetIns_IncentiveType_Master]        
(        
@Comp_Code    Varchar(20),  
@Location_Code		Varchar(20),
@Code   Varchar(100),        
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
  ltrim(rtrim(@Filter_Data))='ALL'        
)        
BEGIN  
select @sqlstr= 'Select a.Inctype_Code,a.Inctype_Name,a.IS_Active    '        
select @sqlstr = @sqlstr + ' from Ins_IncentiveType_Master as a '     
  select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''  
select @sqlstr = @sqlstr + ' and Inctype_Code<>0 '    

        
END
    
 ELSE IF         
(        
ltrim(rtrim(@Code ))<> ''         
      
and ltrim(rtrim(@Filter_Data))='SPECIFY'        
)        
BEGIN        
select @sqlstr= 'selecT  a.Inctype_Code,a.Inctype_Name,a.IS_Active     '        
select @sqlstr = @sqlstr + ' from Ins_IncentiveType_Master as a '     
select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''  
select @sqlstr = @sqlstr + ' And Inctype_Code='    + '''' + @Code    + ''''         
select @sqlstr = @sqlstr + '  '        
END           
print (@sqlstr)        
exec(@sqlstr)        
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_JobcardIncentive_Master]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================        
-- Author  : KRK       
-- Create date :16-03-2023
-- Modified date :16-03-2023       
-- Description : Get Job Card Incentive     Master Details       
-- =============================================================        
-- Grant Execute On [sp_Get_Ins_IncentiveType_Master] To Public     
-- select * from Ins_JobcardIncentive_Master
--  exec [sp_GetIns_JobcardIncentive_Master] '100','5',''
Create Proc [dbo].[sp_GetIns_JobcardIncentive_Master]        
(        
@Comp_Code    Varchar(20),  
@Location_Code		Varchar(20),
@Code   Varchar(100),        
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
  ltrim(rtrim(@Filter_Data))='ALL'        
)        
BEGIN  
select @sqlstr= 'Select a.JOB_Code,a.JOB_Name,Description,Incentive_Amount,a.IS_Active    '        
select @sqlstr = @sqlstr + ' from Ins_JobcardIncentive_Master as a '     
  select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''  
select @sqlstr = @sqlstr + ' and JOB_Code<>0 '    

        
END
    
 ELSE IF         
(        
ltrim(rtrim(@Code ))<> ''         
      
and ltrim(rtrim(@Filter_Data))='SPECIFY'        
)        
BEGIN        
select @sqlstr= 'selecT  a.JOB_Code,a.JOB_Name,Description,Incentive_Amount,a.IS_Active     '        
select @sqlstr = @sqlstr + ' from Ins_JobcardIncentive_Master as a '     
select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''  
select @sqlstr = @sqlstr + ' And JOB_Code='    + '''' + @Code    + ''''         
select @sqlstr = @sqlstr + '  '        
END           
print (@sqlstr)        
exec(@sqlstr)        
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_Mechanic_HelperLink_Details]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================        
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023 
-- Description : Get Ins_Mechanic  Keeping Incentive ENTRY    
-- ===============================================================        
-- Grant Execute On  To Public        
 --select * from   Ins_MechanicIncentiveEntry_Main
 --select * from   Ins_MechanicIncentiveEntry_Line   
      
-- exec [sp_GetIns_Mechanic_HelperLink_Details] '100','THENI','INC/00008/20-21','' ,'Specify'      
--- exec [sp_GetIns_Mechanic_HelperLink_Details] '100','THENI','2020-07-02' ,'Increment Report'      
-- exec [sp_GetIns_Mechanic_HelperLink_Details] '100','THENI',' ','' ,'aLL'      
 
create Proc [dbo].[sp_GetIns_Mechanic_HelperLink_Details]        
(        
@Comp_Code    Varchar(20),        
@Location_Code   Varchar(20),        
@Trans_No     Varchar(100),        
@Att_date    Varchar(100),         
@Filter_Data   Varchar(30)        
)        
as        
BEGIN        
set nocount on        
set dateformat ymd        
Declare @sqlstr varchar(8000)        
        
IF         
 (        
   @Filter_Data = 'Specify'        
          
 )        
BEGIN        
select @sqlstr = 'SELECT  '        
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code '        
select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.Deptcode,d.Deptname ,a.Others_Desc '   
select @sqlstr = @sqlstr + ' ,Tot_Amount '             
select @sqlstr = @sqlstr + ' ,b.Entry_No,b.Entry_Date '

select @sqlstr = @sqlstr + ' ,Sno,Mech_EmpCode,Mech_EmpID,Mech_EmpName,Mech_Percentage '
select @sqlstr = @sqlstr + ' ,Helper_EmpCode,Helper_EmpID,Helper_EmpName,Helper_Percentage '
                
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  Ins_Mechanic_HelperLink_Main as a '        
select @sqlstr = @sqlstr + ' left join  Ins_Mechanic_HelperLink_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =h.Catcode '        
select @sqlstr = @sqlstr + ' left join Deptmaster as d  '        
select @sqlstr = @sqlstr + ' on d.Location_Code =b.location_code and d.DeptCode =h.Deptcode  '        
select @sqlstr = @sqlstr + ' left join Designation as e  '        
select @sqlstr = @sqlstr + ' on e.Location_Code =b.location_code and e.DesgnCode =h.Desgncode  '     
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_No='   + '''' + @Trans_No  + ''''        
--select @sqlstr = @sqlstr + ' and a.Att_date='   + '''' + @Att_date  + ''''        
      
      
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code=' + '''' + @Fin_Year_Code + ''''        
--select @sqlstr = @sqlstr + ' And a.EntryId='   + '''' + @Trans_No  + ''''        
--select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '    
select @sqlstr = @sqlstr + ' Order by h.Empid asc'         
END       
      
else IF         
 (        
   @Filter_Data = 'Other Earning Report'        
          
 )        
BEGIN        
       
select @sqlstr = 'SELECT  '        
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code '        
select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.DeptCode,d.Deptname ,a.Others_Desc '        
       
select @sqlstr = @sqlstr + ' ,b.Sno,b.Mech_EmpCode,b.Mech_EmpID,b.Mech_EmpName,b.Mech_Percentage '
select @sqlstr = @sqlstr + ' ,b.Helper_EmpCode,b.Helper_EmpID,b.Helper_EmpName,b.Helper_Percentage '   
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  Ins_Mechanic_HelperLink_Main as a '        
select @sqlstr = @sqlstr + ' left join  Ins_Mechanic_HelperLink_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '    
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =h.cat_code '        
select @sqlstr = @sqlstr + ' left join Deptmaster as d  '        
select @sqlstr = @sqlstr + ' on d.Location_Code =b.location_code and d.DeptCode =h.Deptcode  '        
select @sqlstr = @sqlstr + ' left join Designation as e  '        
select @sqlstr = @sqlstr + ' on e.Location_Code =b.location_code and e.DesgnCode =h.Desgncode  '    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_No='   + '''' + @Trans_No  + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_Date='   + '''' + @Att_date  + ''''       
END       
        
ELSE IF @Filter_Data  = 'All'        
BEGIN        
select @sqlstr = ' SELECT '        
      
select @sqlstr = @sqlstr + '  a.Comp_Code,a.Location_Code  '        
select @sqlstr = @sqlstr + '  ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + '   '  
select @sqlstr = @sqlstr + '  ,a.DeptCode,b.Deptname ,a.Others_Desc '        
select @sqlstr = @sqlstr + '   ,a.Tot_Amount  '        
select @sqlstr = @sqlstr + '  FROM  Ins_Mechanic_HelperLink_Main as a '        
select @sqlstr = @sqlstr + '  left join Deptmaster as b  '        
select @sqlstr = @sqlstr + ' on b.Location_Code =a.location_code and b.DeptCode =a.DeptCode '             
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='   +  '''' + @Location_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
--select @sqlstr = @sqlstr + ' And a.Authorize=1  '        
        
select @sqlstr = @sqlstr + ' Order by a.Entry_Date desc'        
END        
        
print (@sqlstr)        
exec(@sqlstr)        
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_MechanicIncentive_Details]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================        
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :23-03-2023   
-- Description : Get Ins_Mechanic  Keeping Incentive ENTRY    
-- ===============================================================        
-- Grant Execute On  To Public        
 --select * from   Ins_MechanicIncentiveEntry_Main
 --select * from   Ins_MechanicIncentiveEntry_Line   
      
-- exec [sp_GetIns_MechanicIncentive_Details] '100','theni','MI/00001/22-23','' ,'Specify'      
--- exec [sp_GetIns_MechanicIncentive_Details] '100','SPINNING','2020-07-02' ,'Increment Report'      
-- exec [sp_GetIns_MechanicIncentive_Details] '100','theni',' ','' ,'aLL'      
 
CREATE Proc [dbo].[sp_GetIns_MechanicIncentive_Details]        
(        
@Comp_Code    Varchar(20),        
@Location_Code   Varchar(20),        
@Trans_No     Varchar(100),        
@Att_date    Varchar(100),         
@Filter_Data   Varchar(30)        
)        
as        
BEGIN        
set nocount on        
set dateformat ymd        
Declare @sqlstr varchar(8000)        
        
IF         
 (        
   @Filter_Data = 'Specify'        
          
 )        
BEGIN        
select @sqlstr = 'SELECT  '        
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code '        
select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.Deptcode,d.Deptname ,a.Others_Desc '   
select @sqlstr = @sqlstr + ' ,Tot_Amount '             
select @sqlstr = @sqlstr + ' ,b.Entry_No,b.Entry_Date '        
select @sqlstr = @sqlstr + ' ,b.Sno,b.EmpCode,b.EmpID '        
select @sqlstr = @sqlstr + ' ,b.EmpName '         
select @sqlstr = @sqlstr + ' ,b.FreeService,b.PaidService,b.GeneralService,b.MinorJOB,b.AccidentWork,b.PDI,b.Fit '
select @sqlstr = @sqlstr + '  ,b.WaterService,b.Demo,b.TOTAL,b.Labour,b.Spares,b.Incentive,b.Final_Incentive  '        
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  Ins_MechanicIncentiveEntry_Main as a '        
select @sqlstr = @sqlstr + ' left join  Ins_MechanicIncentiveEntry_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =h.Catcode '        
select @sqlstr = @sqlstr + ' left join Deptmaster as d  '        
select @sqlstr = @sqlstr + ' on d.Location_Code =b.location_code and d.DeptCode =h.Deptcode  '        
select @sqlstr = @sqlstr + ' left join Designation as e  '        
select @sqlstr = @sqlstr + ' on e.Location_Code =b.location_code and e.DesgnCode =h.Desgncode  '     
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_No='   + '''' + @Trans_No  + ''''        
--select @sqlstr = @sqlstr + ' and a.Att_date='   + '''' + @Att_date  + ''''        
      
      
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code=' + '''' + @Fin_Year_Code + ''''        
--select @sqlstr = @sqlstr + ' And a.EntryId='   + '''' + @Trans_No  + ''''        
--select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '    
select @sqlstr = @sqlstr + ' Order by h.Empid asc'         
END       
      
else IF         
 (        
   @Filter_Data = 'Other Earning Report'        
          
 )        
BEGIN        
       
select @sqlstr = 'SELECT  '        
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code '        
select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.DeptCode,d.Deptname ,a.Others_Desc '        
select @sqlstr = @sqlstr + ' ,b.Sno,b.EmpCode,b.EmpID '        
select @sqlstr = @sqlstr + ' ,b.FreeService,b.PaidService,b.GeneralService,b.MinorJOB,b.AccidentWork,b.PDI,b.Fit '
select @sqlstr = @sqlstr + '  ,b.WaterService,b.Demo,b.TOTAL,b.Labour,b.Spares  ,b.Incentive,b.Final_Incentive'    
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  Ins_MechanicIncentiveEntry_Main as a '        
select @sqlstr = @sqlstr + ' left join  Ins_MechanicIncentiveEntry_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '    
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =h.cat_code '        
select @sqlstr = @sqlstr + ' left join Deptmaster as d  '        
select @sqlstr = @sqlstr + ' on d.Location_Code =b.location_code and d.DeptCode =h.Deptcode  '        
select @sqlstr = @sqlstr + ' left join Designation as e  '        
select @sqlstr = @sqlstr + ' on e.Location_Code =b.location_code and e.DesgnCode =h.Desgncode  '    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_No='   + '''' + @Trans_No  + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_Date='   + '''' + @Att_date  + ''''       
END       
        
ELSE IF @Filter_Data  = 'All'        
BEGIN        
select @sqlstr = ' SELECT '        
      
select @sqlstr = @sqlstr + '  a.Comp_Code,a.Location_Code  '        
select @sqlstr = @sqlstr + '  ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + '   '  
select @sqlstr = @sqlstr + '  ,a.DeptCode,b.Deptname ,a.Others_Desc '        
select @sqlstr = @sqlstr + '   ,a.Tot_Amount  '        
select @sqlstr = @sqlstr + '  FROM  Ins_MechanicIncentiveEntry_Main as a '        
select @sqlstr = @sqlstr + '  left join Deptmaster as b  '        
select @sqlstr = @sqlstr + ' on b.Location_Code =a.location_code and b.DeptCode =a.DeptCode '             
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='   +  '''' + @Location_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
--select @sqlstr = @sqlstr + ' And a.Authorize=1  '        
        
select @sqlstr = @sqlstr + ' Order by a.Entry_Date desc'        
END        
        
print (@sqlstr)        
exec(@sqlstr)        
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_MechanicIncentive_Master]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================            
-- Author  : RAJKUMAR.K            
-- Create date : 05-03-2023          
-- Description : Get Ins_MechanicIncentive   Master Details           
-- =============================================================            
-- Grant Execute On [sp_Get_Ins_MechanicIncentive_Master] To Public            
  --  exec  [sp_Get_Ins_MechanicIncentive_Master] '100','','',''
CREATE Proc [dbo].[sp_GetIns_MechanicIncentive_Master]            
(            
@Comp_Code    Varchar(10),         
@Location_Code  Varchar(10),    
@Emp_Code   Varchar(100),            
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
ltrim(rtrim(@Emp_Code))= ''             
--and ltrim(rtrim(@Authorize))= ''             
--and ltrim(rtrim(@Delete_Mode))=''            
and ltrim(rtrim(@Filter_Data))=''            
)            
BEGIN      
select @sqlstr= 'select  a.ID,a.DeptCode,a.Dept_Name '
select @sqlstr = @sqlstr + ',a.FreeService,a.PaidService,a.GeneralService,a.MinorJOB '
select @sqlstr = @sqlstr + ',a.AccidentWork,a.PDI,a.fit,a.waterservice,a.demo,a.labour,a.Spares '
select @sqlstr = @sqlstr + ',a.Effect_from,a.Effect_To,a.IS_Active     '            
select @sqlstr = @sqlstr + ' from Ins_MechanicIncentive_Master as a '         
select @sqlstr = @sqlstr + ' where ID<>0 '        
    
            
END    
        
 ELSE IF             
(            
ltrim(rtrim(@Emp_Code ))<> ''             
          
and ltrim(rtrim(@Filter_Data))=''            
)            
BEGIN            
select @sqlstr= 'select  a.ID,a.DeptCode,a.Dept_Name'    

select @sqlstr = @sqlstr + ',a.FreeService,a.PaidService,a.GeneralService,a.MinorJOB '
select @sqlstr = @sqlstr + ',a.AccidentWork,a.PDI,a.fit,a.waterservice,a.demo,a.labour,a.Spares '
select @sqlstr = @sqlstr + ',a.Effect_from,a.Effect_To,a.IS_Active     ' 
select @sqlstr = @sqlstr + ' from Ins_MechanicIncentive_Master  as as a '         
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''           
select @sqlstr = @sqlstr + ' And a.ID='    + '''' + @Emp_Code    + ''''             
select @sqlstr = @sqlstr + '  '            
     
--select @sqlstr = @sqlstr + ' And  c.Catname='   + '''' + @Cat_name  + ''''         
--select @sqlstr = @sqlstr + ' And  a.AttendanceStatus='   + '''' + @Emp_Type + ''''           
    
END               
print (@sqlstr)            
exec(@sqlstr)            
END    

GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_OtherIncentive_Master]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================        
-- Author  : KRK       
-- Create date :16-03-2023
-- Modified date :16-03-2023       
-- Description : Get Other Incentive     Master Details       
-- =============================================================        
-- Grant Execute On [sp_GetIns_OtherIncentive_Master] To Public     
-- select * from Ins_OtherIncentive_Master
--  exec [sp_GetIns_OtherIncentive_Master] '100','5',''
Create Proc [dbo].[sp_GetIns_OtherIncentive_Master]        
(        
@Comp_Code    Varchar(20),  
@Location_Code		Varchar(20),
@Code   Varchar(100),        
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
  ltrim(rtrim(@Filter_Data))='ALL'        
)        
BEGIN  
select @sqlstr= 'Select a.JOB_Code,a.JOB_Name,Description    ' 
select @sqlstr = @sqlstr + '  ,Slab1,Slab2,Slab3,Slab1_Amount,Slab2_Amount,Slab3_Amount'     
select @sqlstr = @sqlstr + ' ,IS_Active '     

select @sqlstr = @sqlstr + ' from Ins_OtherIncentive_Master as a '     
  select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''  
select @sqlstr = @sqlstr + ' and JOB_Code<>0 '    

        
END
    
 ELSE IF         
(        
ltrim(rtrim(@Code ))<> ''         
      
and ltrim(rtrim(@Filter_Data))='SPECIFY'        
)        
BEGIN        
select @sqlstr= 'selecT  a.JOB_Code,a.JOB_Name,Description      '
select @sqlstr = @sqlstr + '  ,Slab1,Slab2,Slab3,Slab1_Amount,Slab2_Amount,Slab3_Amount'     
select @sqlstr = @sqlstr + ' ,IS_Active '        
select @sqlstr = @sqlstr + ' from Ins_OtherIncentive_Master as a '     
select @sqlstr = @sqlstr + ' Where a.Comp_code='   + '''' + @Comp_Code   + ''''      
select @sqlstr = @sqlstr + ' and  a.Location_Code='   + '''' + @Location_Code   + ''''  
select @sqlstr = @sqlstr + ' And JOB_Code='    + '''' + @Code    + ''''         
select @sqlstr = @sqlstr + '  '        
END           
print (@sqlstr)        
exec(@sqlstr)        
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_SalesIncentive_Details]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================        
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023 
-- Description : Get Sales Incentive ENTRY    
-- ===============================================================        
-- Grant Execute On  To Public        
 --select * from   Ins_SalesIncentiveEntry_Main
 --select * from   Ins_SalesIncentiveEntry_Main   
      
-- exec [sp_GetIns_SalesIncentive_Details] '100','SPINNING','INC/00008/20-21','' ,'Specify'      
--- exec [sp_GetIns_SalesIncentive_Details] '100','SPINNING','2020-07-02' ,'Increment Report'      
-- exec [sp_GetIns_SalesIncentive_Details] '100','SPINNING',' ','' ,'aLL'      
 
CREATE Proc [dbo].[sp_GetIns_SalesIncentive_Details]        
(        
@Comp_Code    Varchar(20),        
@Location_Code   Varchar(20),        
@Trans_No     Varchar(100),        
@Att_date    Varchar(100),         
@Filter_Data   Varchar(30)        
)        
as        
BEGIN        
set nocount on        
set dateformat ymd        
Declare @sqlstr varchar(8000)        
        
IF         
 (        
   @Filter_Data = 'Specify'        
          
 )        
BEGIN        
select @sqlstr = 'SELECT  '        
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code '        
select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.Deptcode,d.Deptname ,a.Others_Desc '   
select @sqlstr = @sqlstr + ' ,a.Allow_Name,Tot_Amount '             
select @sqlstr = @sqlstr + ' ,b.Entry_No,b.Entry_Date '        
select @sqlstr = @sqlstr + ' ,b.Sno,b.EmpCode,b.EmpID '        
select @sqlstr = @sqlstr + ' ,b.EmpName '        
select @sqlstr = @sqlstr + ' ,b.Fixed_Incentive,b.incentive  '        
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  Ins_SalesIncentiveEntry_Main as a '        
select @sqlstr = @sqlstr + ' left join  Ins_SalesIncentiveEntry_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =h.Catcode '        
select @sqlstr = @sqlstr + ' left join Deptmaster as d  '        
select @sqlstr = @sqlstr + ' on d.Location_Code =b.location_code and d.DeptCode =h.Deptcode  '        
select @sqlstr = @sqlstr + ' left join Designation as e  '        
select @sqlstr = @sqlstr + ' on e.Location_Code =b.location_code and e.DesgnCode =h.Desgncode  '     
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_No='   + '''' + @Trans_No  + ''''        
--select @sqlstr = @sqlstr + ' and a.Att_date='   + '''' + @Att_date  + ''''        
      
      
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code=' + '''' + @Fin_Year_Code + ''''        
--select @sqlstr = @sqlstr + ' And a.EntryId='   + '''' + @Trans_No  + ''''        
--select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '    
select @sqlstr = @sqlstr + ' Order by h.Empid asc'         
END       
      
else IF         
 (        
   @Filter_Data = 'Other Earning Report'        
          
 )        
BEGIN        
       
select @sqlstr = 'SELECT  '        
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code '        
select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.DeptCode,d.Deptname ,A.Allow_Name,a.Others_Desc '        
select @sqlstr = @sqlstr + ' ,b.Sno,b.EmpCode,b.EmpID '        
select @sqlstr = @sqlstr + ' ,b.Fixed_Incentive,b.incentive  '        
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  Ins_SalesIncentiveEntry_Main as a '        
select @sqlstr = @sqlstr + ' left join  Ins_SalesIncentiveEntry_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '    
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =h.cat_code '        
select @sqlstr = @sqlstr + ' left join Deptmaster as d  '        
select @sqlstr = @sqlstr + ' on d.Location_Code =b.location_code and d.DeptCode =h.Deptcode  '        
select @sqlstr = @sqlstr + ' left join Designation as e  '        
select @sqlstr = @sqlstr + ' on e.Location_Code =b.location_code and e.DesgnCode =h.Desgncode  '    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_No='   + '''' + @Trans_No  + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_Date='   + '''' + @Att_date  + ''''       
END       
        
ELSE IF @Filter_Data  = 'All'        
BEGIN        
select @sqlstr = ' SELECT '        
      
select @sqlstr = @sqlstr + '  a.Comp_Code,a.Location_Code  '        
select @sqlstr = @sqlstr + '  ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.Allow_Name  '  
select @sqlstr = @sqlstr + '  ,a.DeptCode,b.Deptname ,a.Others_Desc '        
select @sqlstr = @sqlstr + '   ,a.Tot_Amount  '        
select @sqlstr = @sqlstr + '  FROM  Ins_SalesIncentiveEntry_Main as a '        
select @sqlstr = @sqlstr + '  left join Deptmaster as b  '        
select @sqlstr = @sqlstr + ' on b.Location_Code =a.location_code and b.DeptCode =a.DeptCode '             
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='   +  '''' + @Location_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
--select @sqlstr = @sqlstr + ' And a.Authorize=1  '        
        
select @sqlstr = @sqlstr + ' Order by a.Entry_Date desc'        
END        
        
print (@sqlstr)        
exec(@sqlstr)        
END  

GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_SecurityIncentive_Details]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================        
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023 
-- Description : Get Security Incentive ENTRY    
-- ===============================================================        
-- Grant Execute On  To Public        
 --select * from   Ins_SecurityIncentiveEntry_Main
 --select * from   Ins_SecurityIncentiveEntry_Line   
      
-- exec [sp_GetIns_SecurityIncentive_Details] '100','SPINNING','INC/00008/20-21','' ,'Specify'      
--- exec [sp_GetIns_SecurityIncentive_Details] '100','SPINNING','2020-07-02' ,'Increment Report'      
-- exec [sp_GetIns_SecurityIncentive_Details] '100','SPINNING',' ','' ,'aLL'      
 
create Proc [dbo].[sp_GetIns_SecurityIncentive_Details]        
(        
@Comp_Code    Varchar(20),        
@Location_Code   Varchar(20),        
@Trans_No     Varchar(100),        
@Att_date    Varchar(100),         
@Filter_Data   Varchar(30)        
)        
as        
BEGIN        
set nocount on        
set dateformat ymd        
Declare @sqlstr varchar(8000)        
        
IF         
 (        
   @Filter_Data = 'Specify'        
          
 )        
BEGIN        
select @sqlstr = 'SELECT  '        
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code '        
select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.Deptcode,d.Deptname ,a.Others_Desc '   
select @sqlstr = @sqlstr + ' ,a.Allow_Name,Tot_Amount '             
select @sqlstr = @sqlstr + ' ,b.Entry_No,b.Entry_Date '        
select @sqlstr = @sqlstr + ' ,b.Sno,b.EmpCode,b.EmpID '        
select @sqlstr = @sqlstr + ' ,b.EmpName '        
select @sqlstr = @sqlstr + ' ,b.Fixed_Incentive,b.incentive  '        
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  Ins_SecurityIncentiveEntry_Main as a '        
select @sqlstr = @sqlstr + ' left join  Ins_SecurityIncentiveEntry_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =h.Catcode '        
select @sqlstr = @sqlstr + ' left join Deptmaster as d  '        
select @sqlstr = @sqlstr + ' on d.Location_Code =b.location_code and d.DeptCode =h.Deptcode  '        
select @sqlstr = @sqlstr + ' left join Designation as e  '        
select @sqlstr = @sqlstr + ' on e.Location_Code =b.location_code and e.DesgnCode =h.Desgncode  '     
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_No='   + '''' + @Trans_No  + ''''        
--select @sqlstr = @sqlstr + ' and a.Att_date='   + '''' + @Att_date  + ''''        
      
      
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code=' + '''' + @Fin_Year_Code + ''''        
--select @sqlstr = @sqlstr + ' And a.EntryId='   + '''' + @Trans_No  + ''''        
--select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '    
select @sqlstr = @sqlstr + ' Order by h.Empid asc'         
END       
      
else IF         
 (        
   @Filter_Data = 'Other Earning Report'        
          
 )        
BEGIN        
       
select @sqlstr = 'SELECT  '        
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code '        
select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.DeptCode,d.Deptname ,A.Allow_Name,a.Others_Desc '        
select @sqlstr = @sqlstr + ' ,b.Sno,b.EmpCode,b.EmpID '        
select @sqlstr = @sqlstr + ' ,b.Fixed_Incentive,b.incentive  '        
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  Ins_SecurityIncentiveEntry_Main as a '        
select @sqlstr = @sqlstr + ' left join  Ins_SecurityIncentiveEntry_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '    
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =h.cat_code '        
select @sqlstr = @sqlstr + ' left join Deptmaster as d  '        
select @sqlstr = @sqlstr + ' on d.Location_Code =b.location_code and d.DeptCode =h.Deptcode  '        
select @sqlstr = @sqlstr + ' left join Designation as e  '        
select @sqlstr = @sqlstr + ' on e.Location_Code =b.location_code and e.DesgnCode =h.Desgncode  '    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_No='   + '''' + @Trans_No  + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_Date='   + '''' + @Att_date  + ''''       
END       
        
ELSE IF @Filter_Data  = 'All'        
BEGIN        
select @sqlstr = ' SELECT '        
      
select @sqlstr = @sqlstr + '  a.Comp_Code,a.Location_Code  '        
select @sqlstr = @sqlstr + '  ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.Allow_Name  '  
select @sqlstr = @sqlstr + '  ,a.DeptCode,b.Deptname ,a.Others_Desc '        
select @sqlstr = @sqlstr + '   ,a.Tot_Amount  '        
select @sqlstr = @sqlstr + '  FROM  Ins_SecurityIncentiveEntry_Main as a '        
select @sqlstr = @sqlstr + '  left join Deptmaster as b  '        
select @sqlstr = @sqlstr + ' on b.Location_Code =a.location_code and b.DeptCode =a.DeptCode '             
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='   +  '''' + @Location_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
--select @sqlstr = @sqlstr + ' And a.Authorize=1  '        
        
select @sqlstr = @sqlstr + ' Order by a.Entry_Date desc'        
END        
        
print (@sqlstr)        
exec(@sqlstr)        
END  

GO
/****** Object:  StoredProcedure [dbo].[sp_GetIns_SparesIncentive_Details]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================        
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023 
-- Description : Get Spares Incentive ENTRY    
-- ===============================================================        
-- Grant Execute On  To Public        
 --select * from   Ins_SparesincentiveEntry_Main
 --select * from   Ins_SparesincentiveEntry_Line   
      
-- exec [sp_GetIns_SparesIncentive_Details] '100','SPINNING','INC/00008/20-21','' ,'Specify'      
--- exec [sp_GetIns_SparesIncentive_Details] '100','SPINNING','2020-07-02' ,'Increment Report'      
-- exec [sp_GetIns_SparesIncentive_Details] '100','SPINNING',' ','' ,'aLL'      
 
create Proc [dbo].[sp_GetIns_SparesIncentive_Details]        
(        
@Comp_Code    Varchar(20),        
@Location_Code   Varchar(20),        
@Trans_No     Varchar(100),        
@Att_date    Varchar(100),         
@Filter_Data   Varchar(30)        
)        
as        
BEGIN        
set nocount on        
set dateformat ymd        
Declare @sqlstr varchar(8000)        
        
IF         
 (        
   @Filter_Data = 'Specify'        
          
 )        
BEGIN        
select @sqlstr = 'SELECT  '        
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code '        
select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.Deptcode,d.Deptname ,a.Others_Desc '   
select @sqlstr = @sqlstr + ' ,a.Allow_Name,Tot_Amount '             
select @sqlstr = @sqlstr + ' ,b.Entry_No,b.Entry_Date '        
select @sqlstr = @sqlstr + ' ,b.Sno,b.EmpCode,b.EmpID '        
select @sqlstr = @sqlstr + ' ,b.EmpName '        
select @sqlstr = @sqlstr + ' ,b.Fixed_Incentive,b.incentive  '        
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  Ins_SparesincentiveEntry_Main as a '        
select @sqlstr = @sqlstr + ' left join  Ins_SparesincentiveEntry_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =h.Catcode '        
select @sqlstr = @sqlstr + ' left join Deptmaster as d  '        
select @sqlstr = @sqlstr + ' on d.Location_Code =b.location_code and d.DeptCode =h.Deptcode  '        
select @sqlstr = @sqlstr + ' left join Designation as e  '        
select @sqlstr = @sqlstr + ' on e.Location_Code =b.location_code and e.DesgnCode =h.Desgncode  '     
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_No='   + '''' + @Trans_No  + ''''        
--select @sqlstr = @sqlstr + ' and a.Att_date='   + '''' + @Att_date  + ''''        
      
      
--select @sqlstr = @sqlstr + ' And a.Fin_Year_Code=' + '''' + @Fin_Year_Code + ''''        
--select @sqlstr = @sqlstr + ' And a.EntryId='   + '''' + @Trans_No  + ''''        
--select @sqlstr = @sqlstr + ' And a.Delete_Mode=0 '    
select @sqlstr = @sqlstr + ' Order by h.Empid asc'         
END       
      
else IF         
 (        
   @Filter_Data = 'Other Earning Report'        
          
 )        
BEGIN        
       
select @sqlstr = 'SELECT  '        
select @sqlstr = @sqlstr + ' a.Comp_Code,a.Location_Code '        
select @sqlstr = @sqlstr + ' ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.DeptCode,d.Deptname ,A.Allow_Name,a.Others_Desc '        
select @sqlstr = @sqlstr + ' ,b.Sno,b.EmpCode,b.EmpID '        
select @sqlstr = @sqlstr + ' ,b.Fixed_Incentive,b.incentive  '        
select @sqlstr = @sqlstr + ' ,d.DeptName,h.DeptCode ,h.EmpName '      
select @sqlstr = @sqlstr + ' FROM  Ins_SparesincentiveEntry_Main as a '        
select @sqlstr = @sqlstr + ' left join  Ins_SparesincentiveEntry_Line as b '        
select @sqlstr = @sqlstr + ' on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date  '        
select @sqlstr = @sqlstr + ' and b.Location_Code=a.Location_Code '        
select @sqlstr = @sqlstr + ' left join  Emp_Master as h '        
select @sqlstr = @sqlstr + ' on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code '    
select @sqlstr = @sqlstr + ' left join Category_Master as c       
on c.Location_Code =b.location_code and c.CatCode =h.cat_code '        
select @sqlstr = @sqlstr + ' left join Deptmaster as d  '        
select @sqlstr = @sqlstr + ' on d.Location_Code =b.location_code and d.DeptCode =h.Deptcode  '        
select @sqlstr = @sqlstr + ' left join Designation as e  '        
select @sqlstr = @sqlstr + ' on e.Location_Code =b.location_code and e.DesgnCode =h.Desgncode  '    
select @sqlstr = @sqlstr + ' Where a.Comp_Code='  + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code=' + '''' + @Location_Code + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_No='   + '''' + @Trans_No  + ''''        
select @sqlstr = @sqlstr + ' and a.Entry_Date='   + '''' + @Att_date  + ''''       
END       
        
ELSE IF @Filter_Data  = 'All'        
BEGIN        
select @sqlstr = ' SELECT '        
      
select @sqlstr = @sqlstr + '  a.Comp_Code,a.Location_Code  '        
select @sqlstr = @sqlstr + '  ,a.Entry_No,a.Entry_Date '        
select @sqlstr = @sqlstr + ' ,a.Allow_Name  '  
select @sqlstr = @sqlstr + '  ,a.DeptCode,b.Deptname ,a.Others_Desc '        
select @sqlstr = @sqlstr + '   ,a.Tot_Amount  '        
select @sqlstr = @sqlstr + '  FROM  Ins_SparesincentiveEntry_Main as a '        
select @sqlstr = @sqlstr + '  left join Deptmaster as b  '        
select @sqlstr = @sqlstr + ' on b.Location_Code =a.location_code and b.DeptCode =a.DeptCode '             
select @sqlstr = @sqlstr + ' Where a.Comp_Code='   + '''' + @Comp_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Location_Code='   +  '''' + @Location_Code   + ''''        
select @sqlstr = @sqlstr + ' And a.Delete_Mode=0'        
--select @sqlstr = @sqlstr + ' And a.Authorize=1  '        
        
select @sqlstr = @sqlstr + ' Order by a.Entry_Date desc'        
END        
        
print (@sqlstr)        
exec(@sqlstr)        
END  

GO
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_AdvisorIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================    
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :23-03-2023    
-- Description : Save Advisor Incentive ENTRY lINE  (Insert / Update)    
-- ========================================================    
create   Proc [dbo].[sp_Save_Ins_AdvisorIncentiveEntry_Line]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(100),    
@Entry_Date     Varchar(100),    
@Sno      Varchar(10),    
@EmpCode     Varchar(10),    
@EmpID     Varchar(10),    
@EmpName     Varchar(100),    
@FreeService  varchar(50),  
 @PaidService  varchar(50),  
 @GeneralService  varchar(50),  
 @MJ_AW  varchar(50),  
 @PS_AMC  varchar(50),  
 @Synth_Oil_Sales  varchar(50),  
 @Carbon_Cleaning  varchar(50),  
 @Wax_Polish  varchar(50),  
 @Wax_Coating  varchar(50),  
 @INSURANCE  varchar(50),  
  @Labour  varchar(50),  
 @Spares  varchar(50),  
  @Incentive  varchar(50),  
 @Final_Incentive  varchar(50),  
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
    
BEGIN    
select @sqlstr=''    
select @sqlstr = 'Insert into Ins_AdvisorIncentiveEntry_Line Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code ))   + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Sno  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpCode ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpID ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpName   ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@FreeService    ))  + ''''  

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@PaidService   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GeneralService   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@MJ_AW   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@PS_AMC   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Synth_Oil_Sales   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Carbon_Cleaning   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Wax_Polish   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Wax_Coating   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@INSURANCE   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Labour   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Spares   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Incentive   ))  + ''''        
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Final_Incentive   ))  + ''''         
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))  + ''''    
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''    
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + ''''     
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''    
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + '''' + ')'    
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
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_AdvisorIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================    
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023   
-- Description : Save Mechanic Incentive Allowance ENTRY Main  (Insert / Update)    
-- ==================================================================    
 --select * from   Ins_AdvisorIncentiveEntry_Main
 --select * from   Ins_AdvisorIncentiveEntry_Line

create Proc [dbo].[sp_Save_Ins_AdvisorIncentiveEntry_Main]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(20),    
@Entry_Date     Varchar(20),    
@dept_Code    Varchar(10), 
@dept_Name    Varchar(100), 
@Tot_Amount    Varchar(100),   
@Others      Varchar(100),    
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
Select Count(Entry_No) from Ins_AdvisorIncentiveEntry_Main    
Where Comp_Code  = @Comp_Code     
 And  Location_Code   = @Location_Code   
And  Entry_No  = @Entry_No     
And  Entry_Date   = @Entry_Date    
)    
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))    
BEGIN TRAN TRAN1    
select @sqlstr=''    
IF @iMode<=0     
BEGIN    
select @sqlstr = 'Insert into Ins_AdvisorIncentiveEntry_Main Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))   + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@dept_Code ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@dept_Name ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Tot_Amount  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Others  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + ''''     
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + '''' + ')'    
END    
ELSE IF @iMode=1    
BEGIN    
select @sqlstr = 'Update Ins_AdvisorIncentiveEntry_Main Set '    
select @sqlstr= @sqlstr + 'Deptcode='   + '''' + ltrim(rtrim(@dept_Code))  + ''''    
select @sqlstr= @sqlstr + ',Tot_Amount='   + '''' + ltrim(rtrim(@Tot_Amount))  + ''''    
select @sqlstr= @sqlstr + ',Others_Desc='   + '''' + ltrim(rtrim(@others))    + ''''    
select @sqlstr= @sqlstr + ',Authorize='    + '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ',Delete_Mode='   + '''' + ltrim(rtrim(@Delete_Mode))   + ''''    
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))   + ''''    
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate      + ''''    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code       + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
select @sqlstr= @sqlstr +  ' And Entry_No ='  + '''' + @Entry_No        + ''''      
select @sqlstr= @sqlstr +  ' And Entry_Date='  + '''' + @Entry_Date       + ''''      
END    
exec(@sqlstr )    
print @sqlstr    
IF @iMode=1    
BEGIN    
select @sqlstr = 'Delete from Ins_AdvisorIncentiveEntry_Line'    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code   + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
select @sqlstr= @sqlstr +  ' And Entry_No='   + '''' +  @Entry_No   + ''''      
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
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_HSKPGIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================    
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023    
-- Description : Save House Keeping Incentive ENTRY lINE  (Insert / Update)    
-- ========================================================    

create Proc [dbo].[sp_Save_Ins_HSKPGIncentiveEntry_Line]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(100),    
@Entry_Date     Varchar(100),    
@Sno      Varchar(10),    
@EmpCode     Varchar(10),    
@EmpID     Varchar(10),    
@EmpName     Varchar(100),    
@Fixed_Incentive  Varchar(100),    
@Leave  Varchar(10),    
@Incentive  Varchar(10),    

  
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
    
BEGIN    
select @sqlstr=''    
select @sqlstr = 'Insert into Ins_HSKPGIncentiveEntry_Line Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code ))   + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Sno  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpCode ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpID ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpName   ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fixed_Incentive   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Leave   ))  + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Incentive   ))  + ''''      
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))  + ''''    
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''    
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + ''''     
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''    
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + '''' + ')'    
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
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_HSKPGIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================    
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023   
-- Description : Save House Keeping Allowance ENTRY Main  (Insert / Update)    
-- ==================================================================    
 --select * from   Ins_HSKPGIncentiveEntry_Main
 --select * from   Ins_HSKPGIncentiveEntry_Line

create Proc [dbo].[sp_Save_Ins_HSKPGIncentiveEntry_Main]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(20),    
@Entry_Date     Varchar(20),    
@dept_Code    Varchar(10), 
@dept_Name    Varchar(100), 

@Allow_Name		varchar(50),
@Tot_Amount    Varchar(100),   
@Others      Varchar(100),    
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
Select Count(Entry_No) from Ins_HSKPGIncentiveEntry_Main    
Where Comp_Code  = @Comp_Code     
 And  Location_Code   = @Location_Code   
And  Entry_No  = @Entry_No     
And  Entry_Date   = @Entry_Date    
)    
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))    
BEGIN TRAN TRAN1    
select @sqlstr=''    
IF @iMode<=0     
BEGIN    
select @sqlstr = 'Insert into Ins_HSKPGIncentiveEntry_Main Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))   + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))   + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@dept_Code ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@dept_Name ))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Allow_Name    ))				+ '''' 
 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Tot_Amount  ))    + ''''    
  
  
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Others  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))     + ''''    
    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + ''''     
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + '''' + ')'    
END    
ELSE IF @iMode=1    
BEGIN    
select @sqlstr = 'Update Ins_HSKPGIncentiveEntry_Main Set '    
select @sqlstr= @sqlstr + 'Deptcode='   + '''' + ltrim(rtrim(@dept_Code))  + ''''    
select @sqlstr= @sqlstr + ',Tot_Amount='   + '''' + ltrim(rtrim(@Tot_Amount))  + ''''    
  
  
select @sqlstr= @sqlstr + ',Others_Desc='   + '''' + ltrim(rtrim(@others))    + ''''    
select @sqlstr= @sqlstr + ',Authorize='    + '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ',Delete_Mode='   + '''' + ltrim(rtrim(@Delete_Mode))   + ''''    
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))   + ''''    
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate      + ''''    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code       + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
  
select @sqlstr= @sqlstr +  ' And Entry_No ='  + '''' + @Entry_No        + ''''      
select @sqlstr= @sqlstr +  ' And Entry_Date='  + '''' + @Entry_Date       + ''''      
END    
exec(@sqlstr )    
print @sqlstr    
IF @iMode=1    
BEGIN    
select @sqlstr = 'Delete from Ins_HSKPGIncentiveEntry_Line'    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code   + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
  
select @sqlstr= @sqlstr +  ' And Entry_No='   + '''' +  @Entry_No   + ''''      
    
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
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_Incentive_Master]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================  
-- Author  : KRK       
-- Create date :16-03-2023
-- Modified date :16-03-2023  
-- Description : Save Incentive   MAster  (Insert / Update)  
-- ==================================================================  
--select * from Ins_IncentiveType_Master  
--exec sp_Save_Ins_Incentive_Master '100','1','1','10','10','1','ADD','ADMIN','0'  
CREATE Proc [dbo].[sp_Save_Ins_Incentive_Master]
  
(  
@Comp_Code  Varchar(20),  
@Location_Code		Varchar(20),
@Inc_Code  varchar(50),  
@Inc_Name  varchar(50),  
@Inc_Desc  varchar(50),  
@Inctype_Name  varchar(50), 
@Target  varchar(50),  
@Incentive_Amount  varchar(50),  
 

@Isactive  Varchar(50),  
@Screen_Mode Varchar(20),  
@User_Code  Varchar(15),  
@iSuccessFlag   bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iMode   Numeric(18,0)  
Declare @iServerDate Varchar(19)  
Set @iMode=(  
Select Count(Inc_Code )  from  Ins_Incentive_Master    
Where comp_code = @Comp_Code   
	And		Location_Code 		=	@Location_Code
And  Inc_Code  = @Inc_Code   
      
)  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
BEGIN TRAN TRAN1  
select @sqlstr=''  
IF @iMode<=0   
BEGIN  
select @sqlstr = 'Insert into Ins_Incentive_Master Values('  
Select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))     + ''''  
select @sqlstr= @sqlstr +  ','+ ''''+ ltrim(rtrim(@Location_Code ))     + ''''  
select @sqlstr= @sqlstr +  ','+ ''''+ ltrim(rtrim(@Inc_Code))     + ''''  
select @sqlstr= @sqlstr +  ','+ ''''+ ltrim(rtrim(@Inc_name))     + ''''  
select @sqlstr= @sqlstr +  ','+ ''''+ ltrim(rtrim(@Inc_desc ))     + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Inctype_Name    ))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Target    ))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Incentive_Amount    ))    + ''''   

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Isactive ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate       + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate       + '''' + ')'  
END  
ELSE IF @iMode=1  
BEGIN  
select @sqlstr = 'Update Ins_Incentive_Master Set '  
select @sqlstr= @sqlstr + ' Inctype_Name='   + '''' + ltrim(rtrim(@Inctype_Name))  + ''''  
select @sqlstr= @sqlstr + ' ,Inc_Name='   + '''' + ltrim(rtrim(@Inc_Name))  + ''''  
select @sqlstr= @sqlstr + ' ,Inc_Desc='   + '''' + ltrim(rtrim(@Inc_Desc))  + ''''  
select @sqlstr= @sqlstr + ' ,Target='   + '''' + ltrim(rtrim(@Target))  + ''''  
select @sqlstr= @sqlstr + ' ,Incentive_Amount='   + '''' + ltrim(rtrim(@Incentive_Amount))  + ''''  
select @sqlstr= @sqlstr + ',Is_active='    + '''' + ltrim(rtrim(@Isactive))  + ''''  
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code)) + ''''  
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate    + ''''  
select @sqlstr= @sqlstr +  ' Where Comp_code='  + '''' + @Comp_Code     + ''''  
select @sqlstr= @sqlstr +  ' and Location_Code='		+ '''' + @Location_Code					+ ''''
select @sqlstr= @sqlstr +  ' And Inc_Code=' + '''' + @Inc_Code    + ''''    
  
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
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_IncentiveType_Master]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================  
-- Author  : KRK       
-- Create date :16-03-2023
-- Modified date :16-03-2023  
-- Description : Save Incentive type MAster  (Insert / Update)  
-- ==================================================================  
--select * from Ins_IncentiveType_Master  
--exec sp_Save_Ins_IncentiveType_Master '100','1','1','10','10','1','ADD','ADMIN','0'  
CREATE Proc [dbo].[sp_Save_Ins_IncentiveType_Master]
  
(  
@Comp_Code  Varchar(20),  
@Location_Code		Varchar(20),
@Inctype_Code  varchar(50),  
@Inctype_Name  varchar(50),  
@Isactive  Varchar(50),  
@Screen_Mode Varchar(20),  
@User_Code  Varchar(15),  
@iSuccessFlag   bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iMode   Numeric(18,0)  
Declare @iServerDate Varchar(19)  
Set @iMode=(  
Select Count(Inctype_Code )  from  Ins_IncentiveType_Master    
Where comp_code = @Comp_Code   
	And		Location_Code 		=	@Location_Code
And  Inctype_Code  = @Inctype_Code   
      
)  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
BEGIN TRAN TRAN1  
select @sqlstr=''  
IF @iMode<=0   
BEGIN  
select @sqlstr = 'Insert into Ins_IncentiveType_Master Values('  
Select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))     + ''''  
select @sqlstr= @sqlstr +  ','+ ''''+ ltrim(rtrim(@Location_Code ))     + ''''  
select @sqlstr= @sqlstr +  ','+ ''''+ ltrim(rtrim(@Inctype_Code))     + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Inctype_Name    ))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Isactive ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate       + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate       + '''' + ')'  
END  
ELSE IF @iMode=1  
BEGIN  
select @sqlstr = 'Update Ins_IncentiveType_Master Set '  
select @sqlstr= @sqlstr + ' Inctype_Name='   + '''' + ltrim(rtrim(@Inctype_Name))  + ''''  
select @sqlstr= @sqlstr + ',Is_active='    + '''' + ltrim(rtrim(@Isactive))  + ''''  
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code)) + ''''  
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate    + ''''  
select @sqlstr= @sqlstr +  ' Where Comp_code='  + '''' + @Comp_Code     + ''''  
select @sqlstr= @sqlstr +  ' and Location_Code='		+ '''' + @Location_Code					+ ''''
select @sqlstr= @sqlstr +  ' And Inctype_Code=' + '''' + @Inctype_Code    + ''''    
  
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
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_JobcardIncentive_Master]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================  
-- Author  : KRK       
-- Create date :16-03-2023
-- Modified date :16-03-2023  
-- Description : Save Incentive type MAster  (Insert / Update)  
-- ==================================================================  
--select * from Ins_IncentiveType_Master  
--exec sp_Save_Ins_JobcardIncentive_Master '100','1','1','10','10','1','ADD','ADMIN','0'  
Create Proc [dbo].[sp_Save_Ins_JobcardIncentive_Master]
  
(  
@Comp_Code  Varchar(20),  
@Location_Code		Varchar(20),
@JOB_Code  varchar(50),  
@JOB_Name  varchar(50),  
@Description  varchar(50),  
@Incentive_Amount  varchar(50),  

@Isactive  Varchar(50),  
@Screen_Mode Varchar(20),  
@User_Code  Varchar(15),  
@iSuccessFlag   bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iMode   Numeric(18,0)  
Declare @iServerDate Varchar(19)  
Set @iMode=(  
Select Count(JOB_Code )  from  Ins_JobcardIncentive_Master    
Where comp_code = @Comp_Code   
	And		Location_Code 		=	@Location_Code
And  JOB_Code  = @JOB_Code   
      
)  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
BEGIN TRAN TRAN1  
select @sqlstr=''  
IF @iMode<=0   
BEGIN  
select @sqlstr = 'Insert into Ins_JobcardIncentive_Master Values('  
Select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))     + ''''  
select @sqlstr= @sqlstr +  ','+ ''''+ ltrim(rtrim(@Location_Code ))     + ''''  
select @sqlstr= @sqlstr +  ','+ ''''+ ltrim(rtrim(@JOB_Code))     + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@JOB_Name    ))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Description    ))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Incentive_Amount    ))    + ''''   

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Isactive ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate       + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate       + '''' + ')'  
END  
ELSE IF @iMode=1  
BEGIN  
select @sqlstr = 'Update Ins_JobcardIncentive_Master Set '  
select @sqlstr= @sqlstr + ' JOB_Name='   + '''' + ltrim(rtrim(@JOB_Name))  + ''''  
select @sqlstr= @sqlstr + ',Description='    + '''' + ltrim(rtrim(@Description))  + ''''  
select @sqlstr= @sqlstr + ',Incentive_Amount='    + '''' + ltrim(rtrim(@Incentive_Amount))  + ''''  

select @sqlstr= @sqlstr + ',Is_active='    + '''' + ltrim(rtrim(@Isactive))  + ''''  
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code)) + ''''  
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate    + ''''  
select @sqlstr= @sqlstr +  ' Where Comp_code='  + '''' + @Comp_Code     + ''''  
select @sqlstr= @sqlstr +  ' and Location_Code='		+ '''' + @Location_Code					+ ''''
select @sqlstr= @sqlstr +  ' And JOB_Code=' + '''' + @JOB_Code    + ''''    
  
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
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_Mechanic_HelperLink_Line]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================    
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023    
-- Description : Save Mechanic Incentive ENTRY lINE  (Insert / Update)    
-- ========================================================    

create Proc [dbo].[sp_Save_Ins_Mechanic_HelperLink_Line]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(100),    
@Entry_Date     Varchar(100),    
@Sno      Varchar(10),    
@Mech_EmpCode     Varchar(10),    
@Mech_EmpID     Varchar(10),    
@Mech_EmpName     Varchar(10),    
@Mech_Percentage     Varchar(10),    
@Helper_EmpCode     Varchar(10),    
@Helper_EmpID     Varchar(10),    
@Helper_EmpName     Varchar(10),    
@Helper_Percentage     Varchar(10),    
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
    
BEGIN    
select @sqlstr=''    
select @sqlstr = 'Insert into Ins_Mechanic_HelperLink_Line Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code ))   + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Sno  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Mech_EmpCode ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Mech_EmpID ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Mech_EmpName   ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Mech_Percentage    ))  + ''''  

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Helper_EmpCode   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Helper_EmpID   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Helper_EmpName   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Helper_Percentage   ))  + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))  + ''''    
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''    
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + ''''     
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''    
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + '''' + ')'    
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
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_Mechanic_HelperLink_Main]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================    
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023   
-- Description : Save Mechanic Incentive Allowance ENTRY Main  (Insert / Update)    
-- ==================================================================    
 --select * from   Ins_Mechanic_HelperLink_Main
 --select * from   Ins_Mechanic_HelperLink_Line

create Proc [dbo].[sp_Save_Ins_Mechanic_HelperLink_Main]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(20),    
@Entry_Date     Varchar(20),    
@dept_Code    Varchar(10), 
@dept_Name    Varchar(100), 
@Tot_Amount    Varchar(100),   
@Others      Varchar(100),    
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
Select Count(Entry_No) from Ins_Mechanic_HelperLink_Main    
Where Comp_Code  = @Comp_Code     
 And  Location_Code   = @Location_Code   
And  Entry_No  = @Entry_No     
And  Entry_Date   = @Entry_Date    
)    
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))    
BEGIN TRAN TRAN1    
select @sqlstr=''    
IF @iMode<=0     
BEGIN    
select @sqlstr = 'Insert into Ins_Mechanic_HelperLink_Main Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))   + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@dept_Code ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@dept_Name ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Tot_Amount  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Others  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + ''''     
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + '''' + ')'    
END    
ELSE IF @iMode=1    
BEGIN    
select @sqlstr = 'Update Ins_Mechanic_HelperLink_Main Set '    
select @sqlstr= @sqlstr + 'Deptcode='   + '''' + ltrim(rtrim(@dept_Code))  + ''''    
select @sqlstr= @sqlstr + ',Tot_Amount='   + '''' + ltrim(rtrim(@Tot_Amount))  + ''''    
select @sqlstr= @sqlstr + ',Others_Desc='   + '''' + ltrim(rtrim(@others))    + ''''    
select @sqlstr= @sqlstr + ',Authorize='    + '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ',Delete_Mode='   + '''' + ltrim(rtrim(@Delete_Mode))   + ''''    
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))   + ''''    
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate      + ''''    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code       + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
select @sqlstr= @sqlstr +  ' And Entry_No ='  + '''' + @Entry_No        + ''''      
select @sqlstr= @sqlstr +  ' And Entry_Date='  + '''' + @Entry_Date       + ''''      
END    
exec(@sqlstr )    
print @sqlstr    
IF @iMode=1    
BEGIN    
select @sqlstr = 'Delete from Ins_Mechanic_HelperLink_Line'    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code   + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
select @sqlstr= @sqlstr +  ' And Entry_No='   + '''' +  @Entry_No   + ''''      
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
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_MechanicIncentive_Master]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================  
-- Author  : RAJKUMAR.K  
-- Create date : 05-11-2020  
-- Description : Save Mechanic Incentive Master  MAster  (Insert / Update)  
-- ==================================================================  
--select * from Ins_MechanicIncentive_Master  
--exec sp_Save_Ins_MechanicIncentive_Master 'LS MILLS','1','1','10','10','1','ADD','ADMIN','0'  
create Proc [dbo].[sp_Save_Ins_MechanicIncentive_Master]  
(  
@Comp_Code  Varchar(10),  
@Location_Code  Varchar(10),  
@ID  varchar(50),  
 @DeptCode  varchar(50),  
 @Dept_Name  varchar(50),  
 @FreeService  varchar(50),  
 @PaidService  varchar(50),  
 @GeneralService  varchar(50),  
 @MinorJOB  varchar(50),  
 @AccidentWork  varchar(50),  
 @PDI  varchar(50),  
 @fit  varchar(50),  
 @waterservice  varchar(50),  
 @demo  varchar(50),  
 @labour  varchar(50),  
 @Spares  varchar(50),  
 @Effect_from  varchar(50),  
 @Effect_To  varchar(50),  
 @IS_Active  varchar(50),   
@Screen_Mode Varchar(20),  
@User_Code  Varchar(15),  
@iSuccessFlag   bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iMode   Numeric(18,0)  
Declare @iServerDate Varchar(19)  
Set @iMode=(  
Select Count(deptcode   )  from  Ins_MechanicIncentive_Master    
Where comp_code = @Comp_Code   
And  deptcode  = @ID   
      
)  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
BEGIN TRAN TRAN1  
select @sqlstr=''  
IF @iMode<=0   
BEGIN  
select @sqlstr = 'Insert into Ins_MechanicIncentive_Master Values('  
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))     + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code    ))    + ''''  
 select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@ID    ))    + ''''  
 select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@DeptCode    ))    + ''''  
 select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Dept_Name    ))    + ''''  
 select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@FreeService    ))    + ''''  
 select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@PaidService    ))    + ''''  
 select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GeneralService    ))    + ''''  
 select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@MinorJOB    ))    + ''''  
 select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@AccidentWork    ))    + ''''  
 select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@PDI    ))    + ''''  
 select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@fit    ))    + ''''  
 select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@waterservice    ))    + ''''  
 select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@demo    ))    + ''''  
 select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@labour    ))    + ''''  
 select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Spares    ))    + ''''  
 select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Effect_from    ))    + ''''  
 select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Effect_To    ))    + ''''  
 select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@IS_Active    ))    + ''''  
  
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate       + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate       + '''' + ')'  
END  
ELSE IF @iMode=1  
BEGIN  
select @sqlstr = 'Update Ins_MechanicIncentive_Master Set '  
 
 select @sqlstr= @sqlstr + '  DeptCode    ='   + '''' + ltrim(rtrim(@DeptCode  ))  + ''''  
select @sqlstr= @sqlstr + ' ,Dept_Name    ='   + '''' + ltrim(rtrim(@Dept_Name  ))  + ''''  
select @sqlstr= @sqlstr + ' ,FreeService    ='   + '''' + ltrim(rtrim(@FreeService  ))  + ''''  
select @sqlstr= @sqlstr + ' ,PaidService    ='   + '''' + ltrim(rtrim(@PaidService   ))  + ''''  
select @sqlstr= @sqlstr + ' ,GeneralService    ='   + '''' + ltrim(rtrim(@GeneralService  ))  + ''''  
select @sqlstr= @sqlstr + ' ,MinorJOB    ='   + '''' + ltrim(rtrim(@MinorJOB  ))  + ''''  
select @sqlstr= @sqlstr + ' ,AccidentWork    ='   + '''' + ltrim(rtrim(@AccidentWork  ))  + ''''  
select @sqlstr= @sqlstr + ' ,PDI    ='   + '''' + ltrim(rtrim(@PDI  ))  + ''''  
select @sqlstr= @sqlstr + ' ,fit    ='   + '''' + ltrim(rtrim(@fit  ))  + ''''  
select @sqlstr= @sqlstr + ' ,waterservice    ='   + '''' + ltrim(rtrim(@waterservice  ))  + ''''  
select @sqlstr= @sqlstr + ' ,demo    ='   + '''' + ltrim(rtrim(@demo  ))  + ''''  
select @sqlstr= @sqlstr + ' ,labour    ='   + '''' + ltrim(rtrim(@labour  ))  + ''''  
select @sqlstr= @sqlstr + ' ,Spares    ='   + '''' + ltrim(rtrim(@Spares  ))  + ''''  
select @sqlstr= @sqlstr + ' ,Effect_from    ='   + '''' + ltrim(rtrim(@Effect_from  ))  + ''''  
select @sqlstr= @sqlstr + ' ,Effect_To    ='   + '''' + ltrim(rtrim(@Effect_To  ))  + ''''  
select @sqlstr= @sqlstr + ' ,IS_Active    ='   + '''' + ltrim(rtrim(@IS_Active  ))  + ''''  
 
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code)) + ''''  
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate    + ''''  
select @sqlstr= @sqlstr +  ' Where comp_code='  + '''' + @Comp_Code     + ''''  
select @sqlstr= @sqlstr +  ' And ID=' + '''' + @ID    + ''''    
  
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
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_MechanicIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================    
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023    
-- Description : Save Mechanic Incentive ENTRY lINE  (Insert / Update)    
-- ========================================================    

CREATE Proc [dbo].[sp_Save_Ins_MechanicIncentiveEntry_Line]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(100),    
@Entry_Date     Varchar(100),    
@Sno      Varchar(10),    
@EmpCode     Varchar(10),    
@EmpID     Varchar(10),    
@EmpName     Varchar(100),    
@FreeService  varchar(50),  
 @PaidService  varchar(50),  
 @GeneralService  varchar(50),  
 @MinorJOB  varchar(50),  
 @AccidentWork  varchar(50),  
 @PDI  varchar(50),  
 @fit  varchar(50),  
 @waterservice  varchar(50),  
 @demo  varchar(50),  
 @Total  varchar(50),  
  @Labour  varchar(50),  
 @Spares  varchar(50),  
 @Incentive  varchar(50),  
 @Final_Incentive  varchar(50),  
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
    
BEGIN    
select @sqlstr=''    
select @sqlstr = 'Insert into Ins_MechanicIncentiveEntry_Line Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code ))   + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Sno  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpCode ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpID ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpName   ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@FreeService    ))  + ''''  

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@PaidService   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@GeneralService   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@MinorJOB   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@AccidentWork   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@PDI   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@fit   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@waterservice   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@demo   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Total   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Labour   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Spares   ))  + '''' 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Incentive   ))  + ''''        
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Final_Incentive   ))  + ''''        
       
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))  + ''''    
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''    
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + ''''     
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''    
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + '''' + ')'    
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
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_MechanicIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================    
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023   
-- Description : Save Mechanic Incentive Allowance ENTRY Main  (Insert / Update)    
-- ==================================================================    
 --select * from   Ins_MechanicIncentiveEntry_Main
 --select * from   Ins_MechanicIncentiveEntry_Line

create Proc [dbo].[sp_Save_Ins_MechanicIncentiveEntry_Main]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(20),    
@Entry_Date     Varchar(20),    
@dept_Code    Varchar(10), 
@dept_Name    Varchar(100), 
@Tot_Amount    Varchar(100),   
@Others      Varchar(100),    
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
Select Count(Entry_No) from Ins_MechanicIncentiveEntry_Main    
Where Comp_Code  = @Comp_Code     
 And  Location_Code   = @Location_Code   
And  Entry_No  = @Entry_No     
And  Entry_Date   = @Entry_Date    
)    
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))    
BEGIN TRAN TRAN1    
select @sqlstr=''    
IF @iMode<=0     
BEGIN    
select @sqlstr = 'Insert into Ins_MechanicIncentiveEntry_Main Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))   + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@dept_Code ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@dept_Name ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Tot_Amount  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Others  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + ''''     
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + '''' + ')'    
END    
ELSE IF @iMode=1    
BEGIN    
select @sqlstr = 'Update Ins_MechanicIncentiveEntry_Main Set '    
select @sqlstr= @sqlstr + 'Deptcode='   + '''' + ltrim(rtrim(@dept_Code))  + ''''    
select @sqlstr= @sqlstr + ',Tot_Amount='   + '''' + ltrim(rtrim(@Tot_Amount))  + ''''    
select @sqlstr= @sqlstr + ',Others_Desc='   + '''' + ltrim(rtrim(@others))    + ''''    
select @sqlstr= @sqlstr + ',Authorize='    + '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ',Delete_Mode='   + '''' + ltrim(rtrim(@Delete_Mode))   + ''''    
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))   + ''''    
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate      + ''''    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code       + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
select @sqlstr= @sqlstr +  ' And Entry_No ='  + '''' + @Entry_No        + ''''      
select @sqlstr= @sqlstr +  ' And Entry_Date='  + '''' + @Entry_Date       + ''''      
END    
exec(@sqlstr )    
print @sqlstr    
IF @iMode=1    
BEGIN    
select @sqlstr = 'Delete from Ins_MechanicIncentiveEntry_Line'    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code   + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
select @sqlstr= @sqlstr +  ' And Entry_No='   + '''' +  @Entry_No   + ''''      
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
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_OtherIncentive_Master]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================  
-- Author  : KRK       
-- Create date :16-03-2023
-- Modified date :16-03-2023  
-- Description : Save Other  Incentive   MAster  (Insert / Update)  
-- ==================================================================  
--select * from Ins_OtherIncentive_Master  
--exec sp_Save_Ins_OtherIncentive_Master '100','1','1','10','10','1','ADD','ADMIN','0'  
Create Proc [dbo].[sp_Save_Ins_OtherIncentive_Master]
  
(  
@Comp_Code  Varchar(20),  
@Location_Code		Varchar(20),
@JOB_Code  varchar(50),  
@JOB_Name  varchar(50),  
@Description  varchar(50),  
@Slab1  varchar(50),  
@Slab2  varchar(50),  
@Slab3  varchar(50),  
@Slab1_Amount  varchar(50),  
@Slab2_Amount  varchar(50),  
@Slab3_Amount  varchar(50),  
@Isactive  Varchar(50),  
@Screen_Mode Varchar(20),  
@User_Code  Varchar(15),  
@iSuccessFlag   bit output  
)  
as  
set nocount on  
set dateformat ymd  
Declare @sqlstr   Varchar(8000)  
Declare @iMode   Numeric(18,0)  
Declare @iServerDate Varchar(19)  
Set @iMode=(  
Select Count(JOB_Code )  from  Ins_OtherIncentive_Master    
Where comp_code = @Comp_Code   
	And		Location_Code 		=	@Location_Code
And  JOB_Code  = @JOB_Code   
      
)  
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))  
BEGIN TRAN TRAN1  
select @sqlstr=''  
IF @iMode<=0   
BEGIN  
select @sqlstr = 'Insert into Ins_OtherIncentive_Master Values('  
Select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))     + ''''  
select @sqlstr= @sqlstr +  ','+ ''''+ ltrim(rtrim(@Location_Code ))     + ''''  
select @sqlstr= @sqlstr +  ','+ ''''+ ltrim(rtrim(@JOB_Code))     + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@JOB_Name    ))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Description    ))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Slab1    ))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Slab2   ))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Slab3   ))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Slab1_Amount    ))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Slab2_Amount    ))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Slab3_Amount    ))    + ''''   


select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Isactive ))    + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate       + ''''   
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''  
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate       + '''' + ')'  
END  
ELSE IF @iMode=1  
BEGIN  
select @sqlstr = 'Update Ins_OtherIncentive_Master Set '  
select @sqlstr= @sqlstr + ' JOB_Name='   + '''' + ltrim(rtrim(@JOB_Name))  + ''''  
select @sqlstr= @sqlstr + ',Description='    + '''' + ltrim(rtrim(@Description))  + ''''  
select @sqlstr= @sqlstr + ',Slab1='    + '''' + ltrim(rtrim(@Slab1))  + ''''  
select @sqlstr= @sqlstr + ',Slab2='    + '''' + ltrim(rtrim(@Slab2))  + ''''  
select @sqlstr= @sqlstr + ',Slab3='    + '''' + ltrim(rtrim(@Slab3))  + ''''  
select @sqlstr= @sqlstr + ',Slab1_Amount='    + '''' + ltrim(rtrim(@Slab1_Amount))  + ''''  
select @sqlstr= @sqlstr + ',Slab2_Amount='    + '''' + ltrim(rtrim(@Slab2_Amount))  + ''''  
select @sqlstr= @sqlstr + ',Slab3_Amount='    + '''' + ltrim(rtrim(@Slab3_Amount))  + ''''  


select @sqlstr= @sqlstr + ',Is_active='    + '''' + ltrim(rtrim(@Isactive))  + ''''  
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code)) + ''''  
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate    + ''''  
select @sqlstr= @sqlstr +  ' Where Comp_code='  + '''' + @Comp_Code     + ''''  
select @sqlstr= @sqlstr +  ' and Location_Code='		+ '''' + @Location_Code					+ ''''
select @sqlstr= @sqlstr +  ' And JOB_Code=' + '''' + @JOB_Code    + ''''    
  
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
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_SalesIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================    
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023    
-- Description : Save Sales Incentive ENTRY lINE  (Insert / Update)    
-- ========================================================    

create Proc [dbo].[sp_Save_Ins_SalesIncentiveEntry_Line]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(100),    
@Entry_Date     Varchar(100),    
@Sno      Varchar(10),    
@EmpCode     Varchar(10),    
@EmpID     Varchar(10),    
@EmpName     Varchar(100),    
@Fixed_Incentive  Varchar(100),    
@Leave  Varchar(10),    
@Incentive  Varchar(10),    

  
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
    
BEGIN    
select @sqlstr=''    
select @sqlstr = 'Insert into Ins_SalesIncentiveEntry_Line Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code ))   + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Sno  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpCode ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpID ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpName   ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fixed_Incentive   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Leave   ))  + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Incentive   ))  + ''''      
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))  + ''''    
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''    
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + ''''     
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''    
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + '''' + ')'    
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
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_SalesIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================    
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023   
-- Description : Save Sales Allowance ENTRY Main  (Insert / Update)    
-- ==================================================================    
 --select * from   Ins_SalesIncentiveEntry_Main
 --select * from   Ins_SalesIncentiveEntry_Line

create Proc [dbo].[sp_Save_Ins_SalesIncentiveEntry_Main]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(20),    
@Entry_Date     Varchar(20),    
@dept_Code    Varchar(10), 
@dept_Name    Varchar(100), 

@Allow_Name		varchar(50),
@Tot_Amount    Varchar(100),   
@Others      Varchar(100),    
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
Select Count(Entry_No) from Ins_SalesIncentiveEntry_Main    
Where Comp_Code  = @Comp_Code     
 And  Location_Code   = @Location_Code   
And  Entry_No  = @Entry_No     
And  Entry_Date   = @Entry_Date    
)    
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))    
BEGIN TRAN TRAN1    
select @sqlstr=''    
IF @iMode<=0     
BEGIN    
select @sqlstr = 'Insert into Ins_SalesIncentiveEntry_Main Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))   + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))   + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@dept_Code ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@dept_Name ))    + ''''    

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Allow_Name    ))				+ '''' 
 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Tot_Amount  ))    + ''''    
  
  
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Others  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))     + ''''    
    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + ''''     
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + '''' + ')'    
END    
ELSE IF @iMode=1    
BEGIN    
select @sqlstr = 'Update Ins_SalesIncentiveEntry_Main Set '    
select @sqlstr= @sqlstr + 'Deptcode='   + '''' + ltrim(rtrim(@dept_Code))  + ''''    
select @sqlstr= @sqlstr + ',Tot_Amount='   + '''' + ltrim(rtrim(@Tot_Amount))  + ''''    
  
  
select @sqlstr= @sqlstr + ',Others_Desc='   + '''' + ltrim(rtrim(@others))    + ''''    
select @sqlstr= @sqlstr + ',Authorize='    + '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ',Delete_Mode='   + '''' + ltrim(rtrim(@Delete_Mode))   + ''''    
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))   + ''''    
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate      + ''''    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code       + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
  
select @sqlstr= @sqlstr +  ' And Entry_No ='  + '''' + @Entry_No        + ''''      
select @sqlstr= @sqlstr +  ' And Entry_Date='  + '''' + @Entry_Date       + ''''      
END    
exec(@sqlstr )    
print @sqlstr    
IF @iMode=1    
BEGIN    
select @sqlstr = 'Delete from Ins_SalesIncentiveEntry_Line'    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code   + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
  
select @sqlstr= @sqlstr +  ' And Entry_No='   + '''' +  @Entry_No   + ''''      
    
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
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_SecurityIncentiveEntry_Line]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================    
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023    
-- Description : Save Security Incentive ENTRY lINE  (Insert / Update)    
-- ========================================================    

create Proc [dbo].[sp_Save_Ins_SecurityIncentiveEntry_Line]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(100),    
@Entry_Date     Varchar(100),    
@Sno      Varchar(10),    
@EmpCode     Varchar(10),    
@EmpID     Varchar(10),    
@EmpName     Varchar(100),    
@Fixed_Incentive  Varchar(100),    
@Leave  Varchar(10),    
@Incentive  Varchar(10),    

  
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
    
BEGIN    
select @sqlstr=''    
select @sqlstr = 'Insert into Ins_SecurityIncentiveEntry_Line Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code ))   + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Sno  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpCode ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpID ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpName   ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fixed_Incentive   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Leave   ))  + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Incentive   ))  + ''''      
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))  + ''''    
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''    
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + ''''     
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''    
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + '''' + ')'    
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
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_SecurityIncentiveEntry_Main]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================    
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023   
-- Description : Save Security Allowance ENTRY Main  (Insert / Update)    
-- ==================================================================    
 --select * from   Ins_SecurityIncentiveEntry_Main
 --select * from   Ins_SecurityIncentiveEntry_Line

create Proc [dbo].[sp_Save_Ins_SecurityIncentiveEntry_Main]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(20),    
@Entry_Date     Varchar(20),    
@dept_Code    Varchar(10), 
@dept_Name    Varchar(100), 

@Allow_Name		varchar(50),
@Tot_Amount    Varchar(100),   
@Others      Varchar(100),    
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
Select Count(Entry_No) from Ins_SecurityIncentiveEntry_Main    
Where Comp_Code  = @Comp_Code     
 And  Location_Code   = @Location_Code   
And  Entry_No  = @Entry_No     
And  Entry_Date   = @Entry_Date    
)    
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))    
BEGIN TRAN TRAN1    
select @sqlstr=''    
IF @iMode<=0     
BEGIN    
select @sqlstr = 'Insert into Ins_SecurityIncentiveEntry_Main Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))   + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))   + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@dept_Code ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@dept_Name ))    + ''''    

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Allow_Name    ))				+ '''' 
 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Tot_Amount  ))    + ''''    
  
  
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Others  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))     + ''''    
    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + ''''     
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + '''' + ')'    
END    
ELSE IF @iMode=1    
BEGIN    
select @sqlstr = 'Update Ins_SecurityIncentiveEntry_Main Set '    
select @sqlstr= @sqlstr + 'Deptcode='   + '''' + ltrim(rtrim(@dept_Code))  + ''''    
select @sqlstr= @sqlstr + ',Tot_Amount='   + '''' + ltrim(rtrim(@Tot_Amount))  + ''''    
  
  
select @sqlstr= @sqlstr + ',Others_Desc='   + '''' + ltrim(rtrim(@others))    + ''''    
select @sqlstr= @sqlstr + ',Authorize='    + '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ',Delete_Mode='   + '''' + ltrim(rtrim(@Delete_Mode))   + ''''    
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))   + ''''    
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate      + ''''    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code       + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
  
select @sqlstr= @sqlstr +  ' And Entry_No ='  + '''' + @Entry_No        + ''''      
select @sqlstr= @sqlstr +  ' And Entry_Date='  + '''' + @Entry_Date       + ''''      
END    
exec(@sqlstr )    
print @sqlstr    
IF @iMode=1    
BEGIN    
select @sqlstr = 'Delete from Ins_SecurityIncentiveEntry_Line'    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code   + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
  
select @sqlstr= @sqlstr +  ' And Entry_No='   + '''' +  @Entry_No   + ''''      
    
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
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_SparesincentiveEntry_Line]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================    
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023    
-- Description : Save Spares Incentive ENTRY lINE  (Insert / Update)    
-- ========================================================    

create Proc [dbo].[sp_Save_Ins_SparesincentiveEntry_Line]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(100),    
@Entry_Date     Varchar(100),    
@Sno      Varchar(10),    
@EmpCode     Varchar(10),    
@EmpID     Varchar(10),    
@EmpName     Varchar(100),    
@Fixed_Incentive  Varchar(100),    
@Leave  Varchar(10),    
@Incentive  Varchar(10),    

  
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
    
BEGIN    
select @sqlstr=''    
select @sqlstr = 'Insert into Ins_SparesincentiveEntry_Line Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))    + ''''   
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code ))   + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No ))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Sno  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpCode ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpID ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@EmpName   ))  + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Fixed_Incentive   ))  + ''''  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Leave   ))  + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Incentive   ))  + ''''      
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))  + ''''    
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''    
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + ''''     
select @sqlstr= @sqlstr + ','+''''+ @User_Code       + ''''    
select @sqlstr= @sqlstr + ','+''''+ @iServerDate      + '''' + ')'    
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
/****** Object:  StoredProcedure [dbo].[sp_Save_Ins_SparesincentiveEntry_Main]    Script Date: 24/03/2023 23:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================    
-- Author  : KRK       
-- Create date :15-03-2023
-- Modified date :15-03-2023   
-- Description : Save Spares Allowance ENTRY Main  (Insert / Update)    
-- ==================================================================    
 --select * from   Ins_SparesincentiveEntry_Main
 --select * from   Ins_SparesincentiveEntry_Line

create Proc [dbo].[sp_Save_Ins_SparesincentiveEntry_Main]    
(    
@Comp_Code     Varchar(20),    
@Location_Code     Varchar(20),    
@Entry_No     Varchar(20),    
@Entry_Date     Varchar(20),    
@dept_Code    Varchar(10), 
@dept_Name    Varchar(100), 
@Allow_Name		varchar(50),
@Tot_Amount    Varchar(100),   
@Others      Varchar(100),    
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
Select Count(Entry_No) from Ins_SparesincentiveEntry_Main    
Where Comp_Code  = @Comp_Code     
 And  Location_Code   = @Location_Code   
And  Entry_No  = @Entry_No     
And  Entry_Date   = @Entry_Date    
)    
Set @iServerDate=(Select Convert(VARCHAR(19),getdate(),120))    
BEGIN TRAN TRAN1    
select @sqlstr=''    
IF @iMode<=0     
BEGIN    
select @sqlstr = 'Insert into Ins_SparesincentiveEntry_Main Values('    
select @sqlstr= @sqlstr + ''''+ ltrim(rtrim(@Comp_Code))     + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Location_Code))   + ''''    
  
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_No))   + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Entry_Date ))   + ''''     
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@dept_Code ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@dept_Name ))    + ''''    

select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Allow_Name    ))				+ '''' 
 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Tot_Amount  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Others  ))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Authorize))     + ''''    
 
select @sqlstr= @sqlstr + ','+ '''' + ltrim(rtrim(@Delete_Mode))    + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + ''''     
select @sqlstr= @sqlstr + ','+ '''' + @User_Code        + ''''    
select @sqlstr= @sqlstr + ','+ '''' + @iServerDate        + '''' + ')'    
END    
ELSE IF @iMode=1    
BEGIN    
select @sqlstr = 'Update Ins_SparesincentiveEntry_Main Set '    
select @sqlstr= @sqlstr + 'Deptcode='   + '''' + ltrim(rtrim(@dept_Code))  + ''''    
select @sqlstr= @sqlstr + ',Tot_Amount='   + '''' + ltrim(rtrim(@Tot_Amount))  + ''''    
  
  
select @sqlstr= @sqlstr + ',Others_Desc='   + '''' + ltrim(rtrim(@others))    + ''''    
select @sqlstr= @sqlstr + ',Authorize='    + '''' + ltrim(rtrim(@Authorize))   + ''''    
select @sqlstr= @sqlstr + ',Delete_Mode='   + '''' + ltrim(rtrim(@Delete_Mode))   + ''''    
select @sqlstr= @sqlstr + ',Modified_By='   + '''' + ltrim(rtrim(@User_Code))   + ''''    
select @sqlstr= @sqlstr + ',Modified_Date='   + '''' + @iServerDate      + ''''    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code       + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
  
select @sqlstr= @sqlstr +  ' And Entry_No ='  + '''' + @Entry_No        + ''''      
select @sqlstr= @sqlstr +  ' And Entry_Date='  + '''' + @Entry_Date       + ''''      
END    
exec(@sqlstr )    
print @sqlstr    
IF @iMode=1    
BEGIN    
select @sqlstr = 'Delete from Ins_SparesincentiveEntry_Line'    
select @sqlstr= @sqlstr +  ' Where Comp_Code='  + '''' + @Comp_Code   + ''''    
select @sqlstr= @sqlstr +  ' And Location_code='   + '''' +  @Location_Code   + ''''      
  
select @sqlstr= @sqlstr +  ' And Entry_No='   + '''' +  @Entry_No   + ''''      
    
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
