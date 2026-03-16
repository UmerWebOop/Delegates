CREATE TABLE [dbo].[ItemSets](
	[SetItemID] [varchar](30) NOT NULL,
	[ItemID] [varchar](30) NOT NULL,
	[Description] [varchar](100) NULL,
	[Qty] [int] NOT NULL,
	[AddUser] [smallint] NOT NULL,
	[AddDate] [datetime] NOT NULL,
	[ModUser] [smallint] NULL,
	[ModDate] [datetime] NULL,
	[MainItem] [varchar](1) NULL,
	[AlwaysBO] [varchar](1) NULL,
	[Line_No] [int] NULL,
	[BaleNo] [int] NULL,
	[BoxQty] [int] NULL,
	[AutoScanContent] [varchar](30) NULL,
 CONSTRAINT [PK_ItemSets] PRIMARY KEY CLUSTERED 
(
	[SetItemID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


