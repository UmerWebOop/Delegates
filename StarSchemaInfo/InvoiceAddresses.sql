
CREATE TABLE [dbo].[InvoiceAddresses](
	[SalesInvoiceNo] [int] NOT NULL,
	[CustomerID] [varchar](11) NULL,
	[EDICustomerID] [varchar](20) NULL,
	[CustomerVendorCode] [varchar](15) NULL,
	[S_EDIAddressID] [varchar](50) NULL,
	[S_AddressID] [varchar](6) NULL,
	[S_Type] [char](1) NULL,
	[S_Department] [varchar](20) NULL,
	[S_FirstName] [varchar](40) NULL,
	[S_LastName] [varchar](40) NULL,
	[S_Title] [varchar](20) NULL,
	[S_Address1] [varchar](35) NULL,
	[S_Address2] [varchar](35) NULL,
	[S_City] [varchar](35) NULL,
	[S_State] [varchar](10) NULL,
	[S_ZIP] [varchar](10) NULL,
	[S_Country] [varchar](30) NULL,
	[S_Phone] [varchar](20) NULL,
	[S_Fax] [varchar](20) NULL,
	[S_Email] [varchar](512) NULL,
	[S_RDC] [varchar](4) NULL,
	[B_EDIAddressID] [varchar](50) NULL,
	[B_AddressID] [varchar](6) NULL,
	[B_Department] [varchar](20) NULL,
	[B_FirstName] [varchar](40) NULL,
	[B_LastName] [varchar](40) NULL,
	[B_Title] [varchar](20) NULL,
	[B_Address1] [varchar](35) NULL,
	[B_Address2] [varchar](35) NULL,
	[B_City] [varchar](35) NULL,
	[B_State] [varchar](10) NULL,
	[B_ZIP] [varchar](10) NULL,
	[B_Country] [varchar](30) NULL,
	[B_Phone] [varchar](20) NULL,
	[B_Fax] [varchar](20) NULL,
	[B_Email] [varchar](512) NULL,
	[S_Attention] [varchar](40) NULL,
 CONSTRAINT [PK_InvoiceAddresses] PRIMARY KEY NONCLUSTERED 
(
	[SalesInvoiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[InvoiceAddresses]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceAddresses_CustomerAddresses] FOREIGN KEY([CustomerID], [S_AddressID])
REFERENCES [dbo].[CustomerAddresses] ([CustomerID], [AddressID])
GO

ALTER TABLE [dbo].[InvoiceAddresses] CHECK CONSTRAINT [FK_InvoiceAddresses_CustomerAddresses]
GO

ALTER TABLE [dbo].[InvoiceAddresses]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceAddresses_CustomerAddresses1] FOREIGN KEY([CustomerID], [B_AddressID])
REFERENCES [dbo].[CustomerAddresses] ([CustomerID], [AddressID])
GO

ALTER TABLE [dbo].[InvoiceAddresses] CHECK CONSTRAINT [FK_InvoiceAddresses_CustomerAddresses1]
GO

ALTER TABLE [dbo].[InvoiceAddresses]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceAddresses_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO

ALTER TABLE [dbo].[InvoiceAddresses] CHECK CONSTRAINT [FK_InvoiceAddresses_Customers]
GO

ALTER TABLE [dbo].[InvoiceAddresses]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceAddresses_SalesInvoice] FOREIGN KEY([SalesInvoiceNo])
REFERENCES [dbo].[SalesInvoice] ([SalesInvoiceNo])
GO

ALTER TABLE [dbo].[InvoiceAddresses] CHECK CONSTRAINT [FK_InvoiceAddresses_SalesInvoice]
GO


