USE [master]
GO
/****** Object:  Database [StoreDB]    Script Date: 8/9/2018 11:37:34 AM ******/
CREATE DATABASE [StoreDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StoreDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\StoreDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StoreDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\StoreDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StoreDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StoreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StoreDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StoreDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StoreDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StoreDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StoreDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StoreDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StoreDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StoreDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StoreDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StoreDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StoreDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StoreDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StoreDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StoreDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StoreDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StoreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StoreDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StoreDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StoreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StoreDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StoreDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StoreDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StoreDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StoreDB] SET  MULTI_USER 
GO
ALTER DATABASE [StoreDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StoreDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StoreDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StoreDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StoreDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StoreDB] SET QUERY_STORE = OFF
GO
USE [StoreDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [StoreDB]
GO
/****** Object:  Table [dbo].[tbl_Image]    Script Date: 8/9/2018 11:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Image](
	[id] [int] NOT NULL,
	[path] [nvarchar](250) NULL,
	[product_Id] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tbl_Image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Order]    Script Date: 8/9/2018 11:37:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Order](
	[id] [int] NOT NULL,
	[user_Id] [int] NULL,
	[creation_Date] [date] NULL,
	[total_Price] [float] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tbl_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_OrderDetail]    Script Date: 8/9/2018 11:37:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OrderDetail](
	[id] [int] NOT NULL,
	[order_Id] [int] NULL,
	[product_Id] [int] NULL,
	[quantity] [int] NULL,
	[total] [float] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tbl_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 8/9/2018 11:37:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[description] [nvarchar](2500) NULL,
	[remainQuantity] [int] NOT NULL,
	[status] [bit] NULL,
	[productId] [int] NULL,
	[creationDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProductDetail]    Script Date: 8/9/2018 11:37:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ProductDetail](
	[productId] [int] NOT NULL,
	[chassis] [nvarchar](50) NULL,
	[tire] [nvarchar](50) NULL,
	[color] [nvarchar](50) NULL,
	[fork] [nvarchar](50) NULL,
	[release_Date] [datetime] NULL,
	[quantity] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tbl_ProductDetail] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Role]    Script Date: 8/9/2018 11:37:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Role](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 8/9/2018 11:37:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[id] [int] NOT NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[first_Name] [nvarchar](50) NULL,
	[last_Name] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[status] [bit] NULL,
	[role_Id] [int] NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_Image] ([id], [path], [product_Id], [status]) VALUES (1, N'images/product/5.jpg', 1, 1)
INSERT [dbo].[tbl_Image] ([id], [path], [product_Id], [status]) VALUES (2, N'images/product/2.jpg', 2, 1)
INSERT [dbo].[tbl_Image] ([id], [path], [product_Id], [status]) VALUES (3, N'images/product/3.jpg', 3, 1)
INSERT [dbo].[tbl_Image] ([id], [path], [product_Id], [status]) VALUES (4, N'images/product/4.jpg', 4, 1)
INSERT [dbo].[tbl_Image] ([id], [path], [product_Id], [status]) VALUES (5, N'images/product/5.jpg', 5, 1)
INSERT [dbo].[tbl_Image] ([id], [path], [product_Id], [status]) VALUES (6, N'images/product/6.jpg', 11, 1)
INSERT [dbo].[tbl_Image] ([id], [path], [product_Id], [status]) VALUES (7, N'images/product/7.jpg', 12, 1)
INSERT [dbo].[tbl_Image] ([id], [path], [product_Id], [status]) VALUES (8, N'images/product/8.jpg', 13, 1)
INSERT [dbo].[tbl_Image] ([id], [path], [product_Id], [status]) VALUES (9, N'images/product/9.jpg', 14, 1)
INSERT [dbo].[tbl_Image] ([id], [path], [product_Id], [status]) VALUES (10, N'images/product/10.jpg', 15, 1)
INSERT [dbo].[tbl_Image] ([id], [path], [product_Id], [status]) VALUES (11, N'images/product/12.png', 16, 1)
INSERT [dbo].[tbl_Image] ([id], [path], [product_Id], [status]) VALUES (12, N'images/product/11.jpg', 17, 1)
INSERT [dbo].[tbl_Image] ([id], [path], [product_Id], [status]) VALUES (13, N'images/product/13.jpg', 18, 1)
INSERT [dbo].[tbl_Image] ([id], [path], [product_Id], [status]) VALUES (14, N'images/product/14.jpg', 19, 1)
INSERT [dbo].[tbl_Image] ([id], [path], [product_Id], [status]) VALUES (15, N'images/product/15.jpg', 20, 1)
INSERT [dbo].[tbl_Image] ([id], [path], [product_Id], [status]) VALUES (16, N'images/product/17.jpg', 21, 1)
INSERT [dbo].[tbl_Image] ([id], [path], [product_Id], [status]) VALUES (17, N'images/product/16.jpg', 22, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (0, 1, CAST(N'2018-04-25' AS Date), 300, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (1, 1, CAST(N'2018-04-25' AS Date), 300, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (2, 1, CAST(N'2018-04-25' AS Date), 300, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (3, 1, CAST(N'2018-04-25' AS Date), 300, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (4, 1, CAST(N'2018-04-25' AS Date), 3997, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (5, 1, CAST(N'2018-04-25' AS Date), 3997, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (6, 1, CAST(N'2018-04-25' AS Date), 3997, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (7, 1, CAST(N'2018-04-25' AS Date), 4296.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (8, 1, CAST(N'2018-04-25' AS Date), 4296.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (9, 1, CAST(N'2018-04-25' AS Date), 4296.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (10, 1, CAST(N'2018-04-25' AS Date), 4296.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (11, 1, CAST(N'2018-04-25' AS Date), 4296.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (12, 1, CAST(N'2018-04-25' AS Date), 4796.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (13, 1, CAST(N'2018-04-25' AS Date), 5296.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (14, 1, CAST(N'2018-04-25' AS Date), 6295.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (15, 1, CAST(N'2018-04-25' AS Date), 6795.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (16, 1, CAST(N'2018-04-25' AS Date), 7295.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (17, 1, CAST(N'2018-04-25' AS Date), 7295.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (18, 1, CAST(N'2018-04-25' AS Date), 7295.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (19, 1, CAST(N'2018-04-25' AS Date), 7795.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (20, 1, CAST(N'2018-04-25' AS Date), 8095, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (21, 1, CAST(N'2018-04-25' AS Date), 8595, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (22, 1, CAST(N'2018-04-25' AS Date), 8894.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (23, 1, CAST(N'2018-04-25' AS Date), 9394.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (24, 1, CAST(N'2018-04-25' AS Date), 500, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (25, 1, CAST(N'2018-04-25' AS Date), 1499, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (26, 1, CAST(N'2018-04-25' AS Date), 500, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (27, 1, CAST(N'2018-04-25' AS Date), 4995, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (28, 1, CAST(N'2018-04-25' AS Date), 500, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (29, 1, CAST(N'2018-04-25' AS Date), 299.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (30, 1, CAST(N'2018-04-25' AS Date), 500, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (31, 1, CAST(N'2018-04-25' AS Date), 500, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (32, 1, CAST(N'2018-04-25' AS Date), 500, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (33, 1, CAST(N'2018-04-25' AS Date), 2099, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (34, 1, CAST(N'2018-04-25' AS Date), 1598, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (35, 1, CAST(N'2018-04-25' AS Date), 2500, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (36, 1, CAST(N'2018-04-25' AS Date), 1500, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (37, 1, CAST(N'2018-04-25' AS Date), 1497.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (38, 1, CAST(N'2018-04-25' AS Date), 1398.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (39, 11, CAST(N'2018-04-26' AS Date), 1000, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (40, 2, CAST(N'2018-04-28' AS Date), 1000, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (41, 1, CAST(N'2018-04-29' AS Date), 2000, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (42, 13, CAST(N'2018-04-29' AS Date), 1497.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (43, 13, CAST(N'2018-04-29' AS Date), 599, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (44, 1, CAST(N'2018-04-29' AS Date), 5994, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (45, 10, CAST(N'2018-04-30' AS Date), 11, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (46, 10, CAST(N'2018-04-30' AS Date), 11, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (47, 10, CAST(N'2018-04-30' AS Date), 11, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (48, 10, CAST(N'2018-04-30' AS Date), 11, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (49, 10, CAST(N'2018-04-30' AS Date), 500, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (50, 10, CAST(N'2018-04-30' AS Date), 999, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (51, 10, CAST(N'2018-04-30' AS Date), 299.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (52, 10, CAST(N'2018-04-30' AS Date), 11, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (53, 10, CAST(N'2018-04-30' AS Date), 500, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (54, 10, CAST(N'2018-04-30' AS Date), 999, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (55, 10, CAST(N'2018-04-30' AS Date), 3196, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (56, 6, CAST(N'2018-04-30' AS Date), 599, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (57, 6, CAST(N'2018-04-30' AS Date), 999, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (58, 6, CAST(N'2018-04-30' AS Date), 999, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (59, 6, CAST(N'2018-04-30' AS Date), 999, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (60, 6, CAST(N'2018-04-30' AS Date), 999, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (61, 6, CAST(N'2018-04-30' AS Date), 999, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (62, 7, CAST(N'2018-04-30' AS Date), 1298.5, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (63, 1, CAST(N'2018-06-20' AS Date), 624, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (64, 1, CAST(N'2018-06-21' AS Date), 642, 1)
INSERT [dbo].[tbl_Order] ([id], [user_Id], [creation_Date], [total_Price], [status]) VALUES (65, 1, CAST(N'2018-07-14' AS Date), 3120, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (2, 1, 1, 2, 300, 0)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (3, 0, 1, 3, 5296.5, 0)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (4, 20, 1, 4, 8095, 0)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (5, 21, 1, 4, 8595, 0)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (7, 22, 1, 4, 8894.5, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (10, 23, 1, 4, 9394.5, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (11, 23, 2, 9, 9394.5, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (12, 23, 3, 3, 9394.5, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (15, 24, 2, 1, 500, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (18, 25, 1, 1, 999, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (19, 25, 2, 1, 500, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (22, 26, 2, 1, 500, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (25, 27, 1, 5, 999, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (28, 28, 2, 1, 500, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (31, 29, 3, 1, 299.5, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (34, 30, 2, 1, 500, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (37, 31, 2, 1, 500, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (40, 32, 2, 1, 500, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (43, 33, 2, 3, 500, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (44, 33, 3, 2, 299.5, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (47, 34, 1, 1, 999, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (48, 34, 3, 2, 299.5, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (51, 35, 2, 5, 500, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (54, 36, 2, 3, 500, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (57, 37, 3, 5, 299.5, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (60, 38, 2, 1, 500, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (61, 38, 3, 3, 299.5, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (64, 39, 2, 2, 500, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (67, 40, 2, 2, 500, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (70, 41, 2, 4, 500, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (73, 42, 3, 5, 299.5, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (76, 43, 3, 2, 299.5, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (79, 44, 1, 6, 999, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (82, 45, 5, 1, 11, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (85, 46, 5, 1, 11, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (88, 47, 5, 1, 11, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (91, 48, 5, 1, 11, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (94, 49, 2, 1, 500, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (97, 50, 1, 1, 999, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (100, 51, 3, 1, 299.5, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (103, 52, 5, 1, 11, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (106, 53, 2, 1, 500, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (109, 54, 1, 1, 999, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (112, 55, 3, 4, 299.5, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (113, 55, 4, 2, 999, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (116, 56, 3, 2, 299.5, NULL)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (119, 61, 4, 1, 999, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (122, 62, 3, 1, 299.5, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (123, 62, 4, 1, 999, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (126, 63, 17, 1, 312, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (127, 63, 16, 1, 312, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (130, 64, 13, 2, 321, 1)
INSERT [dbo].[tbl_OrderDetail] ([id], [order_Id], [product_Id], [quantity], [total], [status]) VALUES (133, 65, 17, 10, 312, 1)
INSERT [dbo].[tbl_Product] ([id], [name], [price], [description], [remainQuantity], [status], [productId], [creationDate]) VALUES (1, N'Giant ATX 610 2017', 999, N'Conquering hills to get in shape, scouring your neighborhood for the perfect espresso, and even commuting to and from work are fun on Specialized''s Vita Sport Carbon. Its lightweight, women''s-specific carbon frame and fork deliver the perfect blend of speed and road-smoothing luxury. You''ll love the easy-spinning wheels, and the lightning-quick shifts of the wide-range, hill-topping Shimano/microSHIFT drivetrain with FSA cranks. All that speed is easily controlled with powerful Shimano hydraulic disc brakes. Plus, the Specialized Body Geometry women''s saddle and grips with integrated bar-ends provide outstanding comfort on every fun outing.', 8, 1, 1, CAST(N'2018-04-21T00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_Product] ([id], [name], [price], [description], [remainQuantity], [status], [productId], [creationDate]) VALUES (2, N'Galaxy ML250 2017', 500, N'Conquering hills to get in shape, scouring your neighborhood for the perfect espresso, and even commuting to and from work are fun on Specialized''s Vita Sport Carbon. Its lightweight, women''s-specific carbon frame and fork deliver the perfect blend of speed and road-smoothing luxury. You''ll love the easy-spinning wheels, and the lightning-quick shifts of the wide-range, hill-topping Shimano/microSHIFT drivetrain with FSA cranks. All that speed is easily controlled with powerful Shimano hydraulic disc brakes. Plus, the Specialized Body Geometry women''s saddle and grips with integrated bar-ends provide outstanding comfort on every fun outing.', 10, 1, 2, CAST(N'2018-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_Product] ([id], [name], [price], [description], [remainQuantity], [status], [productId], [creationDate]) VALUES (3, N'Galaxy MT18 2017', 299.5, N'Conquering hills to get in shape, scouring your neighborhood for the perfect espresso, and even commuting to and from work are fun on Specialized''s Vita Sport Carbon. Its lightweight, women''s-specific carbon frame and fork deliver the perfect blend of speed and road-smoothing luxury. You''ll love the easy-spinning wheels, and the lightning-quick shifts of the wide-range, hill-topping Shimano/microSHIFT drivetrain with FSA cranks. All that speed is easily controlled with powerful Shimano hydraulic disc brakes. Plus, the Specialized Body Geometry women''s saddle and grips with integrated bar-ends provide outstanding comfort on every fun outing.', 10, 1, 3, CAST(N'2018-04-26T00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_Product] ([id], [name], [price], [description], [remainQuantity], [status], [productId], [creationDate]) VALUES (4, N'Fornix BT450', 999, N'Conquering hills to get in shape, scouring your neighborhood for the perfect espresso, and even commuting to and from work are fun on Specialized''s Vita Sport Carbon. Its lightweight, women''s-specific carbon frame and fork deliver the perfect blend of speed and road-smoothing luxury. You''ll love the easy-spinning wheels, and the lightning-quick shifts of the wide-range, hill-topping Shimano/microSHIFT drivetrain with FSA cranks. All that speed is easily controlled with powerful Shimano hydraulic disc brakes. Plus, the Specialized Body Geometry women''s saddle and grips with integrated bar-ends provide outstanding comfort on every fun outing.', 10, 1, 4, CAST(N'2018-04-29T20:37:41.307' AS DateTime))
INSERT [dbo].[tbl_Product] ([id], [name], [price], [description], [remainQuantity], [status], [productId], [creationDate]) VALUES (5, N'Youngdumb', 11, N'Conquering hills to get in shape, scouring your neighborhood for the perfect espresso, and even commuting to and from work are fun on Specialized''s Vita Sport Carbon. Its lightweight, women''s-specific carbon frame and fork deliver the perfect blend of speed and road-smoothing luxury. You''ll love the easy-spinning wheels, and the lightning-quick shifts of the wide-range, hill-topping Shimano/microSHIFT drivetrain with FSA cranks. All that speed is easily controlled with powerful Shimano hydraulic disc brakes. Plus, the Specialized Body Geometry women''s saddle and grips with integrated bar-ends provide outstanding comfort on every fun outing.', 10, 1, 5, CAST(N'2018-04-30T12:51:04.457' AS DateTime))
INSERT [dbo].[tbl_Product] ([id], [name], [price], [description], [remainQuantity], [status], [productId], [creationDate]) VALUES (6, N'Fornix BT450', 1321, N'Conquering hills to get in shape, scouring your neighborhood for the perfect espresso, and even commuting to and from work are fun on Specialized''s Vita Sport Carbon. Its lightweight, women''s-specific carbon frame and fork deliver the perfect blend of speed and road-smoothing luxury. You''ll love the easy-spinning wheels, and the lightning-quick shifts of the wide-range, hill-topping Shimano/microSHIFT drivetrain with FSA cranks. All that speed is easily controlled with powerful Shimano hydraulic disc brakes. Plus, the Specialized Body Geometry women''s saddle and grips with integrated bar-ends provide outstanding comfort on every fun outing.', 10, 1, 11, CAST(N'2018-04-30T21:37:28.733' AS DateTime))
INSERT [dbo].[tbl_Product] ([id], [name], [price], [description], [remainQuantity], [status], [productId], [creationDate]) VALUES (7, N'Galaxy MT18 2017', 121, N'Conquering hills to get in shape, scouring your neighborhood for the perfect espresso, and even commuting to and from work are fun on Specialized''s Vita Sport Carbon. Its lightweight, women''s-specific carbon frame and fork deliver the perfect blend of speed and road-smoothing luxury. You''ll love the easy-spinning wheels, and the lightning-quick shifts of the wide-range, hill-topping Shimano/microSHIFT drivetrain with FSA cranks. All that speed is easily controlled with powerful Shimano hydraulic disc brakes. Plus, the Specialized Body Geometry women''s saddle and grips with integrated bar-ends provide outstanding comfort on every fun outing.', 10, 1, 12, CAST(N'2018-04-30T21:38:54.403' AS DateTime))
INSERT [dbo].[tbl_Product] ([id], [name], [price], [description], [remainQuantity], [status], [productId], [creationDate]) VALUES (8, N'Fornix BT450', 213, N'Conquering hills to get in shape, scouring your neighborhood for the perfect espresso, and even commuting to and from work are fun on Specialized''s Vita Sport Carbon. Its lightweight, women''s-specific carbon frame and fork deliver the perfect blend of speed and road-smoothing luxury. You''ll love the easy-spinning wheels, and the lightning-quick shifts of the wide-range, hill-topping Shimano/microSHIFT drivetrain with FSA cranks. All that speed is easily controlled with powerful Shimano hydraulic disc brakes. Plus, the Specialized Body Geometry women''s saddle and grips with integrated bar-ends provide outstanding comfort on every fun outing.', 10, 1, 13, CAST(N'2018-04-30T21:40:24.313' AS DateTime))
INSERT [dbo].[tbl_Product] ([id], [name], [price], [description], [remainQuantity], [status], [productId], [creationDate]) VALUES (9, N'Galaxy MT18 2017', 231, N'Conquering hills to get in shape, scouring your neighborhood for the perfect espresso, and even commuting to and from work are fun on Specialized''s Vita Sport Carbon. Its lightweight, women''s-specific carbon frame and fork deliver the perfect blend of speed and road-smoothing luxury. You''ll love the easy-spinning wheels, and the lightning-quick shifts of the wide-range, hill-topping Shimano/microSHIFT drivetrain with FSA cranks. All that speed is easily controlled with powerful Shimano hydraulic disc brakes. Plus, the Specialized Body Geometry women''s saddle and grips with integrated bar-ends provide outstanding comfort on every fun outing.', 10, 1, 14, CAST(N'2018-04-30T21:43:50.903' AS DateTime))
INSERT [dbo].[tbl_Product] ([id], [name], [price], [description], [remainQuantity], [status], [productId], [creationDate]) VALUES (10, N'Fornix BT450', 1231, N'Conquering hills to get in shape, scouring your neighborhood for the perfect espresso, and even commuting to and from work are fun on Specialized''s Vita Sport Carbon. Its lightweight, women''s-specific carbon frame and fork deliver the perfect blend of speed and road-smoothing luxury. You''ll love the easy-spinning wheels, and the lightning-quick shifts of the wide-range, hill-topping Shimano/microSHIFT drivetrain with FSA cranks. All that speed is easily controlled with powerful Shimano hydraulic disc brakes. Plus, the Specialized Body Geometry women''s saddle and grips with integrated bar-ends provide outstanding comfort on every fun outing.', 10, 1, 15, CAST(N'2018-04-30T21:44:54.730' AS DateTime))
INSERT [dbo].[tbl_Product] ([id], [name], [price], [description], [remainQuantity], [status], [productId], [creationDate]) VALUES (11, N'Galaxy MT18 2017', 213, N'Conquering hills to get in shape, scouring your neighborhood for the perfect espresso, and even commuting to and from work are fun on Specialized''s Vita Sport Carbon. Its lightweight, women''s-specific carbon frame and fork deliver the perfect blend of speed and road-smoothing luxury. You''ll love the easy-spinning wheels, and the lightning-quick shifts of the wide-range, hill-topping Shimano/microSHIFT drivetrain with FSA cranks. All that speed is easily controlled with powerful Shimano hydraulic disc brakes. Plus, the Specialized Body Geometry women''s saddle and grips with integrated bar-ends provide outstanding comfort on every fun outing.', 10, 1, 16, CAST(N'2018-04-30T21:45:44.250' AS DateTime))
INSERT [dbo].[tbl_Product] ([id], [name], [price], [description], [remainQuantity], [status], [productId], [creationDate]) VALUES (12, N'Fornix BT450', 321, N'Conquering hills to get in shape, scouring your neighborhood for the perfect espresso, and even commuting to and from work are fun on Specialized''s Vita Sport Carbon. Its lightweight, women''s-specific carbon frame and fork deliver the perfect blend of speed and road-smoothing luxury. You''ll love the easy-spinning wheels, and the lightning-quick shifts of the wide-range, hill-topping Shimano/microSHIFT drivetrain with FSA cranks. All that speed is easily controlled with powerful Shimano hydraulic disc brakes. Plus, the Specialized Body Geometry women''s saddle and grips with integrated bar-ends provide outstanding comfort on every fun outing.', 10, 1, 17, CAST(N'2018-04-30T21:47:20.597' AS DateTime))
INSERT [dbo].[tbl_Product] ([id], [name], [price], [description], [remainQuantity], [status], [productId], [creationDate]) VALUES (13, N'Galaxy MT18 2017', 321, N'Conquering hills to get in shape, scouring your neighborhood for the perfect espresso, and even commuting to and from work are fun on Specialized''s Vita Sport Carbon. Its lightweight, women''s-specific carbon frame and fork deliver the perfect blend of speed and road-smoothing luxury. You''ll love the easy-spinning wheels, and the lightning-quick shifts of the wide-range, hill-topping Shimano/microSHIFT drivetrain with FSA cranks. All that speed is easily controlled with powerful Shimano hydraulic disc brakes. Plus, the Specialized Body Geometry women''s saddle and grips with integrated bar-ends provide outstanding comfort on every fun outing.', 10, 1, 18, CAST(N'2018-04-30T21:53:46.363' AS DateTime))
INSERT [dbo].[tbl_Product] ([id], [name], [price], [description], [remainQuantity], [status], [productId], [creationDate]) VALUES (14, N'Giant ATX 610 2017', 312, N'Conquering hills to get in shape, scouring your neighborhood for the perfect espresso, and even commuting to and from work are fun on Specialized''s Vita Sport Carbon. Its lightweight, women''s-specific carbon frame and fork deliver the perfect blend of speed and road-smoothing luxury. You''ll love the easy-spinning wheels, and the lightning-quick shifts of the wide-range, hill-topping Shimano/microSHIFT drivetrain with FSA cranks. All that speed is easily controlled with powerful Shimano hydraulic disc brakes. Plus, the Specialized Body Geometry women''s saddle and grips with integrated bar-ends provide outstanding comfort on every fun outing.', 10, 1, 19, CAST(N'2018-04-30T21:53:59.730' AS DateTime))
INSERT [dbo].[tbl_Product] ([id], [name], [price], [description], [remainQuantity], [status], [productId], [creationDate]) VALUES (15, N'Fornix BT450', 312, N'Conquering hills to get in shape, scouring your neighborhood for the perfect espresso, and even commuting to and from work are fun on Specialized''s Vita Sport Carbon. Its lightweight, women''s-specific carbon frame and fork deliver the perfect blend of speed and road-smoothing luxury. You''ll love the easy-spinning wheels, and the lightning-quick shifts of the wide-range, hill-topping Shimano/microSHIFT drivetrain with FSA cranks. All that speed is easily controlled with powerful Shimano hydraulic disc brakes. Plus, the Specialized Body Geometry women''s saddle and grips with integrated bar-ends provide outstanding comfort on every fun outing.', 10, 1, 20, CAST(N'2018-04-30T21:55:51.760' AS DateTime))
INSERT [dbo].[tbl_Product] ([id], [name], [price], [description], [remainQuantity], [status], [productId], [creationDate]) VALUES (16, N'Fornix BT450', 312, N'Conquering hills to get in shape, scouring your neighborhood for the perfect espresso, and even commuting to and from work are fun on Specialized''s Vita Sport Carbon. Its lightweight, women''s-specific carbon frame and fork deliver the perfect blend of speed and road-smoothing luxury. You''ll love the easy-spinning wheels, and the lightning-quick shifts of the wide-range, hill-topping Shimano/microSHIFT drivetrain with FSA cranks. All that speed is easily controlled with powerful Shimano hydraulic disc brakes. Plus, the Specialized Body Geometry women''s saddle and grips with integrated bar-ends provide outstanding comfort on every fun outing.', 10, 1, 21, CAST(N'2018-04-30T21:56:12.880' AS DateTime))
INSERT [dbo].[tbl_Product] ([id], [name], [price], [description], [remainQuantity], [status], [productId], [creationDate]) VALUES (17, N'Giant ATX 610 2017', 312, N'Conquering hills to get in shape, scouring your neighborhood for the perfect espresso, and even commuting to and from work are fun on Specialized''s Vita Sport Carbon. Its lightweight, women''s-specific carbon frame and fork deliver the perfect blend of speed and road-smoothing luxury. You''ll love the easy-spinning wheels, and the lightning-quick shifts of the wide-range, hill-topping Shimano/microSHIFT drivetrain with FSA cranks. All that speed is easily controlled with powerful Shimano hydraulic disc brakes. Plus, the Specialized Body Geometry women''s saddle and grips with integrated bar-ends provide outstanding comfort on every fun outing.', 16, 1, 22, CAST(N'2018-04-30T21:56:35.163' AS DateTime))
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (1, N'SHIMANO SLM310', N'CST', N'red', N'RDTY300', CAST(N'2018-07-12T00:00:00.000' AS DateTime), 10, 0)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (2, N'Cobanzz', N'CST 26,5×1.95″', N'green', N'edited', CAST(N'2018-04-13T00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (3, N'shimano', N'MX2.0', N'green', N'Merida ', CAST(N'2018-04-13T00:00:00.000' AS DateTime), 8, 0)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (4, N'SHIMANO ST-EF41', N'CST 26,5×1.95″', N'green', N'Prowheel', CAST(N'2018-04-13T00:00:00.000' AS DateTime), 3, 1)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (5, N'Carbon MX2.0', N'MX2.0', N'green2', N'Merida ', CAST(N'2018-04-13T00:00:00.000' AS DateTime), 12, 0)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (6, N'Talon 3 2017', N'CST 26,5×1.95″', N'green', N'Prowheel', CAST(N'2018-04-13T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (7, N'Shimano Tourney', N'MX2.0', N'green', N'Merida ', CAST(N'2018-04-13T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (8, N'Merida Challenger 700', N'CST 26,5×1.95″', N'green', N'Prowheel', CAST(N'2018-04-13T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (9, N'Merida Duke 300', N'CST 26,5×1.95″', N'green', N'Merida ', CAST(N'2018-04-13T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (10, N'Giant XTC 860 2018', N'CST 26,5×1.95″', N'green', N'Merida ', CAST(N'2018-04-13T00:00:00.000' AS DateTime), 3, 0)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (11, N'Giant XTC 860 2018', N'CST 26,5×1.95″', N'black', N'Prowheel', CAST(N'2018-04-18T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (12, N'Giant XTC 860 2018', N'CST 26,5×1.95″', N'black', N'Prowheel', CAST(N'2018-04-11T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (13, N'Giant XTC 860 2018', N'CST 26,5×1.95″', N'blue', N'Prowheel', CAST(N'2018-04-12T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (14, N'Giant XTC 860 2018', N'CST 26,5×1.95″', N'blue', N'Prowheel', CAST(N'2018-04-13T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (15, N'Giant XTC 860 2018', N'CST 26,5×1.95″', N'black', N'Prowheel', CAST(N'2018-04-14T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (16, N'Giant XTC 860 2018', N'CST 26,5×1.95″', N'blue', N'Prowheel', CAST(N'2018-04-13T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (17, N'Giant XTC 860 2018', N'CST 26,5×1.95″', N'blue', N'Prowheel', CAST(N'2018-04-13T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (18, N'Giant XTC 860 2018', N'CST 26,5×1.95″', N'blue', N'Prowheel', CAST(N'2018-04-13T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (19, N'Giant XTC 860 2018', N'CST 26,5×1.95″', N'black', N'Prowheel', CAST(N'2018-04-13T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (20, N'Giant XTC 860 2018', N'CST 26,5×1.95″', N'black', N'Prowheel', CAST(N'2018-04-13T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (21, N'Giant XTC 860 2018', N'CST 26,5×1.95″', N'black', N'Prowheel', CAST(N'2018-04-13T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tbl_ProductDetail] ([productId], [chassis], [tire], [color], [fork], [release_Date], [quantity], [status]) VALUES (22, N'Giant XTC 860 2018', N'CST 26,5×1.95″', N'black', N'Prowheel', CAST(N'2018-04-13T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tbl_Role] ([id], [name]) VALUES (1, N'admin')
INSERT [dbo].[tbl_Role] ([id], [name]) VALUES (2, N'user')
INSERT [dbo].[tbl_User] ([id], [email], [password], [first_Name], [last_Name], [phone], [status], [role_Id]) VALUES (1, N'vuprobs12@gmail.com', N'vuprobs1', N'vu', N'vu dep trai', N'1231231231', 1, 1)
INSERT [dbo].[tbl_User] ([id], [email], [password], [first_Name], [last_Name], [phone], [status], [role_Id]) VALUES (2, N'nguyentin@gmail.com', N'1234', N'nguyen', N'tin', N'01231231232', 1, 1)
INSERT [dbo].[tbl_User] ([id], [email], [password], [first_Name], [last_Name], [phone], [status], [role_Id]) VALUES (3, N'hongle@gmail.com', N'123', N'hong', N'le', N'09342158292', 1, 1)
INSERT [dbo].[tbl_User] ([id], [email], [password], [first_Name], [last_Name], [phone], [status], [role_Id]) VALUES (4, N'nguyenhong@gmail.com', N'123', N'nguyen', N'hong', N'12341234123', 0, 2)
INSERT [dbo].[tbl_User] ([id], [email], [password], [first_Name], [last_Name], [phone], [status], [role_Id]) VALUES (5, N'longtrinh@gmail.com', N'123', N'long', N'trinh', N'1234567890', 0, 2)
INSERT [dbo].[tbl_User] ([id], [email], [password], [first_Name], [last_Name], [phone], [status], [role_Id]) VALUES (6, N'tuanha@gmail.com', N'123', N'tuan', N'ha', N'1231231231', 0, 2)
INSERT [dbo].[tbl_User] ([id], [email], [password], [first_Name], [last_Name], [phone], [status], [role_Id]) VALUES (7, N'vuprobs123@gmail.com', N'123456', N'vu', N'huynh', N'1234567890', 1, 2)
INSERT [dbo].[tbl_User] ([id], [email], [password], [first_Name], [last_Name], [phone], [status], [role_Id]) VALUES (8, N'vuprobs121@gmail.com', N'123456', N'vu', N'huynh', N'1234567890', 0, 2)
INSERT [dbo].[tbl_User] ([id], [email], [password], [first_Name], [last_Name], [phone], [status], [role_Id]) VALUES (9, N'vuprobs1223@gmail.com', N'123456', N'vu', N'huynh', N'1234567890', 0, 2)
INSERT [dbo].[tbl_User] ([id], [email], [password], [first_Name], [last_Name], [phone], [status], [role_Id]) VALUES (10, N'trucly@gmail.com', N'123456', N'ly', N'truc', N'0984333222', 1, 2)
INSERT [dbo].[tbl_User] ([id], [email], [password], [first_Name], [last_Name], [phone], [status], [role_Id]) VALUES (11, N'vuprobs12123@gmail.com', N'123123', N'vu', N'hunh', N'1231231123', 0, 2)
INSERT [dbo].[tbl_User] ([id], [email], [password], [first_Name], [last_Name], [phone], [status], [role_Id]) VALUES (12, N'tinha@gmail.com', N'123', N'tin', N'ha', N'1231231121', 1, 1)
INSERT [dbo].[tbl_User] ([id], [email], [password], [first_Name], [last_Name], [phone], [status], [role_Id]) VALUES (13, N'loitran@gmail.com', N'loixinhdep', N'loi', N'khung', N'1639637944', 1, 2)
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Person]    Script Date: 8/9/2018 11:37:35 AM ******/
ALTER TABLE [dbo].[tbl_User] ADD  CONSTRAINT [UC_Person] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Image]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Image_tbl_ProductDetail] FOREIGN KEY([product_Id])
REFERENCES [dbo].[tbl_ProductDetail] ([productId])
GO
ALTER TABLE [dbo].[tbl_Image] CHECK CONSTRAINT [FK_tbl_Image_tbl_ProductDetail]
GO
ALTER TABLE [dbo].[tbl_Order]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Order_tbl_User] FOREIGN KEY([user_Id])
REFERENCES [dbo].[tbl_User] ([id])
GO
ALTER TABLE [dbo].[tbl_Order] CHECK CONSTRAINT [FK_tbl_Order_tbl_User]
GO
ALTER TABLE [dbo].[tbl_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_OrderDetail_tbl_Order] FOREIGN KEY([order_Id])
REFERENCES [dbo].[tbl_Order] ([id])
GO
ALTER TABLE [dbo].[tbl_OrderDetail] CHECK CONSTRAINT [FK_tbl_OrderDetail_tbl_Order]
GO
ALTER TABLE [dbo].[tbl_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_OrderDetail_tbl_Product] FOREIGN KEY([product_Id])
REFERENCES [dbo].[tbl_Product] ([id])
GO
ALTER TABLE [dbo].[tbl_OrderDetail] CHECK CONSTRAINT [FK_tbl_OrderDetail_tbl_Product]
GO
ALTER TABLE [dbo].[tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Product_tbl_ProductDetail] FOREIGN KEY([productId])
REFERENCES [dbo].[tbl_ProductDetail] ([productId])
GO
ALTER TABLE [dbo].[tbl_Product] CHECK CONSTRAINT [FK_tbl_Product_tbl_ProductDetail]
GO
ALTER TABLE [dbo].[tbl_User]  WITH CHECK ADD  CONSTRAINT [FK_tbl_User_tbl_Role] FOREIGN KEY([role_Id])
REFERENCES [dbo].[tbl_Role] ([id])
GO
ALTER TABLE [dbo].[tbl_User] CHECK CONSTRAINT [FK_tbl_User_tbl_Role]
GO
USE [master]
GO
ALTER DATABASE [StoreDB] SET  READ_WRITE 
GO
