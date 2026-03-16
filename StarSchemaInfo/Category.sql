CREATE TABLE [dbo].[Category](
	[CategoryNo] [tinyint] NOT NULL,
	[Description] [varchar](30) NOT NULL,
	[ADDUser] [smallint] NULL,
	[ADDDate] [datetime] NULL,
	[MODUser] [smallint] NULL,
	[MODDate] [datetime] NULL,
 CONSTRAINT [PK_VendorCategory_1__10] PRIMARY KEY CLUSTERED 
(
	[CategoryNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


