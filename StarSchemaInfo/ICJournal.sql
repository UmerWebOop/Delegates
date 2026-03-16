CREATE TABLE [dbo].[ICJournal](
	[ICJTransNo] [int] NOT NULL,
	[ItemID] [varchar](30) NOT NULL,
	[GLAccount] [varchar](20) NOT NULL,
	[SalesInvoiceNo] [int] NULL,
	[PackingSlipNo] [int] NULL,
	[PhysicalCountNo] [int] NULL,
	[PurchaseReceiptNo] [int] NULL,
	[CustomerReturnNo] [int] NULL,
	[PayableInvoiceNo] [int] NULL,
	[TransDate] [datetime] NOT NULL,
	[UnitCost] [money] NOT NULL CONSTRAINT [DF_ICJournal_UnitCost]  DEFAULT ((0)),
	[ChangedQty] [int] NOT NULL,
	[Amount] [money] NOT NULL CONSTRAINT [DF_ICJournal_Amount]  DEFAULT ((0)),
	[Reference] [varchar](20) NOT NULL,
	[TransType] [char](1) NOT NULL,
	[Category] [char](1) NOT NULL,
	[PeriodID] [varchar](4) NOT NULL,
	[Transferred] [bit] NOT NULL CONSTRAINT [DF_ICJournal_Transferred]  DEFAULT ((0)),
	[BatchNo] [int] NULL,
	[PostedDate] [datetime] NULL,
	[ADDUser] [smallint] NOT NULL,
	[ADDDate] [datetime] NOT NULL,
	[WHSID] [varchar](3) NULL,
	[LocationID] [varchar](11) NULL,
	[BDID] [char](3) NULL,
 CONSTRAINT [PK_ICJournal] PRIMARY KEY CLUSTERED 
(
	[ICJTransNo] ASC,
	[ItemID] ASC,
	[GLAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SPARS]
) ON [SPARS]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ICJournal]  WITH CHECK ADD  CONSTRAINT [FK_ICJournal_Batches] FOREIGN KEY([BatchNo])
REFERENCES [dbo].[Batches] ([BatchNo])
GO

ALTER TABLE [dbo].[ICJournal] CHECK CONSTRAINT [FK_ICJournal_Batches]
GO

ALTER TABLE [dbo].[ICJournal]  WITH CHECK ADD  CONSTRAINT [FK_ICJournal_CustomerReturns] FOREIGN KEY([CustomerReturnNo])
REFERENCES [dbo].[CustomerReturns] ([CustomerReturnNo])
GO

ALTER TABLE [dbo].[ICJournal] CHECK CONSTRAINT [FK_ICJournal_CustomerReturns]
GO

ALTER TABLE [dbo].[ICJournal]  WITH CHECK ADD  CONSTRAINT [FK_ICJournal_GLAccounts] FOREIGN KEY([GLAccount])
REFERENCES [dbo].[GLAccounts] ([AccountID])
GO

ALTER TABLE [dbo].[ICJournal] CHECK CONSTRAINT [FK_ICJournal_GLAccounts]
GO

ALTER TABLE [dbo].[ICJournal]  WITH CHECK ADD  CONSTRAINT [FK_ICJournal_GLPeriod] FOREIGN KEY([PeriodID])
REFERENCES [dbo].[GLPeriod] ([PeriodID])
GO

ALTER TABLE [dbo].[ICJournal] CHECK CONSTRAINT [FK_ICJournal_GLPeriod]
GO

ALTER TABLE [dbo].[ICJournal]  WITH CHECK ADD  CONSTRAINT [FK_ICJournal_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO

ALTER TABLE [dbo].[ICJournal] CHECK CONSTRAINT [FK_ICJournal_Items]
GO

ALTER TABLE [dbo].[ICJournal]  WITH CHECK ADD  CONSTRAINT [FK_ICJournal_ItemsReceipts] FOREIGN KEY([PurchaseReceiptNo])
REFERENCES [dbo].[ItemsReceipts] ([PurchaseReceiptNo])
GO

ALTER TABLE [dbo].[ICJournal] CHECK CONSTRAINT [FK_ICJournal_ItemsReceipts]
GO

ALTER TABLE [dbo].[ICJournal]  WITH CHECK ADD  CONSTRAINT [FK_ICJournal_PayableInvoices] FOREIGN KEY([PayableInvoiceNo])
REFERENCES [dbo].[PayableInvoices] ([PayableInvoiceNo])
GO

ALTER TABLE [dbo].[ICJournal] CHECK CONSTRAINT [FK_ICJournal_PayableInvoices]
GO

ALTER TABLE [dbo].[ICJournal]  WITH NOCHECK ADD  CONSTRAINT [FK_ICJournal_SalesInvoice] FOREIGN KEY([SalesInvoiceNo])
REFERENCES [dbo].[SalesInvoice] ([SalesInvoiceNo])
GO

ALTER TABLE [dbo].[ICJournal] CHECK CONSTRAINT [FK_ICJournal_SalesInvoice]
GO


