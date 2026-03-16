CREATE TABLE [dbo].[ICJournalDetail](
	[ICJTransNo] [int] NOT NULL,
	[GLAccount] [varchar](20) NOT NULL,
	[Line_No] [int] NOT NULL,
	[ItemType] [char](1) NOT NULL,
	[ItemID] [varchar](30) NOT NULL,
	[SKU] [varchar](10) NULL,
	[TransDocument] [char](3) NULL,
	[TransDocumentNo] [int] NULL,
	[UnitCost] [money] NOT NULL DEFAULT ((0)),
	[ChangedQty] [int] NOT NULL,
	[Amount] [money] NOT NULL DEFAULT ((0)),
	[WHSID] [varchar](3) NOT NULL,
	[LocationID] [varchar](11) NULL,
	[BDID] [char](3) NOT NULL,
	[OldWHSQty] [int] NOT NULL,
	[OldAvgCost] [money] NOT NULL DEFAULT ((0)),
	[OldValue] [money] NOT NULL DEFAULT ((0)),
	[NewWHSQty] [int] NOT NULL,
	[NewAvgCost] [money] NOT NULL DEFAULT ((0)),
	[NewValue] [money] NOT NULL DEFAULT ((0)),
	[Description] [varchar](200) NULL DEFAULT (NULL),
	[ADDUser] [int] NOT NULL,
	[ADDDate] [datetime] NOT NULL DEFAULT (getdate()),
	[LotNo] [varchar](15) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


