USE [Chitou]
GO
/****** Object:  Table [dbo].[hotel]    Script Date: 2022/9/13 下午 07:01:35 ******/
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
/****** Object:  Table [dbo].[hotelComment]    Script Date: 2022/9/13 下午 07:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotelComment](
	[commentID] [int] NOT NULL,
	[hotelID] [int] NULL,
	[name] [nvarchar](50) NULL,
	[rating] [float] NULL,
	[date] [date] NULL,
	[comment] [nvarchar](50) NULL,
	[photo1] [nchar](10) NULL,
	[photo2] [nchar](10) NULL,
	[photo3] [nchar](10) NULL,
 CONSTRAINT [PK_hotelComment] PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservation]    Script Date: 2022/9/13 下午 07:01:35 ******/
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
/****** Object:  Table [dbo].[room]    Script Date: 2022/9/13 下午 07:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room](
	[roomID] [int] IDENTITY(1,1) NOT NULL,
	[hotelID] [int] NULL,
	[name] [nvarchar](50) NULL,
	[price] [int] NULL,
	[capacity] [nvarchar](50) NULL,
	[totalAmount] [int] not NULL,
	[amount] [int] NULL,
	[bed] [nvarchar](50) NULL,
	[photos] [nvarchar](50) NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_room] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roomDetail]    Script Date: 2022/9/13 下午 07:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roomDetail](
	[roomID] [int] NOT NULL,
	[landSize] [float] NULL,
	[landScape] [nvarchar](50) NULL,
	[addbed] [nvarchar](10) NULL,
	[wifi] [nvarchar](50) NULL,
	[pet] [nvarchar](50) NULL,
	[smoke] [nvarchar](50) NULL,
	[feature] [nvarchar](50) NULL,
	[equipment] [nvarchar](50) NULL,
	[bathroom] [nvarchar](50) NULL,
	[entertainment] [nvarchar](50) NULL,
	[foodAndDrink] [nvarchar](50) NULL,
	[more] [nvarchar](50) NULL,
 CONSTRAINT [PK_roomDetail] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[hotel] ON 

INSERT [dbo].[hotel] ([hotelID], [name], [address], [type], [intro], [country], [phone], [status], [capacity], [owner], [averagePrice], [photos]) VALUES (1, N'台北凱達大飯店', N'萬華區艋舺大道 167 號, 台北市, 10851', N'飯店', N'您不妨考慮入住台北凱達大飯店，住宿提供乾洗/洗衣服務、酒吧/酒廊和健身房等設施服務。住宿附設餐廳Jiayan，有中式料理。提供客房內免費無線上網，旅客可以隨時掌握世界大小事。', N'台灣', N'02-12345678', N'營業中', 200, N'艾妲王', 5000, N'/yee')
INSERT [dbo].[hotel] ([hotelID], [name], [address], [type], [intro], [country], [phone], [status], [capacity], [owner], [averagePrice], [photos]) VALUES (2, N'路境行旅', N'重慶南路一段 86 號, 中正區, 台北市, 10045', N'飯店', N'路境行旅提供機場接駁車、遊樂場和遊戲室等設施服務。此外，除了乾洗/洗衣服務和 24 小時商務中心，住宿還有提供客房內免費無線上網。', N'台灣', N'02-98765432', N'倒閉', 200, N'瑪瑙水母', 20000, N'/yoo')
SET IDENTITY_INSERT [dbo].[hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[reservation] ON 

INSERT [dbo].[reservation] ([reservationID],[roomID], [roomName], [memberID], [booker], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople],[numberOfRoom], [hotelName]) VALUES (1, 1, N'精緻客房', 1, N'我爸', CAST(N'2022-09-11' AS Date), CAST(N'2022-09-12T13:00:00.0000000' AS Date), CAST(N'2022-09-13T11:00:00.0000000' AS Date), N'加50張十人床', 500,1, N'雅杜麗緻')
INSERT [dbo].[reservation] ([reservationID],[roomID], [roomName], [memberID], [booker], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople],[numberOfRoom], [hotelName]) VALUES (2, 5, N'破爛套房', 5, N'我的狗', CAST(N'2022-09-13T11:00:00.0000000' AS Date), CAST(N'2022-09-13T11:00:00.0000000' AS Date), CAST(N'2022-09-13T11:00:00.0000000' AS Date), N'加一張雙人床', 0,1, N'智利杜亞')
INSERT [dbo].[reservation] ([reservationID],[roomID], [roomName], [memberID], [booker], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople],[numberOfRoom], [hotelName]) VALUES (3, 1, N'精緻客房', 4, N'我媽', CAST(N'2022-09-13T03:00:00.0000000' AS Date), CAST(N'2022-09-14T03:00:00.0000000' AS Date), CAST(N'2022-09-13T03:00:00.0000000' AS Date), N'不要床', 1,1, N'志啞力度')
SET IDENTITY_INSERT [dbo].[reservation] OFF
GO
SET IDENTITY_INSERT [dbo].[room] ON 

INSERT [dbo].[room] ([roomID], [hotelID], [name], [price], [capacity],[totalAmount], [amount], [bed], [photos], [status]) VALUES (1, 1, N'精緻客房', 1810, N'3',3, 3, N'1 張標準雙人床
', N'/yye', N'可預訂')
INSERT [dbo].[room] ([roomID], [hotelID], [name], [price], [capacity],[totalAmount], [amount], [bed], [photos], [status]) VALUES (1002, 2, N'總統套房', 99999, N'1',3, 3, N'1', N'/paa', N'整修中')
INSERT [dbo].[room] ([roomID], [hotelID], [name], [price], [capacity],[totalAmount], [amount], [bed], [photos], [status]) VALUES (1005, 1, N'廁所', 5, N'9',1, 1, N'1張馬桶', N'/yoo', N'可以上廁所')
SET IDENTITY_INSERT [dbo].[room] OFF
GO
ALTER TABLE [dbo].[hotelComment]  WITH CHECK ADD  CONSTRAINT [FK_hotelComment_hotel] FOREIGN KEY([hotelID])
REFERENCES [dbo].[hotel] ([hotelID])
GO
ALTER TABLE [dbo].[hotelComment] CHECK CONSTRAINT [FK_hotelComment_hotel]
GO
ALTER TABLE [dbo].[room]  WITH CHECK ADD  CONSTRAINT [FK_room_hotel] FOREIGN KEY([hotelID])
REFERENCES [dbo].[hotel] ([hotelID])
GO
ALTER TABLE [dbo].[room] CHECK CONSTRAINT [FK_room_hotel]
GO
