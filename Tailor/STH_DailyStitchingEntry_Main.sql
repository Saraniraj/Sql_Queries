USE [DB_HRMS]
GO

/****** Object:  Table [dbo].[Proll_OvertimeEntry_Main]    Script Date: 28-Feb-2023 12:24:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[STH_DailyStitchingEntry_Main](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [varchar](100) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[STH_Date] [datetime] NOT NULL,
		[Total_Stitched] [float] NOT NULL,
	[Total_Amount] [float] NOT NULL,
	[Unit] [nvarchar](50) NULL,
	[Others_Desc] [nvarchar](150) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_STH_DailyStitchingEntry_Main] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[STH_Date] ASC
 
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


