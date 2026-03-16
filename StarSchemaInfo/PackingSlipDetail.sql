CREATE TABLE [dbo].[PackingSlipDetail](
	[PackingSlipNo] [int] NOT NULL,
	[Line_No] [smallint] NOT NULL,
	[OrderLine] [smallint] NOT NULL,
	[ItemID] [varchar](30) NOT NULL,
	[ItemType] [char](1) NOT NULL,
	[StockNo] [int] NULL,
	[SKU] [varchar](10) NULL,
	[UPC] [varchar](20) NULL,
	[CustomerItemCode] [varchar](30) NULL,
	[ItemDescription] [varchar](100) NULL,
	[MarkFor] [varchar](35) NULL,
	[Quantity] [smallint] NOT NULL,
	[Cost] [money] NOT NULL,
	[PriceCategory] [tinyint] NOT NULL,
	[Price] [money] NOT NULL,
	[Discount] [real] NOT NULL,
	[ExtPrice] [money] NOT NULL,
	[Taxable] [bit] NOT NULL CONSTRAINT [DF_PackingSlipDetail_Taxable]  DEFAULT ((0)),
	[TaxRate] [real] NOT NULL CONSTRAINT [DF_PackingSlipDetail_TaxRate]  DEFAULT ((0)),
	[TaxAmount] [money] NOT NULL,
	[TaxCode] [varchar](30) NULL,
	[TrackingNo] [varchar](35) NULL,
	[BaleNo] [varchar](10) NULL,
	[RevenueAccount] [varchar](20) NULL,
	[DiscountAccount] [varchar](20) NULL,
	[COGSAccount] [varchar](20) NULL,
	[UCC128] [varchar](20) NULL,
	[ShippedDate] [datetime] NULL,
	[SQFTPrice] [money] NOT NULL CONSTRAINT [DF_PackingSlipDetail_SQFTPrice]  DEFAULT ((0)),
	[NEWPOSNo] [int] NULL,
	[POS_LineNO] [int] NULL,
	[Confirmed_Status] [char](1) NULL,
	[GTIN] [varchar](14) NULL,
	[SetItemID] [varchar](30) NULL,
	[SetOrderQty] [int] NULL,
	[SetPrice] [money] NULL,
	[MLine_No] [int] NULL,
	[MainItem] [char](1) NULL,
	[AlwaysBO] [char](1) NULL,
	[SetLine_No] [int] NULL,
	[BoxLine_No] [int] NULL,
	[ShipmentOutTime] [datetime] NULL,
	[OrgCost] [money] NULL,
	[LotNo] [varchar](15) NULL,
 CONSTRAINT [PK_PackingSlipDetail] PRIMARY KEY CLUSTERED 
(
	[PackingSlipNo] ASC,
	[Line_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SPARS]
) ON [SPARS]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PackingSlipDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackingSlipDetail_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO

ALTER TABLE [dbo].[PackingSlipDetail] CHECK CONSTRAINT [FK_PackingSlipDetail_Items]
GO

ALTER TABLE [dbo].[PackingSlipDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackingSlipDetail_PriceCategories] FOREIGN KEY([PriceCategory])
REFERENCES [dbo].[PriceCategories] ([CategoryNo])
GO

ALTER TABLE [dbo].[PackingSlipDetail] CHECK CONSTRAINT [FK_PackingSlipDetail_PriceCategories]
GO

ALTER TABLE [dbo].[PackingSlipDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackingSlipDetail_RugsOAK1] FOREIGN KEY([SKU])
REFERENCES [dbo].[RugsOAK] ([SKU])
GO

ALTER TABLE [dbo].[PackingSlipDetail] CHECK CONSTRAINT [FK_PackingSlipDetail_RugsOAK1]
GO


