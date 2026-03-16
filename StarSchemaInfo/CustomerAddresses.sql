CREATE TABLE [dbo].[CustomerAddresses](
	[CustomerID] [varchar](11) NOT NULL,
	[AddressID] [varchar](6) NOT NULL,
	[EDIAddressID] [varchar](50) NULL,
	[Type] [char](1) NOT NULL,
	[Department] [varchar](20) NULL,
	[FirstName] [varchar](40) NULL,
	[LastName] [varchar](40) NULL CONSTRAINT [DF_CustomerAddresses_LastName]  DEFAULT (''),
	[Title] [varchar](20) NULL,
	[Address1] [varchar](35) NULL,
	[Address2] [varchar](35) NULL,
	[City] [varchar](35) NULL,
	[State] [varchar](10) NULL,
	[ZIP] [varchar](10) NULL,
	[Country] [varchar](30) NULL,
	[Phone1] [varchar](20) NULL,
	[Phone2] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[Email] [varchar](512) NULL,
	[RDC] [varchar](6) NULL,
	[ADDUser] [smallint] NOT NULL,
	[ADDDate] [datetime] NOT NULL,
	[MODUser] [smallint] NULL,
	[MODDate] [datetime] NULL,
	[ShipInBoxOnly] [bit] NOT NULL CONSTRAINT [DF__CustomerA__ShipI__60F4A22E]  DEFAULT (0),
	[TaxID] [varchar](3) NULL,
	[TaxRate] [real] NULL,
	[HomeNumber] [varchar](20) NULL,
	[CellNumber] [varchar](20) NULL,
	[WorkNumber] [varchar](20) NULL,
	[Province] [varchar](30) NULL,
	[AddressStatus] [char](1) NULL,
	[StatusDate] [datetime] NULL,
	[AddressNo] [int] NULL,
	[DefaultAddress] [bit] NULL,
	[RolledRugsOnly] [bit] NULL,
 CONSTRAINT [PK_CustomerAddresses] PRIMARY KEY NONCLUSTERED 
(
	[CustomerID] ASC,
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[CustomerAddresses]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAddresses_Customers1] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO

ALTER TABLE [dbo].[CustomerAddresses] CHECK CONSTRAINT [FK_CustomerAddresses_Customers1]
GO


