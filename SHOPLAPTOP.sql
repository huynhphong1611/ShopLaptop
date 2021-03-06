USE [master]
GO
/****** Object:  Database [SHOPLAPTOP]    Script Date: 07/03/2021 10:12:31 AM ******/
CREATE DATABASE [SHOPLAPTOP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SHOPDIENTHOAI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SHOPDIENTHOAI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SHOPDIENTHOAI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SHOPDIENTHOAI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SHOPLAPTOP] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SHOPLAPTOP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SHOPLAPTOP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET ARITHABORT OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SHOPLAPTOP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SHOPLAPTOP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SHOPLAPTOP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SHOPLAPTOP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET RECOVERY FULL 
GO
ALTER DATABASE [SHOPLAPTOP] SET  MULTI_USER 
GO
ALTER DATABASE [SHOPLAPTOP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SHOPLAPTOP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SHOPLAPTOP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SHOPLAPTOP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SHOPLAPTOP] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SHOPLAPTOP', N'ON'
GO
ALTER DATABASE [SHOPLAPTOP] SET QUERY_STORE = OFF
GO
USE [SHOPLAPTOP]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 07/03/2021 10:12:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMIN](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserUsername] [nvarchar](255) NOT NULL,
	[UserPassword] [nvarchar](255) NOT NULL,
	[UserName] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BRAND]    Script Date: 07/03/2021 10:12:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BRAND](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](255) NOT NULL,
	[BrandURL] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONFIGURATION]    Script Date: 07/03/2021 10:12:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONFIGURATION](
	[ConfigID] [int] IDENTITY(1,1) NOT NULL,
	[OSName] [nvarchar](255) NULL,
	[OSVersion] [nvarchar](255) NULL,
	[SizeDisplay] [nvarchar](255) NULL,
	[FrontCamera] [nvarchar](255) NULL,
	[Cpu] [nvarchar](255) NULL,
	[Ram] [nvarchar](255) NULL,
	[Battery] [nvarchar](255) NULL,
	[ProductID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 07/03/2021 10:12:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerUsername] [nvarchar](255) NOT NULL,
	[CustomerPassword] [nvarchar](255) NOT NULL,
	[CustomerEmail] [nvarchar](255) NULL,
	[CustomerName] [nvarchar](255) NOT NULL,
	[CustomerPhone] [nvarchar](20) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDER]    Script Date: 07/03/2021 10:12:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[Total] [decimal](18, 2) NULL,
	[CustomerName] [nvarchar](255) NOT NULL,
	[CustomerPhone] [nvarchar](20) NOT NULL,
	[CustomerAddress] [nvarchar](255) NOT NULL,
	[OrderStatusID] [int] NULL,
	[CustomerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERDETAIL]    Script Date: 07/03/2021 10:12:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERDETAIL](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERSTATUS]    Script Date: 07/03/2021 10:12:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERSTATUS](
	[StatusID] [int] NOT NULL,
	[StatusName] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 07/03/2021 10:12:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[ProductPrice] [decimal](18, 0) NOT NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[Rating] [int] NULL,
	[ProductImage] [nvarchar](4000) NULL,
	[ProductStock] [int] NULL,
	[ProductURL] [nvarchar](255) NULL,
	[Viewcount] [int] NULL,
	[ProductStatus] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[BrandID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ADMIN] ON 

INSERT [dbo].[ADMIN] ([UserId], [UserUsername], [UserPassword], [UserName], [CreatedDate]) VALUES (1, N'hoang', N'4297f44b13955235245b2497399d7a93', N'Nguyễn Hoàng', CAST(N'2020-11-20T15:30:35.547' AS DateTime))
INSERT [dbo].[ADMIN] ([UserId], [UserUsername], [UserPassword], [UserName], [CreatedDate]) VALUES (2, N'quang', N'e10adc3949ba59abbe56e057f20f883e', N'Vũ Minh Quang', CAST(N'2020-11-20T15:30:35.557' AS DateTime))
INSERT [dbo].[ADMIN] ([UserId], [UserUsername], [UserPassword], [UserName], [CreatedDate]) VALUES (3, N'unknow_viet', N'1234231', N'Viet Vo', CAST(N'2020-11-11T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ADMIN] OFF
SET IDENTITY_INSERT [dbo].[BRAND] ON 

INSERT [dbo].[BRAND] ([BrandID], [BrandName], [BrandURL], [CreatedDate]) VALUES (1, N'Lenovo', N'lenovo', CAST(N'2020-11-20T15:30:35.523' AS DateTime))
INSERT [dbo].[BRAND] ([BrandID], [BrandName], [BrandURL], [CreatedDate]) VALUES (2, N'Samsung', N'samsung', CAST(N'2020-11-20T15:30:35.523' AS DateTime))
INSERT [dbo].[BRAND] ([BrandID], [BrandName], [BrandURL], [CreatedDate]) VALUES (3, N'Dell', N'dell', CAST(N'2020-11-20T15:30:35.523' AS DateTime))
INSERT [dbo].[BRAND] ([BrandID], [BrandName], [BrandURL], [CreatedDate]) VALUES (4, N'Hp', N'hp', CAST(N'2020-11-20T15:30:35.523' AS DateTime))
INSERT [dbo].[BRAND] ([BrandID], [BrandName], [BrandURL], [CreatedDate]) VALUES (5, N'Asus', N'asus', CAST(N'2020-11-20T15:30:35.523' AS DateTime))
SET IDENTITY_INSERT [dbo].[BRAND] OFF
SET IDENTITY_INSERT [dbo].[CONFIGURATION] ON 

INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (1, N'Window', N'Window 10', N'15 inch', N'20 MP', N'Intel Core i5 1035G7', N'8 GB', N'4400 mAh', 1)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (2, N'Window', N'Window 10', N'12 inch', N'12 MP', N'Intel Core i5 1035G7', N'8 GB', N'4400 mAh', 2)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (3, N'Window', N'Window 10', N'13 inch', N'7 MP', N'Intel Core i7 1165G7', N'16 GB', N'5600 mAh', 3)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (4, N'Window', N'Window 10', N'14 inch', N'10 MP', N'Intel Core i7 1165G7', N'12 GB', N'4400 mAh', 4)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (5, N'Window', N'Window 10', N'11 inch', N'40 MP', N'AMD Ryzen 9 5900HX', N'12 GB', N'5000 mAh', 5)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (6, N'Window', N'Window 10', N'14 inch', N'32 MP', N'AMD Ryzen 5 4500U', N'8 GB', N'4400 mAh', 6)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (7, N'Window', N'Window 10', N'15 inch', N'7 MP', N'Intel Core i7 10510U', N'8 GB', N'4400 mAh', 7)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (8, N'Window', N'Window 10', N'15 inch', N'	12 MP', N'Intel Core i7 10510U', N'8 GB', N'4400 mAh', 8)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (9, N'Window', N'Window 10', N'12 inch', N'	12 MP', N'AMD Ryzen 9 5900HX', N'8 GB', N'6000 mAh', 9)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (10, N'Window', N'Window 10', N'13 inch', N'12 MP', N'AMD Ryzen 9 5900HX', N'8 GB', N'4400 mAh', 10)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (11, N'Window', N'Window 10', N'14 inch', N'	12 MP', N'AMD Ryzen 5 4500U', N'8 GB', N'4400 mAh', 11)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (12, N'Window', N'Window 10', N'14 inch', N'40 MP', N'AMD Ryzen 9 5900HX', N'16 GB', N'4400 mAh', 12)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (13, N'Window', N'Window 10', N'15 inch', N'12 MP', N'Intel Core i7 1165G7', N'8 GB', N'5600 mAh', 13)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (14, N'Window', N'Window 10', N'12 inch', N'32 MP', N'Intel Core i5 1035G7', N'16 GB', N'4400 mAh', 14)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (15, N'Window', N'Window 10', N'13 inch', N'12 MP', N'Intel Core i7 10510U', N'8 GB', N'4400 mAh', 15)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (16, N'Window', N'Window 10', N'14 inch', N'32 MP', N'AMD Ryzen 5 4500U', N'16 GB', N'5400 mAh', 16)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (17, N'Ubuntu', N'Ubuntu 20', N'15 inch', N'32 MP', N'Intel Core i7 10510U', N'8 GB', N'6000 mAh', 17)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (18, N'Ubuntu', N'Ubuntu 20', N'11 inch', N'12 MP', N'Intel Core i7 1165G7', N'16 GB', N'4400 mAh', 18)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (19, N'Ubuntu', N'Ubuntu 20', N'14 inch', N'40 MP', N'Intel Core i7 10510U', N'8 GB', N'4400 mAh', 19)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (20, N'Ubuntu', N'Ubuntu 20', N'15 inch', N'12 MP', N'Intel Core i5 1035G7', N'16 GB', N'4400 mAh', 20)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (21, N'Ubuntu', N'Ubuntu 20', N'13 inch', N'32 MP', N'Intel Core i7 10510U', N'8 GB', N'4400 mAh', 21)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (22, N'Linux ', N'Linux 18', N'14 inch', N'12 MP', N'Intel Core i7 1165G7', N'16 GB', N'4400 mAh', 22)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (23, N'Linux ', N'Linux 18', N'13 inch', N'40 MP', N'Intel Core i7 10510U', N'8 GB', N'5000 mAh', 23)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (24, N'Linux ', N'Linux 18', N'12 inch', N'12 MP', N'Intel Core i5 1035G7', N'16 GB', N'4400 mAh', 24)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (25, N'Linux ', N'Linux 18', N'14 inch', N'40 MP', N'Intel Core i7 10510U', N'8 GB', N'5000 mAh', 25)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (26, N'Linux ', N'Linux 18', N'15 inch', N'12 MP', N'AMD Ryzen 9 5900HX', N'16 GB', N'4400 mAh', 26)
INSERT [dbo].[CONFIGURATION] ([ConfigID], [OSName], [OSVersion], [SizeDisplay], [FrontCamera], [Cpu], [Ram], [Battery], [ProductID]) VALUES (27, N'', NULL, N'13 inch', NULL, NULL, NULL, N'4400 mAh', NULL)
SET IDENTITY_INSERT [dbo].[CONFIGURATION] OFF
SET IDENTITY_INSERT [dbo].[ORDER] ON 

INSERT [dbo].[ORDER] ([OrderID], [OrderDate], [Total], [CustomerName], [CustomerPhone], [CustomerAddress], [OrderStatusID], [CustomerID]) VALUES (1, CAST(N'2021-03-05T00:00:00.000' AS DateTime), CAST(8378000.00 AS Decimal(18, 2)), N'Nguyen Anh Tien', N'014521456845', N'100 Hoang Quoc Viet', 3, NULL)
SET IDENTITY_INSERT [dbo].[ORDER] OFF
SET IDENTITY_INSERT [dbo].[ORDERDETAIL] ON 

INSERT [dbo].[ORDERDETAIL] ([DetailID], [Quantity], [OrderID], [ProductID]) VALUES (1, 2, 1, 23)
INSERT [dbo].[ORDERDETAIL] ([DetailID], [Quantity], [OrderID], [ProductID]) VALUES (2, 1, 1, 20)
SET IDENTITY_INSERT [dbo].[ORDERDETAIL] OFF
INSERT [dbo].[ORDERSTATUS] ([StatusID], [StatusName], [CreatedDate]) VALUES (1, N'Đang xử lý', CAST(N'2020-11-20T15:30:35.537' AS DateTime))
INSERT [dbo].[ORDERSTATUS] ([StatusID], [StatusName], [CreatedDate]) VALUES (2, N'Đang giao hàng', CAST(N'2020-11-20T15:30:35.537' AS DateTime))
INSERT [dbo].[ORDERSTATUS] ([StatusID], [StatusName], [CreatedDate]) VALUES (3, N'Đã giao hàng', CAST(N'2020-11-20T15:30:35.537' AS DateTime))
INSERT [dbo].[ORDERSTATUS] ([StatusID], [StatusName], [CreatedDate]) VALUES (4, N'Hàng có lỗi', CAST(N'2020-11-20T15:30:35.537' AS DateTime))
INSERT [dbo].[ORDERSTATUS] ([StatusID], [StatusName], [CreatedDate]) VALUES (5, N'Đã hủy', CAST(N'2020-11-20T15:30:35.537' AS DateTime))
SET IDENTITY_INSERT [dbo].[PRODUCT] ON 

INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (1, N'Lenovo IdeaPad L340-15IRH 81LK00FAVN', N'Laptop Lenovo Ideapad Gaming 3i 15IMH05 81Y40067VN. Sở hữu cấu hình khủng bao gồm chip Intel Core i7 Gen 10, RAM 8 GB cùng card đồ họa rời mạnh mẽ, Lenovo Ideapad Gaming 3i 15IMH05 81Y40067VN hoàn toàn xứng danh là một trong những chiếc laptop gaming mạnh mẽ nhất hiện nay.Vẻ ngoài thanh lịch, giản đơnDù là sản phẩm dành cho gaming nhưng Ideapad Gaming 3i có thiết kế thanh lịch, giản đơn. Nhờ vậy mà sản phẩm có thể sử dụng phù hợp ở mọi nơi, mọi môi trường. Build máy chắc chắn, bao phủ lên toàn bộ chiếc laptop gaming Lenovo này là màu đen huyền bí, 2 đường vát tinh tế trên nắp máy cùng logo Lenovo ở góc phải. Bên cạnh đó, các góc cạnh trên khung máy cũng được cắt vát để tạo vẻ hiện đại, cá tính.', CAST(43990000 AS Decimal(18, 0)), CAST(41990000 AS Decimal(18, 0)), 5, N'https://laptopworld.vn/media/product/4491_lenovo_ideapad_l340_anh5.jpg', 50, N'Lenovo-IdeaPad-L340-15IRH-81LK00FAVN', 170, 1, CAST(N'2020-05-14T18:44:04.920' AS DateTime), 1)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (2, N'Lenovo ThinkPad T490s', N'Với thiết kế sang trọng, hiệu năng mạnh mẽ cùng những tính năng mới hấp dẫn và tuổi thọ pin lâu dài, Lenovo ThinkPad T490 xứng đáng là sản phẩm cao cấp được các doanh nhân ưa chuộng nhất hiện nay.Hiệu năng mạnh mẽ đáp ứng mọi nhu cầuLenovo ThinkPad T490s được trang bị bộ vi xử lý Intel Core i5 hoặc I7 Processor Gen 10th đem đến hiệu năng cao và trải nghiệm chất lượng cho người dùng thay cho Chip xử lý đàn em Gen 8ThBên cạnh đó, với bộ nhớ trong Ram 8GB/16GB đảm bảo xử lí các thao tác thật mượt mà và ổn định;Đặc biệt, với card đồ họa Integrated Graphics bạn có thể hoàn toàn yên tâm rằng máy có thể hỗ trợ bạn tối đa từ các việc đơn giản đến các công việc mang tính chất đòi hỏi cao như thiết kế đồ họa, 3D, photoshop,... cũng như giải tríNăm nay Lenovo cho bạn lựa chọn phiên bản GPU rời với GTX MX250', CAST(37990000 AS Decimal(18, 0)), NULL, 5, N'https://mac24h.vn/images/detailed/48/ThinkPadT490_ht9a-sh_t3wt-9h_rlql-bk_8ywh-mw.jpg?t=1604894144', 50, N'Lenovo-ThinkPad-T490s', 199, 1, CAST(N'2020-05-14T18:44:04.920' AS DateTime), 1)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (3, N'Lenovo Thinkbook 14 IML 20RV00B8VN', N'Được thiết kế cho giới doanh nhân chuyên nghiệp năng động, Lenovo ThinkPad T14 14 inch mang đến hiệu suất và bảo mật bạn cần để luôn năng suất trong lúc di chuyển. Trang bị chip xử lý Intel Core thế hệ thứ 10 lõi tứ mới nhất, 8GB RAM DDR4 và dung lượng ổ cứng SSD M.2 NVMe PCIe 256GB, laptop này có thể tải nhanh chóng và xử lý đa tác vụ đa dạng ứng dụng. Laptop này còn sử dụng màn hình 14 inch 1366 x 768 HD TN cho hình ảnh trong rõ, bất kể bạn làm việc với văn bản, lướt internet hay xem video với loa tăng cường Dolby.

Các màn hình tương thích có thể kết nối qua cac cổng USB Type-C và Thunderbolt 3 để mở rộng tầm nhìn; hai cổng này cũng hỗ trợ sạc điện. Máy cho phép truyền tập tin từ khay đọc thẻ microSD tích hợp hoặc kết nối với thiết bị ngoại vi tương thích như ổ cứng ngoài đến các cổng USB 3.1 Gen 1 Type-A và Type-C cho tốc độ thông lưu cao nhất là 5 Gb/s. Các thiết bị Thunderbolt 3 có thể kết nối và tạo daisy chain cho tốc độ truyền tải dữ liệu đạt đến 40 Gb/s.', CAST(37990000 AS Decimal(18, 0)), NULL, 5, N'https://laptopworld.vn/media/product/6465_', 50, N'Lenovo-Thinkbook-14-IML-20RV00B8VN', 199, 1, CAST(N'2020-05-14T18:44:04.920' AS DateTime), 1)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (4, N'Samsung Galaxy Book Flex Alpha', N'Galaxy Book Flex và Book Ion đã được Samsung trình làng vào hồi tháng 10, tuy nhiên đến hiện tại bộ đôi này vẫn chưa được chính thức lên kệ. Hôm nay (3/1), trước thềm CES 2020, công ty lại ra mắt thêm một mẫu laptop thuộc dòng sản phẩm này có tên là Galaxy Book Flex Alpha, với mức giá rẻ hơn khá nhiều so với hai thế hệ trước mà vẫn sở hữu nhiều tính năng cao cấp.

Thiết kế
Cụ thể, Galaxy Book Flex Alpha có ngoại hình gần như không khác gì so với chiếc Galaxy Book Flex, khi nó hoàn thiện từ chất liệu nhôm, có các cạnh sắc nét và viền khá mỏng, cùng với phần bản lề có khả năng xoay 360 độ, giúp bạn có thể sử dụng máy ở nhiều tư thế khác nhau.', CAST(50000000 AS Decimal(18, 0)), NULL, 5, N'https://mac24h.vn/images/detailed/48/surface-laptop-go-ice-blue-00-700x700.jpg?t=1604710171', 50, N'Samsung-Galaxy-Book-Flex-Alpha', 1, 1, CAST(N'2020-05-14T18:44:04.920' AS DateTime), 2)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (5, N'Samsung Galaxy S20 Ultra', N'Samsung Galaxy S20 Ultra siêu phẩm công nghệ hàng đầu của Samsung mới ra mắt với nhiều đột phá công nghệ, màn hình tràn viền không khuyết điểm, hiệu năng đỉnh cao, camera độ phân giải siêu khủng 108 MP cùng khả năng zoom 100X thách thức mọi giới hạn .', CAST(29990000 AS Decimal(18, 0)), NULL, 5, N'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTDxy3izVeXspgKfTs6GBFePtdWxyv5vrKrqnTEoGVs2UxiW4yrAJHIbvYhEPbAfBq_0v2O4e8khgM&usqp=CAc', 50, N'Samsung-Galaxy-S20-Ultra', 66, 1, CAST(N'2020-05-14T18:44:04.920' AS DateTime), 2)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (6, N'DELL XPS 13 7390', N'Dell XPS 13 7390 là mẫu laptop được Dell định hướng là dòng giải trí, làm việc cao cấp. Một chiếc máy mang trong mình hình dáng nhỏ gọn nhưng vẫn đảm bảo được sự ổn định và bền bỉ để phục vụ công việc cũng như giải trí xuyên suốt một ngày làm việc. Dell XPS 13 7390 mặc dù không có thay đổi gì nhiều so với các phiên bản trước kia, thế nhưng chất lượng sản phẩm vẫn luôn được đảm bảo. Vẫn được sử dụng bằng chất lượng Carbon Fiber, XPS 13 7390 mang tới trải nghiệm vô cùng dễ chịu cho người dùng. Độ hoàn thiện thiết kế tốt khiến cho máy luôn giữ được dáng vẻ thanh lịch vốn có của nó. Ngoài ra bản lề của máy cũng rất chắc chắn khiến người dùng yên tâm trong quá trình sử dụng.', CAST(13990000 AS Decimal(18, 0)), NULL, 5, N'https://laptophaianh.vn/image/cache/catalog/71kwzzf79nl.-sl1500--600x600.jpg', 50, N'DELL-XPS-13-7390', 80, 1, CAST(N'2020-05-14T18:44:04.920' AS DateTime), 3)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (7, N'Lenovo Thinkpad X1 Extreme ', N'Laptop đầu tiên của mình có màn hình 15 inch, và nhiều như mình đánh giá cao bất động sản màn hình mà nó cung cấp, viên gạch dày của một thiết bị quá nặng để chuyên chở. Khi đến lúc phải nâng cấp, mình cũng như rất nhiều người đã cưỡi trên làn sóng laptop màn hình nhỏ đã trở nên phổ biến trong thập kỷ qua.', CAST(15000000 AS Decimal(18, 0)), CAST(14999000 AS Decimal(18, 0)), 4, N'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQwNXdCdxHsTjOKiSR6LuFIlHrSoYPY0UUFfFFg0QlrouK4afphykS8XtcHh7Jo1xTaoPh7gnY7ekpG&usqp=CAc', 40, N'Lenovo-Thinkpad-X1-Extreme-', 120, 1, CAST(N'2020-05-14T19:08:30.053' AS DateTime), 1)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (8, N'Lenovo ThinkPad E590 20NBS07000', N'Là một laptop phục vụ giới văn phòng, bàn phím của máy không thể chê vào đâu được với kích thước phím vừa vặn, không bị trượt tay khi gõ. Độ nảy của phím cũng rất tốt, giúp duy trì tốc độ gõ văn bản. Ngoài ra, máy có kích thước 15 inch nên có thêm cả bàn phím số bên tay phải. Đây hẳn là trợ thủ đắc lực của người dùng cần xử lý, nhập số liệu, mà không cần phải trang bị thêm bàn phím số nữa.', CAST(23990000 AS Decimal(18, 0)), NULL, 4, N'https://laptopworld.vn/media/product/6624_lenovo_thinkpad_e590_5.jpg', 100, N'Lenovo-ThinkPad-E590-20NBS07000', 420, 1, CAST(N'2020-05-14T19:11:38.233' AS DateTime), 1)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (9, N'Lenovo IdeaPad 3 14ARE05 81W3002FVN', N'Laptop Lenovo Yoga Duet 7 13IML05 – Laptop nhỏ gọn, màn hình 2K sắc nét
Lenovo Yoga Duet 7 13IML05 là một mẫu laptop Lenovo nổi bật với thiết kế mỏng nhẹ, hiệu năng cao.

Thiết kế 2 trong 1, màn hình 2K, 13 inch nhỏ gọn, độ phủ màu 100% sRGB
Laptop Lenovo Yoga Duet 7 13IML05 là một mẫu laptop vô cùng đặc biệt với thiết kế 2 trong 1. Cụ thể, với bàn phím Bluetooth có thể tháo rời, Yoga Duet 7 13IML05 có thể hoán đổi giữa laptop và tablet.', CAST(25690000 AS Decimal(18, 0)), CAST(23490000 AS Decimal(18, 0)), 4, N'https://laptopworld.vn/media/product/6000_6000_lenovo_ideapad_3_6.jpg', 100, N'Lenovo-IdeaPad-3-14ARE05-81W3002FVN', 90, 1, CAST(N'2020-05-14T19:13:30.810' AS DateTime), 1)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (10, N'
Lenovo Legion Y545', N'Lenovo Legion Y545 15 inch sở hữu hiệu suất tuyệt vời thường chỉ thấy trên desktop, trang bị chip xử lý Intel Core thế hệ thứ 9, card đồ họa NVIDIA GeForce GTX, bộ dung lượng cao và hệ thống tản nhiệt xuất sắc trong thiết kế cân bằng giữa hiệu suất game khủng và tính linh động thực dụng cho phép bạn tận hưởng các trò chơi ở bất kỳ đâu.', CAST(30490000 AS Decimal(18, 0)), CAST(29990000 AS Decimal(18, 0)), 4, N'https://zshop.vn/images/thumbnails/1065/596/detailed/112/ezgif-2-e35af44ea080_ltwz-9f_4e4n-yj.jpg?t=1600254312', 10, N'Lenovo-Legion-Y545', 38, 1, CAST(N'2020-05-14T19:15:16.880' AS DateTime), 1)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (11, N'Lenovo IdeaPad S145 15IIL', N'Khi đang di chuyể, bạn sẽ không bao giờ phải mang theo ổ cắm điện vì chúng tôi đã thiết kế IdeaPad S540 với thời lượng pin lên tới 9 giờ. Nếu cần sạc pin, đừng lo lắng vì bạn sẽ không mất nhiều thời gian lắm đâu. Công nghệ RapidCharge của S540 cho cho bạn 2 giờ sử dụng chỉ với một lần sạc trong 15 phút và 70% công suất chỉ trong một giờ', CAST(21690000 AS Decimal(18, 0)), NULL, 4, N'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQdaXwliVj7-pTT90CclF_r9hNomRYPyAHid86A0-IBWQ3CBxXZ9zKcGGMWq6OEnyEKdiKdbbzAOQ&usqp=CAc', 100, N'Lenovo-IdeaPad-S145-15IIL', 23, 1, CAST(N'2020-05-14T19:18:13.560' AS DateTime), 1)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (12, N'Samsung Ultralbook Np900x3G', N'Laptop Ultralbook Samsung 940x3g
==> Laptop Ultralbook Samsung 940X3G

Core i5 – 4200u, 4G, SSD 128G, 3K, Touch, 13.9in

Dòng SAMSUNG cao cấp, siêu mỏng siêu nhẹ, hình ảnh cực sắc nét.', CAST(36000000 AS Decimal(18, 0)), CAST(35999000 AS Decimal(18, 0)), 4, N'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT6OTQwRrdvleskyhyOIe0dy3CHhRAL6Zei7lr9tWWA-okG3trjjkFaG99XD5nV1Q&usqp=CAc', 55, N'Samsung-Ultralbook-Np900x3G', 55, 1, CAST(N'2020-05-14T19:22:41.770' AS DateTime), 2)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (13, N'Samsung Notebook 9 PRO 13.3', N'Galaxy Book Flex và Book Ion đã được Samsung trình làng vào hồi tháng 10, tuy nhiên đến hiện tại bộ đôi này vẫn chưa được chính thức lên kệ. Hôm nay (3/1), trước thềm CES 2020, công ty lại ra mắt thêm một mẫu laptop thuộc dòng sản phẩm này có tên là Galaxy Book Flex Alpha, với mức giá rẻ hơn khá nhiều so với hai thế hệ trước mà vẫn sở hữu nhiều tính năng cao cấp.

', CAST(27000000 AS Decimal(18, 0)), CAST(25490000 AS Decimal(18, 0)), 4, N'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQhXAfjoPg5qHNbAztM0cnJ_cOgamewpAWh_zSdJ_cq36jsF35qsafePVwzeUl0QEfPtSo26aH6NOlMSzXZJZvFL-seAJVgdP2jmu6C4Yc-KWgV4_Oku9Z6&usqp=CAE', 100, N'Samsung-Notebook-9-PRO-13.3', 23, 1, CAST(N'2020-05-14T19:24:33.727' AS DateTime), 2)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (14, N'Laptop Samsung Galaxy Book Flex2', N'Trong gia đình nhà Microsoft, Surface vẫn được coi là siêu phẩm. Với những thế hệ cải tiến mới như Surface Laptop Core i7, sản phẩm được cho là sẽ mang đến cho người sử dụng sự đa dạng và linh hoạt hơn hẳn khi dùng.

Nếu như bạn đã quen thuộc với những thiết bị lai đình đám của thương hiệu danh giá này, chắc hẳn Microsoft cũng đã nghĩ tới những phương án ra mắt các kiểu mẫu mới để làm hài lòng hơn khách hàng của mình. Trong đó, phải kể tới phải kể tới Surface Studio đẹp ngang ngửa iMac của Apple, và Surface Laptop 2 Core i5 cũng không nằm ở vị trí ngoại lệ trong số đó.', CAST(22990000 AS Decimal(18, 0)), CAST(12990000 AS Decimal(18, 0)), 5, N'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSXUlYEVWtfijQIcbgmJFs9m_jVy3u44wLart-dVmyks9eH8Audlhp6cjGp3WD5n2xvdqbtjttueYIEyq-w3dOMn0uQNHY863UtHM9mc5P6YD9KhUzZJEEC3LM&usqp=CAE', 100, N'Laptop-Samsung-Galaxy-Book-Flex2', 11, 1, CAST(N'2020-05-14T19:27:19.773' AS DateTime), 2)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (15, N'Samsung - Galaxy Book Ion', N'Như vậy là Microsoft đã chính thức tung ra các “siêu phẩm” chủ chốt của mình trong năm 2016 vào tối ngày hôm qua trong sự kiện Microsoft October 2016. Đó là thế hệ Surface Book kế tiếp mang tên Surface Book và Surface Studio.

Theo công bố thì Surface Book Core i7 sử dụng bộ xử lý Intel thế hệ thứ 6, trang bị thêm card đồ họa NVIDIA GTX 965M và nâng thời gian sử dụng pin lên đến 16 giờ. Với những nâng cấp rất đáng quan tâm này, Surface Book i7 hứa hẹn mang đến hiệu suất đồ hoạ tăng gấp đôi so với thế hệ Surface Book cũ, cũng như thời lượng pin tăng 30%. Và điều đáng chú ý là việc khẳng định Surface Book i7 mạnh gấp 3 lần so với dòng Macbook Pro 2013 đến từ Apple.

Khác với MacBook chỉ đơn thuần là laptop thì Surface Book ram 16gb ngoài vai trò là một chiếc laptop thì phần bàn phím và màn hình của thiết bị còn có thể tách ra để biến thành một chiếc tablet màn hình 13.5 inch chạy Windows 10 với cấu hình cực cao và thiết kế sang trọng.', CAST(20000000 AS Decimal(18, 0)), CAST(19999000 AS Decimal(18, 0)), 5, N'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQy4AVFIsm1uuRGEOT3WfBSmdTM7Nj4SuSdfRn0DZ5LlqLw0KmTGvo0GVpzKFsWQD314zkBIzetx23MOU_rOy1VlcY51QXLA1dDChly7eZ_&usqp=CAE', 100, N'Samsung---Galaxy-Book-Ion', 199, 1, CAST(N'2020-05-14T19:29:38.877' AS DateTime), 2)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (16, N'Samsung Galaxy Book S 2020', N'Để đem đến sự tiện lợi nhất cho người dùng thì Microsoft đã cho ra mắt chiếc máy tính 2 trong 1 Surface Pro 7 Core i5 RAM 8GB SSD 128GB với thiết kế hiện đại, có tính di động cao và cấu hình cực ổn định cho những thao tác dễ dàng. Đây hứa hẹn sẽ là chiếc máy tính xách tay hiện đại được người dùng lựa chọn nhiều nhất. Hãy cùng Vương Khang tìm hiểu chi tiết thông tin qua bài viết sau đây.', CAST(18000000 AS Decimal(18, 0)), CAST(17000000 AS Decimal(18, 0)), 5, N'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTBvwl_4wbSxBIICdDo4uO86_VTI67gJCWD49-u1RwL6zrMekGL3Bl5mqY5TF5XhYYtRVu25zOwqeMA8MImXL50LPgWygAnlH5vL-yv_YOGhv5l9ZyLOB6p&usqp=CAE', 100, N'Samsung-Galaxy-Book-S-2020', 123, 1, CAST(N'2020-05-14T19:32:00.807' AS DateTime), 2)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (17, N'Samsung Notebook 7 13.3”', N'Máy tính đa chế độ nhỏ nhất thế giới với tỷ lệ màn hình trên thân máy đạt 90%.
Sức mạnh khủng, hiệu năng tuyệt vời trong một thiết kế thanh gọn.', CAST(14990000 AS Decimal(18, 0)), NULL, 5, N'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTxKJxtlY2kdO_zHYBq1fK3rjI42OB9rXHFw1-9r-hBCMFiRuAnNQFDD9u7KIppJpsPtGcPAJOae0PqpazbRfuAa-W4aaS2yXkZlimYcZ-Y&usqp=CAE', 100, N'Samsung-Notebook-7-13.3”', 420, 1, CAST(N'2020-05-14T19:34:05.977' AS DateTime), 2)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (18, N'Samsung Notebook 9 Np930Mbe-K01Us', N'Như vậy là Microsoft đã chính thức tung ra các “siêu phẩm” chủ chốt của mình trong năm 2016 vào tối ngày hôm qua trong sự kiện Microsoft October 2016. Đó là thế hệ Surface Book kế tiếp mang tên Surface Book và Surface Studio.

Theo công bố thì Surface Book Core i7 sử dụng bộ xử lý Intel thế hệ thứ 6, trang bị thêm card đồ họa NVIDIA GTX 965M và nâng thời gian sử dụng pin lên đến 16 giờ. Với những nâng cấp rất đáng quan tâm này, Surface Book i7 hứa hẹn mang đến hiệu suất đồ hoạ tăng gấp đôi so với thế hệ Surface Book cũ, cũng như thời lượng pin tăng 30%. Và điều đáng chú ý là việc khẳng định Surface Book i7 mạnh gấp 3 lần so với dòng Macbook Pro 2013 đến từ Apple.

Khác với MacBook chỉ đơn thuần là laptop thì Surface Book ram 16gb ngoài vai trò là một chiếc laptop thì phần bàn phím và màn hình của thiết bị còn có thể tách ra để biến thành một chiếc tablet màn hình 13.5 inch chạy Windows 10 với cấu hình cực cao và thiết kế sang trọng', CAST(10490000 AS Decimal(18, 0)), CAST(99999000 AS Decimal(18, 0)), 5, N'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQughX9p40db1gIsyj6ZtG5vW5CxvhaY39sTzwZ9T_pzVrVDBYmKQ3dqtP42TUdI-lZ7asH1ciyKRB-CSnfYbz1OjSFRp53IaotieqROpI&usqp=CAY', 1000, N'Samsung-Notebook-9-Np930Mbe-K01Us', 53, 1, CAST(N'2020-05-14T19:35:56.540' AS DateTime), 2)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (19, N'Dell XPS 15 9550', N'Một hơi thở không khí trong lành. Đây là lần đại tu dòng XPS 15 lớn nhất kể từ năm 2016, nhưng đó có phải là tất cả những gì người hâm mộ XPS muốn? Cùng tìm hiểu kỹ trong bài đánh giá sau đâyHợp kim kim loại giờ đây củng cố các cạnh và góc tương phản với mẫu XPS 15 9570 năm ngoái
Sau gần năm năm sử dụng cùng một khung gầm chính xác từ XPS 15 9550 cho đến XPS 15 7590, Dell XPS 15 9500 là thiết kế lại hoàn toàn mà dòng sản phẩm vô cùng cần thiết. Hệ thống này mang đến một loạt các thay đổi toàn diện : cả bên trong và bên ngoài với màn hình tỷ lệ khung hình 16:10 mới là nổi bật nhất.', CAST(10490000 AS Decimal(18, 0)), CAST(99999000 AS Decimal(18, 0)), 5, N'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQDt44siP-rPeatqZ4xaKfrBcA6beUiQLxTdmZg8d56jKqVehM8D8CfwhsD027O5HCGmeO_k2XRJBf5F-dUAW4ml6FWNmkWe4qYK4ZSVNPCzIRoQ6tfAWGp&usqp=CAE', 100, N'Dell-XPS-15-9550', 310, 1, CAST(N'2020-05-14T19:38:25.270' AS DateTime), 3)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (20, N'HP Envy 13 aq1057TX', N'Hp Envy 13 vốn từ lâu đã là 1 trong những mẫu Laptop hạng sang được nhiều người dùng tin tưởng và chọn lựa, với thiết kế mỏng, nhẹ, tinh tế.

Nay phiên bản 2018 với nhiều sự thay đổi đáng chú ý , càng làm cho chiếc Hp Envy được tối đa hóa sức mạnh để trở thành chiến binh thực thụ của HP trong cuộc đua tranh thị trường phân khúc Laptop hạng sang với các hãng lớn khác. (Dell XPS, Asus UX, Macbook .....)

Vậy hãy cùng Gia Nguyễn tìm hiểu thêm về sản phẩm này xem có điều gì đặc biệt không nhé !', CAST(4000000 AS Decimal(18, 0)), NULL, 4, N'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQl3W5wDlX85Bpo3JERP2GY_7CtFB1z8rSsuRJuuwBrRTCKXT9kmaoOhREgOZVbUA37pPAbKrrWOCuV1nxqITlQ5yi4Zfa4X9DDMH-T8X8&usqp=CAE', 100, N'HP-Envy-13-aq1057TX', 210, 1, CAST(N'2020-05-14T20:57:28.030' AS DateTime), 4)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (21, N'HP Envy X360 15', N'- Màn hình OLED dải động cao HDR với sắc đen trung thực
Tận hưởng độ tương phản hoàn mỹ và độ sâu hình ảnh cao với màn hình OLED 4K có công nghệ dải động cao HDR cho hiển thị sắc nét, rực rỡ.
- Màn hình chống phản chiếu
Giảm hình ảnh phản chiếu trên màn hình và tăng cường độ tương phản để bạn nhìn nội dung hiển thị được rõ ràng và thoải mái ở mọi không gian sử dụng.
- Hiệu chỉnh màu với HP Display Control
Chọn trong 3 không gian màu đã thiết lập sẵn để trải nghiệm được chân thật hơn khi mua sắm trực tuyến, chỉnh sửa hình ảnh hoặc xem phim.
- Chiếc máy tính gập xoay theo phong cách của bạn', CAST(3490000 AS Decimal(18, 0)), NULL, 5, N'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR8kL9A8mNyHNVHykJlyc9R5ZRZg5a0ox9QUmjMhOQDL2Iu1200B0kABO58O97BfdL6gljpNg2iZCvXGlsJjKDJvq7nHb6iynPawaGdDsZUcShX6JOS5ry7eA&usqp=CAE', 100, N'HP-Envy-X360-15', 300, 1, CAST(N'2020-05-14T20:59:01.590' AS DateTime), 4)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (22, N'HP SPECTRE X360 Convertible', N'- Màn hình OLED dải động cao HDR với sắc đen trung thực
Tận hưởng độ tương phản hoàn mỹ và độ sâu hình ảnh cao với màn hình OLED 4K có công nghệ dải động cao HDR cho hiển thị sắc nét, rực rỡ.
- Màn hình chống phản chiếu
Giảm hình ảnh phản chiếu trên màn hình và tăng cường độ tương phản để bạn nhìn nội dung hiển thị được rõ ràng và thoải mái ở mọi không gian sử dụng.
- Hiệu chỉnh màu với HP Display Control
Chọn trong 3 không gian màu đã thiết lập sẵn để trải nghiệm được chân thật hơn khi mua sắm trực tuyến, chỉnh sửa hình ảnh hoặc xem phim.
- Chiếc máy tính gập xoay theo phong cách của bạn', CAST(2690000 AS Decimal(18, 0)), NULL, 5, N'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRsXqAQ98NY77zRan5UP5DoW3JPXWD8LZYw90PeNoOgSi0G28UtwyZacVcQ0wME6aSBgq-u5YPEy7-VFj0Herm0WV0wmI_9N_Lt5KllgWym&usqp=CAE', 100, N'HP-SPECTRE-X360-Convertible', 199, 1, CAST(N'2020-05-14T21:00:09.860' AS DateTime), 4)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (23, N'HP Pavilion x360', N'Sở hữu hiết kế mạnh mẽ với các cạnh sắc nét, dòng chữ Pavilion ở bản lề thì logo HP ở nắp máy cũng được tô điểm nổi bật trên nắp máy. Ưu điểm từ chất vỏ máy cao cấp còn giúp cho máy ít bám vân tay và bụi bẩn, cảm giác cầm nắm trên tay cũng mát lạnh và thoải mái hơn nhiều. ', CAST(2190000 AS Decimal(18, 0)), CAST(2189000 AS Decimal(18, 0)), 5, N'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQFYX1-O4mxw7E7U3uLJZPgHe-gwIdBuTzwZ297Vec_P_KOd-tZX9rEj199lF9KegHAui8aroDtbNcxN-fEM0ORquGMgNuFZe2vIerB3djVYjdMWYljAOjd&usqp=CAE', 100, N'HP-Pavilion-x360', 199, 1, CAST(N'2020-05-14T21:01:53.703' AS DateTime), 4)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (24, N'Asus ZenBook UX425EA', N'Zenbook UX425EA-BM069T có màu xám thông, thể hiện sự thâm trầm, hiện đại. Kiểu dáng cao cấp và hoàn thiện từ kim loại nguyên khối, cùng màn hình viền siêu mỏng tạo nên một chiếc laptop đẹp hoàn mỹ. Asus Zenbook 14 mang tới đẳng cấp riêng biệt cho người dùng, khẳng định đẳng cấp của sự trí tuệ qua một thiết bị công nghệ đỉnh cao.', CAST(24000000 AS Decimal(18, 0)), NULL, 5, N'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTZDBW_B06Wx693-opJaQke8ApbYEa54NFO56waxpi5OBfFxxjf21H08DNbmZSbtcdieXdDyFns2SGnQYATNUG3tKHZ-ngxd2M5nVARQsz1UJ6nTkgtPZER&usqp=CAE', 100, N'Asus-ZenBook-UX425EA', 199, 1, CAST(N'2020-05-14T21:05:44.240' AS DateTime), 5)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (25, N'ASUS VivoBook S533EQ-BQ041T', N'Asus Vivobook S15 S533EQ BQ011T sở hữu trọng lượng chỉ 1.8kg với độ mỏng 16.1mm, thiết kế mỏng nhẹ nên bạn chỉ cần cho Asus VivoBook S15 vào balo, túi xách và mang đi mọi nơi bạn muốn.

Ngoại hình của Asus Vivobook S15 được thiết kế vô cùng tinh tế khi khung máy và vỏ đều được làm hoàn toàn bằng kim loại có độ bền cao. Hạn chế tác động của ngoại lực vào máy làm ảnh hưởng tới linh kiện bên trong. Các cạnh viền được chế tác tinh xảo với đường cắt vát kim cương cực kì thẩm mỹ. Viền cắt kim cương giúp cho máy có vẻ ngoài hấp dẫn hơn và giúp bạn dễ dàng mở nắp ra hơn. 

Màu sắc độc nhất của Asus tạo nên xu hướng mới giúp bạn thể hiện cá tính mạnh mẽ hơn. Asus Vivobook S15 S533EQ BQ011T mang trên mình tông màu Đen India thể hiện khả năng lãnh đạo và cá tính độc lập không lùi bước, sẵn sàng chịu trách nhiệm mọi tình huống', CAST(19990000 AS Decimal(18, 0)), NULL, 5, N'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQnYhFwBAfpteBtUmM0Dh1FLWTwQYbmXtXP65lNooZCkjeJnWe4j1r9RI1hsn3yYpKvRzcRmlqtBs0ILdqmAmiuWlGe-w9kYzFyKi3b9kKd&usqp=CAE', 100, N'ASUS-VivoBook-S533EQ-BQ041T', 199, 1, CAST(N'2020-05-14T21:08:18.930' AS DateTime), 5)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [PromotionPrice], [Rating], [ProductImage], [ProductStock], [ProductURL], [Viewcount], [ProductStatus], [CreatedDate], [BrandID]) VALUES (26, N'Asus Vivobook S533EQ BQ011T', N'Asus Vivobook S15 S533EQ BQ011T sở hữu trọng lượng chỉ 1.8kg với độ mỏng 16.1mm, thiết kế mỏng nhẹ nên bạn chỉ cần cho Asus VivoBook S15 vào balo, túi xách và mang đi mọi nơi bạn muốn.

Ngoại hình của Asus Vivobook S15 được thiết kế vô cùng tinh tế khi khung máy và vỏ đều được làm hoàn toàn bằng kim loại có độ bền cao. Hạn chế tác động của ngoại lực vào máy làm ảnh hưởng tới linh kiện bên trong. Các cạnh viền được chế tác tinh xảo với đường cắt vát kim cương cực kì thẩm mỹ. Viền cắt kim cương giúp cho máy có vẻ ngoài hấp dẫn hơn và giúp bạn dễ dàng mở nắp ra hơn. 

Màu sắc độc nhất của Asus tạo nên xu hướng mới giúp bạn thể hiện cá tính mạnh mẽ hơn. Asus Vivobook S15 S533EQ BQ011T mang trên mình tông màu Đen India thể hiện khả năng lãnh đạo và cá tính độc lập không lùi bước, sẵn sàng chịu trách nhiệm mọi tình huống', CAST(18000000 AS Decimal(18, 0)), CAST(17999000 AS Decimal(18, 0)), 5, N'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcT2lg10fzeUOC5Igp6VKNWuRw-ngVMtihb0dzCGGxikhI9fWxnGke6jixufvLXFq56Da3q9f-SSzDaKga3LkU_JppB4G-MkCg&usqp=CAY', 100, N'Asus-Vivobook-S533EQ-BQ011T', 199, 1, CAST(N'2020-05-14T21:11:03.127' AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[PRODUCT] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ADMIN__04C7FD87592A4F52]    Script Date: 07/03/2021 10:12:32 AM ******/
ALTER TABLE [dbo].[ADMIN] ADD UNIQUE NONCLUSTERED 
(
	[UserUsername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__BRAND__2206CE9BF5730442]    Script Date: 07/03/2021 10:12:32 AM ******/
ALTER TABLE [dbo].[BRAND] ADD UNIQUE NONCLUSTERED 
(
	[BrandName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CUSTOMER__9EE7DC8A29D8B532]    Script Date: 07/03/2021 10:12:32 AM ******/
ALTER TABLE [dbo].[CUSTOMER] ADD UNIQUE NONCLUSTERED 
(
	[CustomerUsername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BRAND] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CUSTOMER] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ORDER] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[ORDERSTATUS] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  DEFAULT ((0)) FOR [PromotionPrice]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  DEFAULT (N'') FOR [ProductImage]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  DEFAULT ((1)) FOR [ProductStock]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CONFIGURATION]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[PRODUCT] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CUSTOMER] ([CustomerID])
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[ORDERSTATUS] ([StatusID])
GO
ALTER TABLE [dbo].[ORDERDETAIL]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[ORDER] ([OrderID])
GO
ALTER TABLE [dbo].[ORDERDETAIL]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[PRODUCT] ([ProductID])
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD FOREIGN KEY([BrandID])
REFERENCES [dbo].[BRAND] ([BrandID])
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD CHECK  (([RATING]>=(0) AND [RATING]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [SHOPLAPTOP] SET  READ_WRITE 
GO
