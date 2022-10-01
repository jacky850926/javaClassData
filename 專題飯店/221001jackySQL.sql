USE [Chitou]
GO
/****** Object:  Table [dbo].[adminchitou]    Script Date: 2022/10/1 下午 02:54:28 ******/
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
/****** Object:  Table [dbo].[memberbasicinfo]    Script Date: 2022/10/1 下午 02:54:28 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[memberdetailinfo]    Script Date: 2022/10/1 下午 02:54:28 ******/
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
GO
INSERT [dbo].[adminchitou] ([adminid], [adminstatus], [username], [password], [permission]) VALUES (1003, 1, N'admin', N'$2a$10$4r.U7nnYk2cpXEzswPK2BekxBdF9GrW4xtcHVbWdk2A6bpkJZg.2a', 1)
GO
INSERT [dbo].[adminchitou] ([adminid], [adminstatus], [username], [password], [permission]) VALUES (1004, 2, N'manager', N'$2a$10$.dhFBkVag5jrWSeMB3mQhOPWN4.gNWDF6Bt4Hc/LqhjJBDE.opo9G', 1)
GO
INSERT [dbo].[adminchitou] ([adminid], [adminstatus], [username], [password], [permission]) VALUES (1005, 3, N'boss', N'$2a$10$8umK1PBtam7GuZy/fQp/J.z16MIq8H1ww9BY3lvBVzcvYgRbnjefy', 1)
GO
SET IDENTITY_INSERT [dbo].[adminchitou] OFF
GO
SET IDENTITY_INSERT [dbo].[memberbasicinfo] ON 
GO
INSERT [dbo].[memberbasicinfo] ([memberid], [statusid], [username], [password], [photo], [email]) VALUES (1, 1, N'jacky', N'123', N'images/jacky/login/20220926girl-6.jpg', N'uuu@gmail.com')
GO
INSERT [dbo].[memberbasicinfo] ([memberid], [statusid], [username], [password], [photo], [email]) VALUES (3, 1, N'kitty', N'123', N'images/jacky/login/20220926girl-3.jpg', N'aaa@gmail.com')
GO
INSERT [dbo].[memberbasicinfo] ([memberid], [statusid], [username], [password], [photo], [email]) VALUES (52, 1, N'1', N'123', N'images/jacky/login/20220930', N'efqewr@gmawqwe')
GO
INSERT [dbo].[memberbasicinfo] ([memberid], [statusid], [username], [password], [photo], [email]) VALUES (53, 1, N'queenie', N'123', N'images/jacky/login/20220930', N'werqew@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[memberbasicinfo] OFF
GO
INSERT [dbo].[memberdetailinfo] ([memberid], [name], [phone], [address], [nickname], [nationality], [birth], [gender], [createtime], [modifytime]) VALUES (1, N'jacky', N'988231123', N'101 peter st.', N'jacky', N'TW', CAST(N'1994-09-23T00:00:00.000' AS DateTime), N'male', CAST(N'2022-09-09T00:00:00.000' AS DateTime), CAST(N'2020-09-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[memberdetailinfo] ([memberid], [name], [phone], [address], [nickname], [nationality], [birth], [gender], [createtime], [modifytime]) VALUES (3, N'kitty', N'921231234', N'999 queen st.', N'kitty', N'CA', CAST(N'1995-09-23T00:00:00.000' AS DateTime), N'female', CAST(N'2021-08-08T00:00:00.000' AS DateTime), CAST(N'2021-08-08T00:00:00.000' AS DateTime))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_admin_username]    Script Date: 2022/10/1 下午 02:54:28 ******/
ALTER TABLE [dbo].[adminchitou] ADD  CONSTRAINT [UK_admin_username] UNIQUE NONCLUSTERED 
(
 [username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_email]    Script Date: 2022/10/1 下午 02:54:28 ******/
ALTER TABLE [dbo].[memberbasicinfo] ADD  CONSTRAINT [UK_email] UNIQUE NONCLUSTERED 
(
 [email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_username]    Script Date: 2022/10/1 下午 02:54:28 ******/
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