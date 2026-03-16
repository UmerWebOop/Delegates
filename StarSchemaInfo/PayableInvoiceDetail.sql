CREATE TABLE [dbo].[PayableInvoiceDetail](
	[PayableInvoiceNo] [int] NOT NULL,
	[Line_No] [smallint] NOT NULL,
	[BaleNumber] [varchar](30) NOT NULL,
	[ItemID] [varchar](30) NOT NULL,
	[Description] [varchar](100) NULL,
	[ItemType] [char](1) NOT NULL,
	[StockNo] [int] NULL,
	[VendorStyle] [varchar](30) NULL,
	[OrderQty] [int] NULL CONSTRAINT [DF_PayableInvoiceDetail_OrderQty]  DEFAULT ((0)),
	[ReceivedQty] [int] NULL,
	[ReturnQty] [int] NULL CONSTRAINT [DF_PayableInvoiceDetail_Quantity]  DEFAULT ((0)),
	[Cost] [money] NOT NULL,
	[Discount] [real] NOT NULL CONSTRAINT [DF_PayableInvoiceDetail_Discount]  DEFAULT (0),
	[ExtCost] [money] NOT NULL,
	[TaxRate] [real] NOT NULL CONSTRAINT [DF_PayableInvoiceDetail_TaxRate]  DEFAULT (0),
	[ExtTax] [money] NOT NULL,
	[ItemAccount] [varchar](20) NOT NULL,
	[Taxable] [bit] NOT NULL CONSTRAINT [DF_PayableInvoiceDetail_Taxable]  DEFAULT (0),
	[ReceiptNo] [int] NULL,
	[ReceiptLine] [smallint] NULL,
	[Category] [varchar](6) NULL,
	[Collection] [smallint] NULL,
	[Design] [int] NULL,
	[Color] [smallint] NULL,
	[Size] [varchar](6) NULL,
	[SKU] [varchar](10) NULL,
	[PONo] [int] NULL,
	[POLineNo] [smallint] NULL,
	[POQty] [smallint] NULL,
	[VInvoiceRef] [varchar](20) NULL,
	[ReceiveBin] [varchar](11) NULL,
	[LotNo] [varchar](15) NULL,
 CONSTRAINT [PK_PayableInvoiceDetail] PRIMARY KEY NONCLUSTERED 
(
	[PayableInvoiceNo] ASC,
	[Line_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PayableInvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_PayableInvoiceDetail_ItemReceiptDetail] FOREIGN KEY([ReceiptNo], [ReceiptLine])
REFERENCES [dbo].[ItemReceiptDetail] ([PurchaseReceiptNo], [Line_No])
GO

ALTER TABLE [dbo].[PayableInvoiceDetail] CHECK CONSTRAINT [FK_PayableInvoiceDetail_ItemReceiptDetail]
GO

ALTER TABLE [dbo].[PayableInvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_PayableInvoiceDetail_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO

ALTER TABLE [dbo].[PayableInvoiceDetail] CHECK CONSTRAINT [FK_PayableInvoiceDetail_Items]
GO

ALTER TABLE [dbo].[PayableInvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_PayableInvoiceDetail_PayableInvoices] FOREIGN KEY([PayableInvoiceNo])
REFERENCES [dbo].[PayableInvoices] ([PayableInvoiceNo])
GO

ALTER TABLE [dbo].[PayableInvoiceDetail] CHECK CONSTRAINT [FK_PayableInvoiceDetail_PayableInvoices]
GO

ALTER TABLE [dbo].[PayableInvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_PayableInvoiceDetail_RugsOAK] FOREIGN KEY([SKU])
REFERENCES [dbo].[RugsOAK] ([SKU])
GO

ALTER TABLE [dbo].[PayableInvoiceDetail] CHECK CONSTRAINT [FK_PayableInvoiceDetail_RugsOAK]
GO


