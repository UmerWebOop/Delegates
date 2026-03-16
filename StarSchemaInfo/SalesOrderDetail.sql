CREATE TABLE [dbo].[SalesOrderDetail](
	[SalesOrderNo] [int] NOT NULL,
	[Line_No] [int] NOT NULL,
	[CustomerID] [varchar](11) NULL,
	[BackOrder] [bit] NOT NULL CONSTRAINT [DF_SalesOrderDetail_BackOrder]  DEFAULT ((0)),
	[ItemID] [varchar](30) NOT NULL,
	[ItemType] [char](1) NOT NULL,
	[SKU] [varchar](50) NULL,
	[CustomerItemCode] [varchar](30) NULL,
	[ItemDescription] [varchar](100) NULL,
	[MarkFor] [varchar](35) NULL,
	[LocationID] [varchar](11) NULL,
	[WarehouseID] [varchar](3) NOT NULL,
	[OrderQty] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[RequiredDate] [datetime] NOT NULL,
	[Cost] [money] NOT NULL,
	[PriceCategory] [tinyint] NULL,
	[Price] [money] NOT NULL,
	[Discount] [real] NOT NULL CONSTRAINT [DF_SalesOrderDetail_Discount]  DEFAULT ((0)),
	[ExtPrice] [money] NOT NULL,
	[Taxable] [bit] NOT NULL CONSTRAINT [DF_SalesOrderDetail_Taxable]  DEFAULT ((0)),
	[TaxRate] [real] NOT NULL CONSTRAINT [DF_SalesOrderDetail_TaxRate]  DEFAULT ((0)),
	[TaxAmount] [money] NOT NULL CONSTRAINT [DF_SalesOrderDetail_TaxAmount]  DEFAULT ((0)),
	[TaxCode] [varchar](30) NULL,
	[ToShipQty] [int] NOT NULL CONSTRAINT [DF_SalesOrderDetail_ToShipQty]  DEFAULT ((0)),
	[PickingTicketQty] [int] NOT NULL CONSTRAINT [DF_SalesOrderDetail_PickingTickingQty]  DEFAULT ((0)),
	[ShippedQty] [int] NOT NULL CONSTRAINT [DF_SalesOrderDetail_ShippedQty]  DEFAULT ((0)),
	[ShippingDate] [datetime] NULL,
	[UserNo] [smallint] NULL,
	[DateChanged] [datetime] NULL,
	[LastOrderQty] [int] NOT NULL CONSTRAINT [DF_SalesOrderDetail_LastOrderQty]  DEFAULT ((0)),
	[RevenueAccount] [varchar](20) NULL,
	[DiscountAccount] [varchar](20) NULL,
	[COGSAccount] [varchar](20) NULL,
	[SpecialPONo] [int] NULL,
	[SalesEvent] [varchar](6) NULL,
	[VendorID] [varchar](6) NULL,
	[VPackingSlipNo] [int] NULL,
	[Category] [varchar](6) NULL,
	[Collection] [smallint] NULL,
	[Design] [int] NULL,
	[Color] [smallint] NULL,
	[Size] [varchar](6) NULL,
	[SalesType] [varchar](3) NULL,
	[SQFTPrice] [money] NULL CONSTRAINT [DF_SalesOrderDetail_SQFTPrice]  DEFAULT ((0)),
	[HomeCollection] [bit] NULL,
	[Field01] [varchar](250) NULL,
	[Field02] [varchar](250) NULL,
	[Field03] [varchar](250) NULL,
	[Field04] [varchar](250) NULL,
	[Field05] [varchar](250) NULL,
	[VendorItemCode] [varchar](50) NULL,
	[POS_LineNo] [int] NULL,
	[NewPOSNo] [int] NULL,
	[POSPurchaseReceiptNo] [int] NULL,
	[POSTransferNo] [int] NULL,
	[POSSalesOrderNo] [int] NULL,
	[ETA_Date] [datetime] NULL,
	[ETAStatus] [bit] NULL,
	[SuggestedETA] [varchar](512) NULL,
	[Weight] [float] NULL,
	[ETA_RequestID] [int] NULL,
	[Discontinued] [bit] NULL,
	[SetItemID] [varchar](30) NULL,
	[MainItem] [varchar](1) NULL,
	[SetOrderQty] [smallint] NULL,
	[SetPrice] [money] NULL,
	[MLine_No] [smallint] NULL,
	[StoreID] [varchar](6) NULL,
	[TypeDetail] [varchar](1) NULL,
	[AlwaysBO] [char](1) NULL,
	[EDICancellationCode] [varchar](100) NULL,
	[WorkSheetNo] [int] NULL,
	[WSLine_NO] [int] NULL,
	[ATSFromHO] [bit] NULL DEFAULT ((0)),
	[Brand] [nvarchar](800) NULL,
	[BrandApproved] [bit] NOT NULL DEFAULT ((0)),
	[QtyChangeReason] [nvarchar](250) NULL,
 CONSTRAINT [PK_SalesOrderDetail] PRIMARY KEY CLUSTERED 
(
	[SalesOrderNo] ASC,
	[Line_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[SalesOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderDetail_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO

ALTER TABLE [dbo].[SalesOrderDetail] CHECK CONSTRAINT [FK_SalesOrderDetail_Customers]
GO

ALTER TABLE [dbo].[SalesOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderDetail_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO

ALTER TABLE [dbo].[SalesOrderDetail] CHECK CONSTRAINT [FK_SalesOrderDetail_Items]
GO

ALTER TABLE [dbo].[SalesOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderDetail_PriceCategories] FOREIGN KEY([PriceCategory])
REFERENCES [dbo].[PriceCategories] ([CategoryNo])
GO

ALTER TABLE [dbo].[SalesOrderDetail] CHECK CONSTRAINT [FK_SalesOrderDetail_PriceCategories]
GO

ALTER TABLE [dbo].[SalesOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderDetail_SalesEvents] FOREIGN KEY([SalesEvent])
REFERENCES [dbo].[SalesEvents] ([SalesEventID])
GO

ALTER TABLE [dbo].[SalesOrderDetail] CHECK CONSTRAINT [FK_SalesOrderDetail_SalesEvents]
GO

ALTER TABLE [dbo].[SalesOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderDetail_SalesOrders] FOREIGN KEY([SalesOrderNo])
REFERENCES [dbo].[SalesOrders] ([SalesOrderNo])
GO

ALTER TABLE [dbo].[SalesOrderDetail] CHECK CONSTRAINT [FK_SalesOrderDetail_SalesOrders]
GO

ALTER TABLE [dbo].[SalesOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderDetail_Vendors] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendors] ([VendorID])
GO

ALTER TABLE [dbo].[SalesOrderDetail] CHECK CONSTRAINT [FK_SalesOrderDetail_Vendors]
GO

ALTER TABLE [dbo].[SalesOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderDetail_Warehouses] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO

ALTER TABLE [dbo].[SalesOrderDetail] CHECK CONSTRAINT [FK_SalesOrderDetail_Warehouses]
GO


