USE [Powersoft_YASOTHA]
GO

/****** Object:  Table [dbo].[Ins_MechanicIncentiveEntry_Main]    Script Date: 23-Mar-23 16:15:26 ******/
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


