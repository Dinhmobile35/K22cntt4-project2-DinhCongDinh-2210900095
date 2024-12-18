USE [K22CNT4_DinhCongDinh_2210900095_db]
GO
/****** Object:  Table [dbo].[AdminLogs]    Script Date: 16/11/2024 11:43:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminLogs](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[AdminID] [int] NULL,
	[Action] [nvarchar](255) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 16/11/2024 11:43:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 16/11/2024 11:43:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 16/11/2024 11:43:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[Status] [nvarchar](20) NULL,
	[PaymentMethod] [nvarchar](20) NULL,
	[DeliveryAddress] [nvarchar](255) NULL,
	[OrderCode] [nvarchar](20) NULL,
	[RecipientName] [nvarchar](100) NULL,
	[RecipientEmail] [nvarchar](255) NULL,
	[RecipientPhone] [nvarchar](20) NULL,
	[RecipientAddress] [nvarchar](255) NULL,
	[Username] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 16/11/2024 11:43:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[PaymentDate] [datetime] NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[PaymentMethod] [nvarchar](20) NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 16/11/2024 11:43:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 16/11/2024 11:43:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[QuantityInStock] [int] NULL,
	[CategoryID] [int] NULL,
	[MainImageUrl] [nvarchar](255) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 16/11/2024 11:43:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[Rating] [int] NULL,
	[Comment] [nvarchar](1000) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 16/11/2024 11:43:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NOT NULL,
	[AddedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 16/11/2024 11:43:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[Address] [nvarchar](255) NULL,
	[Role] [nvarchar](20) NULL,
	[CreatedAt] [datetime] NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishList]    Script Date: 16/11/2024 11:43:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishList](
	[WishListID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[AddedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[WishListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [CreatedAt]) VALUES (1, N'key phần mềm', N'key', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [CreatedAt]) VALUES (2, N'Usb boot', N'usb boot phần mềm,iso', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (1, 1, NULL, 2, CAST(23333.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (2, 2, NULL, 1, CAST(23333.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (3, 3, NULL, 1, CAST(23333.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (4, 3, NULL, 1, CAST(23333.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (5, 4, 8, 1, CAST(400000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (6, 5, 8, 1, CAST(400000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (7, 6, 8, 1, CAST(400000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (8, 7, 9, 1, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (9, 8, 8, 3, CAST(400000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (10, 8, 9, 2, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (11, 9, 8, 1, CAST(400000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (12, 10, 8, 1, CAST(400000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (13, 10, 10, 1, CAST(435000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (14, 11, 9, 1, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (15, 11, 8, 4, CAST(400000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (16, 12, 8, 1, CAST(400000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (17, 13, 11, 1, CAST(1000000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (18, 13, 9, 1, CAST(10000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [PaymentMethod], [DeliveryAddress], [OrderCode], [RecipientName], [RecipientEmail], [RecipientPhone], [RecipientAddress], [Username]) VALUES (1, 7, CAST(N'2024-11-13T21:46:58.203' AS DateTime), CAST(46666.00 AS Decimal(18, 2)), N'Pending', N'COD', N'Địa chỉ giao hàng', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [PaymentMethod], [DeliveryAddress], [OrderCode], [RecipientName], [RecipientEmail], [RecipientPhone], [RecipientAddress], [Username]) VALUES (2, 7, CAST(N'2024-11-13T21:47:09.257' AS DateTime), CAST(23333.00 AS Decimal(18, 2)), N'Chờ xử lý', N'COD', N'Địa chỉ giao hàng', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [PaymentMethod], [DeliveryAddress], [OrderCode], [RecipientName], [RecipientEmail], [RecipientPhone], [RecipientAddress], [Username]) VALUES (3, 7, CAST(N'2024-11-13T22:23:18.767' AS DateTime), CAST(46666.00 AS Decimal(18, 2)), N'Pending', N'COD', N'Địa chỉ giao hàng', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [PaymentMethod], [DeliveryAddress], [OrderCode], [RecipientName], [RecipientEmail], [RecipientPhone], [RecipientAddress], [Username]) VALUES (4, 7, CAST(N'2024-11-13T23:40:12.423' AS DateTime), CAST(400000.00 AS Decimal(18, 2)), N'Pending', N'COD', N'Địa chỉ giao hàng', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [PaymentMethod], [DeliveryAddress], [OrderCode], [RecipientName], [RecipientEmail], [RecipientPhone], [RecipientAddress], [Username]) VALUES (5, 7, CAST(N'2024-11-14T13:38:18.307' AS DateTime), CAST(400000.00 AS Decimal(18, 2)), N'Đã xử lý', N'COD', N'Địa chỉ giao hàng', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [PaymentMethod], [DeliveryAddress], [OrderCode], [RecipientName], [RecipientEmail], [RecipientPhone], [RecipientAddress], [Username]) VALUES (6, 7, CAST(N'2024-11-15T18:08:23.553' AS DateTime), CAST(400000.00 AS Decimal(18, 2)), N'Pending', N'COD', N'Địa chỉ giao hàng', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [PaymentMethod], [DeliveryAddress], [OrderCode], [RecipientName], [RecipientEmail], [RecipientPhone], [RecipientAddress], [Username]) VALUES (7, 7, CAST(N'2024-11-15T21:10:04.610' AS DateTime), CAST(10000.00 AS Decimal(18, 2)), N'Pending', N'COD', N'Địa chỉ giao hàng', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [PaymentMethod], [DeliveryAddress], [OrderCode], [RecipientName], [RecipientEmail], [RecipientPhone], [RecipientAddress], [Username]) VALUES (8, 1, CAST(N'2024-11-16T09:16:59.993' AS DateTime), CAST(1220000.00 AS Decimal(18, 2)), N'Chưa xử lý', NULL, NULL, NULL, N'dinh', N'dinhmobile35@gmail.com', N'0399355483', N'Đinhqiwdwqd', NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [PaymentMethod], [DeliveryAddress], [OrderCode], [RecipientName], [RecipientEmail], [RecipientPhone], [RecipientAddress], [Username]) VALUES (9, 1, CAST(N'2024-11-16T09:18:29.253' AS DateTime), CAST(400000.00 AS Decimal(18, 2)), N'Chưa xử lý', NULL, NULL, NULL, N'èwf', N'dagewd@gmail.com', N'022', N'ưdqd', NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [PaymentMethod], [DeliveryAddress], [OrderCode], [RecipientName], [RecipientEmail], [RecipientPhone], [RecipientAddress], [Username]) VALUES (10, 1, CAST(N'2024-11-16T09:29:49.237' AS DateTime), CAST(835000.00 AS Decimal(18, 2)), N'Chưa xử lý', NULL, NULL, NULL, N'dffsf', N'dinhmobile35@gmail.com', N'0399355483', N' vfs', NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [PaymentMethod], [DeliveryAddress], [OrderCode], [RecipientName], [RecipientEmail], [RecipientPhone], [RecipientAddress], [Username]) VALUES (11, 1, CAST(N'2024-11-16T20:05:51.473' AS DateTime), CAST(1610000.00 AS Decimal(18, 2)), N'Chưa xử lý', NULL, NULL, NULL, N'dinh', N'dinhmobile35@gmail.com', N'0399355483', N'1', NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [PaymentMethod], [DeliveryAddress], [OrderCode], [RecipientName], [RecipientEmail], [RecipientPhone], [RecipientAddress], [Username]) VALUES (12, 1, CAST(N'2024-11-16T22:44:28.667' AS DateTime), CAST(400000.00 AS Decimal(18, 2)), N'Chưa xử lý', NULL, NULL, NULL, N'dinh', N'dinhmobile35@gmail.com', N'0399355483', N'ưda', NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [PaymentMethod], [DeliveryAddress], [OrderCode], [RecipientName], [RecipientEmail], [RecipientPhone], [RecipientAddress], [Username]) VALUES (13, 1, CAST(N'2024-11-16T23:14:41.687' AS DateTime), CAST(1010000.00 AS Decimal(18, 2)), N'Chưa xử lý', NULL, NULL, NULL, N'dinh', N'dinhmobile35@gmail.com', N'0399355483', N'gưeg', NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [Price], [QuantityInStock], [CategoryID], [MainImageUrl], [CreatedAt]) VALUES (8, N'Phần mềm diệt virus Kaspersky', N'Phần mềm diệt virus Kaspersky', CAST(400000.00 AS Decimal(18, 2)), 2, 1, N'https://anhdvshop.com/wp-content/uploads/2024/04/kaspersky-antivirus-anhdv-shop-300x300.png', NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [Price], [QuantityInStock], [CategoryID], [MainImageUrl], [CreatedAt]) VALUES (9, N'Bộ cài Windows 11 AIO Premium ', N'Bộ cài Windows 11 AIO Premium định dạng ISO', CAST(10000.00 AS Decimal(18, 2)), 100, NULL, N'https://anhdvshop.com/wp-content/uploads/2022/02/Win11_Premium_AIO-300x300.jpg', NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [Price], [QuantityInStock], [CategoryID], [MainImageUrl], [CreatedAt]) VALUES (10, N'Bộ cài Windows 10 Premium', N'Bộ cài Windows 10 Premium định dạng ISO', CAST(435000.00 AS Decimal(18, 2)), 1, 1, N'https://anhdvshop.com/wp-content/uploads/2021/05/windows10_Premium_AIO_Anhdvshop_1-300x300.jpg', NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [Price], [QuantityInStock], [CategoryID], [MainImageUrl], [CreatedAt]) VALUES (11, N' Mã kích hoạt bản quyền cho Office', N'Key Office Pro Plus liên kết với Email của bạn và dùng vĩnh viễn cho 01 máy tính. Khi cài lại Windows hay chuyển máy thì vào trang quản lý tài khoản để huỷ máy cũ và kích hoạt lại trên máy mới. Office 2019 trở lên chỉ cài được trên Windows 10 và 11. Chọn đúng phiên bản cho Windows hoặc Macbook.', CAST(1000000.00 AS Decimal(18, 2)), 100, 1, N'https://anhdvshop.com/wp-content/uploads/2022/06/Office_2021_Pro_Plus_Digital-510x510.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ShoppingCart] ON 

INSERT [dbo].[ShoppingCart] ([CartID], [UserID], [ProductID], [Quantity], [AddedAt]) VALUES (15, 7, 9, 1, CAST(N'2024-11-16T08:49:12.590' AS DateTime))
INSERT [dbo].[ShoppingCart] ([CartID], [UserID], [ProductID], [Quantity], [AddedAt]) VALUES (24, 11, 8, 1, CAST(N'2024-11-16T22:39:15.803' AS DateTime))
INSERT [dbo].[ShoppingCart] ([CartID], [UserID], [ProductID], [Quantity], [AddedAt]) VALUES (28, 1, 11, 1, CAST(N'2024-11-16T23:16:10.800' AS DateTime))
SET IDENTITY_INSERT [dbo].[ShoppingCart] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Email], [PasswordHash], [FullName], [PhoneNumber], [Address], [Role], [CreatedAt], [Status]) VALUES (1, N'nguyen_van_a', N'nguyenvana@example.com', N'hashed_password1', N'Nguy?n Van A', N'0987654321', N'Hà N?i', N'user', NULL, N'Active')
INSERT [dbo].[Users] ([UserID], [Username], [Email], [PasswordHash], [FullName], [PhoneNumber], [Address], [Role], [CreatedAt], [Status]) VALUES (2, N'tran_thi_b', N'tranthib@example.com', N'hashed_password2', N'Tr?n Th? B', N'0976543210', N'TP. H? Chí Minh', N'user', NULL, N'Active')
INSERT [dbo].[Users] ([UserID], [Username], [Email], [PasswordHash], [FullName], [PhoneNumber], [Address], [Role], [CreatedAt], [Status]) VALUES (3, N'le_van_c', N'levanc@example.com', N'hashed_password3', N'Lê Van C', N'0965432109', N'Ðà N?ng', N'user', NULL, N'Active')
INSERT [dbo].[Users] ([UserID], [Username], [Email], [PasswordHash], [FullName], [PhoneNumber], [Address], [Role], [CreatedAt], [Status]) VALUES (4, N'pham_minh_d', N'phamminhd@example.com', N'hashed_password4', N'Ph?m Minh D', N'0954321098', N'C?n Tho', N'Admin', NULL, N'Inactive')
INSERT [dbo].[Users] ([UserID], [Username], [Email], [PasswordHash], [FullName], [PhoneNumber], [Address], [Role], [CreatedAt], [Status]) VALUES (5, N'admin_user', N'admin@example.com', N'hashed_password5', N'Admin User', N'0943210987', N'Hà N?i', N'Admin', CAST(N'2024-11-08T09:00:39.827' AS DateTime), N'Active')
INSERT [dbo].[Users] ([UserID], [Username], [Email], [PasswordHash], [FullName], [PhoneNumber], [Address], [Role], [CreatedAt], [Status]) VALUES (7, N'dinh', N'dinhmobile325@gmail.com', N'1', N'dinhcongdinh', NULL, NULL, N'user', NULL, N'Active')
INSERT [dbo].[Users] ([UserID], [Username], [Email], [PasswordHash], [FullName], [PhoneNumber], [Address], [Role], [CreatedAt], [Status]) VALUES (11, N'admin', N'dinhmobile35@gmail.com', N'123', N'admin', N'0399', N'abc', N'Admin', NULL, N'Active')
INSERT [dbo].[Users] ([UserID], [Username], [Email], [PasswordHash], [FullName], [PhoneNumber], [Address], [Role], [CreatedAt], [Status]) VALUES (13, N'dinhrrrrr', N'dinhmobile3255@gmail.com', N'123', N'dinhcongdinhefer3r', NULL, NULL, NULL, CAST(N'2024-11-16T23:13:39.257' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E48E51C8D4]    Script Date: 16/11/2024 11:43:14 CH ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534099D3951]    Script Date: 16/11/2024 11:43:14 CH ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdminLogs] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [PaymentDate]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT ('Paid') FOR [Status]
GO
ALTER TABLE [dbo].[ProductImages] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [QuantityInStock]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ShoppingCart] ADD  DEFAULT (getdate()) FOR [AddedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('customer') FOR [Role]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('active') FOR [Status]
GO
ALTER TABLE [dbo].[WishList] ADD  DEFAULT (getdate()) FOR [AddedAt]
GO
ALTER TABLE [dbo].[AdminLogs]  WITH CHECK ADD FOREIGN KEY([AdminID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
