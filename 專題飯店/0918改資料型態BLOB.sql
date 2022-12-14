USE [chitou]
GO
/****** Object:  Table [dbo].[hotel]    Script Date: 2022/9/18 下午 10:26:43 ******/
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
 CONSTRAINT [PK_hotel] PRIMARY KEY CLUSTERED 
(
	[hotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservation]    Script Date: 2022/9/18 下午 10:26:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservation](
	[reservationID] [int] IDENTITY(1,1) NOT NULL,
	[roomID] [int] NULL,
	[roomName] [nvarchar](50) NULL,
	[memberID] [int] NULL,
	[booker] [nvarchar](50) NULL,
	[checkInDate] [date] NULL,
	[checkOutDate] [date] NULL,
	[paymentDate] [date] NULL,
	[addBed] [nvarchar](50) NULL,
	[numberOfPeople] [int] NULL,
	[numberOfRoom] [int] NULL,
	[hotelName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[reservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room]    Script Date: 2022/9/18 下午 10:26:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room](
	[roomID] [int] IDENTITY(1000,1) NOT NULL,
	[roomStyleID] [int] NULL,
 CONSTRAINT [PK_room] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roomOrder]    Script Date: 2022/9/18 下午 10:26:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roomOrder](
	[roomOrderID] [int] IDENTITY(1,1) NOT NULL,
	[reservationID] [int] NOT NULL,
	[roomStyleID] [int] NOT NULL,
	[numberOfRoom] [int] NOT NULL,
 CONSTRAINT [PK_roomOrder] PRIMARY KEY CLUSTERED 
(
	[roomOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roomStyle]    Script Date: 2022/9/18 下午 10:26:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roomStyle](
	[styleID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[capacity] [nvarchar](50) NULL,
	[price] [int] NULL,
	[bed] [nvarchar](50) NULL,
	[photos] [nvarchar](50) NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_roomStyle] PRIMARY KEY CLUSTERED 
(
	[styleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[hotel] ON 

INSERT [dbo].[hotel] ([hotelID], [name], [address], [type], [intro], [country], [phone], [status], [capacity], [owner], [averagePrice]) VALUES (1, N'台北凱達大飯店', N'萬華區艋舺大道 167 號, 台北市, 10851', N'飯店', N'您不妨考慮入住台北凱達大飯店，住宿提供乾洗/洗衣服務、酒吧/酒廊和健身房等設施服務。住宿附設餐廳Jiayan，有中式料理。提供客房內免費無線上網，旅客可以隨時掌握世界大小事。', N'台灣', N'02-12345678', N'營業中', 200, N'艾妲王', 5000)
INSERT [dbo].[hotel] ([hotelID], [name], [address], [type], [intro], [country], [phone], [status], [capacity], [owner], [averagePrice]) VALUES (2, N'路境行旅', N'重慶南路一段 86 號, 中正區, 台北市, 10045', N'飯店', N'路境行旅提供機場接駁車、遊樂場和遊戲室等設施服務。此外，除了乾洗/洗衣服務和 24 小時商務中心，住宿還有提供客房內免費無線上網。', N'台灣', N'02-98765432', N'倒閉', 200, N'瑪瑙水母', 20000)
INSERT [dbo].[hotel] ([hotelID], [name], [address], [type], [intro], [country], [phone], [status], [capacity], [owner], [averagePrice]) VALUES (3, N'台北 W 飯店', N'信義區忠孝東路五段 10 號, 台北市, 110', N'飯店', N'台北 W 飯店提供機場接駁車、池中酒吧和池畔酒吧等設施服務，而且離台北 101很近。想要慰勞自己、放鬆一下嗎？可以到附設的 Spa AWAY SPA做個美體療程、身體去角質或美甲/足部護理。住宿附設 2 間餐廳，有中式料理和早午餐。健身房提供瑜珈課和有氧舞蹈課；此外，台北 W 飯店也有露台、附設購物中心和乾洗/洗衣服務。提供客房內免費無線上網，還有大廳壁爐和酒吧/酒廊。', N'台灣', N'98765432', N'倒閉', 123, N'國父紀念館', 3)
SET IDENTITY_INSERT [dbo].[hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[reservation] ON 

INSERT [dbo].[reservation] ([reservationID], [roomID], [roomName], [memberID], [booker], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [numberOfRoom], [hotelName]) VALUES (1, 1001, N'精緻客房', 1, N'我爸', CAST(N'2022-09-11' AS Date), CAST(N'2022-09-12' AS Date), CAST(N'2022-09-13' AS Date), N'加50張十人床', 500, 1, N'雅杜麗緻')
INSERT [dbo].[reservation] ([reservationID], [roomID], [roomName], [memberID], [booker], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [numberOfRoom], [hotelName]) VALUES (2, 1004, N'破爛套房', 5, N'我的狗', CAST(N'2022-09-13' AS Date), CAST(N'2022-09-13' AS Date), CAST(N'2022-09-13' AS Date), N'加一張雙人床', 0, 1, N'智利杜亞')
INSERT [dbo].[reservation] ([reservationID], [roomID], [roomName], [memberID], [booker], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [numberOfRoom], [hotelName]) VALUES (3, 1001, N'精緻客房', 4, N'我媽', CAST(N'2022-09-13' AS Date), CAST(N'2022-09-14' AS Date), CAST(N'2022-09-13' AS Date), N'不要床', 1, 1, N'志啞力度')
INSERT [dbo].[reservation] ([reservationID], [roomID], [roomName], [memberID], [booker], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [numberOfRoom], [hotelName]) VALUES (4, 1007, N'精緻客房', 1, N'我', CAST(N'2022-09-14' AS Date), CAST(N'2022-09-16' AS Date), CAST(N'2022-09-13' AS Date), N'床加滿', 1, 1, N'杜麗雅治')
SET IDENTITY_INSERT [dbo].[reservation] OFF
GO
SET IDENTITY_INSERT [dbo].[room] ON 

INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1001, 1)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1004, 3)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1006, 5)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1007, 1)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1008, 3)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1009, 5)
SET IDENTITY_INSERT [dbo].[room] OFF
GO
SET IDENTITY_INSERT [dbo].[roomStyle] ON 

INSERT [dbo].[roomStyle] ([styleID], [name], [capacity], [price], [bed], [photos], [status]) VALUES (1, N'精緻客房', N'3', 1810, N'1 張標準雙人床', N'/paa', N'整修中')
INSERT [dbo].[roomStyle] ([styleID], [name], [capacity], [price], [bed], [photos], [status]) VALUES (3, N'總統套房', N'1', 99999, N'1', N'/paaa', N'可預訂')
INSERT [dbo].[roomStyle] ([styleID], [name], [capacity], [price], [bed], [photos], [status]) VALUES (5, N'廁所', N'1', 5, N'1張馬桶', N'/yoo', N'可以上廁所')
SET IDENTITY_INSERT [dbo].[roomStyle] OFF
GO
ALTER TABLE [dbo].[room]  WITH CHECK ADD  CONSTRAINT [FK_room_roomStyle] FOREIGN KEY([roomStyleID])
REFERENCES [dbo].[roomStyle] ([styleID])
GO
ALTER TABLE [dbo].[room] CHECK CONSTRAINT [FK_room_roomStyle]
GO
ALTER TABLE [dbo].[roomOrder]  WITH CHECK ADD  CONSTRAINT [FK_roomOrder_reservation] FOREIGN KEY([reservationID])
REFERENCES [dbo].[reservation] ([reservationID])
GO
ALTER TABLE [dbo].[roomOrder] CHECK CONSTRAINT [FK_roomOrder_reservation]
GO
