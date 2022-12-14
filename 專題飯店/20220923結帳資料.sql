USE [chitou]
GO
/****** Object:  Table [dbo].[reservation]    Script Date: 2022/9/23 下午 04:51:02 ******/
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
SET IDENTITY_INSERT [dbo].[reservation] ON 

INSERT [dbo].[reservation] ([reservationID], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName]) VALUES (1, 1, N'我爸', N'123@gmail.com', N'89898989', 1001, N'精緻客房', CAST(N'2022-09-11' AS Date), CAST(N'2022-09-12' AS Date), CAST(N'2022-09-13' AS Date), N'加50張十人床', 500, N'雅杜麗緻')
INSERT [dbo].[reservation] ([reservationID], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName]) VALUES (2, 5, N'我的狗', N'333@gmail.com', N'12121212', 1006, N'破爛套房', CAST(N'2022-09-13' AS Date), CAST(N'2022-09-13' AS Date), CAST(N'2022-09-13' AS Date), N'加一張雙人床', 0, N'智利杜亞')
INSERT [dbo].[reservation] ([reservationID], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName]) VALUES (3, 4, N'我媽', N'111@gmail.com', N'56565656', 1001, N'精緻客房', CAST(N'2022-09-13' AS Date), CAST(N'2022-09-14' AS Date), CAST(N'2022-09-13' AS Date), N'不要床', 1, N'志啞力度')
SET IDENTITY_INSERT [dbo].[reservation] OFF
GO
