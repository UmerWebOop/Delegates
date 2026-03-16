CREATE TABLE [dbo].[VendorPayments](
	[ApplyPaymentNo] [int] NOT NULL,
	[PaymentNo] [int] NULL,
	[DebitMemoNo] [int] NULL,
	[PayDocNo] [varchar](20) NOT NULL,
	[DocDate] [datetime] NOT NULL,
	[PayableInvoiceNo] [int] NOT NULL,
	[DiscountAccount] [varchar](20) NULL,
	[PaymentAccount] [varchar](20) NULL,
	[VendorID] [varchar](6) NOT NULL,
	[Amount] [money] NOT NULL CONSTRAINT [DF_VendorPaym_Amount_1__10]  DEFAULT (0),
	[DiscountAmount] [money] NOT NULL CONSTRAINT [DF_VendorPaym_DiscountAmount_2]  DEFAULT (0),
	[Reference] [varchar](20) NULL,
	[DocType] [char](1) NOT NULL,
	[Status] [char](1) NOT NULL,
	[Remarks] [varchar](255) NULL,
	[ADDuser] [smallint] NOT NULL,
	[ADDdate] [datetime] NOT NULL,
	[MODUser] [smallint] NULL,
	[MODDate] [datetime] NULL,
	[PeriodID] [varchar](4) NULL,
	[MasterPaymentNo] [int] NULL,
 CONSTRAINT [PK_VendorPayments] PRIMARY KEY NONCLUSTERED 
(
	[ApplyPaymentNo] ASC,
	[PayableInvoiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[VendorPayments]  WITH CHECK ADD  CONSTRAINT [FK_VendorPayments_2__10] FOREIGN KEY([PayableInvoiceNo])
REFERENCES [dbo].[PayableInvoices] ([PayableInvoiceNo])
GO

ALTER TABLE [dbo].[VendorPayments] CHECK CONSTRAINT [FK_VendorPayments_2__10]
GO

ALTER TABLE [dbo].[VendorPayments]  WITH CHECK ADD  CONSTRAINT [FK_VendorPayments_3__10] FOREIGN KEY([PaymentAccount])
REFERENCES [dbo].[PaymentAccounts] ([Account])
GO

ALTER TABLE [dbo].[VendorPayments] CHECK CONSTRAINT [FK_VendorPayments_3__10]
GO

ALTER TABLE [dbo].[VendorPayments]  WITH CHECK ADD  CONSTRAINT [FK_VendorPayments_BankPayments] FOREIGN KEY([PaymentNo])
REFERENCES [dbo].[BankPayments] ([PaymentNo])
GO

ALTER TABLE [dbo].[VendorPayments] CHECK CONSTRAINT [FK_VendorPayments_BankPayments]
GO

ALTER TABLE [dbo].[VendorPayments]  WITH CHECK ADD  CONSTRAINT [FK_VendorPayments_PayableInvoices] FOREIGN KEY([DebitMemoNo])
REFERENCES [dbo].[PayableInvoices] ([PayableInvoiceNo])
GO

ALTER TABLE [dbo].[VendorPayments] CHECK CONSTRAINT [FK_VendorPayments_PayableInvoices]
GO

ALTER TABLE [dbo].[VendorPayments]  WITH CHECK ADD  CONSTRAINT [FK_VendorPayments_Vendors] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendors] ([VendorID])
GO

ALTER TABLE [dbo].[VendorPayments] CHECK CONSTRAINT [FK_VendorPayments_Vendors]
GO


