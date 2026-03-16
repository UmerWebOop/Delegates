
CREATE TABLE [dbo].[SalesInvoiceDetail](
	[SalesInvoiceNo] [int] NOT NULL,
	[Line_No] [int] NOT NULL,
	[RefInvoiceNo] [int] NULL,
	[RefInvoiceLineNo] [int] NULL,
	[OrderLine] [int] NOT NULL,
	[CustomerID] [varchar](11) NULL,
	[ItemID] [varchar](30) NOT NULL,
	[ItemType] [char](1) NOT NULL,
	[StockNo] [int] NULL,
	[SKU] [varchar](10) NULL,
	[UPC] [varchar](20) NULL,
	[CustomerItemCode] [varchar](30) NULL,
	[ItemDescription] [varchar](100) NULL,
	[MarkFor] [varchar](30) NULL,
	[OrderQty] [int] NOT NULL CONSTRAINT [DF_SalesInvoiceDetail_OrderQty]  DEFAULT (0),
	[OrderDate] [datetime] NULL,
	[InvoicedQty] [int] NOT NULL,
	[RMAQty] [int] NULL CONSTRAINT [DF_SalesInvoiceDetail_RMAQty]  DEFAULT (0),
	[InvoicedDate] [datetime] NOT NULL,
	[ShippedQty] [int] NOT NULL CONSTRAINT [DF_SalesInvoiceDetail_ShippedQty]  DEFAULT (0),
	[Cost] [money] NOT NULL,
	[PriceCategory] [tinyint] NULL,
	[Price] [money] NOT NULL,
	[Discount] [real] NOT NULL CONSTRAINT [DF_SalesInvoiceDetail_Discount]  DEFAULT (0),
	[ExtPrice] [money] NOT NULL,
	[Taxable] [bit] NOT NULL CONSTRAINT [DF_SalesInvoiceDetail_Taxable]  DEFAULT (0),
	[TaxRate] [real] NOT NULL,
	[TaxAmount] [money] NOT NULL,
	[TaxCode] [varchar](30) NULL,
	[TrackingNo] [varchar](35) NULL,
	[BaleNo] [varchar](10) NULL,
	[RevenueAccount] [varchar](20) NULL,
	[DiscountAccount] [varchar](20) NULL,
	[COGSAccount] [varchar](20) NULL,
	[SpecialPONo] [int] NULL,
	[WarehouseID] [varchar](3) NULL,
	[UserNo] [smallint] NULL,
	[SalesEvent] [varchar](6) NULL,
	[Category] [varchar](6) NULL,
	[Collection] [smallint] NULL,
	[Design] [int] NULL,
	[Color] [smallint] NULL,
	[Size] [varchar](6) NULL,
	[SalesType] [varchar](3) NULL,
	[ReturnQty] [smallint] NOT NULL CONSTRAINT [DF_SalesInvoiceDetail_ReturnQty]  DEFAULT (0),
	[LocationID] [varchar](11) NULL,
	[SQFT] [real] NOT NULL CONSTRAINT [DF_SalesInvoiceDetail_SQFT]  DEFAULT (0),
	[CUFT] [real] NOT NULL CONSTRAINT [DF_SalesInvoiceDetail_CUFT]  DEFAULT (0),
	[Weight] [real] NOT NULL CONSTRAINT [DF_SalesInvoiceDetail_Weight]  DEFAULT (0),
	[SQFTPrice] [money] NOT NULL CONSTRAINT [DF_SalesInvoiceDetail_SQFTPrice]  DEFAULT (0),
	[ReturnAmount] [money] NOT NULL CONSTRAINT [DF_SalesInvoiceDetail_ReturnAmount]  DEFAULT (0),
	[HomeCollection] [bit] NULL,
	[BDID] [char](3) NOT NULL,
	[NEWPOSNo] [int] NULL,
	[POS_LineNO] [int] NULL,
	[ReasonForEDIReturn] [varchar](2) NULL,
	[DeliveryNo] [int] NULL,
	[Delivery_LineNo] [int] NULL,
	[POSPurchaseReceiptNo] [int] NULL,
	[POSSalesOrderNo] [int] NULL,
	[SetItemID] [varchar](30) NULL,
	[SetOrderQty] [int] NULL,
	[SetPrice] [money] NULL,
	[MLine_No] [int] NULL,
	[MainItem] [char](1) NULL,
	[AlwaysBO] [char](1) NULL,
	[SetLine_No] [int] NULL,
	[Remarks] [varchar](30) NULL,
	[CRQty] [int] NULL,
	[ShippingCharges] [money] NULL,
	[OrgCost] [money] NULL,
	[LotNo] [varchar](15) NULL,
 CONSTRAINT [PK_SalesInvoiceDetail] PRIMARY KEY CLUSTERED 
(
	[SalesInvoiceNo] ASC,
	[Line_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[SalesInvoiceDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesInvoiceDetail_SalesType] FOREIGN KEY([SalesType], [BDID])
REFERENCES [dbo].[SalesType] ([SalesTypeID], [BDID])
GO

ALTER TABLE [dbo].[SalesInvoiceDetail] CHECK CONSTRAINT [FK_SalesInvoiceDetail_SalesType]
GO


