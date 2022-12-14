USE [Chitou]
GO
/****** Object:  Table [dbo].[adminchitou]    Script Date: 2022/10/4 下午 08:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adminchitou](
	[adminid] [int] IDENTITY(1,1) NOT NULL,
	[adminstatus] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[permission] [bit] NOT NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[adminid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[article]    Script Date: 2022/10/4 下午 08:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[article](
	[postid] [int] IDENTITY(1,1) NOT NULL,
	[posterid] [int] NOT NULL,
	[countryid] [int] NOT NULL,
	[typeid] [int] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[title] [nvarchar](30) NOT NULL,
	[date] [nvarchar](12) NOT NULL,
	[photo] [nvarchar](max) NULL,
 CONSTRAINT [wenzhang_pk] PRIMARY KEY CLUSTERED 
(
	[postid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attraction]    Script Date: 2022/10/4 下午 08:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attraction](
	[attraction_id] [int] NOT NULL,
	[prefer_id] [int] NOT NULL,
	[attraction_name] [nvarchar](20) NULL,
	[attraction_location] [nvarchar](30) NULL,
	[attraction_description] [nvarchar](max) NULL,
	[attraction_notice] [nvarchar](max) NULL,
	[photo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[attraction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[attraction_Luana]    Script Date: 2022/10/4 下午 08:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attraction_Luana](
	[attractionID] [int] IDENTITY(1,1) NOT NULL,
	[prefer_id] [int] NOT NULL,
	[name] [nvarchar](14) NOT NULL,
	[location] [nvarchar](20) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[photo1] [nvarchar](max) NULL,
 CONSTRAINT [attraction_pk] PRIMARY KEY CLUSTERED 
(
	[attractionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[attractionOrderDetail]    Script Date: 2022/10/4 下午 08:27:31 ******/
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
/****** Object:  Table [dbo].[attractionPlan]    Script Date: 2022/10/4 下午 08:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attractionPlan](
	[planID] [int] IDENTITY(1,1) NOT NULL,
	[attractionID] [int] NOT NULL,
	[planName] [nvarchar](20) NOT NULL,
	[planFee] [int] NOT NULL,
 CONSTRAINT [plan_pk] PRIMARY KEY CLUSTERED 
(
	[planID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 2022/10/4 下午 08:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[itemId] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[planId] [int] NOT NULL,
	[attractionId] [int] NOT NULL,
	[attractionName] [nvarchar](50) NOT NULL,
	[planName] [nvarchar](50) NOT NULL,
	[planFee] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[itemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 2022/10/4 下午 08:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[countryID] [int] NOT NULL,
	[countryName] [nvarchar](20) NOT NULL,
	[countryModerator] [nvarchar](20) NULL,
	[countryIntro] [nvarchar](max) NULL,
 CONSTRAINT [country_pk] PRIMARY KEY CLUSTERED 
(
	[countryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlightTicket]    Script Date: 2022/10/4 下午 08:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlightTicket](
	[flightID] [varchar](14) NOT NULL,
	[classID] [int] NOT NULL,
	[departureTime] [datetime] NOT NULL,
	[arrivalTime] [datetime] NOT NULL,
	[fare] [int] NOT NULL,
	[airline] [nvarchar](10) NOT NULL,
	[originID] [nvarchar](14) NOT NULL,
	[destinationID] [nvarchar](14) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hobbyclassification]    Script Date: 2022/10/4 下午 08:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hobbyclassification](
	[prefer_id] [int] NOT NULL,
	[prefer_name] [nvarchar](10) NULL,
	[prefer_descrip] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[prefer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hotel]    Script Date: 2022/10/4 下午 08:27:31 ******/
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
/****** Object:  Table [dbo].[memberbasicinfo]    Script Date: 2022/10/4 下午 08:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[memberbasicinfo](
	[memberid] [int] IDENTITY(1,1) NOT NULL,
	[statusid] [int] NOT NULL,
	[username] [nvarchar](14) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[photo] [nvarchar](max) NULL,
	[email] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_memberbasicinfo] PRIMARY KEY CLUSTERED 
(
	[memberid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[memberdetailinfo]    Script Date: 2022/10/4 下午 08:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[memberdetailinfo](
	[memberid] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[nickname] [nvarchar](50) NULL,
	[nationality] [nvarchar](50) NULL,
	[birth] [datetime] NULL,
	[gender] [nvarchar](10) NULL,
	[createtime] [datetime] NULL,
	[modifytime] [datetime] NULL,
 CONSTRAINT [PK_memberdetailinfo] PRIMARY KEY CLUSTERED 
(
	[memberid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderlist]    Script Date: 2022/10/4 下午 08:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderlist](
	[orderType] [nvarchar](10) NULL,
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
/****** Object:  Table [dbo].[reservation]    Script Date: 2022/10/4 下午 08:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservation](
	[reservationID] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [varchar](15) NOT NULL,
	[memberID] [int] NULL,
	[booker] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[roomID] [int] NULL,
	[roomName] [nvarchar](50) NULL,
	[checkInDate] [date] NULL,
	[checkOutDate] [date] NULL,
	[paymentDate] [datetime] NULL,
	[addBed] [nvarchar](50) NULL,
	[numberOfPeople] [int] NULL,
	[hotelName] [nvarchar](50) NULL,
	[orderStatus] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[reservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room]    Script Date: 2022/10/4 下午 08:27:31 ******/
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
/****** Object:  Table [dbo].[roomStyle]    Script Date: 2022/10/4 下午 08:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roomStyle](
	[styleID] [int] IDENTITY(1,1) NOT NULL,
	[hotelID] [int] NULL,
	[name] [nvarchar](50) NULL,
	[capacity] [int] NULL,
	[price] [int] NULL,
	[bed] [nvarchar](50) NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_roomStyle] PRIMARY KEY CLUSTERED 
(
	[styleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[adminchitou] ON 

INSERT [dbo].[adminchitou] ([adminid], [adminstatus], [username], [password], [permission]) VALUES (1003, 1, N'admin', N'$2a$10$4r.U7nnYk2cpXEzswPK2BekxBdF9GrW4xtcHVbWdk2A6bpkJZg.2a', 1)
INSERT [dbo].[adminchitou] ([adminid], [adminstatus], [username], [password], [permission]) VALUES (1004, 2, N'manager', N'$2a$10$.dhFBkVag5jrWSeMB3mQhOPWN4.gNWDF6Bt4Hc/LqhjJBDE.opo9G', 1)
INSERT [dbo].[adminchitou] ([adminid], [adminstatus], [username], [password], [permission]) VALUES (1005, 3, N'boss', N'$2a$10$8umK1PBtam7GuZy/fQp/J.z16MIq8H1ww9BY3lvBVzcvYgRbnjefy', 1)
SET IDENTITY_INSERT [dbo].[adminchitou] OFF
GO
SET IDENTITY_INSERT [dbo].[attractionPlan] ON 

INSERT [dbo].[attractionPlan] ([planID], [attractionID], [planName], [planFee]) VALUES (1, 1, N'name', 3)
SET IDENTITY_INSERT [dbo].[attractionPlan] OFF
GO
INSERT [dbo].[Hobbyclassification] ([prefer_id], [prefer_name], [prefer_descrip]) VALUES (1, N'eeee', N'eat')
GO
SET IDENTITY_INSERT [dbo].[hotel] ON 

INSERT [dbo].[hotel] ([hotelID], [name], [address], [type], [intro], [country], [phone], [status], [capacity], [owner], [averagePrice], [photos]) VALUES (1, N'台北凱達大飯店', N'萬華區艋舺大道 167 號, 台北市, 10851', N'飯店', N'您不妨考慮入住台北凱達大飯店，住宿提供乾洗/洗衣服務、酒吧/酒廊和健身房等設施服務。住宿附設餐廳Jiayan，有中式料理。提供客房內免費無線上網，旅客可以隨時掌握世界大小事。', N'台灣', N'02-12345678', N'營業中', 200, N'艾妲王', 5000, N'/yee')
INSERT [dbo].[hotel] ([hotelID], [name], [address], [type], [intro], [country], [phone], [status], [capacity], [owner], [averagePrice], [photos]) VALUES (2, N'路境行旅', N'重慶南路一段 86 號, 中正區, 台北市, 10045', N'飯店', N'路境行旅提供機場接駁車、遊樂場和遊戲室等設施服務。此外，除了乾洗/洗衣服務和 24 小時商務中心，住宿還有提供客房內免費無線上網。', N'台灣', N'02-98765432', N'倒閉', 200, N'瑪瑙水母', 20000, N'/yoo')
INSERT [dbo].[hotel] ([hotelID], [name], [address], [type], [intro], [country], [phone], [status], [capacity], [owner], [averagePrice], [photos]) VALUES (3, N'台北 W 飯店', N'信義區忠孝東路五段 10 號, 台北市, 110', N'飯店', N'台北 W 飯店提供機場接駁車、池中酒吧和池畔酒吧等設施服務，而且離台北 101很近。想要慰勞自己、放鬆一下嗎？可以到附設的 Spa AWAY SPA做個美體療程、身體去角質或美甲/足部護理。住宿附設 2 間餐廳，有中式料理和早午餐。健身房提供瑜珈課和有氧舞蹈課；此外，台北 W 飯店也有露台、附設購物中心和乾洗/洗衣服務。提供客房內免費無線上網，還有大廳壁爐和酒吧/酒廊。', N'台灣', N'98765432', N'倒閉', 123, N'國父紀念館', 3, N'/pepe')
INSERT [dbo].[hotel] ([hotelID], [name], [address], [type], [intro], [country], [phone], [status], [capacity], [owner], [averagePrice], [photos]) VALUES (7, N'台北大倉久和大飯店', N'南京東路一段 9 號, 台北市, 10450', N'飯店', N'台北大倉久和大飯店提供咖啡廳、乾洗/洗衣服務和酒吧/酒廊等設施服務，您可以多加利用。想要慰勞自己、放鬆一下嗎？不妨多加利用三溫暖或蒸氣室，也可以去做個美體療程、身體去角質或臉部療程。住宿有 3 間餐廳，提供中式料理。提供客房內免費無線上網，隨時掌握世界大小事，還有健身俱樂部和 24 小時商務中心等設施服務。', N'台灣', N'02-2523-1111', N'營業中', 2000, N'大倉久和', 2000, NULL)
SET IDENTITY_INSERT [dbo].[hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[memberbasicinfo] ON 

INSERT [dbo].[memberbasicinfo] ([memberid], [statusid], [username], [password], [photo], [email]) VALUES (54, 4, N'very', N'$2a$10$tYYAl8AQ9SbDygx.zOJCzelldoIAI9i2YkWG35J9ZcVUs5OLeX0FW', N'images/jacky/login/20221002d38b380be03060bc284024ec61f60e59.jpg', N'weqewq@gmail.com')
INSERT [dbo].[memberbasicinfo] ([memberid], [statusid], [username], [password], [photo], [email]) VALUES (58, 4, N'kitty', N'$2a$10$GDR8SUIYLQ6yTq8TAz.MrO8rBF9tf2XuiqzV8snt6W/0w0t4.31Gm', N'images/jacky/login/20221002d38b380be03060bc284024ec61f60e59.jpg', N'yyy@gmail.com')
SET IDENTITY_INSERT [dbo].[memberbasicinfo] OFF
GO
INSERT [dbo].[memberdetailinfo] ([memberid], [name], [phone], [address], [nickname], [nationality], [birth], [gender], [createtime], [modifytime]) VALUES (54, NULL, N'0909090909', N'654321987', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[memberdetailinfo] ([memberid], [name], [phone], [address], [nickname], [nationality], [birth], [gender], [createtime], [modifytime]) VALUES (58, NULL, N'0909090909', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[orderlist] ([orderType], [orderId], [orderDate], [orderStatus], [totalPrice], [memberId]) VALUES (N'飯店', N'B183a2d8b123', CAST(N'2022-10-04T19:55:00.000' AS DateTime), N'已付款', 4481, 0)
INSERT [dbo].[orderlist] ([orderType], [orderId], [orderDate], [orderStatus], [totalPrice], [memberId]) VALUES (N'飯店', N'B183a2dc3866', CAST(N'2022-10-04T19:58:58.000' AS DateTime), N'已付款', 4481, 0)
GO
SET IDENTITY_INSERT [dbo].[reservation] ON 

INSERT [dbo].[reservation] ([reservationID], [orderId], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName], [orderStatus]) VALUES (1, N'B183a2d8b123', 0, N'123', N'123@gmail.com', N'123', 1020, N'菁英客房二小床', CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04T19:55:00.000' AS DateTime), N'不加床', 2, N'台北 W 飯店', N'已付款')
INSERT [dbo].[reservation] ([reservationID], [orderId], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName], [orderStatus]) VALUES (2, N'B183a2dc3866', 0, N'321', N'123@gmail.com', N'321', 1021, N'皇家客房一小床', CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04T19:58:58.000' AS DateTime), N'不加床', 2, N'台北 W 飯店', N'已付款')
SET IDENTITY_INSERT [dbo].[reservation] OFF
GO
SET IDENTITY_INSERT [dbo].[room] ON 

INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1009, 2)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1015, 5)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1016, 5)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1017, 5)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1018, 5)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1019, 5)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1020, 6)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1021, 7)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1022, 8)
INSERT [dbo].[room] ([roomID], [roomStyleID]) VALUES (1023, 8)
SET IDENTITY_INSERT [dbo].[room] OFF
GO
SET IDENTITY_INSERT [dbo].[roomStyle] ON 

INSERT [dbo].[roomStyle] ([styleID], [hotelID], [name], [capacity], [price], [bed], [status]) VALUES (2, 7, N'菁英客房二小床', 4, 4481, N'2 張單人床', N'開放')
INSERT [dbo].[roomStyle] ([styleID], [hotelID], [name], [capacity], [price], [bed], [status]) VALUES (5, 1, N'菁英客房二小床', 4, 4481, N'2 張單人床', N'開放')
INSERT [dbo].[roomStyle] ([styleID], [hotelID], [name], [capacity], [price], [bed], [status]) VALUES (6, 3, N'菁英客房二小床', 4, 4481, N'2 張單人床', N'開放')
INSERT [dbo].[roomStyle] ([styleID], [hotelID], [name], [capacity], [price], [bed], [status]) VALUES (7, 3, N'皇家客房一小床', 4, 4481, N'2 張單人床', N'開放')
INSERT [dbo].[roomStyle] ([styleID], [hotelID], [name], [capacity], [price], [bed], [status]) VALUES (8, 7, N'破爛客房二小床', 4, 4481, N'2 張單人床', N'開放')
SET IDENTITY_INSERT [dbo].[roomStyle] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_admin_username]    Script Date: 2022/10/4 下午 08:27:31 ******/
ALTER TABLE [dbo].[adminchitou] ADD  CONSTRAINT [UK_admin_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_email]    Script Date: 2022/10/4 下午 08:27:31 ******/
ALTER TABLE [dbo].[memberbasicinfo] ADD  CONSTRAINT [UK_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_username]    Script Date: 2022/10/4 下午 08:27:31 ******/
ALTER TABLE [dbo].[memberbasicinfo] ADD  CONSTRAINT [UK_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[article]  WITH CHECK ADD FOREIGN KEY([countryid])
REFERENCES [dbo].[country] ([countryID])
GO
ALTER TABLE [dbo].[Attraction]  WITH CHECK ADD FOREIGN KEY([prefer_id])
REFERENCES [dbo].[Hobbyclassification] ([prefer_id])
GO
ALTER TABLE [dbo].[memberdetailinfo]  WITH CHECK ADD  CONSTRAINT [FK_memberdetailinfo_memberbasicinfo] FOREIGN KEY([memberid])
REFERENCES [dbo].[memberbasicinfo] ([memberid])
GO
ALTER TABLE [dbo].[memberdetailinfo] CHECK CONSTRAINT [FK_memberdetailinfo_memberbasicinfo]
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
