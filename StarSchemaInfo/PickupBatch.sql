CREATE TABLE [dbo].[PickupBatch](
	[PickupBatchNo] [int] NOT NULL,
	[PickupUser] [smallint] NULL,
	[TotalQtyToPick] [int] NULL,
	[TotalPickedQty] [int] NULL,
	[LastActivityDate] [datetime] NULL,
	[WHSID] [varchar](3) NULL,
	[Message] [varchar](max) NULL,
	[AddDate] [datetime] NULL,
	[Weight] [decimal](14, 2) NULL,
 CONSTRAINT [PK_PickupBatch_1] PRIMARY KEY CLUSTERED 
(
	[PickupBatchNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


