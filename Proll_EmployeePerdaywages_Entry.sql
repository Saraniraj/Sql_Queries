USE [DB_HRMS]
GO

/****** Object:  Table [dbo].[HRD_PermissionEntry]    Script Date: 02/05/2023 16:22:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Proll_EmployeePerdaywages_Entry](
	[Comp_Code] [varchar](20) NOT NULL,
	[Location_Code] [varchar](20) NOT NULL,
	[ID] [bigint] NOT NULL,
	[SDate] [datetime] NOT NULL,
	[Empcode] [nvarchar](50) NOT NULL,
	[Empid] [nvarchar](50) NULL,
 
	[Min_perday_Wages] [float] NULL,
	[Remarks] [nvarchar](500) NULL,
	[IS_Active] [int] NULL,
	[Created_By] [varchar](15) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](15) NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Proll_EmployeePerdaywages_Entry] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[SDate] ASC,
	[Empcode] ASC 
 
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


