USE [master]
GO
CREATE DATABASE [ShoppingProject]
GO
USE [ShoppingProject]
GO
ALTER DATABASE [ShoppingProject] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoppingProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShoppingProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoppingProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoppingProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoppingProject] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoppingProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoppingProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoppingProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoppingProject] SET QUERY_STORE = OFF
GO
USE [ShoppingProject]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/6/2021 4:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [nchar](16) NOT NULL,
	[Name] [nchar](128) NULL,
	[Type] [nchar](128) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 6/6/2021 4:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Email] [nchar](128) NULL,
	[Detail] [text] NULL,
	[Rating] [int] NULL,
	[Status] [bit] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/6/2021 4:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerEmail] [nchar](128) NULL,
	[Status] [bit] NULL,
	[SaleEmail] [nchar](128) NULL,
	[CompleteDate] [date] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 6/6/2021 4:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 6/6/2021 4:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nchar](128) NULL,
	[Title] [nchar](256) NULL,
	[ThumbnailLink] [nchar](512) NULL,
	[UploadDate] [date] NULL,
	[Status] [bit] NULL,
	[Details] [text] NULL,
	[CategoryId] [nchar](16) NULL,
	[OnSlider] [bit] NULL,
	[UpdateDate] [date] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/6/2021 4:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](128) NULL,
	[CategoryId] [nchar](16) NULL,
	[ThumbnailLink] [nchar](512) NULL,
	[OringinalSalePrice] [float] NULL,
	[Details] [text] NULL,
	[SalePrice] [float] NULL,
	[Status] [bit] NULL,
	[Stock] [int] NULL,
	[SaleStatus] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/6/2021 4:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [nchar](16) NOT NULL,
	[Name] [nchar](128) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/6/2021 4:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Email] [nchar](128) NOT NULL,
	[Password] [nchar](20) NULL,
	[AvatarLink] [nchar](512) NULL,
	[Address] [nchar](100) NULL,
	[FullName] [nchar](50) NULL,
	[PhoneNumber] [nchar](12) NULL,
	[Gender] [nchar](16) NULL,
	[CreationDate] [date] NULL,
	[Status] [bit] NULL,
	[RoleId] [nchar](16) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([Id], [Name], [Type]) VALUES (N'C1              ', N'Sweet Cake                                                                                                                      ', N'cake                                                                                                                            ')
INSERT [dbo].[Category] ([Id], [Name], [Type]) VALUES (N'C2              ', N'Savory Cake                                                                                                                     ', N'cake                                                                                                                            ')
INSERT [dbo].[Category] ([Id], [Name], [Type]) VALUES (N'C3              ', N'Bread                                                                                                                           ', N'cake                                                                                                                            ')
INSERT [dbo].[Category] ([Id], [Name], [Type]) VALUES (N'C4              ', N'Cream Cake                                                                                                                      ', N'cake                                                                                                                            ')
INSERT [dbo].[Category] ([Id], [Name], [Type]) VALUES (N'P1              ', N'Promoting                                                                                                                       ', N'post                                                                                                                            ')
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [Email], [Title], [ThumbnailLink], [UploadDate], [Status], [Details], [CategoryId], [OnSlider], [UpdateDate]) VALUES (1, N'market@fpt.edu.vn                                                                                                               ', N'Testing                                                                                                                                                                                                                                                         ', NULL, CAST(N'2021-05-30' AS Date), 0, N'This is a testing post used for testing purposes. Thank you for testing this test', N'P1              ', 0, CAST(N'2021-05-30' AS Date))
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [CategoryId], [ThumbnailLink], [OringinalSalePrice], [Details], [SalePrice], [Status], [Stock], [SaleStatus]) VALUES (2, N'Melon Cake                                                                                                                      ', N'C1              ', NULL, 136000, N'Cake filled with melon flavor', 96000, 1, 6, 0)
INSERT [dbo].[Product] ([Id], [Name], [CategoryId], [ThumbnailLink], [OringinalSalePrice], [Details], [SalePrice], [Status], [Stock], [SaleStatus]) VALUES (3, N'Spam Cake                                                                                                                       ', N'C2              ', NULL, 150000, N'Covered in spam', 120000, 0, 0, 0)
INSERT [dbo].[Product] ([Id], [Name], [CategoryId], [ThumbnailLink], [OringinalSalePrice], [Details], [SalePrice], [Status], [Stock], [SaleStatus]) VALUES (4, N'Strawberry Birthday Cake                                                                                                        ', N'C3              ', NULL, 280000, N'Basic strawberry flavored birthday cake', 240000, 1, 2, 0)
INSERT [dbo].[Product] ([Id], [Name], [CategoryId], [ThumbnailLink], [OringinalSalePrice], [Details], [SalePrice], [Status], [Stock], [SaleStatus]) VALUES (5, N'Europian-styled Wedding Cake                                                                                                    ', N'C4              ', NULL, 670000, N'A 3-floor wedding cake for a fancy couple ', 560000, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'ad              ', N'Admin                                                                                                                           ')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'mkt             ', N'Marketing                                                                                                                       ')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'sa              ', N'Sale                                                                                                                            ')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'us              ', N'User                                                                                                                            ')
GO
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'admin@fpt.edu.vn                                                                                                                ', N'admin               ', NULL, N'fpt university                                                                                      ', N'A Van Minh                                        ', N'0963484125  ', N'Male            ', CAST(N'2021-05-30' AS Date), 1, N'ad              ')
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'market@fpt.edu.vn                                                                                                               ', N'market              ', NULL, N'fpt university                                                                                      ', N'Ma Thi Ket Tinh                                   ', N'0874125678  ', N'Female          ', CAST(N'2021-05-30' AS Date), 1, N'mkt             ')
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'sale@fpt.edu.vn                                                                                                                 ', N'sale                ', NULL, N'fpt university                                                                                      ', N'Sa Van Le                                         ', N'0987412361  ', N'Male            ', CAST(N'2021-05-30' AS Date), 1, N'sa              ')
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'user@fpt.edu.vn                                                                                                                 ', N'user                ', NULL, N'fpt university                                                                                      ', N'U Van So                                          ', N'0877741125  ', N'Male            ', CAST(N'2021-05-30' AS Date), 1, N'us              ')
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Product]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_User] FOREIGN KEY([Email])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerEmail])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Sale] FOREIGN KEY([SaleEmail])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Sale]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Order]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Product]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Category]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_User] FOREIGN KEY([Email])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [ShoppingProject] SET  READ_WRITE 
GO
