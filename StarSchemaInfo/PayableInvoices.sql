CREATE TABLE [dbo].[PayableInvoices](
	[PayableInvoiceNo] [int] NOT NULL,
	[VendorID] [varchar](6) NOT NULL,
	[InvoiceType] [char](1) NOT NULL,
	[ControlAccount] [varchar](20) NOT NULL,
	[PaymentTerms] [tinyint] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[PaymentDiscDays] [int] NULL,
	[PaymentNetDays] [int] NULL,
	[PaymentDiscount] [real] NOT NULL,
	[PaymentPriority] [char](1) NOT NULL,
	[SalesDiscount] [real] NOT NULL CONSTRAINT [DF_PayableInvoices_SalesDiscount]  DEFAULT (0),
	[PurchaseReceiptNo] [int] NULL,
	[VendorInvoiceRef] [varchar](20) NOT NULL,
	[VendorInvoiceDate] [datetime] NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[DiscountDate] [datetime] NOT NULL,
	[TotalAmount] [money] NOT NULL CONSTRAINT [DF_PayableInv_TotalAmount1__10]  DEFAULT (0),
	[PaidAmount] [money] NOT NULL CONSTRAINT [DF_PayableInv_PaidAmount_2__10]  DEFAULT (0),
	[AmountForDiscount] [money] NOT NULL CONSTRAINT [DF_PayableInv_AmountForDiscoun]  DEFAULT (0),
	[DiscountAmount] [money] NOT NULL CONSTRAINT [DF_PayableInv_DiscountAmount_4]  DEFAULT (0),
	[DiscountAvailed] [money] NOT NULL CONSTRAINT [DF_PayableInv_DiscountAvailed_]  DEFAULT (0),
	[AdjustmentAmount] [money] NOT NULL CONSTRAINT [DF_PayableInv_AdjustmentAmount]  DEFAULT (0),
	[ApprovedAmount] [money] NOT NULL CONSTRAINT [DF_PayableInv_ApprovedAmount_7]  DEFAULT (0),
	[ApprovedDiscount] [money] NOT NULL CONSTRAINT [DF_PayableInv_ApprovedDiscount]  DEFAULT (0),
	[ApprovedAdjustment] [money] NOT NULL CONSTRAINT [DF_PayableInv_ApprovedAdjustme]  DEFAULT (0),
	[Remarks] [varchar](255) NULL,
	[PInvNo] [int] NULL,
	[ADDuser] [int] NOT NULL,
	[ADDdate] [datetime] NOT NULL,
	[APRuser] [int] NULL,
	[APRdate] [datetime] NULL,
	[PaymentAccount] [varchar](20) NULL,
	[MODUser] [int] NULL,
	[MODDate] [datetime] NULL,
	[PeriodID] [varchar](4) NULL,
	[CutOffDate] [datetime] NULL,
	[DayClosed] [char](1) NULL,
	[WarehouseID] [varchar](3) NULL,
	[Ref_ReceiptNo] [int] NULL,
	[ReceiveBin] [varchar](11) NULL,
	[OtherChargesAccount] [varchar](15) NULL,
	[FuturePayableInvoiceNo] [int] NULL,
	[IRType] [char](1) NULL,
 CONSTRAINT [PK_PayableInvoices_1__10] PRIMARY KEY CLUSTERED 
(
	[PayableInvoiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PayableInvoices]  WITH CHECK ADD  CONSTRAINT [FK_PayableInvoices_2__10] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendors] ([VendorID])
GO

ALTER TABLE [dbo].[PayableInvoices] CHECK CONSTRAINT [FK_PayableInvoices_2__10]
GO

ALTER TABLE [dbo].[PayableInvoices]  WITH CHECK ADD  CONSTRAINT [FK_PayableInvoices_ItemsReceipts] FOREIGN KEY([PurchaseReceiptNo])
REFERENCES [dbo].[ItemsReceipts] ([PurchaseReceiptNo])
GO

ALTER TABLE [dbo].[PayableInvoices] CHECK CONSTRAINT [FK_PayableInvoices_ItemsReceipts]
GO

ALTER TABLE [dbo].[PayableInvoices]  WITH CHECK ADD  CONSTRAINT [FK_PayableInvoices_PaymentAccounts] FOREIGN KEY([PaymentAccount])
REFERENCES [dbo].[PaymentAccounts] ([Account])
GO

ALTER TABLE [dbo].[PayableInvoices] CHECK CONSTRAINT [FK_PayableInvoices_PaymentAccounts]
GO

ALTER TABLE [dbo].[PayableInvoices]  WITH CHECK ADD  CONSTRAINT [FK_PayableInvoices_PaymentTerms] FOREIGN KEY([PaymentTerms])
REFERENCES [dbo].[PaymentTerms] ([PaymentTermNo])
GO

ALTER TABLE [dbo].[PayableInvoices] CHECK CONSTRAINT [FK_PayableInvoices_PaymentTerms]
GO


