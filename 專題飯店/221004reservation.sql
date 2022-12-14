USE [Chitou]
GO
/****** Object:  Table [dbo].[reservation]    Script Date: 2022/10/4 下午 06:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservation](
	[reservationID] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [varchar](15) not NULL,
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
	[orderStatus] [nvarchar](15) not null,
PRIMARY KEY CLUSTERED 
(
	[reservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[reservation] ON 

INSERT [dbo].[reservation] ([reservationID], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName]) VALUES (1, 1, N'我爸', N'123@gmail.com', N'89898989', 1009, N'精緻客房', CAST(N'2022-09-11' AS Date), CAST(N'2022-09-12' AS Date), CAST(N'2022-09-13T00:00:00.000' AS DateTime), N'加50張十人床', 500, N'雅杜麗緻')
INSERT [dbo].[reservation] ([reservationID], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName]) VALUES (2, 5, N'我的狗', N'333@gmail.com', N'12121212', 1010, N'破爛套房', CAST(N'2022-09-13' AS Date), CAST(N'2022-09-13' AS Date), CAST(N'2022-09-13T00:00:00.000' AS DateTime), N'加一張雙人床', 0, N'智利杜亞')
INSERT [dbo].[reservation] ([reservationID], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName]) VALUES (3, 4, N'我媽', N'111@gmail.com', N'56565656', 1014, N'精緻客房', CAST(N'2022-09-13' AS Date), CAST(N'2022-09-14' AS Date), CAST(N'2022-09-13T00:00:00.000' AS DateTime), N'不要床', 1, N'志啞力度')
INSERT [dbo].[reservation] ([reservationID], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName]) VALUES (4, 3, N'我', N'111@gmail', N'78945612', 1022, N'123', CAST(N'2022-09-14' AS Date), CAST(N'2022-09-15' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[reservation] ([reservationID], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName]) VALUES (7, 54, N'very', N'weqewq@gmail.com', N'0909090909', 1020, N'菁英客房二小床', CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04T00:00:00.000' AS DateTime), N'不加床', 2, N'台北 W 飯店')
INSERT [dbo].[reservation] ([reservationID], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName]) VALUES (8, 54, N'very', N'weqewq@gmail.com', N'0909090909', 1009, N'菁英客房二小床', CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04T00:00:00.000' AS DateTime), N'不加床', 2, N'台北大倉久和大飯店')
INSERT [dbo].[reservation] ([reservationID], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName]) VALUES (9, 54, N'very', N'weqewq@gmail.com', N'0909090909', 1022, N'破爛客房二小床', CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04T15:27:12.000' AS DateTime), N'不加床', 2, N'台北大倉久和大飯店')
INSERT [dbo].[reservation] ([reservationID], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName]) VALUES (10, 0, N'123', N'123@gmail.com', N'123', 1022, N'破爛客房二小床', CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04T16:16:06.000' AS DateTime), N'不加床', 2, N'台北大倉久和大飯店')
INSERT [dbo].[reservation] ([reservationID], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName]) VALUES (11, 0, N'321', N'321@gmail', N'321', 1022, N'破爛客房二小床', CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04T16:25:32.000' AS DateTime), N'不加床', 2, N'台北大倉久和大飯店')
INSERT [dbo].[reservation] ([reservationID], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName]) VALUES (12, 0, N'333', N'333@gmail', N'333333', 1022, N'破爛客房二小床', CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04T18:09:19.000' AS DateTime), N'不加床', 2, N'台北大倉久和大飯店')
INSERT [dbo].[reservation] ([reservationID], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName]) VALUES (13, 0, N'333', N'333@gmail', N'333', 1023, N'破爛客房二小床', CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04T18:23:59.000' AS DateTime), N'不加床', 2, N'台北大倉久和大飯店')
SET IDENTITY_INSERT [dbo].[reservation] OFF
GO
