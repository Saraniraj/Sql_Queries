
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
	[Week_off] [nvarchar](500) NOT NULL
) ON [PRIMARY]
GO