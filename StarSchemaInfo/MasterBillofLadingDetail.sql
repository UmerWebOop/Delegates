CREATE TABLE [dbo].[MasterBillofLadingDetail](
	[MasterBillofLadingNo] [int] NOT NULL,
	[Line_No] [int] NOT NULL,
	[BillofLadingNo] [int] NOT NULL,
	[AdditionalInfo] [varchar](max) NULL,
	[QTY] [int] NOT NULL,
	[Weight] [float] NULL,
	[CommodityDescription] [varchar](255) NULL,
	[NMFCNo] [varchar](10) NULL,
	[ClassDescription] [varchar](10) NULL,
 CONSTRAINT [PK_MasterBillofLadingDetail] PRIMARY KEY CLUSTERED 
(
	[MasterBillofLadingNo] ASC,
	[Line_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


