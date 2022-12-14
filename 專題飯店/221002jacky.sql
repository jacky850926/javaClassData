USE [Chitou]
GO
/****** Object:  Table [dbo].[adminchitou]    Script Date: 10/2/2022 3:01:41 PM ******/
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
/****** Object:  Table [dbo].[memberbasicinfo]    Script Date: 10/2/2022 3:01:41 PM ******/
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
/****** Object:  Table [dbo].[memberdetailinfo]    Script Date: 10/2/2022 3:01:41 PM ******/
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
SET IDENTITY_INSERT [dbo].[adminchitou] ON 

INSERT [dbo].[adminchitou] ([adminid], [adminstatus], [username], [password], [permission]) VALUES (1003, 1, N'admin', N'$2a$10$4r.U7nnYk2cpXEzswPK2BekxBdF9GrW4xtcHVbWdk2A6bpkJZg.2a', 1)
INSERT [dbo].[adminchitou] ([adminid], [adminstatus], [username], [password], [permission]) VALUES (1004, 2, N'manager', N'$2a$10$.dhFBkVag5jrWSeMB3mQhOPWN4.gNWDF6Bt4Hc/LqhjJBDE.opo9G', 1)
INSERT [dbo].[adminchitou] ([adminid], [adminstatus], [username], [password], [permission]) VALUES (1005, 3, N'boss', N'$2a$10$8umK1PBtam7GuZy/fQp/J.z16MIq8H1ww9BY3lvBVzcvYgRbnjefy', 1)
SET IDENTITY_INSERT [dbo].[adminchitou] OFF
GO
SET IDENTITY_INSERT [dbo].[memberbasicinfo] ON 

INSERT [dbo].[memberbasicinfo] ([memberid], [statusid], [username], [password], [photo], [email]) VALUES (54, 4, N'very', N'$2a$10$tYYAl8AQ9SbDygx.zOJCzelldoIAI9i2YkWG35J9ZcVUs5OLeX0FW', N'images/jacky/login/20221002d38b380be03060bc284024ec61f60e59.jpg', N'weqewq@gmail.com')
INSERT [dbo].[memberbasicinfo] ([memberid], [statusid], [username], [password], [photo], [email]) VALUES (58, 4, N'kitty', N'$2a$10$GDR8SUIYLQ6yTq8TAz.MrO8rBF9tf2XuiqzV8snt6W/0w0t4.31Gm', N'images/jacky/login/20221002d38b380be03060bc284024ec61f60e59.jpg', N'yyy@gmail.com')
SET IDENTITY_INSERT [dbo].[memberbasicinfo] OFF
GO
INSERT [dbo].[memberdetailinfo] ([memberid], [name], [phone], [address], [nickname], [nationality], [birth], [gender], [createtime], [modifytime]) VALUES (58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_admin_username]    Script Date: 10/2/2022 3:01:41 PM ******/
ALTER TABLE [dbo].[adminchitou] ADD  CONSTRAINT [UK_admin_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_email]    Script Date: 10/2/2022 3:01:41 PM ******/
ALTER TABLE [dbo].[memberbasicinfo] ADD  CONSTRAINT [UK_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_username]    Script Date: 10/2/2022 3:01:41 PM ******/
ALTER TABLE [dbo].[memberbasicinfo] ADD  CONSTRAINT [UK_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[memberdetailinfo]  WITH CHECK ADD  CONSTRAINT [FK_memberdetailinfo_memberbasicinfo] FOREIGN KEY([memberid])
REFERENCES [dbo].[memberbasicinfo] ([memberid])
GO
ALTER TABLE [dbo].[memberdetailinfo] CHECK CONSTRAINT [FK_memberdetailinfo_memberbasicinfo]
GO
