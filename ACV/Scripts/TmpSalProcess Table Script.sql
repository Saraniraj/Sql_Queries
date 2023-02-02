USE [PowerERP_ACV]
GO

/****** Object:  Table [dbo].[TmpSalProcess]    Script Date: 02-Feb-2023 10:47:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TmpSalProcess](
	[Comp_Code] [nvarchar](50) NULL,
	[Location_Code] [nvarchar](50) NULL,
	[Empcode] [varchar](50) NOT NULL,
	[EmpID] [bigint] NOT NULL,
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
	[NHFH_Present] [float] NULL,  ----- New Columns Added
	[LOP] [float] NOT NULL,
	[CL] [float] NULL,
	[TotalDays] [float] NOT NULL,
	[Paid_Days] [float] NULL,
	[PaidDays] [float] NOT NULL,
	[Basic] [float] NOT NULL,
	[AttnEarning] [float] NOT NULL,
	[HRAAmount1] [float] NOT NULL,
	[HRAAmount] [float] NOT NULL,
	[PFSource] [float] NOT NULL,
	[ESISource] [float] NOT NULL,
	[LeaveSalary] [float] NOT NULL,
	[RsPerDay] [float] NOT NULL,
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
	[Canteen] [float] NOT NULL,
	[BankLoan] [float] NOT NULL,
	[Advance] [float] NOT NULL,
	[SalaryType] [varchar](50) NOT NULL,
	[SalaryDay] [float] NOT NULL,
	[Factor_ID] [float] NULL,
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
	[GrossRound] [float] NOT NULL,
	[SalaryDay1] [float] NOT NULL,
	[Weekoff_Day] [nvarchar](50) NULL,
	[No_Of_Woff] [float] NULL,
	[DaysInMonth] [float] NULL,
	[OT_Hours] [float] NULL,
	[OT_SALARY] [float] NULL,
	[Nightshft_ALW] [float] NULL,
	[Monthly_inc] [float] NULL,
	[Holiday_wages] [float] NULL,
	[Petrol_alow] [float] NULL,
	[Tot_Ded] [numeric](18, 2) NULL,
	[Net_Salary] [numeric](18, 2) NULL,
	[By_Bank] [numeric](18, 0) NULL,
	[By_Cash] [numeric](18, 0) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[TmpSalProcess] ADD  CONSTRAINT [DF__TmpSalPro__HRAAm__0CFADF99]  DEFAULT ((0)) FOR [HRAAmount1]
GO

ALTER TABLE [dbo].[TmpSalProcess] ADD  CONSTRAINT [DF__TmpSalPro__DedRo__1A54DAB7]  DEFAULT ((0)) FOR [DedRound]
GO

ALTER TABLE [dbo].[TmpSalProcess] ADD  CONSTRAINT [DF__TmpSalPro__EarnR__1B48FEF0]  DEFAULT ((0)) FOR [EarnRound]
GO

ALTER TABLE [dbo].[TmpSalProcess] ADD  CONSTRAINT [DF__TmpSalPro__AttnE__1C3D2329]  DEFAULT ((0)) FOR [AttnEarnRound]
GO

ALTER TABLE [dbo].[TmpSalProcess] ADD  CONSTRAINT [DF__TmpSalPro__EarnD__2101D846]  DEFAULT ((0)) FOR [EarnDay]
GO

ALTER TABLE [dbo].[TmpSalProcess] ADD  CONSTRAINT [DF__TmpSalPro__Gross__21F5FC7F]  DEFAULT ((0)) FOR [GrossAmount]
GO

ALTER TABLE [dbo].[TmpSalProcess] ADD  CONSTRAINT [DF__TmpSalPro__Gross__22EA20B8]  DEFAULT ((0)) FOR [GrossRound]
GO

ALTER TABLE [dbo].[TmpSalProcess] ADD  CONSTRAINT [DF__TmpSalPro__Salar__679450C0]  DEFAULT ((0)) FOR [SalaryDay1]
GO


