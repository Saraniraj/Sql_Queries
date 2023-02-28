USE [DB_HRMS]
GO

/****** Object:  Table [dbo].[SalStoreTable]    Script Date: 05-Jan-2023 17:27:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SalStoreTable](
	[Comp_Code] [nvarchar](50) NOT NULL,
	[Location_Code] [nvarchar](50) NOT NULL,
	[Empcode] [varchar](50) NOT NULL,
	[EmpID] [bigint] NOT NULL,
	[Tokenno] [nvarchar](50) NULL,
	[CatCode] [bigint] NOT NULL,
	[DeptCode] [bigint] NOT NULL,
	[DesignCode] [bigint] NOT NULL,
	[SDate] [datetime] NOT NULL,
	[Present] [float] NOT NULL,
	[Absent] [float] NOT NULL,
	[Leave] [float] NOT NULL,
	[WeeklyOff] [float] NOT NULL,
	[Weekoff_Present] [float] NULL,
	[Weekoff_Paid] [float] NULL,
	[Extra_work] [float] NULL,
	[Extra_work_paid] [float] NULL,
	[NH] [float] NOT NULL,
	[FH] [float] NOT NULL,
	[LOP] [float] NOT NULL,
	[CL] [float] NULL,
	[TotalDays] [float] NOT NULL,
	[PaidDays] [float] NOT NULL,
	[Basic] [float] NOT NULL,
	[AttnEarning] [numeric](18, 3) NOT NULL,
	[HRAAmount1] [float] NOT NULL,
	[HRAAmount] [numeric](18, 3) NOT NULL,
	[WashAmount1] [float] NULL,
	[WashAmount] [float] NULL,
	[DAAmount1] [float] NULL,
	[DAAmount] [float] NULL,
	[PFSource] [float] NOT NULL,
	[ESISource] [float] NOT NULL,
	[LeaveSalary] [float] NOT NULL,
	[RsPerDay] [numeric](18, 3) NOT NULL,
	[LOPAmount] [float] NOT NULL,
	[PFAmount] [float] NOT NULL,
	[EPFAmount] [float] NOT NULL,
	[EPSAmount] [float] NOT NULL,
	[ESIAmount] [float] NOT NULL,
	[EmpESIAmount] [float] NOT NULL,
	[MDESIAmount] [float] NOT NULL,
	[TotalEarnings] [float] NOT NULL,
	[TotalDeductions] [float] NOT NULL,
	[NetAmount] [float] NOT NULL,
	[insurance] [float] NULL,
	[Advance] [float] NOT NULL,
	[Canteen] [float] NOT NULL,
	[Fine] [float] NOT NULL,
	[others] [float] NULL,
	[SalaryType] [varchar](50) NOT NULL,
	[SalaryDay] [float] NOT NULL,
	[Factor_ID] [float] NOT NULL,
	[PF] [float] NOT NULL,
	[EPF] [float] NOT NULL,
	[EPS] [float] NOT NULL,
	[ESI] [float] NOT NULL,
	[EmpESI] [float] NOT NULL,
	[MDESI] [float] NOT NULL,
	[MaxPFSalary] [float] NOT NULL,
	[MaxESISalary] [float] NOT NULL,
	[MinESISalary] [float] NOT NULL,
	[DedRound] [float] NOT NULL,
	[EarnRound] [float] NOT NULL,
	[AttnEarnRound] [float] NOT NULL,
	[EarnDay] [float] NOT NULL,
	[GrossAmount] [float] NOT NULL,
	[Grossround] [numeric](18, 3) NOT NULL,
	[SalaryDay1] [float] NOT NULL,
	[Weekoff_Day] [varchar](50) NULL,
	[No_Of_Woff] [float] NULL,
	[DaysInMonth] [float] NULL,
	[OT_Hours] [float] NULL,
	[OT_SALARY] [float] NULL,
	[Nightshft_ALW] [float] NULL,
	[Monthly_inc] [float] NULL,
	[Holiday_wages] [float] NULL,
	[Tot_Ded] [numeric](18, 2) NULL,
	[Net_Salary] [numeric](18, 2) NULL,
	[IS_Closed] [float] NULL,
	[Created_By] [varchar](15) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](15) NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_SalStoreTable] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	[Location_Code] ASC,
	[Empcode] ASC,
	[EmpID] ASC,
	[CatCode] ASC,
	[SDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[SalStoreTable] ADD  CONSTRAINT [DF__SalStoreT__HRAAm__4CF5691D]  DEFAULT ((0)) FOR [HRAAmount1]
GO

ALTER TABLE [dbo].[SalStoreTable] ADD  CONSTRAINT [DF__SalStoreT__Salar__26CFC035]  DEFAULT ('-') FOR [SalaryType]
GO

ALTER TABLE [dbo].[SalStoreTable] ADD  CONSTRAINT [DF_SalStoreTable_SalaryDay]  DEFAULT ((0)) FOR [SalaryDay]
GO

ALTER TABLE [dbo].[SalStoreTable] ADD  CONSTRAINT [DF_SalStoreTable_SalaryDay11]  DEFAULT ((0)) FOR [Factor_ID]
GO

ALTER TABLE [dbo].[SalStoreTable] ADD  CONSTRAINT [DF__SalStoreT__MaxPF__4A18FC72]  DEFAULT ((0)) FOR [MaxPFSalary]
GO

ALTER TABLE [dbo].[SalStoreTable] ADD  CONSTRAINT [DF__SalStoreT__MaxES__4B0D20AB]  DEFAULT ((0)) FOR [MaxESISalary]
GO

ALTER TABLE [dbo].[SalStoreTable] ADD  CONSTRAINT [DF__SalStoreT__MinES__4C0144E4]  DEFAULT ((0)) FOR [MinESISalary]
GO

ALTER TABLE [dbo].[SalStoreTable] ADD  CONSTRAINT [DF__SalStoreT__DedRo__5B438874]  DEFAULT ((0)) FOR [DedRound]
GO

ALTER TABLE [dbo].[SalStoreTable] ADD  CONSTRAINT [DF__SalStoreT__EarnR__5A4F643B]  DEFAULT ((0)) FOR [EarnRound]
GO

ALTER TABLE [dbo].[SalStoreTable] ADD  CONSTRAINT [DF__SalStoreT__AttnE__5C37ACAD]  DEFAULT ((0)) FOR [AttnEarnRound]
GO

ALTER TABLE [dbo].[SalStoreTable] ADD  CONSTRAINT [DF__SalStoreT__EarnD__335592AB]  DEFAULT ((0)) FOR [EarnDay]
GO

ALTER TABLE [dbo].[SalStoreTable] ADD  CONSTRAINT [DF__SalStoreT__Gross__3449B6E4]  DEFAULT ((0)) FOR [GrossAmount]
GO

ALTER TABLE [dbo].[SalStoreTable] ADD  CONSTRAINT [DF__SalStoreT__Gross__353DDB1D]  DEFAULT ((0)) FOR [Grossround]
GO

ALTER TABLE [dbo].[SalStoreTable] ADD  CONSTRAINT [DF__SalStoreT__Salar__688874F9]  DEFAULT ((0)) FOR [SalaryDay1]
GO


