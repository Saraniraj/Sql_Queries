USE [DB_HRMS]
GO

/****** Object:  Table [dbo].[Proll_OvertimeEntry_Line]    Script Date: 28-Feb-2023 12:42:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[STH_DailyStitchingEntry_Line](
	[Comp_Code] [nvarchar](100) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [nvarchar](150) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[STH_Date] [datetime] NOT NULL,
	[Sno] [varchar](10) NOT NULL,
		[EmpCode] [nvarchar](15) NOT NULL,
	[Tokenno] [nvarchar](15) NOT NULL,
	Ops_Code int NOT NULL,
	Operation_Name [nvarchar](150) NOT NULL,
	Product_Name	[nvarchar](150) NOT NULL,
	[Rate_Per_Pcs] [numeric](10, 2) NULL,
	[NO_of_Stitched] [float] NOT NULL,
		[Stitched_Amount]  [numeric](10, 2) NULL,
		[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_STH_DailyStitchingEntry_Line] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Sno] ASC,
	[EmpCode] ASC,
	Ops_Code  ASC,
	[STH_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


