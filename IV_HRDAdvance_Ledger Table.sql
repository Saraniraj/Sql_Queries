USE [MY_Attendance_SAO]
GO

/****** Object:  Table [dbo].[IV_HRDAdvance_Ledger]    Script Date: 22/11/2022 16:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[IV_HRDAdvance_Ledger](
	[Comp_Code] [varchar](10) NOT NULL,
	[Location_Code] [varchar](10) NOT NULL,
	[Trans_No] [varchar](100) NOT NULL,
	[Trans_Date] [datetime] NOT NULL,
	[Loan_Date] [datetime] NOT NULL,
	[Trans_Type] [varchar](100) NOT NULL,
	[Empcode] [varchar](50) NOT NULL,
	[Empid] [varchar](50) NOT NULL,
	[Opening] [numeric](18, 3) NULL,
	[current_Adv] [numeric](18, 3) NULL,
	[Paid_Amount] [numeric](18, 3) NULL,
 CONSTRAINT [PK_IV_HRDAdvance_Ledger_1] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Loan_Date] ASC,
	[Trans_Type] ASC,
	[Empcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


