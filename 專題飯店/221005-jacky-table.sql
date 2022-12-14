USE [Chitou]
GO
/****** Object:  Table [dbo].[adminchitou]    Script Date: 10/5/2022 11:13:46 AM ******/
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
/****** Object:  Table [dbo].[memberbasicinfo]    Script Date: 10/5/2022 11:13:46 AM ******/
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
	[verificationcode] [nvarchar](100) NULL,
 CONSTRAINT [PK_memberbasicinfo] PRIMARY KEY CLUSTERED 
(
	[memberid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[memberdetailinfo]    Script Date: 10/5/2022 11:13:46 AM ******/
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
SET IDENTITY_INSERT [dbo].[adminchitou] ON 

INSERT [dbo].[adminchitou] ([adminid], [adminstatus], [username], [password], [permission]) VALUES (1003, 1, N'admin', N'$2a$10$4r.U7nnYk2cpXEzswPK2BekxBdF9GrW4xtcHVbWdk2A6bpkJZg.2a', 1)
INSERT [dbo].[adminchitou] ([adminid], [adminstatus], [username], [password], [permission]) VALUES (1004, 2, N'manager', N'$2a$10$.dhFBkVag5jrWSeMB3mQhOPWN4.gNWDF6Bt4Hc/LqhjJBDE.opo9G', 1)
INSERT [dbo].[adminchitou] ([adminid], [adminstatus], [username], [password], [permission]) VALUES (1005, 3, N'boss', N'$2a$10$8umK1PBtam7GuZy/fQp/J.z16MIq8H1ww9BY3lvBVzcvYgRbnjefy', 1)
INSERT [dbo].[adminchitou] ([adminid], [adminstatus], [username], [password], [permission]) VALUES (1006, 3, N'noauth', N'123', 1)
SET IDENTITY_INSERT [dbo].[adminchitou] OFF
GO
SET IDENTITY_INSERT [dbo].[memberbasicinfo] ON 

INSERT [dbo].[memberbasicinfo] ([memberid], [statusid], [username], [password], [photo], [email], [verificationcode]) VALUES (1, 4, N'tim', N'123', NULL, N'tim@gmail.com', NULL)
INSERT [dbo].[memberbasicinfo] ([memberid], [statusid], [username], [password], [photo], [email], [verificationcode]) VALUES (2, 4, N'test', N'123', NULL, N'test@gmail.com', NULL)
INSERT [dbo].[memberbasicinfo] ([memberid], [statusid], [username], [password], [photo], [email], [verificationcode]) VALUES (3, 4, N'jacky', N'$2a$10$FgCBWvRcDejgmKIDeRwPhuDmGyJ49CI/mXCgdN8/H3ZpIf/DBdn72', N'images/jacky/login/20221005', N'123@gmail.com', N'XbtGNqLY7y7dDcV')
SET IDENTITY_INSERT [dbo].[memberbasicinfo] OFF
GO
INSERT [dbo].[memberdetailinfo] ([memberid], [name], [phone], [address], [nickname], [nationality], [birth], [gender], [createtime], [modifytime]) VALUES (3, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'0', CAST(N'2022-10-05T11:09:24.0000000' AS DateTime2), CAST(N'2022-10-05T11:09:24.0000000' AS DateTime2))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_admin_username]    Script Date: 10/5/2022 11:13:46 AM ******/
ALTER TABLE [dbo].[adminchitou] ADD  CONSTRAINT [UK_admin_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_email]    Script Date: 10/5/2022 11:13:46 AM ******/
ALTER TABLE [dbo].[memberbasicinfo] ADD  CONSTRAINT [UK_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_username]    Script Date: 10/5/2022 11:13:46 AM ******/
ALTER TABLE [dbo].[memberbasicinfo] ADD  CONSTRAINT [UK_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
