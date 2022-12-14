USE [master]
GO
/****** Object:  Database [Chitou]    Script Date: 2022/10/11 下午 08:16:57 ******/
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
/****** Object:  Table [dbo].[adminchitou]    Script Date: 2022/10/11 下午 08:16:57 ******/
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
/****** Object:  Table [dbo].[article]    Script Date: 2022/10/11 下午 08:16:57 ******/
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
/****** Object:  Table [dbo].[Attraction]    Script Date: 2022/10/11 下午 08:16:57 ******/
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
/****** Object:  Table [dbo].[attraction_Luana]    Script Date: 2022/10/11 下午 08:16:57 ******/
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
/****** Object:  Table [dbo].[attractionOrderDetail]    Script Date: 2022/10/11 下午 08:16:57 ******/
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
/****** Object:  Table [dbo].[attractionPlan]    Script Date: 2022/10/11 下午 08:16:57 ******/
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
/****** Object:  Table [dbo].[cart]    Script Date: 2022/10/11 下午 08:16:57 ******/
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
	[memberid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[itemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 2022/10/11 下午 08:16:57 ******/
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
/****** Object:  Table [dbo].[FlightTicket]    Script Date: 2022/10/11 下午 08:16:57 ******/
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
/****** Object:  Table [dbo].[Hobbyclassification]    Script Date: 2022/10/11 下午 08:16:57 ******/
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
/****** Object:  Table [dbo].[hotel]    Script Date: 2022/10/11 下午 08:16:57 ******/
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
/****** Object:  Table [dbo].[loginstatus]    Script Date: 2022/10/11 下午 08:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loginstatus](
	[statusid] [int] NOT NULL,
	[statusname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_loginstatus] PRIMARY KEY CLUSTERED 
(
	[statusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[memberbasicinfo]    Script Date: 2022/10/11 下午 08:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[memberbasicinfo](
	[memberid] [int] IDENTITY(1,1) NOT NULL,
	[statusid] [int] NOT NULL,
	[username] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[photo] [nvarchar](max) NULL,
	[email] [nvarchar](200) NOT NULL,
	[verificationcode] [nvarchar](100) NULL,
 CONSTRAINT [PK_memberbasicinfo] PRIMARY KEY CLUSTERED 
(
	[memberid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[memberdetailinfo]    Script Date: 2022/10/11 下午 08:16:57 ******/
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
	[createtime] [datetime2](7) NULL,
	[modifytime] [datetime2](7) NULL,
 CONSTRAINT [PK_memberdetailinfo] PRIMARY KEY CLUSTERED 
(
	[memberid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderlist]    Script Date: 2022/10/11 下午 08:16:57 ******/
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
/****** Object:  Table [dbo].[Pricingplan]    Script Date: 2022/10/11 下午 08:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pricingplan](
	[plan_id] [int] NOT NULL,
	[attraction_id] [int] NOT NULL,
	[plan_name] [nvarchar](20) NULL,
	[plan_fee] [int] NULL,
	[plan_discript] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[plan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservation]    Script Date: 2022/10/11 下午 08:16:57 ******/
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
	[hotelID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[reservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room]    Script Date: 2022/10/11 下午 08:16:57 ******/
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
/****** Object:  Table [dbo].[roomStyle]    Script Date: 2022/10/11 下午 08:16:57 ******/
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
INSERT [dbo].[adminchitou] ([adminid], [adminstatus], [username], [password], [permission]) VALUES (1006, 3, N'noauth', N'123', 1)
SET IDENTITY_INSERT [dbo].[adminchitou] OFF
GO
INSERT [dbo].[Attraction] ([attraction_id], [prefer_id], [attraction_name], [attraction_location], [attraction_description], [attraction_notice], [photo]) VALUES (11111, 1, N'六福村', N'306新竹縣關西鎮60號', N'<p>Xpark 為台灣首座新都會型水生公園。將生活在地球上各種地域的生物們的環境，透過空間演出與科技的融合，加以忠實的重現。在連氣溫、濕度、味道及聲音都經過縝密計算的空間裡，從天花板到地坪、延伸至水槽的影像演出呈現出 360° 具魄力的沉浸式空間。來訪旅客彷彿真的身歷其境，使用五感體驗各真實場景。主角，是生活在那裡的生物們，隨環境變遷而演變進化的生物們的不思議，從各種角度將其魅力性襯托出來的環境演出也是一大特徵。Xpark 是一個滿足人們無止盡的「對於求知的慾望和獲知的喜悅」，並在世界上也是獨一無二的寓教於樂設施。</p>', NULL, NULL)
INSERT [dbo].[Attraction] ([attraction_id], [prefer_id], [attraction_name], [attraction_location], [attraction_description], [attraction_notice], [photo]) VALUES (67890, 1, N'Xpark', N'320桃園市中壢區春德路105號', N'<p>Xpark 為台灣首座新都會型水生公園。將生活在地球上各種地域的生物們的環境，透過空間演出與科技的融合，加以忠實的重現。在連氣溫、濕度、味道及聲音都經過縝密計算的空間裡，從天花板到地坪、延伸至水槽的影像演出呈現出 360° 具魄力的沉浸式空間。來訪旅客彷彿真的身歷其境，使用五感體驗各真實場景。主角，是生活在那裡的生物們，隨環境變遷而演變進化的生物們的不思議，從各種角度將其魅力性襯托出來的環境演出也是一大特徵。Xpark 是一個滿足人們無止盡的「對於求知的慾望和獲知的喜悅」，並在世界上也是獨一無二的寓教於樂設施。</p>', NULL, N'f07f8feb.jpg')
GO
SET IDENTITY_INSERT [dbo].[attractionPlan] ON 

INSERT [dbo].[attractionPlan] ([planID], [attractionID], [planName], [planFee]) VALUES (1, 1, N'name', 3)
SET IDENTITY_INSERT [dbo].[attractionPlan] OFF
GO
SET IDENTITY_INSERT [dbo].[cart] ON 

INSERT [dbo].[cart] ([itemId], [quantity], [planId], [attractionId], [attractionName], [planName], [planFee], [memberid]) VALUES (8, 1, 1000, 11111, N'六福村', N'六福村單日優惠票', 750, 3)
SET IDENTITY_INSERT [dbo].[cart] OFF
GO
INSERT [dbo].[FlightTicket] ([flightID], [classID], [departureTime], [arrivalTime], [fare], [airline], [originID], [destinationID]) VALUES (N'CJ426', 2, CAST(N'2022-12-31T00:00:00.000' AS DateTime), CAST(N'2023-01-01T00:00:00.000' AS DateTime), 18699, N'華信', N'桃園TPE', N'波士頓BOS')
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
INSERT [dbo].[loginstatus] ([statusid], [statusname]) VALUES (1, N'admin')
INSERT [dbo].[loginstatus] ([statusid], [statusname]) VALUES (2, N'manager')
INSERT [dbo].[loginstatus] ([statusid], [statusname]) VALUES (3, N'boss')
INSERT [dbo].[loginstatus] ([statusid], [statusname]) VALUES (4, N'unverified_member')
INSERT [dbo].[loginstatus] ([statusid], [statusname]) VALUES (5, N'verified_member')
GO
SET IDENTITY_INSERT [dbo].[memberbasicinfo] ON 

INSERT [dbo].[memberbasicinfo] ([memberid], [statusid], [username], [password], [photo], [email], [verificationcode]) VALUES (1, 4, N'tim', N'123', NULL, N'tim@gmail.com', NULL)
INSERT [dbo].[memberbasicinfo] ([memberid], [statusid], [username], [password], [photo], [email], [verificationcode]) VALUES (2, 4, N'test', N'123', NULL, N'test@gmail.com', NULL)
INSERT [dbo].[memberbasicinfo] ([memberid], [statusid], [username], [password], [photo], [email], [verificationcode]) VALUES (3, 4, N'jacky', N'$2a$10$FgCBWvRcDejgmKIDeRwPhuDmGyJ49CI/mXCgdN8/H3ZpIf/DBdn72', N'images/jacky/login/20221005', N'123@gmail.com', N'XbtGNqLY7y7dDcV')
INSERT [dbo].[memberbasicinfo] ([memberid], [statusid], [username], [password], [photo], [email], [verificationcode]) VALUES (4, 5, N'learningma0926@gmail.com', N'$2a$10$OVc9HwSzpWjuc0eMNkgkV.wyy/dCrId0OiOpHBdjmlHsjvc.luvBW', N'images/jacky/login/default1.png', N'learningma0926@gmail.com', NULL)
INSERT [dbo].[memberbasicinfo] ([memberid], [statusid], [username], [password], [photo], [email], [verificationcode]) VALUES (1004, 5, N'eeit49group1chitou@gmail.com', N'default_pw', N'images/jacky/login/default1.png', N'eeit49group1chitou@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[memberbasicinfo] OFF
GO
INSERT [dbo].[memberdetailinfo] ([memberid], [name], [phone], [address], [nickname], [nationality], [birth], [gender], [createtime], [modifytime]) VALUES (3, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'0', CAST(N'2022-10-05T11:09:24.0000000' AS DateTime2), CAST(N'2022-10-05T11:09:24.0000000' AS DateTime2))
INSERT [dbo].[memberdetailinfo] ([memberid], [name], [phone], [address], [nickname], [nationality], [birth], [gender], [createtime], [modifytime]) VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[memberdetailinfo] ([memberid], [name], [phone], [address], [nickname], [nationality], [birth], [gender], [createtime], [modifytime]) VALUES (1004, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[orderlist] ([orderType], [orderId], [orderDate], [orderStatus], [totalPrice], [memberId]) VALUES (N'飯店', N'B183a2d8b123', CAST(N'2022-10-04T19:55:00.000' AS DateTime), N'已付款', 4481, 0)
INSERT [dbo].[orderlist] ([orderType], [orderId], [orderDate], [orderStatus], [totalPrice], [memberId]) VALUES (N'飯店', N'B183a2dc3866', CAST(N'2022-10-04T19:58:58.000' AS DateTime), N'已付款', 4481, 0)
INSERT [dbo].[orderlist] ([orderType], [orderId], [orderDate], [orderStatus], [totalPrice], [memberId]) VALUES (N'飯店', N'B183ac3372ae', CAST(N'2022-10-06T15:31:23.000' AS DateTime), N'已付款', 4481, 0)
INSERT [dbo].[orderlist] ([orderType], [orderId], [orderDate], [orderStatus], [totalPrice], [memberId]) VALUES (N'飯店', N'B183ac815ea0', CAST(N'2022-10-06T16:55:03.000' AS DateTime), N'已付款', 4481, 0)
INSERT [dbo].[orderlist] ([orderType], [orderId], [orderDate], [orderStatus], [totalPrice], [memberId]) VALUES (N'飯店', N'B183ac91e42e', CAST(N'2022-10-06T17:13:05.000' AS DateTime), N'已付款', 4481, 0)
INSERT [dbo].[orderlist] ([orderType], [orderId], [orderDate], [orderStatus], [totalPrice], [memberId]) VALUES (N'飯店', N'B183ac9c780e', CAST(N'2022-10-06T17:24:39.000' AS DateTime), N'已付款', 4481, 0)
INSERT [dbo].[orderlist] ([orderType], [orderId], [orderDate], [orderStatus], [totalPrice], [memberId]) VALUES (N'飯店', N'B183aca55cfa', CAST(N'2022-10-06T17:34:21.000' AS DateTime), N'已付款', 4481, 0)
INSERT [dbo].[orderlist] ([orderType], [orderId], [orderDate], [orderStatus], [totalPrice], [memberId]) VALUES (N'飯店', N'B183c617d141', CAST(N'2022-10-11T16:09:53.000' AS DateTime), N'已付款', 4481, 0)
GO
INSERT [dbo].[Pricingplan] ([plan_id], [attraction_id], [plan_name], [plan_fee], [plan_discript]) VALUES (1000, 11111, N'六福村單日優惠票', 750, N'適用於：6 歲以上者,水樂園門票需另行購買')
INSERT [dbo].[Pricingplan] ([plan_id], [attraction_id], [plan_name], [plan_fee], [plan_discript]) VALUES (1001, 11111, N'六福村午後入場單日優惠票', 599, N'限 13:00 過後入場使用,水樂園門票需另行購買')
INSERT [dbo].[Pricingplan] ([plan_id], [attraction_id], [plan_name], [plan_fee], [plan_discript]) VALUES (1002, 11111, N'六福村單日優惠票 4 張', 2800, N'經營已久的遊樂園，園內主題區有驚險遊樂設施、互動式動物表演和蒸汽火車')
INSERT [dbo].[Pricingplan] ([plan_id], [attraction_id], [plan_name], [plan_fee], [plan_discript]) VALUES (1010, 67890, N'Xpar單日優惠票k', 588, N'先進的水族館，設有水母缸、企鵝展覽及人工潮汐池')
GO
SET IDENTITY_INSERT [dbo].[reservation] ON 

INSERT [dbo].[reservation] ([reservationID], [orderId], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName], [orderStatus], [hotelID]) VALUES (1, N'B183a2d8b123', 0, N'123', N'123@gmail.com', N'123', 1020, N'菁英客房二小床', CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04T19:55:00.000' AS DateTime), N'不加床', 2, N'台北 W 飯店', N'已付款', NULL)
INSERT [dbo].[reservation] ([reservationID], [orderId], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName], [orderStatus], [hotelID]) VALUES (2, N'B183a2dc3866', 0, N'321', N'123@gmail.com', N'321', 1021, N'皇家客房一小床', CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04' AS Date), CAST(N'2022-10-04T19:58:58.000' AS DateTime), N'不加床', 2, N'台北 W 飯店', N'已付款', NULL)
INSERT [dbo].[reservation] ([reservationID], [orderId], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName], [orderStatus], [hotelID]) VALUES (3, N'B183ac3372ae', 0, N'222', N'123@gmail.com', N'333', 1020, N'菁英客房二小床', CAST(N'2022-10-06' AS Date), CAST(N'2022-10-06' AS Date), CAST(N'2022-10-06T15:31:23.000' AS DateTime), N'不加床', 2, N'台北 W 飯店', N'已付款', NULL)
INSERT [dbo].[reservation] ([reservationID], [orderId], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName], [orderStatus], [hotelID]) VALUES (4, N'B183ac815ea0', 0, N'5234', N'234@gmail', N'afd', 1021, N'皇家客房一小床', CAST(N'2022-10-06' AS Date), CAST(N'2022-10-06' AS Date), CAST(N'2022-10-06T16:55:03.000' AS DateTime), N'不加床', 2, N'台北 W 飯店', N'已付款', NULL)
INSERT [dbo].[reservation] ([reservationID], [orderId], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName], [orderStatus], [hotelID]) VALUES (5, N'B183ac91e42e', 0, N'888', N'999@gmail.com', N'789', 1009, N'菁英客房二小床', CAST(N'2022-10-06' AS Date), CAST(N'2022-10-06' AS Date), CAST(N'2022-10-06T17:13:05.000' AS DateTime), N'不加床', 2, N'台北大倉久和大飯店', N'已付款', NULL)
INSERT [dbo].[reservation] ([reservationID], [orderId], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName], [orderStatus], [hotelID]) VALUES (6, N'B183ac9c780e', 0, N'陳韋翰', N'weber122462118@gmail.com', N'0983624629', 1022, N'破爛客房二小床', CAST(N'2022-10-06' AS Date), CAST(N'2022-10-06' AS Date), CAST(N'2022-10-06T17:24:39.000' AS DateTime), N'2 張單人床', 2, N'台北大倉久和大飯店', N'已付款', NULL)
INSERT [dbo].[reservation] ([reservationID], [orderId], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName], [orderStatus], [hotelID]) VALUES (7, N'B183aca55cfa', 0, N'陳韋翰', N'123@gmail.com', N'0983624629', 1023, N'破爛客房二小床', CAST(N'2022-10-06' AS Date), CAST(N'2022-10-06' AS Date), CAST(N'2022-10-06T17:34:21.000' AS DateTime), N'2 張單人床', 2, N'台北大倉久和大飯店', N'已付款', NULL)
INSERT [dbo].[reservation] ([reservationID], [orderId], [memberID], [booker], [email], [phone], [roomID], [roomName], [checkInDate], [checkOutDate], [paymentDate], [addBed], [numberOfPeople], [hotelName], [orderStatus], [hotelID]) VALUES (8, N'B183c617d141', 0, N'888', N'888@gmail.com', N'031302313', 1020, N'菁英客房二小床', CAST(N'2022-10-11' AS Date), CAST(N'2022-10-11' AS Date), CAST(N'2022-10-11T16:09:53.000' AS DateTime), N'不加床', 1, N'台北 W 飯店', N'已付款', NULL)
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
/****** Object:  Index [UK_admin_username]    Script Date: 2022/10/11 下午 08:16:58 ******/
ALTER TABLE [dbo].[adminchitou] ADD  CONSTRAINT [UK_admin_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_email]    Script Date: 2022/10/11 下午 08:16:58 ******/
ALTER TABLE [dbo].[memberbasicinfo] ADD  CONSTRAINT [UK_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[adminchitou]  WITH CHECK ADD  CONSTRAINT [FK_adminchitou_loginstatus] FOREIGN KEY([adminstatus])
REFERENCES [dbo].[loginstatus] ([statusid])
GO
ALTER TABLE [dbo].[adminchitou] CHECK CONSTRAINT [FK_adminchitou_loginstatus]
GO
ALTER TABLE [dbo].[article]  WITH CHECK ADD FOREIGN KEY([countryid])
REFERENCES [dbo].[country] ([countryID])
GO
ALTER TABLE [dbo].[Attraction]  WITH CHECK ADD FOREIGN KEY([prefer_id])
REFERENCES [dbo].[Hobbyclassification] ([prefer_id])
GO
ALTER TABLE [dbo].[memberbasicinfo]  WITH CHECK ADD  CONSTRAINT [FK_memberbasicinfo_loginstatus] FOREIGN KEY([statusid])
REFERENCES [dbo].[loginstatus] ([statusid])
GO
ALTER TABLE [dbo].[memberbasicinfo] CHECK CONSTRAINT [FK_memberbasicinfo_loginstatus]
GO
ALTER TABLE [dbo].[Pricingplan]  WITH CHECK ADD FOREIGN KEY([attraction_id])
REFERENCES [dbo].[Attraction] ([attraction_id])
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
