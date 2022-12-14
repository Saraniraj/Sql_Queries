USE [LS_HRD_B]
GO

/****** Object:  Table [dbo].[Temp_MusterAttendance]    Script Date: 13/12/2022 17:41:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Temp_MusterAttendance](
	[ShiftId] [float] NOT NULL,
	[SDate] [datetime] NOT NULL,
	[Empcode] [varchar](25) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[PunchStartFrom] [datetime] NOT NULL,
	[PunchStartTo] [datetime] NOT NULL,
	[PunchEndFrom] [datetime] NOT NULL,
	[PunchEndTo] [datetime] NOT NULL,
	[inRand] [float] NOT NULL,
	[OutRand] [float] NULL,
	[INTIME] [datetime] NOT NULL,
	[OUTTIME] [datetime] NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[DAYVALUE] [float] NOT NULL,
	[ETYPE] [nvarchar](500) NULL,
	[Week_off] [nvarchar](500) NOT NULL,
 CONSTRAINT [IX_Temp_MusterAttendancee] UNIQUE NONCLUSTERED 
(
	[SDate] ASC,
	[Empcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


