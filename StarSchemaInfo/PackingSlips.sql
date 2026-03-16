
CREATE TABLE [dbo].[PackingSlips](
	[PackingSlipNo] [int] NOT NULL,
	[PickingTicketNo] [int] NULL,
	[CustomerID] [varchar](11) NULL,
	[SalesOrderNo] [int] NOT NULL,
	[SaleType] [varchar](3) NOT NULL,
	[WarehouseID] [varchar](3) NOT NULL,
	[ShipToAddress] [varchar](6) NULL,
	[DropShipAddress] [bit] NOT NULL,
	[ShipVia] [varchar](6) NOT NULL,
	[Status] [char](1) NOT NULL,
	[TotalQty] [smallint] NOT NULL,
	[TotalBales] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DatePrinted] [datetime] NULL,
	[SalesInvoiceNo] [int] NULL,
	[ADDUser] [smallint] NOT NULL,
	[ADDDate] [datetime] NOT NULL,
	[ShipToWHS] [varchar](3) NULL,
	[BillOfLadingNo] [int] NULL,
	[ManifestNo] [int] NULL,
	[HandlingCharges] [money] NOT NULL CONSTRAINT [DF_PackingSlips_HandlingCharges]  DEFAULT ((0)),
	[ShippingCharges] [money] NOT NULL CONSTRAINT [DF_PackingSlips_ShippingCharges]  DEFAULT ((0)),
	[ScacCode] [varchar](4) NULL,
	[FreightInvoiceNo] [int] NULL,
	[TotalSQFT] [real] NOT NULL CONSTRAINT [DF_PackingSlips_TotalSQFT]  DEFAULT ((0)),
	[TotalCUFT] [real] NOT NULL CONSTRAINT [DF_PackingSlips_TotalCUFT]  DEFAULT ((0)),
	[TotalWeight] [real] NOT NULL CONSTRAINT [DF_PackingSlips_TotalWeight]  DEFAULT ((0)),
	[CustomerPO] [varchar](250) NULL,
	[MODUser] [smallint] NULL,
	[MODDate] [datetime] NULL,
	[PeriodID] [varchar](4) NULL,
	[RRCN] [varchar](25) NULL,
	[PUAN] [varchar](16) NULL,
	[RID] [varchar](4) NULL,
	[LoadID] [varchar](100) NULL,
	[Residential] [varchar](1) NULL,
	[FreightPrepaid] [varchar](1) NULL,
	[NEWPOSNo] [int] NULL,
	[Signature_Required_forDelivery] [char](1) NULL,
	[Order_ShipToAddress] [varchar](6) NULL,
	[OrderingStore] [varchar](6) NULL,
	[PKTNo] [int] NULL,
	[ScanBatch] [bit] NULL,
	[Exported_855] [bit] NULL CONSTRAINT [DF__PackingSl__Expor__6EB1CB31]  DEFAULT ((0)),
	[Exported_855UserNo] [int] NULL,
	[Exported_855Date] [datetime] NULL,
	[ScanBatchValue] [int] NULL,
	[SpecialInstructions] [varchar](250) NULL,
	[OffIns] [varchar](250) NULL,
	[ShipViaRemarks] [varchar](250) NULL,
	[ASNAfterTrailerClosed] [bit] NULL,
	[IncludeDeclareValue] [varchar](1) NULL
) ON [SPARS]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PackingSlips]  WITH CHECK ADD  CONSTRAINT [FK_PackingSlips_CustomerAddresses] FOREIGN KEY([CustomerID], [ShipToAddress])
REFERENCES [dbo].[CustomerAddresses] ([CustomerID], [AddressID])
GO

ALTER TABLE [dbo].[PackingSlips] CHECK CONSTRAINT [FK_PackingSlips_CustomerAddresses]
GO

ALTER TABLE [dbo].[PackingSlips]  WITH CHECK ADD  CONSTRAINT [FK_PackingSlips_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO

ALTER TABLE [dbo].[PackingSlips] CHECK CONSTRAINT [FK_PackingSlips_Customers]
GO

ALTER TABLE [dbo].[PackingSlips]  WITH CHECK ADD  CONSTRAINT [FK_PackingSlips_PickingTickets] FOREIGN KEY([PickingTicketNo])
REFERENCES [dbo].[PickingTickets] ([PickingTicketNo])
GO

ALTER TABLE [dbo].[PackingSlips] CHECK CONSTRAINT [FK_PackingSlips_PickingTickets]
GO

ALTER TABLE [dbo].[PackingSlips]  WITH CHECK ADD  CONSTRAINT [FK_PackingSlips_SalesInvoice] FOREIGN KEY([SalesInvoiceNo])
REFERENCES [dbo].[SalesInvoice] ([SalesInvoiceNo])
GO

ALTER TABLE [dbo].[PackingSlips] CHECK CONSTRAINT [FK_PackingSlips_SalesInvoice]
GO

ALTER TABLE [dbo].[PackingSlips]  WITH NOCHECK ADD  CONSTRAINT [FK_PackingSlips_SalesOrders] FOREIGN KEY([SalesOrderNo])
REFERENCES [dbo].[SalesOrders] ([SalesOrderNo])
GO

ALTER TABLE [dbo].[PackingSlips] CHECK CONSTRAINT [FK_PackingSlips_SalesOrders]
GO

ALTER TABLE [dbo].[PackingSlips]  WITH CHECK ADD  CONSTRAINT [FK_PackingSlips_ShipVia] FOREIGN KEY([ShipVia])
REFERENCES [dbo].[ShipVia] ([ShipViaID])
GO

ALTER TABLE [dbo].[PackingSlips] CHECK CONSTRAINT [FK_PackingSlips_ShipVia]
GO

ALTER TABLE [dbo].[PackingSlips]  WITH CHECK ADD  CONSTRAINT [FK_PackingSlips_Warehouses] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO

ALTER TABLE [dbo].[PackingSlips] CHECK CONSTRAINT [FK_PackingSlips_Warehouses]
GO

ALTER TABLE [dbo].[PackingSlips]  WITH CHECK ADD  CONSTRAINT [FK_PackingSlips_Warehouses1] FOREIGN KEY([ShipToWHS])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO

ALTER TABLE [dbo].[PackingSlips] CHECK CONSTRAINT [FK_PackingSlips_Warehouses1]
GO

ALTER TABLE [dbo].[PackingSlips]  WITH CHECK ADD  CONSTRAINT [FK_PackingSlips_Warehouses2] FOREIGN KEY([ShipToWHS])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO

ALTER TABLE [dbo].[PackingSlips] CHECK CONSTRAINT [FK_PackingSlips_Warehouses2]
GO


