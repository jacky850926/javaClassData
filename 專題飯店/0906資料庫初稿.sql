USE [Chitou]
GO
/****** Object:  Table [dbo].[hotel]    Script Date: 2022/9/6 下午 08:44:56 ******/
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
	[phone] [int] NULL,
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
/****** Object:  Table [dbo].[hotelComment]    Script Date: 2022/9/6 下午 08:44:56 ******/
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
 CONSTRAINT [PK_hotelComment] PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room]    Script Date: 2022/9/6 下午 08:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room](
	[roomID] [int] NOT NULL,
	[hotelID] [int] NULL,
	[roomNumber] [int] NULL,
	[name] [nvarchar](50) NULL,
	[price] [int] NULL,
	[capacity] [int] NULL,
	[amount] [int] NULL,
	[addBed] [int] NULL,
	[description] [nvarchar](max) NULL,
	[notice] [nvarchar](max) NULL,
	[photos] [nchar](10) NULL,
	[status] [nchar](10) NOT NULL,
 CONSTRAINT [PK_room] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roomDetail]    Script Date: 2022/9/6 下午 08:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roomDetail](
	[roomID] [int] NOT NULL,
	[landSize] [float] NULL,
	[landScape] [nvarchar](50) NULL,
	[bed] [nvarchar](10) NULL,
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
ALTER TABLE [dbo].[roomDetail]  WITH CHECK ADD  CONSTRAINT [FK_roomDetail_room] FOREIGN KEY([roomID])
REFERENCES [dbo].[room] ([roomID])
GO
ALTER TABLE [dbo].[roomDetail] CHECK CONSTRAINT [FK_roomDetail_room]
GO
