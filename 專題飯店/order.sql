USE [chitou2]
GO
/****** Object:  Table [dbo].[attractionOrderDetail]    Script Date: 2022/10/4 下午 05:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attractionOrderDetail](
	[itemId] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [varchar](15) NOT NULL,
	[attractionId] [int] NOT NULL,
	[attractionName] [nvarchar](50) NOT NULL,
	[planName] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[itemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderlist]    Script Date: 2022/10/4 下午 05:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderlist](
	[orderType] [int] NULL,
	[orderId] [varchar](15) NOT NULL,
	[orderDate] [datetime] NOT NULL,
	[orderStatus] [nvarchar](20) NOT NULL,
	[totalPrice] [int] NOT NULL,
	[memberId] [int] NULL,
 CONSTRAINT [PK__orderlis__0809335DAAEE6C12] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
