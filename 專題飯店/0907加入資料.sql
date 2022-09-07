USE [Chitou]
GO
/****** Object:  Table [dbo].[hotel]    Script Date: 2022/9/7 下午 08:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotel](
	[hotelID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[type] [nvarchar](10) NULL,
	[intro] [nvarchar](max) NULL,
	[country] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[status] [nvarchar](10) NULL,
	[capacity] [int] NULL,
	[owner] [nvarchar](50) NULL,
	[averagePrice] [int] NULL,
	[photos] [nvarchar](50) NULL,
 CONSTRAINT [PK_hotel] PRIMARY KEY CLUSTERED 
(
	[hotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[hotel] ON 

INSERT [dbo].[hotel] ([hotelID], [name], [address], [type], [intro], [country], [phone], [status], [capacity], [owner], [averagePrice], [photos]) VALUES (1, N'台北凱達大飯店', N'萬華區艋舺大道 167 號, 台北市, 10851', N'飯店', N'您不妨考慮入住台北凱達大飯店，住宿提供乾洗/洗衣服務、酒吧/酒廊和健身房等設施服務。住宿附設餐廳Jiayan，有中式料理。提供客房內免費無線上網，旅客可以隨時掌握世界大小事。', N'台灣', N'02-12345678', N'營業中', 200, N'艾妲王', 5000, N'/yee')
INSERT [dbo].[hotel] ([hotelID], [name], [address], [type], [intro], [country], [phone], [status], [capacity], [owner], [averagePrice], [photos]) VALUES (2, N'路境行旅', N'重慶南路一段 86 號, 中正區, 台北市, 10045', N'飯店', N'路境行旅提供機場接駁車、遊樂場和遊戲室等設施服務。此外，除了乾洗/洗衣服務和 24 小時商務中心，住宿還有提供客房內免費無線上網。', N'台灣', N'02-98765432', N'倒閉', 200, N'瑪瑙水母', 20000, N'/yoo')
SET IDENTITY_INSERT [dbo].[hotel] OFF
GO
