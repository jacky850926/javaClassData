USE [chitou]
GO
SET IDENTITY_INSERT [dbo].[reservation] ON 

INSERT [dbo].[reservation] ([reservationID], [roomID], [roomName], [memberID], [booker], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [numberOfRoom], [hotelName]) VALUES (1, 1001, N'精緻客房', 1, N'我爸', CAST(N'2022-09-11' AS Date), CAST(N'2022-09-12' AS Date), CAST(N'2022-09-13' AS Date), N'加50張十人床', 500, 1, N'雅杜麗緻')
INSERT [dbo].[reservation] ([reservationID], [roomID], [roomName], [memberID], [booker], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [numberOfRoom], [hotelName]) VALUES (2, 1004, N'破爛套房', 5, N'我的狗', CAST(N'2022-09-13' AS Date), CAST(N'2022-09-13' AS Date), CAST(N'2022-09-13' AS Date), N'加一張雙人床', 0, 1, N'智利杜亞')
INSERT [dbo].[reservation] ([reservationID], [roomID], [roomName], [memberID], [booker], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [numberOfRoom], [hotelName]) VALUES (3, 1001, N'精緻客房', 4, N'我媽', CAST(N'2022-09-13' AS Date), CAST(N'2022-09-14' AS Date), CAST(N'2022-09-13' AS Date), N'不要床', 1, 1, N'志啞力度')
INSERT [dbo].[reservation] ([reservationID], [roomID], [roomName], [memberID], [booker], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [numberOfRoom], [hotelName]) VALUES (4, 1007, N'精緻客房', 1, N'我', CAST(N'2022-09-14' AS Date), CAST(N'2022-09-16' AS Date), CAST(N'2022-09-13' AS Date), N'床加滿', 1, 1, N'杜麗雅治')
SET IDENTITY_INSERT [dbo].[reservation] OFF
GO
