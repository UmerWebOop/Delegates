CREATE TABLE [dbo].[DropShipAddress](
	[DropShipNo] [int] NOT NULL,
	[SalesOrderNo] [int] NULL,
	[CustomerID] [varchar](11) NULL,
	[FirstName] [varchar](40) NULL,
	[LastName] [varchar](40) NULL,
	[Address1] [varchar](35) NOT NULL,
	[Address2] [varchar](35) NULL,
	[City] [varchar](35) NULL,
	[State] [varchar](10) NOT NULL,
	[ZIP] [varchar](10) NOT NULL,
	[Country] [varchar](30) NOT NULL,
	[Phone] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[Email] [varchar](512) NULL,
	[SalesInvoiceNo] [int] NULL,
	[Attention] [varchar](40) NULL,
 CONSTRAINT [PK_DropShipAddress] PRIMARY KEY NONCLUSTERED 
(
	[DropShipNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[DropShipAddress]  WITH CHECK ADD  CONSTRAINT [FK_DropShipAddress_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO

ALTER TABLE [dbo].[DropShipAddress] CHECK CONSTRAINT [FK_DropShipAddress_Customers]
GO

ALTER TABLE [dbo].[DropShipAddress]  WITH CHECK ADD  CONSTRAINT [FK_DropShipAddress_SalesInvoice] FOREIGN KEY([SalesInvoiceNo])
REFERENCES [dbo].[SalesInvoice] ([SalesInvoiceNo])
GO

ALTER TABLE [dbo].[DropShipAddress] CHECK CONSTRAINT [FK_DropShipAddress_SalesInvoice]
GO

ALTER TABLE [dbo].[DropShipAddress]  WITH CHECK ADD  CONSTRAINT [FK_DropShipAddress_SalesOrders] FOREIGN KEY([SalesOrderNo])
REFERENCES [dbo].[SalesOrders] ([SalesOrderNo])
GO

ALTER TABLE [dbo].[DropShipAddress] CHECK CONSTRAINT [FK_DropShipAddress_SalesOrders]
GO


