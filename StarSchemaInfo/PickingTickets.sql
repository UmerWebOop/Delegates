CREATE TABLE [dbo].[PickingTickets](
	[PickingTicketNo] [int] NOT NULL,
	[CustomerID] [varchar](11) NULL,
	[SalesOrderNo] [int] NOT NULL,
	[SalesType] [varchar](3) NOT NULL,
	[WarehouseID] [varchar](3) NOT NULL,
	[ShipToAddress] [varchar](6) NULL,
	[DropShipAddress] [bit] NOT NULL CONSTRAINT [DF_PackingTickets_DropShipAddress]  DEFAULT (0),
	[ShipVia] [varchar](6) NOT NULL,
	[Status] [char](1) NOT NULL,
	[ShippingPriority] [tinyint] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DatePrinted] [datetime] NULL,
	[DateCollected] [datetime] NULL,
	[SpecialInstructions] [varchar](1000) NULL,
	[ADDUser] [smallint] NOT NULL,
	[ADDDate] [datetime] NOT NULL,
	[ShipToWHS] [varchar](3) NULL,
	[CustomerPO] [varchar](250) NULL,
	[PeriodID] [varchar](4) NULL,
	[MODUser] [smallint] NULL,
	[MODDate] [datetime] NULL,
	[Residential] [varchar](1) NULL,
	[FreightPrepaid] [varchar](1) NULL,
	[NEWPOSNo] [int] NULL,
	[Signature_Required_forDelivery] [char](1) NULL,
	[ScanBatch] [bit] NULL,
	[ScanBatchValue] [int] NULL,
	[OffIns] [varchar](250) NULL,
	[Inspected] [varchar](1) NULL,
	[InspectedUser] [int] NULL,
	[InspectedDate] [datetime] NULL,
	[InspectedMODUser] [int] NULL,
	[InspectedMODDate] [datetime] NULL,
 CONSTRAINT [PK_PackingTickets] PRIMARY KEY NONCLUSTERED 
(
	[PickingTicketNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PickingTickets]  WITH NOCHECK ADD  CONSTRAINT [FK_PackingTickets_CustomerAddresses] FOREIGN KEY([CustomerID], [ShipToAddress])
REFERENCES [dbo].[CustomerAddresses] ([CustomerID], [AddressID])
GO

ALTER TABLE [dbo].[PickingTickets] CHECK CONSTRAINT [FK_PackingTickets_CustomerAddresses]
GO

ALTER TABLE [dbo].[PickingTickets]  WITH NOCHECK ADD  CONSTRAINT [FK_PackingTickets_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO

ALTER TABLE [dbo].[PickingTickets] CHECK CONSTRAINT [FK_PackingTickets_Customers]
GO

ALTER TABLE [dbo].[PickingTickets]  WITH NOCHECK ADD  CONSTRAINT [FK_PackingTickets_Warehouses] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO

ALTER TABLE [dbo].[PickingTickets] CHECK CONSTRAINT [FK_PackingTickets_Warehouses]
GO

ALTER TABLE [dbo].[PickingTickets]  WITH NOCHECK ADD  CONSTRAINT [FK_PickingTickets_SalesOrders] FOREIGN KEY([SalesOrderNo])
REFERENCES [dbo].[SalesOrders] ([SalesOrderNo])
GO

ALTER TABLE [dbo].[PickingTickets] CHECK CONSTRAINT [FK_PickingTickets_SalesOrders]
GO

ALTER TABLE [dbo].[PickingTickets]  WITH NOCHECK ADD  CONSTRAINT [FK_PickingTickets_ShipVia] FOREIGN KEY([ShipVia])
REFERENCES [dbo].[ShipVia] ([ShipViaID])
GO

ALTER TABLE [dbo].[PickingTickets] CHECK CONSTRAINT [FK_PickingTickets_ShipVia]
GO

ALTER TABLE [dbo].[PickingTickets]  WITH NOCHECK ADD  CONSTRAINT [FK_PickingTickets_Warehouses] FOREIGN KEY([ShipToWHS])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO

ALTER TABLE [dbo].[PickingTickets] CHECK CONSTRAINT [FK_PickingTickets_Warehouses]
GO


