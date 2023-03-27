USE [Powersoft_YASOTHA]
GO

/****** Object:  Table [dbo].[Ins_MechanicIncentiveEntry_Line]    Script Date: 23-Mar-23 16:18:42 ******/
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


