USE [C7_SPARSus]
GO

/****** Object:  Table [dbo].[SalesCommissions]    Script Date: 12/02/2026 7:30:40 pm ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SalesCommissions](
	[CommissionNo] [int] NOT NULL,
	[SalesInvoiceNo] [int] NOT NULL,
	[SalesOrderNo] [int] NULL,
	[InvoiceType] [char](1) NOT NULL,
	[PoolID] [varchar](6) NULL,
	[PoolCommission] [real] NOT NULL CONSTRAINT [DF_SalesCommissions_PoolCommission]  DEFAULT (0),
	[Agent] [varchar](6) NOT NULL,
	[AgentType] [tinyint] NULL,
	[PoolShare] [real] NOT NULL CONSTRAINT [DF_SalesCommissions_PoolShare]  DEFAULT (0),
	[CommissionRate] [real] NULL,
	[CDS] [bit] NOT NULL,
	[TotalAmount] [money] NOT NULL,
	[AmountForComm] [money] NOT NULL,
	[PaidAmount] [money] NOT NULL CONSTRAINT [DF_SalesCommissions_PaidAmount]  DEFAULT (0),
	[LastPayInvoiceNo] [int] NULL,
	[Status] [char](1) NOT NULL,
	[ADDUser] [smallint] NOT NULL,
	[ADDDate] [datetime] NOT NULL,
	[MCE] [bit] NOT NULL CONSTRAINT [DF_SalesCommissions_MCE]  DEFAULT (0),
	[MODUser] [smallint] NULL,
	[MODDate] [datetime] NULL,
	[LineMode] [int] NULL,
 CONSTRAINT [PK_SalesCommissions] PRIMARY KEY NONCLUSTERED 
(
	[CommissionNo] ASC,
	[Agent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[SalesCommissions]  WITH CHECK ADD  CONSTRAINT [FK_SalesCommissions_PayableInvoices] FOREIGN KEY([LastPayInvoiceNo])
REFERENCES [dbo].[PayableInvoices] ([PayableInvoiceNo])
GO

ALTER TABLE [dbo].[SalesCommissions] CHECK CONSTRAINT [FK_SalesCommissions_PayableInvoices]
GO

ALTER TABLE [dbo].[SalesCommissions]  WITH CHECK ADD  CONSTRAINT [FK_SalesCommissions_SalesInvoice] FOREIGN KEY([SalesInvoiceNo])
REFERENCES [dbo].[SalesInvoice] ([SalesInvoiceNo])
GO

ALTER TABLE [dbo].[SalesCommissions] CHECK CONSTRAINT [FK_SalesCommissions_SalesInvoice]
GO

ALTER TABLE [dbo].[SalesCommissions]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesCommissions_SalesOrders] FOREIGN KEY([SalesOrderNo])
REFERENCES [dbo].[SalesOrders] ([SalesOrderNo])
GO

ALTER TABLE [dbo].[SalesCommissions] CHECK CONSTRAINT [FK_SalesCommissions_SalesOrders]
GO

ALTER TABLE [dbo].[SalesCommissions]  WITH CHECK ADD  CONSTRAINT [FK_SalesCommissions_Vendors] FOREIGN KEY([Agent])
REFERENCES [dbo].[Vendors] ([VendorID])
GO

ALTER TABLE [dbo].[SalesCommissions] CHECK CONSTRAINT [FK_SalesCommissions_Vendors]
GO


