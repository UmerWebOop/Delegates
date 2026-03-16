CREATE TABLE [dbo].[SalesOrders](
	[SalesOrderNo] [int] NOT NULL,
	[CustomerID] [varchar](11) NULL,
	[CustomerPO] [varchar](250) NULL,
	[OrderPlacedBy] [varchar](20) NULL,
	[OrderDate] [datetime] NOT NULL,
	[SODate] [datetime] NOT NULL,
	[SalesType] [varchar](3) NOT NULL,
	[Status] [char](1) NOT NULL,
	[SpecialOrder] [bit] NOT NULL CONSTRAINT [DF_SalesOrders_SpecialOrder]  DEFAULT (0),
	[Region] [int] NULL,
	[BillToAddress] [varchar](6) NULL,
	[ShipToAddress] [varchar](6) NULL,
	[DropShipAddress] [bit] NOT NULL CONSTRAINT [DF_SalesOrders_DropShipAddress]  DEFAULT (0),
	[ShipToWHS] [varchar](3) NULL,
	[ShippingDate] [datetime] NOT NULL,
	[CancelDate] [datetime] NOT NULL,
	[ShipVia] [varchar](6) NOT NULL,
	[ShippingPriority] [tinyint] NOT NULL,
	[PriceCategory] [tinyint] NULL,
	[PaymentTerm] [tinyint] NULL,
	[DiscountDays] [int] NULL,
	[DueDays] [int] NULL,
	[PaymentDiscount] [real] NULL,
	[SalesDiscount] [real] NOT NULL CONSTRAINT [DF_SalesOrders_SalesDiscount]  DEFAULT (0),
	[SpecialPricing] [bit] NOT NULL CONSTRAINT [DF_SalesOrders_SpecialPricing]  DEFAULT (0),
	[SpecialDescription] [bit] NOT NULL CONSTRAINT [DF_SalesOrders_SpecialDescription]  DEFAULT (0),
	[LoadPrice] [char](1) NULL,
	[LoadPercentage] [real] NOT NULL CONSTRAINT [DF_SalesOrders_LoadPercentage]  DEFAULT (0),
	[TaxID] [varchar](3) NULL,
	[TaxRate] [real] NOT NULL CONSTRAINT [DF_SalesOrders_TaxRate]  DEFAULT (0),
	[ARCAccount] [varchar](20) NULL,
	[STLAccount] [varchar](20) NULL,
	[FCRAccount] [varchar](20) NULL,
	[DRVAccount] [varchar](20) NULL,
	[OpenCredit] [money] NOT NULL CONSTRAINT [DF_SalesOrders_OpenCredit]  DEFAULT (0),
	[TotalQty] [int] NOT NULL,
	[TotalQtyShipped] [int] NOT NULL CONSTRAINT [DF_SalesOrders_TotalQtyShipped]  DEFAULT (0),
	[ServiceCharges] [money] NOT NULL CONSTRAINT [DF_SalesOrders_ServiceCharges]  DEFAULT (0),
	[SHCharges] [money] NOT NULL CONSTRAINT [DF_SalesOrders_SHCharges]  DEFAULT (0),
	[TaxAmount] [money] NOT NULL CONSTRAINT [DF_SalesOrders_TaxAmount]  DEFAULT (0),
	[TotalAmount] [money] NOT NULL,
	[OrderTakenBy] [varchar](20) NULL,
	[GeneratePickingTicket] [bit] NOT NULL CONSTRAINT [DF_SalesOrders_GeneratePickingTicket]  DEFAULT (1),
	[SpecialInstruction] [varchar](4000) NULL,
	[BlanketOrder] [int] NULL,
	[SalesEvent] [varchar](6) NULL,
	[ADDUser] [smallint] NOT NULL,
	[ADDDate] [datetime] NOT NULL,
	[MODUser] [smallint] NULL,
	[MODDate] [datetime] NULL,
	[WarehouseID] [varchar](3) NULL,
	[MCE_Allowed] [bit] NOT NULL CONSTRAINT [DF_SalesOrders_MCE_Allowed]  DEFAULT (0),
	[CCPaymentNo] [int] NULL,
	[CashReceiptNo] [int] NULL,
	[Not_Shipable] [bit] NOT NULL CONSTRAINT [DF_SalesOrders_Not_Shipable]  DEFAULT (0),
	[LastActivityReason] [varchar](250) NULL,
	[PriceFormat] [char](1) NULL,
	[CollateralCheckNo] [int] NULL,
	[AdvancePayments] [tinyint] NOT NULL CONSTRAINT [DF_SalesOrders_AdvancePayments]  DEFAULT (0),
	[AdvancePaymentType] [char](1) NULL,
	[PeriodID] [varchar](4) NULL,
	[ReleasedUser] [smallint] NULL,
	[ReleasedDate] [datetime] NULL,
	[TotalMerchandise] [money] NULL,
	[TotalServices] [money] NULL,
	[PrintSetting] [varchar](1) NULL CONSTRAINT [DF_SalesOrders_PrintSetting]  DEFAULT ('D'),
	[BDID] [char](3) NULL,
	[TotalServicesQty] [int] NOT NULL CONSTRAINT [DF__SalesOrde__Total__548247A3]  DEFAULT (0),
	[ShowEventID] [varchar](10) NULL,
	[NewPOSNo] [int] NULL,
	[EDI_Canceled] [varchar](1) NULL,
	[Residential] [varchar](1) NULL,
	[FreightPrepaid] [varchar](1) NULL,
	[Exported_855] [int] NULL,
	[Exported_855UserNo] [int] NULL,
	[Exported_855Date] [datetime] NULL,
	[ExportedCancel_855] [int] NULL,
	[ExportedCancel_855UserNo] [int] NULL,
	[ExportedCancel_855Date] [datetime] NULL,
	[Signature_Required_forDelivery] [char](1) NULL,
	[Exported_870UserNo] [int] NULL,
	[Exported_870Date] [datetime] NULL,
	[Exported_870] [int] NULL DEFAULT ((0)),
	[Exported_870Sec] [int] NULL DEFAULT ((0)),
	[Exported_870SecUserNo] [int] NULL,
	[Exported_870SecDate] [datetime] NULL,
	[Exported_870DD] [int] NULL DEFAULT ((0)),
	[Exported_870DDUserNo] [int] NULL,
	[Exported_870DDDate] [datetime] NULL,
	[Exported_870ED] [int] NULL DEFAULT ((0)),
	[Exported_870EDUserNo] [int] NULL,
	[Exported_870EDDate] [datetime] NULL,
	[Exported_870DE] [int] NULL DEFAULT ((0)),
	[Exported_870DEUserNo] [int] NULL,
	[Exported_870DEDate] [datetime] NULL,
	[DonotOverride_Shipvia] [varchar](1) NULL,
	[EDI_Exported_SSPO] [int] NULL,
	[EDI_Exported_SSPOUserNo] [int] NULL,
	[EDI_Exported_SSPODate] [datetime] NULL,
	[EDI_Export_SSSLBO] [int] NULL,
	[EDI_Export_SSSLBOUserNo] [int] NULL,
	[EDI_Export_SSSLBODate] [datetime] NULL,
	[EDI_Export_MSBO] [int] NULL,
	[EDI_Export_MSBOUserNo] [int] NULL,
	[EDI_Export_MSBODate] [datetime] NULL,
	[EDI_Export_MS] [int] NULL,
	[EDI_Export_MSUserNo] [int] NULL,
	[EDI_Export_MSDate] [datetime] NULL,
	[EDI_Exported870CC] [int] NULL,
	[EDI_Exported870CCUserNo] [int] NULL,
	[EDI_Exported870CCDate] [datetime] NULL,
	[ManualExportedEDIOrders] [bit] NULL,
	[ManualExportedEDIOrders_UserNo] [int] NULL,
	[ManualExportedEDIOrders_Date] [datetime] NULL,
	[SHChargesPer] [real] NULL,
	[OnHold] [varchar](1) NULL,
	[ShipComplete] [varchar](1) NULL,
	[IncludeDeclareValue] [varchar](1) NULL,
	[DeclareValueAmount] [money] NULL,
	[Ship_ServiceMethod] [varchar](70) NULL,
	[ServiceStandard] [varchar](70) NULL,
	[ShippingCost] [money] NULL,
	[AddressType] [varchar](20) NULL,
	[CustomerComments] [varchar](2000) NULL,
	[TypeDetail] [varchar](1) NULL,
	[Weight] [float] NULL,
	[ETA_RequestID] [int] NULL,
	[Discontinued] [bit] NULL,
	[SetItemID] [varchar](30) NULL,
	[MainItem] [varchar](1) NULL,
	[SetOrderQty] [smallint] NULL,
	[SetPrice] [money] NULL,
	[MLine_No] [smallint] NULL,
	[StoreID] [varchar](6) NULL,
	[MC_OrderNumber] [int] NULL,
	[OrderingName] [varchar](30) NULL,
	[EmailAddress] [varchar](512) NULL,
	[ContactName] [varchar](35) NULL,
	[ContactPhoneNo] [varchar](20) NULL,
	[TotalBales] [int] NULL,
	[TagProcessed] [varchar](6) NULL,
	[Converted_To] [int] NULL,
	[Converted_From] [int] NULL,
	[Converted_User] [smallint] NULL,
	[Converted_Date] [datetime] NULL,
	[IsEmailSent] [tinyint] NULL,
	[CancelOrder_IsEmailSent] [tinyint] NULL,
	[Doc_IsEmailSent] [tinyint] NULL,
	[ExportAllowed_855] [int] NULL,
	[Exported_MWHS870] [int] NULL,
	[Exported_MWHS870UserNo] [int] NULL,
	[Exported_MWHS870Date] [datetime] NULL,
	[EDICancellationCode] [varchar](100) NULL,
	[ExternalOrderNo] [varchar](50) NULL,
	[Attention] [nvarchar](50) NULL,
	[DoNotAddImportCharges] [varchar](1) NULL,
	[Exported_865] [bit] NULL,
	[NotShippable_ReasonID] [varchar](10) NULL,
	[NotShippable_Type] [varchar](1) NULL,
	[Field01] [varchar](250) NULL,
	[Field02] [varchar](250) NULL,
	[Field03] [varchar](250) NULL,
	[Field04] [varchar](250) NULL,
	[Field05] [varchar](250) NULL,
	[Field06] [varchar](250) NULL,
	[Field07] [varchar](250) NULL,
	[Field08] [varchar](250) NULL,
	[Field09] [varchar](250) NULL,
	[Field10] [varchar](250) NULL,
	[Field11] [varchar](250) NULL,
	[Field12] [varchar](250) NULL,
	[Field13] [varchar](250) NULL,
	[Field14] [varchar](250) NULL,
	[Field15] [varchar](250) NULL,
	[Field16] [varchar](250) NULL,
	[Field17] [varchar](250) NULL,
	[Field18] [varchar](250) NULL,
	[Field19] [varchar](250) NULL,
	[Field20] [varchar](250) NULL,
	[InternalNotes] [nvarchar](4000) NULL,
	[HoldOrder] [bit] NULL DEFAULT ((0)),
	[IsManualBaling] [bit] NULL DEFAULT ((0)),
	[RestrictRDC] [bit] NULL,
	[IsUCCLabelGenerated] [bit] NULL DEFAULT ((0)),
	[TotalServicesDiscount] [money] NULL,
 CONSTRAINT [PK_SalesOrders] PRIMARY KEY NONCLUSTERED 
(
	[SalesOrderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_CashReceipts] FOREIGN KEY([CashReceiptNo])
REFERENCES [dbo].[CashReceipts] ([CashReceiptNo])
GO

ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_CashReceipts]
GO

ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_CustomerAddresses] FOREIGN KEY([CustomerID], [BillToAddress])
REFERENCES [dbo].[CustomerAddresses] ([CustomerID], [AddressID])
GO

ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_CustomerAddresses]
GO

ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_CustomerAddresses1] FOREIGN KEY([CustomerID], [ShipToAddress])
REFERENCES [dbo].[CustomerAddresses] ([CustomerID], [AddressID])
GO

ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_CustomerAddresses1]
GO

ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_CustomerAddresses2] FOREIGN KEY([CustomerID], [ShipToAddress])
REFERENCES [dbo].[CustomerAddresses] ([CustomerID], [AddressID])
GO

ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_CustomerAddresses2]
GO

ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO

ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_Customers]
GO

ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_PaymentTerms] FOREIGN KEY([PaymentTerm])
REFERENCES [dbo].[PaymentTerms] ([PaymentTermNo])
GO

ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_PaymentTerms]
GO

ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_PriceCategories] FOREIGN KEY([PriceCategory])
REFERENCES [dbo].[PriceCategories] ([CategoryNo])
GO

ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_PriceCategories]
GO

ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_SalesEvents] FOREIGN KEY([SalesEvent])
REFERENCES [dbo].[SalesEvents] ([SalesEventID])
GO

ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_SalesEvents]
GO

ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_ShipVia] FOREIGN KEY([ShipVia])
REFERENCES [dbo].[ShipVia] ([ShipViaID])
GO

ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_ShipVia]
GO

ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_ShowEvents] FOREIGN KEY([ShowEventID])
REFERENCES [dbo].[ShowEvents] ([ShowEventID])
GO

ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_ShowEvents]
GO

ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_TaxRates] FOREIGN KEY([TaxID])
REFERENCES [dbo].[TaxRates] ([TaxID])
GO

ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_TaxRates]
GO

ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_Warehouses] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO

ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_Warehouses]
GO

ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_Warehouses1] FOREIGN KEY([ShipToWHS])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO

ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_Warehouses1]
GO

ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_Warehouses2] FOREIGN KEY([ShipToWHS])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO

ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_Warehouses2]
GO


