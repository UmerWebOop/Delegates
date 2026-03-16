CREATE TABLE [dbo].[PickingTicketDetail](
	[PickingTicketNo] [int] NOT NULL,
	[Line_No] [smallint] NOT NULL,
	[OrderLine] [smallint] NOT NULL,
	[ItemID] [varchar](30) NOT NULL,
	[ItemType] [char](1) NOT NULL,
	[StockNo] [int] NULL,
	[SKU] [varchar](10) NULL,
	[UPC] [varchar](20) NULL,
	[Location] [varchar](11) NOT NULL,
	[LocationType] [char](1) NULL,
	[PickingLocation] [varchar](11) NULL,
	[PickLocationType] [char](1) NULL,
	[BaleNo] [varchar](10) NULL,
	[TrackingNo] [varchar](35) NULL,
	[MODUser] [smallint] NULL,
	[MODDate] [datetime] NULL,
	[NEWPOSNo] [int] NULL,
	[POS_LineNO] [int] NULL,
	[PickupBatchNo] [int] NULL,
	[PickupUser] [smallint] NULL,
	[PickupDate] [datetime] NULL,
	[LabelPrintedDate] [datetime] NULL,
	[ShippingCharges] [money] NULL
) ON [PRIMARY]
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[PickingTicketDetail] ADD [UCC128] [varchar](20) NULL
ALTER TABLE [dbo].[PickingTicketDetail] ADD [ScanToTruckDate] [datetime] NULL
ALTER TABLE [dbo].[PickingTicketDetail] ADD [IDX] [int] NULL
SET ANSI_PADDING ON
ALTER TABLE [dbo].[PickingTicketDetail] ADD [PackingID] [varchar](30) NULL
ALTER TABLE [dbo].[PickingTicketDetail] ADD [SetItemID] [varchar](30) NULL
ALTER TABLE [dbo].[PickingTicketDetail] ADD [SetOrderQty] [int] NULL
ALTER TABLE [dbo].[PickingTicketDetail] ADD [SetPrice] [money] NULL
ALTER TABLE [dbo].[PickingTicketDetail] ADD [MLine_No] [int] NULL
ALTER TABLE [dbo].[PickingTicketDetail] ADD [MainItem] [char](1) NULL
ALTER TABLE [dbo].[PickingTicketDetail] ADD [AlwaysBO] [char](1) NULL
ALTER TABLE [dbo].[PickingTicketDetail] ADD [SetLine_No] [int] NULL
ALTER TABLE [dbo].[PickingTicketDetail] ADD [BoxLine_No] [int] NULL
ALTER TABLE [dbo].[PickingTicketDetail] ADD [LotNo] [varchar](15) NULL
 CONSTRAINT [PK_PickingTicketDetail] PRIMARY KEY NONCLUSTERED 
(
	[PickingTicketNo] ASC,
	[Line_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PickingTicketDetail]  WITH CHECK ADD  CONSTRAINT [FK_PickingTicketDetail_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO

ALTER TABLE [dbo].[PickingTicketDetail] CHECK CONSTRAINT [FK_PickingTicketDetail_Items]
GO

ALTER TABLE [dbo].[PickingTicketDetail]  WITH CHECK ADD  CONSTRAINT [FK_PickingTicketDetail_Locations] FOREIGN KEY([Location])
REFERENCES [dbo].[Locations] ([LocationID])
GO

ALTER TABLE [dbo].[PickingTicketDetail] CHECK CONSTRAINT [FK_PickingTicketDetail_Locations]
GO

ALTER TABLE [dbo].[PickingTicketDetail]  WITH CHECK ADD  CONSTRAINT [FK_PickingTicketDetail_Locations1] FOREIGN KEY([PickingLocation])
REFERENCES [dbo].[Locations] ([LocationID])
GO

ALTER TABLE [dbo].[PickingTicketDetail] CHECK CONSTRAINT [FK_PickingTicketDetail_Locations1]
GO

ALTER TABLE [dbo].[PickingTicketDetail]  WITH CHECK ADD  CONSTRAINT [FK_PickingTicketDetail_PackingTickets] FOREIGN KEY([PickingTicketNo])
REFERENCES [dbo].[PickingTickets] ([PickingTicketNo])
GO

ALTER TABLE [dbo].[PickingTicketDetail] CHECK CONSTRAINT [FK_PickingTicketDetail_PackingTickets]
GO

ALTER TABLE [dbo].[PickingTicketDetail]  WITH CHECK ADD  CONSTRAINT [FK_PickingTicketDetail_RugsOAK] FOREIGN KEY([SKU])
REFERENCES [dbo].[RugsOAK] ([SKU])
GO

ALTER TABLE [dbo].[PickingTicketDetail] CHECK CONSTRAINT [FK_PickingTicketDetail_RugsOAK]
GO


