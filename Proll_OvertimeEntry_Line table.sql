USE [DB_HRMS]
GO

/****** Object:  Table [dbo].[Proll_OvertimeEntry_Line]    Script Date: 03-Feb-2023 16:28:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Proll_OvertimeEntry_Line](
	[Comp_Code] [nvarchar](100) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Entry_No] [nvarchar](150) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Sno] [varchar](10) NOT NULL,
	[EmpCode] [nvarchar](15) NOT NULL,
	[Tokenno] [nvarchar](15) NOT NULL,
	[SDate] [datetime] NOT NULL,
	[DaySalary] [numeric](10, 2) NULL,
	[OtHours] [float] NOT NULL,
	[OTPercent] [int] NOT NULL,
	[OT_Amount] [float] NOT NULL,
	[Otincen] [nchar](10) NULL,
	[OtNett] [nchar](10) NULL,
	[OTFlag] [nchar](10) NULL,
	[Unit] [nchar](10) NULL,
	[DEPTCODE] [numeric](3, 0) NULL,
	[DIVICODE] [numeric](3, 0) NULL,
	[DESGCODE] [numeric](3, 0) NULL,
	[OTCAT] [varchar](50) NULL,
	[SHED] [varchar](1) NULL,
	[Authorize] [int] NOT NULL,
	[Delete_Mode] [int] NOT NULL,
	[Created_By] [varchar](15) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](15) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Proll_OvertimeEntry_Line] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Entry_No] ASC,
	[Entry_Date] ASC,
	[Sno] ASC,
	[EmpCode] ASC,
	[SDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


