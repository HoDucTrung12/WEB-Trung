USE [master]
GO
/****** Object:  Database [Fashion_Shop2]    Script Date: 6/2/2022 10:22:01 PM ******/
CREATE DATABASE [Fashion_Shop2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fashion_Shop2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Fashion_Shop2.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Fashion_Shop2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Fashion_Shop2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Fashion_Shop2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fashion_Shop2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fashion_Shop2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fashion_Shop2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fashion_Shop2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Fashion_Shop2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fashion_Shop2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET RECOVERY FULL 
GO
ALTER DATABASE [Fashion_Shop2] SET  MULTI_USER 
GO
ALTER DATABASE [Fashion_Shop2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fashion_Shop2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fashion_Shop2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fashion_Shop2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Fashion_Shop2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Fashion_Shop2', N'ON'
GO
USE [Fashion_Shop2]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/2/2022 10:22:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [varchar](256) NOT NULL,
	[Password] [varchar](256) NOT NULL,
	[Fullname] [nvarchar](256) NOT NULL,
	[Role] [int] NOT NULL,
	[Email] [varchar](256) NULL,
	[Gender] [bit] NOT NULL,
	[Image] [varchar](500) NULL,
	[Birthday] [date] NULL,
	[Phone] [char](10) NOT NULL,
	[Address] [nvarchar](256) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 6/2/2022 10:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](256) NOT NULL,
	[ProductID] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/2/2022 10:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Cus_username] [varchar](256) NOT NULL,
	[Phone] [char](10) NULL,
	[Cus_address] [nvarchar](256) NULL,
	[Cus_email] [varchar](256) NULL,
	[Date] [date] NOT NULL,
	[TotalPrice] [bigint] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/2/2022 10:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_order] [int] NOT NULL,
	[ID_product] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/2/2022 10:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[IDCategory] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Image] [varchar](500) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 6/2/2022 10:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/2/2022 10:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](256) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SizeAndColor]    Script Date: 6/2/2022 10:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SizeAndColor](
	[productID] [nvarchar](50) NOT NULL,
	[size] [nvarchar](50) NOT NULL,
	[color] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_SizeAndColor] PRIMARY KEY CLUSTERED 
(
	[productID] ASC,
	[size] ASC,
	[color] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([Username], [Password], [Fullname], [Role], [Email], [Gender], [Image], [Birthday], [Phone], [Address]) VALUES (N'abc123', N'45262', N'ABC', 2, NULL, 0, NULL, NULL, N'0123123123', NULL)
INSERT [dbo].[Account] ([Username], [Password], [Fullname], [Role], [Email], [Gender], [Image], [Birthday], [Phone], [Address]) VALUES (N'agueroduc01', N'123123', N'Ngọc Đức', 1, N'agueroduc01@gmail.com', 0, NULL, NULL, N'0789924726', NULL)
INSERT [dbo].[Account] ([Username], [Password], [Fullname], [Role], [Email], [Gender], [Image], [Birthday], [Phone], [Address]) VALUES (N'duc123', N'123123123@dD', N'Đức', 2, N'agueroduc01@gmail.com', 0, N'https://picsum.photos/500/500', CAST(N'2001-02-13' AS Date), N'0789924726', N'974/47/22 CMT8 P.5 Q.TB')
INSERT [dbo].[Account] ([Username], [Password], [Fullname], [Role], [Email], [Gender], [Image], [Birthday], [Phone], [Address]) VALUES (N'KH01', N'123123@Dd', N'KH01', 2, N'KH01@gmail.com', 0, N'C:\Users\Ngoc Duc\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\Fashion_shop3\files\checklist.png', NULL, N'0332132412', N'')
INSERT [dbo].[Account] ([Username], [Password], [Fullname], [Role], [Email], [Gender], [Image], [Birthday], [Phone], [Address]) VALUES (N'lethanhtrung', N'123123123@tT', N'Lê Thành Trung', 2, N'n19dccn214@student.ptithcm.edu.vn', 0, N'https://i.picsum.photos/id/757/500/500.jpg?hmac=EwwmT3950su7R_ARfzbUsqubYnt5TnWZRS9zQm36BZA', NULL, N'0942533512', N'Biên Hòa Đồng Nai')
INSERT [dbo].[Account] ([Username], [Password], [Fullname], [Role], [Email], [Gender], [Image], [Birthday], [Phone], [Address]) VALUES (N'trungho', N'123123@dD', N'Hồ Đức Trung', 2, N'n19dccn213@student.ptithcm.edu.vn', 0, NULL, NULL, N'0123123123', N'CưMgar, Đắk Lắk')
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [Cus_username], [Phone], [Cus_address], [Cus_email], [Date], [TotalPrice]) VALUES (1, N'trungho', N'0123123123', N'CưMgar, Đắk Lắk', N'n19dccn213@student.ptithcm.edu.vn', CAST(N'2000-12-01' AS Date), 123000)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([ID], [ID_order], [ID_product], [Quantity], [Price]) VALUES (1, 1, N'1', 2, NULL)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
INSERT [dbo].[Product] ([ID], [Name], [IDCategory], [Price], [Image]) VALUES (N'1', N'Women''s Fashion Handbag', N'BAGS', 56.9900016784668, N'https://d-themes.com/html/riode/images/shop/1.jpg')
INSERT [dbo].[Product] ([ID], [Name], [IDCategory], [Price], [Image]) VALUES (N'10', N'A Dress-suit Valise', N'BAGS', 189.23, N'https://d-themes.com/html/riode/images/shop/10.jpg')
INSERT [dbo].[Product] ([ID], [Name], [IDCategory], [Price], [Image]) VALUES (N'1001', N'New Productttt', N'ACCESSORIES', 5, N'https://d-themes.com/html/riode/images/demos/demo4/products/3.jpg')
INSERT [dbo].[Product] ([ID], [Name], [IDCategory], [Price], [Image]) VALUES (N'11', N'Converse Season Shoes', N'MEN', 135.11, N'https://d-themes.com/html/riode/images/shop/11.jpg')
INSERT [dbo].[Product] ([ID], [Name], [IDCategory], [Price], [Image]) VALUES (N'12', N'Man''s Black Wrist Watch', N'WATCHES', 280.99, N'https://d-themes.com/html/riode/images/shop/12.jpg')
INSERT [dbo].[Product] ([ID], [Name], [IDCategory], [Price], [Image]) VALUES (N'13', N'Comfortable Brown Scart', N'WOMEN', 139.99, N'https://d-themes.com/html/riode/images/shop/13.jpg')
INSERT [dbo].[Product] ([ID], [Name], [IDCategory], [Price], [Image]) VALUES (N'14', N'Cotton-padded Clothing', N'CLOTHING', 125.99, N'https://d-themes.com/html/riode/images/shop/14.jpg')
INSERT [dbo].[Product] ([ID], [Name], [IDCategory], [Price], [Image]) VALUES (N'15', N'Season Sports Sneaker', N'SHOES', 125.99, N'https://d-themes.com/html/riode/images/shop/25.jpg')
INSERT [dbo].[Product] ([ID], [Name], [IDCategory], [Price], [Image]) VALUES (N'2', N'Mackintosh Poket Backpack', N'BAGS', 125.99, N'https://d-themes.com/html/riode/images/shop/2.jpg')
INSERT [dbo].[Product] ([ID], [Name], [IDCategory], [Price], [Image]) VALUES (N'3', N'Fashionable Orginal Trucker', N'SHOES', 111, N'https://d-themes.com/html/riode/images/shop/3.jpg')
INSERT [dbo].[Product] ([ID], [Name], [IDCategory], [Price], [Image]) VALUES (N'4', N'Mackintosh Poket Backpack', N'CLOTHING', 78.64, N'https://d-themes.com/html/riode/images/shop/4.jpg')
INSERT [dbo].[Product] ([ID], [Name], [IDCategory], [Price], [Image]) VALUES (N'5', N'Fashion Man Watch', N'WATCHES', 314.99, N'https://d-themes.com/html/riode/images/shop/5.jpg')
INSERT [dbo].[Product] ([ID], [Name], [IDCategory], [Price], [Image]) VALUES (N'6', N'Men Beautiful Clothing', N'CLOTHING', 93.99, N'https://d-themes.com/html/riode/images/shop/6.jpg')
INSERT [dbo].[Product] ([ID], [Name], [IDCategory], [Price], [Image]) VALUES (N'7', N'Converse Training Shoes', N'SHOES', 113.99, N'https://d-themes.com/html/riode/images/shop/7.jpg')
INSERT [dbo].[Product] ([ID], [Name], [IDCategory], [Price], [Image]) VALUES (N'8', N'Women Beautiful Headgear', N'WOMEN', 78.99, N'https://d-themes.com/html/riode/images/shop/8.jpg')
INSERT [dbo].[Product] ([ID], [Name], [IDCategory], [Price], [Image]) VALUES (N'9', N'Hand Electric Cell', N'ACCESSORIES', 26.99, N'https://d-themes.com/html/riode/images/shop/9.jpg')
INSERT [dbo].[ProductCategory] ([ID], [Name]) VALUES (N'ACCESSORIES', N'ACCESSORIES')
INSERT [dbo].[ProductCategory] ([ID], [Name]) VALUES (N'BAGS', N'BAGS & BACKPACKS')
INSERT [dbo].[ProductCategory] ([ID], [Name]) VALUES (N'CLOTHING', N'CLOTHING')
INSERT [dbo].[ProductCategory] ([ID], [Name]) VALUES (N'MEN', N'MEN')
INSERT [dbo].[ProductCategory] ([ID], [Name]) VALUES (N'SHOES', N'SHOES')
INSERT [dbo].[ProductCategory] ([ID], [Name]) VALUES (N'WATCHES', N'WATCHES')
INSERT [dbo].[ProductCategory] ([ID], [Name]) VALUES (N'WOMEN', N'WOMEN')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (2, N'Customer')
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'1', N'FREE SIZE', N'BLUE', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'1', N'FREE SIZE', N'WHITE', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'10', N'SMALL', N'BLACK', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'10', N'SMALL', N'BROWN', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'1001', N'FreeSize', N'Brown', 46)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'11', N'FREE SIZE', N'YELLOW', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'11', N'LARGE', N'WHITE', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'12', N'FREE SIZE', N'RED', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'12', N'SMALL', N'BLACK', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'13', N'MEDIUM', N'BROWN', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'13', N'SMALL', N'BLACK', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'14', N'MEDIUM', N'GREEN', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'14', N'SMALL', N'WHITE', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'15', N'LARGE', N'BLACK', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'15', N'LARGE', N'RED', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'2', N'MEDIUM', N'BLACK', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'2', N'SMALL', N'WHITE', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'3', N'FREE SIZE', N'YELLOW', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'3', N'LARGE', N'BROWN', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'4', N'SMALL', N'RED', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'5', N'LARGE', N'GREEN', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'5', N'MEDIUM', N'GREEN', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'6', N'MEDIUM', N'YELLOW', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'7', N'FREE SIZE', N'WHITE', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'8', N'MEDIUM', N'WHITE', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'8', N'SMALL', N'BROWN', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'9', N'FREE SIZE', N'WHITE', 50)
INSERT [dbo].[SizeAndColor] ([productID], [size], [color], [quantity]) VALUES (N'9', N'MEDIUM', N'WHITE', 50)
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([Cus_username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([ID_order])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ID_product])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([IDCategory])
REFERENCES [dbo].[ProductCategory] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[SizeAndColor]  WITH CHECK ADD  CONSTRAINT [FK_SizeAndColor_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[SizeAndColor] CHECK CONSTRAINT [FK_SizeAndColor_Product]
GO
USE [master]
GO
ALTER DATABASE [Fashion_Shop2] SET  READ_WRITE 
GO
