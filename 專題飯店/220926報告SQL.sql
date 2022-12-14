USE [chitou]
GO
/****** Object:  Table [dbo].[hotel]    Script Date: 2022/9/26 下午 08:02:57 ******/
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
/****** Object:  Table [dbo].[reservation]    Script Date: 2022/9/26 下午 08:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservation](
	[reservationID] [int] IDENTITY(1,1) NOT NULL,
	[memberID] [int] NULL,
	[booker] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[roomID] [int] NULL,
	[roomName] [nvarchar](50) NULL,
	[checkInDate] [date] NULL,
	[checkOutDate] [date] NULL,
	[paymentDate] [date] NULL,
	[addBed] [nvarchar](50) NULL,
	[numberOfPeople] [int] NULL,
	[hotelName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[reservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room]    Script Date: 2022/9/26 下午 08:02:57 ******/
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
/****** Object:  Table [dbo].[roomStyle]    Script Date: 2022/9/26 下午 08:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roomStyle](
	[styleID] [int] IDENTITY(1,1) NOT NULL,
	[hotelID] [int] NULL,
	[name] [nvarchar](50) NULL,
	[capacity] [nvarchar](50) NULL,
	[price] [int] NULL,
	[bed] [nvarchar](50) NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_roomStyle] PRIMARY KEY CLUSTERED 
(
	[styleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[hotel] ON 

INSERT [dbo].[hotel] ([hotelID], [name], [address], [type], [intro], [country], [phone], [status], [capacity], [owner], [averagePrice], [photos]) VALUES (1, N'台北凱達大飯店', N'萬華區艋舺大道 167 號, 台北市, 10851', N'飯店', N'您不妨考慮入住台北凱達大飯店，住宿提供乾洗/洗衣服務、酒吧/酒廊和健身房等設施服務。住宿附設餐廳Jiayan，有中式料理。提供客房內免費無線上網，旅客可以隨時掌握世界大小事。', N'台灣', N'02-12345678', N'營業中', 200, N'艾妲王', 5000, N'/yee')
INSERT [dbo].[hotel] ([hotelID], [name], [address], [type], [intro], [country], [phone], [status], [capacity], [owner], [averagePrice], [photos]) VALUES (2, N'路境行旅', N'重慶南路一段 86 號, 中正區, 台北市, 10045', N'飯店', N'路境行旅提供機場接駁車、遊樂場和遊戲室等設施服務。此外，除了乾洗/洗衣服務和 24 小時商務中心，住宿還有提供客房內免費無線上網。', N'台灣', N'02-98765432', N'倒閉', 200, N'瑪瑙水母', 20000, N'/yoo')
INSERT [dbo].[hotel] ([hotelID], [name], [address], [type], [intro], [country], [phone], [status], [capacity], [owner], [averagePrice], [photos]) VALUES (3, N'台北 W 飯店', N'信義區忠孝東路五段 10 號, 台北市, 110', N'飯店', N'台北 W 飯店提供機場接駁車、池中酒吧和池畔酒吧等設施服務，而且離台北 101很近。想要慰勞自己、放鬆一下嗎？可以到附設的 Spa AWAY SPA做個美體療程、身體去角質或美甲/足部護理。住宿附設 2 間餐廳，有中式料理和早午餐。健身房提供瑜珈課和有氧舞蹈課；此外，台北 W 飯店也有露台、附設購物中心和乾洗/洗衣服務。提供客房內免費無線上網，還有大廳壁爐和酒吧/酒廊。', N'台灣', N'98765432', N'倒閉', 123, N'國父紀念館', 3, N'/pepe')
INSERT [dbo].[hotel] ([hotelID], [name], [address], [type], [intro], [country], [phone], [status], [capacity], [owner], [averagePrice], [photos]) VALUES (1006, N'台北大倉久和大飯店', N'南京東路一段 9 號, 台北市, 10450', N'飯店', N'台北大倉久和大飯店提供咖啡廳、乾洗/洗衣服務和酒吧/酒廊等設施服務，您可以多加利用。想要慰勞自己、放鬆一下嗎？不妨多加利用三溫暖或蒸氣室，也可以去做個美體療程、身體去角質或臉部療程。住宿有 3 間餐廳，提供中式料理。提供客房內免費無線上網，隨時掌握世界大小事，還有健身俱樂部和 24 小時商務中心等設施服務。', N'台灣', N'02-2523-1111', N'營業中', 2000, N'大倉久和', 2300, NULL)
SET IDENTITY_INSERT [dbo].[hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[reservation] ON 

INSERT [dbo].[reservation] ([reservationID], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName]) VALUES (1, 1, N'我爸', N'123@gmail.com', N'89898989', 1001, N'精緻客房', CAST(N'2022-09-11' AS Date), CAST(N'2022-09-12' AS Date), CAST(N'2022-09-13' AS Date), N'加50張十人床', 500, N'雅杜麗緻')
INSERT [dbo].[reservation] ([reservationID], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName]) VALUES (2, 5, N'我的狗', N'333@gmail.com', N'12121212', 1006, N'破爛套房', CAST(N'2022-09-13' AS Date), CAST(N'2022-09-13' AS Date), CAST(N'2022-09-13' AS Date), N'加一張雙人床', 0, N'智利杜亞')
INSERT [dbo].[reservation] ([reservationID], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName]) VALUES (3, 4, N'我媽', N'111@gmail.com', N'56565656', 1001, N'精緻客房', CAST(N'2022-09-13' AS Date), CAST(N'2022-09-14' AS Date), CAST(N'2022-09-13' AS Date), N'不要床', 1, N'志啞力度')
SET IDENTITY_INSERT [dbo].[reservation] OFF
GO
SET IDENTITY_INSERT [dbo].[room] ON 

INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1001, 1)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1004, 3)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1006, 5)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1007, 1)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1008, 3)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1009, 5)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1010, 1)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1011, 3)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1012, 3)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1013, 3)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (2014, 1006)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (2015, 1006)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (2016, 1006)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (2022, 1008)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (2023, 1008)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (2024, 1008)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (2025, 1008)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (2026, 1008)
SET IDENTITY_INSERT [dbo].[room] OFF
GO
SET IDENTITY_INSERT [dbo].[roomStyle] ON 

INSERT [dbo].[roomStyle] ([styleID], [hotelID], [name], [capacity], [price], [bed], [status]) VALUES (1, 1, N'精緻客房', N'3', 1810, N'1 張標準雙人床', N'整修中')
INSERT [dbo].[roomStyle] ([styleID], [hotelID], [name], [capacity], [price], [bed], [status]) VALUES (3, 1, N'總統套房', N'1', 99999, N'1', N'可預訂')
INSERT [dbo].[roomStyle] ([styleID], [hotelID], [name], [capacity], [price], [bed], [status]) VALUES (5, 1, N'廁所', N'1', 5, N'1張馬桶', N'可以上廁所')
INSERT [dbo].[roomStyle] ([styleID], [hotelID], [name], [capacity], [price], [bed], [status]) VALUES (1006, NULL, N'qweqwe', N'33', 800, N'55', N'客滿')
INSERT [dbo].[roomStyle] ([styleID], [hotelID], [name], [capacity], [price], [bed], [status]) VALUES (1008, 1006, N'菁英客房二小床', N'最多可入住 4 人 (含所有額外成人與孩童)', 4481, N'2 張單人床', N'開放')
SET IDENTITY_INSERT [dbo].[roomStyle] OFF
GO
ALTER TABLE [dbo].[room]  WITH CHECK ADD  CONSTRAINT [FK_room_roomStyle] FOREIGN KEY([roomStyleID])
REFERENCES [dbo].[roomStyle] ([styleID])
GO
ALTER TABLE [dbo].[room] CHECK CONSTRAINT [FK_room_roomStyle]
GO
ALTER TABLE [dbo].[roomStyle]  WITH CHECK ADD  CONSTRAINT [FK_roomStyle_hotel] FOREIGN KEY([hotelID])
REFERENCES [dbo].[hotel] ([hotelID])
GO
ALTER TABLE [dbo].[roomStyle] CHECK CONSTRAINT [FK_roomStyle_hotel]
GO
