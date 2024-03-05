USE [PowerERP_Cashew]
GO

/****** Object:  Table [dbo].[HRD_PaymentReceipt]    Script Date: 07/09/2023 13:12:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_DailyExpensesEntry](
	[Comp_Code] [varchar](20) NOT NULL,
	[Location_Code] [varchar](20) NOT NULL,
	[Expense_ID] [bigint] NOT NULL,
	[Expense_Date] [datetime] NOT NULL,
	[LotNo] [varchar](50) NOT NULL,
	ExpenseHead_ID  [int] NOT NULL,
	 ExpenseHead_Desc [nvarchar](250) NOT NULL,
	[Qty] [numeric](18, 2) NULL,

	[Amount] [numeric](18, 2) NULL,
	[Remarks] [nvarchar](500) NULL,
	[IS_Active] [int] NULL,
	[Created_By] [varchar](15) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](15) NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_tbl_DailyExpensesEntry] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[ExpenseHead_ID] ASC,
		[Expense_Date] ASC,
	LotNo ASC


)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


