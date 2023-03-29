USE [DB_HRMS]
GO

/****** Object:  Table [dbo].[STH_Product_Master]    Script Date: 25-Feb-2023 16:38:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[STH_Operation_Master](
	[Comp_Code] [varchar](20) NOT NULL,
	[Location_Code] [varchar](20) NOT NULL,
	[Ops_Code] [bigint] NOT NULL,
	[Operation_Name] [varchar](50) NOT NULL,
	[Rate_Per_Pcs] [numeric](18, 2) NULL,
	[Effect_from] [datetime] NULL,
	[Effect_To] [datetime] NULL,
	[IS_Active] [int] NULL,
	[Created_By] [varchar](15) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](15) NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_STH_Operation_Master] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Operation_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


