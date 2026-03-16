CREATE TABLE [dbo].[PickupBatchDetail](
	[PickupBatchNo] [int] NOT NULL,
	[PickingTicketNo] [int] NOT NULL,
	[CustomerID] [varchar](11) NULL,
	[CustomerName] [varchar](40) NULL,
	[CustomerPO] [varchar](250) NULL,
	[ShipComplete] [varchar](1) NULL,
	[TotalQtyToPick] [int] NULL,
	[TotalPickedQty] [int] NULL,
	[TotalBales] [smallint] NULL,
	[LabelsPrinted] [smallint] NULL,
	[ScannedToTruck] [smallint] NULL,
	[LastActivityDate] [datetime] NULL,
	[LastActivityStatus] [varchar](200) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PickupBatchDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_PickupBatchDetail_PickupBatch] FOREIGN KEY([PickupBatchNo])
REFERENCES [dbo].[PickupBatch] ([PickupBatchNo])
GO

ALTER TABLE [dbo].[PickupBatchDetail] CHECK CONSTRAINT [FK_PickupBatchDetail_PickupBatch]
GO


