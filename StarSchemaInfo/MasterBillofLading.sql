CREATE TABLE [dbo].[MasterBillofLading](
	[MasterBillofLadingNo] [int] NOT NULL,
	[StdBillofLadingNo] [varchar](20) NOT NULL,
	[CustomerID] [varchar](11) NULL,
	[AdditionalInfo] [varchar](255) NULL,
	[LoadID] [varchar](255) NULL,
	[TotalQTY] [int] NOT NULL,
	[TotalWeight] [float] NULL,
	[ADDUser] [int] NOT NULL,
	[ADDDate] [datetime] NOT NULL,
	[MODUser] [int] NULL,
	[MODDate] [datetime] NULL,
	[Status] [char](1) NULL,
 CONSTRAINT [PK_MasterBillofLading] PRIMARY KEY CLUSTERED 
(
	[MasterBillofLadingNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


