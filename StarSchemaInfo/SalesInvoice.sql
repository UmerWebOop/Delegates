CREATE TABLE [dbo].[SalesInvoice](
	[SalesInvoiceNo] [int] NOT NULL,
	[CustomerID] [varchar](11) NULL,
	[CustomerPO] [varchar](250) NULL,
	[SalesOrderNo] [int] NULL,
	[BlanketOrder] [int] NULL,
	[OrderDate] [datetime] NULL,
	[SODate] [datetime] NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[SalesType] [varchar](3) NOT NULL,
	[InvoiceType] [char](1) NOT NULL,
	[Status] [char](1) NOT NULL CONSTRAINT [DF_SalesInvoice_Status]  DEFAULT ((1)),
	[SpecialOrder] [bit] NOT NULL CONSTRAINT [DF_SalesInvoice_SpecialOrder]  DEFAULT ((0)),
	[Region] [int] NULL,
	[BillToAddress] [varchar](6) NULL,
	[ShipToAddress] [varchar](6) NULL,
	[ShipToWHS] [varchar](3) NULL,
	[PackingSlipNo] [int] NULL,
	[CustomerReturnNo] [int] NULL,
	[ConsignmentInvoiceNo] [int] NULL,
	[DropShipAddress] [bit] NOT NULL CONSTRAINT [DF_SalesInvoice_DropShipAddress]  DEFAULT ((0)),
	[ShippingDate] [datetime] NULL,
	[CancelDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[ShipVia] [varchar](6) NULL,
	[SalesEvent] [varchar](6) NULL,
	[PriceCategory] [tinyint] NULL,
	[PaymentTerm] [tinyint] NULL,
	[DiscountDays] [int] NULL,
	[DueDays] [int] NULL,
	[PaymentDiscount] [real] NOT NULL CONSTRAINT [DF_SalesInvoice_PaymentDiscount]  DEFAULT ((0)),
	[PaymentDueDate] [datetime] NULL,
	[PaymentDiscountDate] [datetime] NULL,
	[SalesDiscount] [real] NOT NULL CONSTRAINT [DF_SalesInvoice_SalesDiscount]  DEFAULT ((0)),
	[SpecialPricing] [bit] NOT NULL CONSTRAINT [DF_SalesInvoice_SpecialPricing]  DEFAULT ((0)),
	[SpecialDescription] [bit] NOT NULL CONSTRAINT [DF_SalesInvoice_SpecialDescription]  DEFAULT ((0)),
	[LoadPrice] [char](1) NULL,
	[LoadPercentage] [real] NOT NULL CONSTRAINT [DF_SalesInvoice_LoadPercentage]  DEFAULT ((0)),
	[TaxRate] [real] NOT NULL CONSTRAINT [DF_SalesInvoice_TaxRate]  DEFAULT ((0)),
	[TaxID] [varchar](3) NULL,
	[ARCAccount] [varchar](20) NULL,
	[STLAccount] [varchar](20) NULL,
	[FCRAccount] [varchar](20) NULL,
	[DRVAccount] [varchar](20) NULL,
	[OpenCredit] [money] NOT NULL CONSTRAINT [DF_SalesInvoice_OpenCredit]  DEFAULT ((0)),
	[TotalQty] [int] NOT NULL CONSTRAINT [DF_SalesInvoice_TotalQty]  DEFAULT ((0)),
	[TotalQtyInvoiced] [int] NOT NULL,
	[ServiceCharges] [money] NOT NULL CONSTRAINT [DF_SalesInvoice_ServiceCharges]  DEFAULT ((0)),
	[ShippingCharges] [money] NOT NULL CONSTRAINT [DF_SalesInvoice_SHCharges]  DEFAULT ((0)),
	[HandlingCharges] [money] NOT NULL CONSTRAINT [DF_SalesInvoice_HandlingCharges]  DEFAULT ((0)),
	[TotalWeight] [real] NOT NULL CONSTRAINT [DF_SalesInvoice_TotalWeight]  DEFAULT ((0)),
	[TaxAmount] [money] NOT NULL CONSTRAINT [DF_SalesInvoice_TaxAmount]  DEFAULT ((0)),
	[TotalAmount] [money] NOT NULL CONSTRAINT [DF_SalesInvoice_TotalAmount]  DEFAULT ((0)),
	[AppliedAmount] [money] NOT NULL CONSTRAINT [DF_SalesInvoice_AppliedAmount]  DEFAULT ((0)),
	[AmountForDiscount] [money] NOT NULL CONSTRAINT [DF_SalesInvoice_AmmountForDiscount]  DEFAULT ((0)),
	[PaymentDiscountAmount] [money] NOT NULL CONSTRAINT [DF_SalesInvoice_PaymentDiscountAmount]  DEFAULT ((0)),
	[AdjustmentAmount] [money] NOT NULL CONSTRAINT [DF_SalesInvoice_AdjustmentAmount]  DEFAULT ((0)),
	[AppliedDiscount] [money] NOT NULL CONSTRAINT [DF_SalesInvoice_AppliedDiscount]  DEFAULT ((0)),
	[CreditApplied] [bit] NOT NULL CONSTRAINT [DF_SalesInvoice_CreditApplied]  DEFAULT ((0)),
	[OrderTakenBy] [varchar](20) NULL,
	[Printed] [tinyint] NULL CONSTRAINT [DF_SalesInvoice_Printed]  DEFAULT ((0)),
	[SpecialInstructions] [varchar](4000) NULL,
	[BatchNo] [int] NULL,
	[MCE_Allowed] [bit] NOT NULL CONSTRAINT [DF_SalesInvoice_MCE_Allowed]  DEFAULT ((0)),
	[ADDUser] [smallint] NOT NULL,
	[ADDDate] [datetime] NOT NULL,
	[MODUser] [smallint] NULL,
	[MODDate] [datetime] NULL,
	[WarehouseID] [varchar](3) NULL,
	[BillOfLadingNo] [int] NULL,
	[ManifestNo] [int] NULL,
	[CCPaymentNo] [int] NULL,
	[CashReceiptNo] [int] NULL,
	[ScacCode] [varchar](30) NULL,
	[TotalSQFT] [real] NOT NULL CONSTRAINT [DF_SalesInvoice_TotalSQFT]  DEFAULT ((0)),
	[TotalCUFT] [real] NOT NULL CONSTRAINT [DF_SalesInvoice_TotalCUFT]  DEFAULT ((0)),
	[PriceFormat] [char](1) NULL,
	[RefInvoiceNo] [int] NULL,
	[CollateralCheckNo] [int] NULL,
	[AdvancePayments] [tinyint] NOT NULL CONSTRAINT [DF_SalesInvoice_AdvancePayments]  DEFAULT ((0)),
	[AdvancePaymentType] [char](1) NULL,
	[PeriodID] [varchar](4) NULL,
	[OrderPlacedBy] [varchar](20) NULL,
	[RMANO] [int] NULL,
	[TotalMerchandise] [money] NULL,
	[TotalServices] [money] NULL,
	[PrintSetting] [varchar](1) NULL CONSTRAINT [DF_SalesInvoice_PrintSetting]  DEFAULT ('D'),
	[TransferedConsignment] [char](1) NOT NULL CONSTRAINT [DF__SalesInvo__Trans__727433EB]  DEFAULT ('N'),
	[AcknowledgeConsignment] [char](1) NOT NULL CONSTRAINT [DF__SalesInvo__Ackno__7738E908]  DEFAULT ('N'),
	[BDID] [char](3) NULL,
	[ManualDocNo] [varchar](20) NULL,
	[TotalServicesQty] [int] NOT NULL CONSTRAINT [DF__SalesInvo__Total__538E236A]  DEFAULT ((0)),
	[DayClosed] [char](1) NULL,
	[POSInvoice] [tinyint] NOT NULL CONSTRAINT [DF__SalesInvo__POSIn__7CD0301F]  DEFAULT ((0)),
	[ShowEventID] [varchar](10) NULL,
	[NewPOSNo] [int] NULL,
	[RefField6] [money] NULL CONSTRAINT [DF__SalesInvo__RefFi__16AB6315]  DEFAULT ((0)),
	[EDI_Exported] [int] NULL CONSTRAINT [DF__SalesInvo__EDI_E__5EC3DF9B]  DEFAULT ((0)),
	[DeliveryNo] [int] NULL,
	[PSNo] [int] NULL,
	[ASNPrinted] [bit] NULL,
	[IsSentInvoiceNotification] [bit] NULL,
	[ASNAfterTrailerClosed] [bit] NULL,
	[ImportChargesAdded] [varchar](1) NULL,
	[WriteOff] [bit] NULL,
	[TotalServicesDiscount] [money] NULL,
 CONSTRAINT [PK_SalesInvoice] PRIMARY KEY CLUSTERED 
(
	[SalesInvoiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[SalesInvoice]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesInvoice_CashReceipts] FOREIGN KEY([CashReceiptNo])
REFERENCES [dbo].[CashReceipts] ([CashReceiptNo])
GO

ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [FK_SalesInvoice_CashReceipts]
GO

ALTER TABLE [dbo].[SalesInvoice]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesInvoice_CustomerAddresses] FOREIGN KEY([CustomerID], [BillToAddress])
REFERENCES [dbo].[CustomerAddresses] ([CustomerID], [AddressID])
GO

ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [FK_SalesInvoice_CustomerAddresses]
GO

ALTER TABLE [dbo].[SalesInvoice]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesInvoice_CustomerAddresses1] FOREIGN KEY([CustomerID], [ShipToAddress])
REFERENCES [dbo].[CustomerAddresses] ([CustomerID], [AddressID])
GO

ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [FK_SalesInvoice_CustomerAddresses1]
GO

ALTER TABLE [dbo].[SalesInvoice]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesInvoice_CustomerReturns] FOREIGN KEY([CustomerReturnNo])
REFERENCES [dbo].[CustomerReturns] ([CustomerReturnNo])
GO

ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [FK_SalesInvoice_CustomerReturns]
GO

ALTER TABLE [dbo].[SalesInvoice]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesInvoice_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO

ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [FK_SalesInvoice_Customers]
GO

ALTER TABLE [dbo].[SalesInvoice]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesInvoice_PaymentTerms] FOREIGN KEY([PaymentTerm])
REFERENCES [dbo].[PaymentTerms] ([PaymentTermNo])
GO

ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [FK_SalesInvoice_PaymentTerms]
GO

ALTER TABLE [dbo].[SalesInvoice]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesInvoice_PriceCategories] FOREIGN KEY([PriceCategory])
REFERENCES [dbo].[PriceCategories] ([CategoryNo])
GO

ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [FK_SalesInvoice_PriceCategories]
GO

ALTER TABLE [dbo].[SalesInvoice]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesInvoice_SalesEvents] FOREIGN KEY([SalesEvent])
REFERENCES [dbo].[SalesEvents] ([SalesEventID])
GO

ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [FK_SalesInvoice_SalesEvents]
GO

ALTER TABLE [dbo].[SalesInvoice]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesInvoice_SalesOrders] FOREIGN KEY([SalesOrderNo])
REFERENCES [dbo].[SalesOrders] ([SalesOrderNo])
GO

ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [FK_SalesInvoice_SalesOrders]
GO

ALTER TABLE [dbo].[SalesInvoice]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesInvoice_ShipVia] FOREIGN KEY([ShipVia])
REFERENCES [dbo].[ShipVia] ([ShipViaID])
GO

ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [FK_SalesInvoice_ShipVia]
GO

ALTER TABLE [dbo].[SalesInvoice]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesInvoice_ShowEvents] FOREIGN KEY([ShowEventID])
REFERENCES [dbo].[ShowEvents] ([ShowEventID])
GO

ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [FK_SalesInvoice_ShowEvents]
GO

ALTER TABLE [dbo].[SalesInvoice]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesInvoice_TaxRates] FOREIGN KEY([TaxID])
REFERENCES [dbo].[TaxRates] ([TaxID])
GO

ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [FK_SalesInvoice_TaxRates]
GO

ALTER TABLE [dbo].[SalesInvoice]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesInvoice_Warehouses] FOREIGN KEY([ShipToWHS])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO

ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [FK_SalesInvoice_Warehouses]
GO

ALTER TABLE [dbo].[SalesInvoice]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesInvoice_Warehouses1] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO

ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [FK_SalesInvoice_Warehouses1]
GO


