CREATE TABLE [dbo].[Region](
	[RegionNo] [int] NOT NULL,
	[Description] [varchar](30) NOT NULL,
	[ADDUser] [smallint] NULL,
	[ADDDate] [datetime] NULL,
	[MODUser] [smallint] NULL,
	[MODDate] [datetime] NULL,
 CONSTRAINT [PK_VendorType_1__10] PRIMARY KEY CLUSTERED 
(
	[RegionNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


