USE SN_HRD
GO

/****** Object:  Table [dbo].[Bank_Master]    Script Date: 27/04/2023 10:48:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[LIB_BookClassification](
	[Comp_Code] [varchar](20) NOT NULL,
	[BOOK_CLASSF_ID] [bigint] NOT NULL,
	[Book_Classf_Type] [varchar](50) NOT NULL,
	  
		[IS_Active] [int] NULL,
	[Created_By] [varchar](15) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](15) NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_LIB_BookClassification] PRIMARY KEY CLUSTERED 
(
	[Comp_Code] ASC,
	 	[BOOK_CLASSF_ID] ASC,
	[Book_Classf_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
 
 

  
 

