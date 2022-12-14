USE [chitou]
GO
/****** Object:  Table [dbo].[roomOrder]    Script Date: 2022/9/23 下午 04:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roomOrder](
	[roomOrderID] [int] IDENTITY(1,1) NOT NULL,
	[reservationID] [int] NOT NULL,
	[roomStyleID] [int] NOT NULL,
	[numberOfRoom] [int] NOT NULL,
 CONSTRAINT [PK_roomOrder] PRIMARY KEY CLUSTERED 
(
	[roomOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[roomOrder]  WITH CHECK ADD  CONSTRAINT [FK_roomOrder_reservation] FOREIGN KEY([reservationID])
REFERENCES [dbo].[reservation] ([reservationID])
GO
ALTER TABLE [dbo].[roomOrder] CHECK CONSTRAINT [FK_roomOrder_reservation]
GO
