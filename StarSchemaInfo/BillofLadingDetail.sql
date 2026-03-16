CREATE TABLE [dbo].[BillofLadingDetail](
	[BillofLadingNo] [int] NOT NULL,
	[PackingSlipNo] [int] NOT NULL,
	[BaleNo] [varchar](10) NOT NULL,
	[Weight] [real] NULL,
	[Sidemark] [varchar](30) NULL,
	[Rate] [real] NULL,
	[Charges] [money] NULL,
	[DeclareValue] [money] NULL,
	[HandlingUnit] [int] NULL,
	[Description] [varchar](255) NULL,
	[TotalCUFT] [real] NULL,
	[RateRef] [money] NULL,
 CONSTRAINT [PK_BillofLadingDetail] PRIMARY KEY NONCLUSTERED 
(
	[BillofLadingNo] ASC,
	[PackingSlipNo] ASC,
	[BaleNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[BillofLadingDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillofLadingDetail_BillofLading] FOREIGN KEY([BillofLadingNo])
REFERENCES [dbo].[BillofLading] ([BillofLadingNo])
GO

ALTER TABLE [dbo].[BillofLadingDetail] CHECK CONSTRAINT [FK_BillofLadingDetail_BillofLading]
GO


