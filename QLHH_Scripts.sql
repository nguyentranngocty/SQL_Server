USE [QLHH]
GO
/****** Object:  Table [dbo].[Nhacungcap]    Script Date: 9/20/2024 9:40:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhacungcap](
	[maNCC] [varchar](5) NOT NULL,
	[tenNCC] [varchar](20) NULL,
	[trangthai] [numeric](2, 0) NULL,
	[thanhpho] [varchar](30) NULL,
 CONSTRAINT [PK_Nhacungcap] PRIMARY KEY CLUSTERED 
(
	[maNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phutung]    Script Date: 9/20/2024 9:40:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phutung](
	[maPT] [varchar](5) NOT NULL,
	[tenPT] [varchar](10) NULL,
	[mausac] [varchar](10) NULL,
	[khoiluong] [float] NULL,
	[thanhpho] [varchar](30) NULL,
 CONSTRAINT [PK_Phutung] PRIMARY KEY CLUSTERED 
(
	[maPT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vanchuyen]    Script Date: 9/20/2024 9:40:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vanchuyen](
	[maNCC] [varchar](5) NOT NULL,
	[maPT] [varchar](5) NOT NULL,
	[soluong] [numeric](5, 0) NULL,
 CONSTRAINT [PK_Vanchuyen] PRIMARY KEY CLUSTERED 
(
	[maNCC] ASC,
	[maPT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Vanchuyen]  WITH CHECK ADD  CONSTRAINT [FK_Vanchuyen_Nhacungcap] FOREIGN KEY([maNCC])
REFERENCES [dbo].[Nhacungcap] ([maNCC])
GO
ALTER TABLE [dbo].[Vanchuyen] CHECK CONSTRAINT [FK_Vanchuyen_Nhacungcap]
GO
ALTER TABLE [dbo].[Vanchuyen]  WITH CHECK ADD  CONSTRAINT [FK_Vanchuyen_Phutung] FOREIGN KEY([maPT])
REFERENCES [dbo].[Phutung] ([maPT])
GO
ALTER TABLE [dbo].[Vanchuyen] CHECK CONSTRAINT [FK_Vanchuyen_Phutung]
GO
