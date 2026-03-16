CREATE TABLE [dbo].[BillofLading](
	[BillofLadingNo] [int] NOT NULL,
	[CustomerID] [varchar](11) NULL,
	[ShipToAddress] [varchar](50) NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](35) NULL,
	[City] [varchar](35) NULL,
	[State] [varchar](10) NULL,
	[Zip] [varchar](10) NULL,
	[Country] [varchar](15) NULL,
	[TotalWeight] [real] NULL,
	[TotalSQFT] [real] NULL,
	[TotalCUFT] [real] NULL,
	[Route] [varchar](100) NULL,
	[VehicleNo] [varchar](20) NULL,
	[Carrier] [varchar](50) NULL,
	[PickUpDate] [datetime] NULL,
	[CarrierProNo] [varchar](35) NULL,
	[TotalAmount] [money] NULL,
	[CODAmount] [money] NULL,
	[Freight] [money] NULL,
	[FreightPrepaid] [bit] NOT NULL,
	[CODCharges] [money] NULL,
	[CODChargesPrepaid] [bit] NOT NULL,
	[Warehouse] [varchar](3) NULL,
	[ScacCode] [varchar](4) NULL,
	[NotifyToName] [varchar](50) NULL,
	[NotifyFaxNo] [varchar](50) NULL,
	[NotifyTelNo] [varchar](50) NULL,
	[FBTName] [varchar](50) NULL,
	[FBTStreet] [varchar](50) NULL,
	[FBTCity] [varchar](50) NULL,
	[FBTState] [varchar](50) NULL,
	[FBTZip] [varchar](50) NULL,
	[ShipperPer] [varchar](50) NULL,
	[CarrierPer] [varchar](50) NULL,
	[SDate] [varchar](50) NULL,
	[CorrectWeightLbs] [real] NULL,
	[AdditionalInfo] [varchar](255) NULL,
	[ShipToWarehouse] [varchar](3) NULL,
	[TotalCharges] [money] NULL,
	[Rate] [real] NULL,
	[ShipVia] [varchar](6) NULL,
	[ADDUser] [smallint] NULL,
	[ADDDate] [datetime] NULL,
	[MODUser] [smallint] NULL,
	[MODDate] [datetime] NULL,
	[Phone] [varchar](20) NULL,
	[Blank] [bit] NULL,
	[Status] [char](1) NULL,
	[StdBillOfLadingNo] [varchar](20) NOT NULL DEFAULT (''),
	[MultiplePages] [varchar](1) NOT NULL DEFAULT ('N'),
	[Freight_Format] [char](1) NOT NULL DEFAULT (''),
	[Packages] [char](1) NOT NULL DEFAULT ('R'),
	[Pallet_Slip] [char](1) NOT NULL DEFAULT ('S'),
	[NMFCNo] [varchar](10) NOT NULL DEFAULT (''),
	[Class] [varchar](10) NOT NULL DEFAULT (''),
	[TrailerLoaded] [char](1) NOT NULL DEFAULT (''),
	[FreightCounted] [char](1) NOT NULL DEFAULT ('P'),
	[PalletQty] [int] NOT NULL DEFAULT (0),
	[TotalWeight_User] [real] NULL,
	[TotalPackages_User] [int] NULL,
	[LooseFreight] [varchar](1) NULL,
	[AllowMultipleShipTo] [bit] NULL,
	[CIDNo] [varchar](30) NULL,
	[ASNPrinted] [bit] NULL,
	[AddressType] [varchar](20) NULL,
	[LoadID] [varchar](100) NULL,
	[SealNo] [varchar](30) NULL,
	[DeliveryDate] [datetime] NULL,
	[CommodityDescription] [varchar](255) NULL,
	[PackagesQty] [int] NULL,
	[FBTStreet2] [varchar](50) NULL,
	[RoutingNo] [varchar](30) NULL,
 CONSTRAINT [PK_B/L] PRIMARY KEY NONCLUSTERED 
(
	[BillofLadingNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[BillofLading]  WITH CHECK ADD  CONSTRAINT [FK_BillofLading_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO

ALTER TABLE [dbo].[BillofLading] CHECK CONSTRAINT [FK_BillofLading_Customers]
GO

ALTER TABLE [dbo].[BillofLading]  WITH CHECK ADD  CONSTRAINT [FK_BillofLading_ShipVia] FOREIGN KEY([ShipVia])
REFERENCES [dbo].[ShipVia] ([ShipViaID])
GO

ALTER TABLE [dbo].[BillofLading] CHECK CONSTRAINT [FK_BillofLading_ShipVia]
GO

ALTER TABLE [dbo].[BillofLading]  WITH CHECK ADD  CONSTRAINT [FK_BillofLading_Warehouses] FOREIGN KEY([Warehouse])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO

ALTER TABLE [dbo].[BillofLading] CHECK CONSTRAINT [FK_BillofLading_Warehouses]
GO


