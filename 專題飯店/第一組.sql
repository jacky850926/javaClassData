USE [master]
GO
/****** Object:  Database [Chitou]    Script Date: 2022/9/23 下午 08:54:59 ******/
CREATE DATABASE [Chitou]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Chitou', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Chitou.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Chitou_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Chitou_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Chitou] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Chitou].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Chitou] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Chitou] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Chitou] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Chitou] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Chitou] SET ARITHABORT OFF 
GO
ALTER DATABASE [Chitou] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Chitou] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Chitou] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Chitou] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Chitou] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Chitou] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Chitou] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Chitou] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Chitou] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Chitou] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Chitou] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Chitou] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Chitou] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Chitou] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Chitou] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Chitou] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Chitou] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Chitou] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Chitou] SET  MULTI_USER 
GO
ALTER DATABASE [Chitou] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Chitou] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Chitou] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Chitou] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Chitou] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Chitou] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Chitou] SET QUERY_STORE = OFF
GO
USE [Chitou]
GO
/****** Object:  Table [dbo].[adminchitou]    Script Date: 2022/9/23 下午 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adminchitou](
	[adminid] [int] IDENTITY(1,1) NOT NULL,
	[adminstatus] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[permission] [bit] NOT NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[adminid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_admin_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[article]    Script Date: 2022/9/23 下午 08:55:00 ******/
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
/****** Object:  Table [dbo].[Attraction]    Script Date: 2022/9/23 下午 08:55:00 ******/
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
PRIMARY KEY CLUSTERED 
(
	[attraction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[attraction_Luana]    Script Date: 2022/9/23 下午 08:55:00 ******/
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
/****** Object:  Table [dbo].[attractionPlan]    Script Date: 2022/9/23 下午 08:55:00 ******/
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
/****** Object:  Table [dbo].[cart]    Script Date: 2022/9/23 下午 08:55:00 ******/
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
/****** Object:  Table [dbo].[country]    Script Date: 2022/9/23 下午 08:55:00 ******/
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
/****** Object:  Table [dbo].[FlightTicket]    Script Date: 2022/9/23 下午 08:55:00 ******/
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
/****** Object:  Table [dbo].[Hobbyclassification]    Script Date: 2022/9/23 下午 08:55:00 ******/
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
/****** Object:  Table [dbo].[hotel]    Script Date: 2022/9/23 下午 08:55:00 ******/
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
/****** Object:  Table [dbo].[memberbasicinfo]    Script Date: 2022/9/23 下午 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[memberbasicinfo](
	[memberid] [int] IDENTITY(1,1) NOT NULL,
	[statusid] [int] NOT NULL,
	[username] [nvarchar](14) NOT NULL,
	[password] [nvarchar](14) NOT NULL,
	[photo] [nvarchar](max) NULL,
	[email] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_memberbasicinfo] PRIMARY KEY CLUSTERED 
(
	[memberid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[memberdetailinfo]    Script Date: 2022/9/23 下午 08:55:00 ******/
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
/****** Object:  Table [dbo].[orders]    Script Date: 2022/9/23 下午 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[attractionID] [int] NOT NULL,
	[planID] [int] NOT NULL,
	[attractionName] [nvarchar](10) NOT NULL,
	[planName] [nvarchar](10) NOT NULL,
	[planFee] [int] NOT NULL,
	[orderdate] [bigint] NOT NULL,
	[orderstatus] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservation]    Script Date: 2022/9/23 下午 08:55:00 ******/
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
/****** Object:  Table [dbo].[room]    Script Date: 2022/9/23 下午 08:55:00 ******/
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
/****** Object:  Table [dbo].[roomStyle]    Script Date: 2022/9/23 下午 08:55:00 ******/
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
ALTER TABLE [dbo].[orders] ADD  CONSTRAINT [DF__orders__ordersta__71D1E811]  DEFAULT ((1)) FOR [orderstatus]
GO
ALTER TABLE [dbo].[orders] ADD  CONSTRAINT [DF__orders__quantity__72C60C4A]  DEFAULT ((1)) FOR [quantity]
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
USE [master]
GO
ALTER DATABASE [Chitou] SET  READ_WRITE 
GO
