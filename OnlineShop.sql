USE [OnlineShop]
GO
/****** Object:  Table [dbo].[About]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MetaTitle] [varchar](250) NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[Detal] [ntext] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifineDate] [datetime] NULL,
	[ModifineBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifineDate] [datetime] NULL,
	[ModifineBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
	[Language] [varchar](2) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [bigint] NOT NULL,
	[CommentMsg] [nvarchar](max) NULL,
	[CommentDate] [datetime] NULL,
	[ProductID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[ParentID] [bigint] NULL,
	[Rate] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MetaTitle] [varchar](250) NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[CategoryID] [bigint] NULL,
	[Detal] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifineDate] [datetime] NULL,
	[ModifineBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
	[Tags] [nvarchar](500) NULL,
	[Language] [varchar](2) NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTag]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTag](
	[ContentID] [bigint] NOT NULL,
	[TagID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ContentTag] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupID] [varchar](20) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Content] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [varchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[ID] [varchar](2) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [varchar](50) NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MetaTitle] [varchar](250) NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](20) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[IncludeVAT] [bit] NULL,
	[Quantity] [int] NULL,
	[CategoryID] [bigint] NULL,
	[Detal] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifineDate] [datetime] NULL,
	[ModifineBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifineDate] [datetime] NULL,
	[ModifineBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[Description] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifineDate] [datetime] NULL,
	[ModifineBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[ID] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Value] [nvarchar](250) NULL,
	[Status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](32) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[GroupID] [varchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[DistrictID] [int] NULL,
	[ProvinceID] [int] NULL,
	[Phone] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifineDate] [datetime] NULL,
	[ModifineBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 16/11/2022 12:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[About] ON 

INSERT [dbo].[About] ([ID], [MetaTitle], [Name], [Description], [Image], [Detal], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (1, N'tinh-nang', N'TÍNH NĂNG PHONG PHÚ', N'Với hơn 100 tính năng', N'/assests/client/images/08.png', N'Với 10 nhóm chính: Sản phẩm, tin tức, banner, dịch vụ, tuyển dụng, hỗ trợ trực tuyến, thành viên, đơn hàng, thanh toán, giới thiệu .. và hơn 100 tính năng phụ, hệ thống Elamweb.com của AIO Việt Nam đầy đủ nhu cầu của 1 website cao cấp.', CAST(N'2022-11-12T01:48:41.670' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[About] ([ID], [MetaTitle], [Name], [Description], [Image], [Detal], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (2, N'chi-phi', N'TỐI ƯU CHI PHÍ', N'Đầu tứ lớn, giá phù hợp

', N'/assests/client/images/010-1.png', N'Với doanh nghiệp mới, chi phí là điều rất đáng lo ngại. chúng tôi đã làm tốt nhiệm vụ hỗ trợ khách hàng này, không phí phát sinh, không phí hosting, mua và sử dụng, trả phí hàng năm tiện lợi!

Theo thống kê của chúng tôi, khi sử dụng dịch vụ của chúng tôi, quý khách hàng đã tiết kiệm được hơn 20tr vnđ chi phí. Còn số này không nhỏ, đủ để bạn có 1 chiến lược Marketing hoàng tráng cùng với chúng tôi', CAST(N'2022-11-12T16:03:48.727' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[About] ([ID], [MetaTitle], [Name], [Description], [Image], [Detal], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (3, N'giao-dien', N'KHO GIAO DIỆN LỚN', N'Với hơn 1000+ mẫu,thoải mái chọn lựa', N'/assests/client/images/010-1.png', N'Kho giao diện của Elamweb.com đa dạng lĩnh vực và phong phú về số lượng được thiết kế bởi các chuyên gia sáng tạo hàng đầu. Website của bạn sẽ luôn đẹp và thu hút trên mọi thiết bị giúp bạn gia tăng doanh số nhanh chóng', CAST(N'2022-11-12T16:05:41.760' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[About] ([ID], [MetaTitle], [Name], [Description], [Image], [Detal], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (4, N'quan-ly', N'QUẢN LÝ DỄ DÀNG', N'Đơn giản hoá việc quản trị web', N'/assests/client/images/06.png', N'Với gần 9 năm kinh nghiệm làm web, chúng tôi hiểu rõ hơn ai hết, khách hàng muốn website phải cực kỳ dễ dàng quản lý. dễ quản lý hơn MS Word, vì vậy bản yên tâm về cách sử dụng!

Chỉ cần vi tính văn phòng và 30 phút tìm hiểu, bạn đã có thể làm chủ trang website của Elamweb.com. Nhưng nếu vẫn chưa chinh phục được, bạn cứ thoải mái liên hệ, chuyên viên của chúng tôi sẽ hướng dẫn bạn tận tình.', CAST(N'2022-11-12T16:08:17.070' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[About] ([ID], [MetaTitle], [Name], [Description], [Image], [Detal], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (5, N'ho-tro', N'HỖ TRỢ 24/7', N'Hệ thống hỗ trợ chuyên nghiệp', N'/assests/client/images/013.png', N'Hệ thống hỗ trợ khách hàng với quy trình quản lý khách hàng chuyên nghiệp, đảm bảo đáp ứng 24/7 những yêu cầu của khách hàng.

Bất cứ khi nào bạn cần, chỉ cần bạn Alo qua đường dây hotline: 0777.777.317 hoặc 09.02468 100, chúng tôi sẽ trả lời cho bạn nhanh nhất có thể.', CAST(N'2022-11-12T16:08:54.770' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[About] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Language]) VALUES (1, N'Tin the gioi', N'tin tg', 1, 1, NULL, CAST(N'2022-09-20T21:29:52.830' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Language]) VALUES (2, N'Tin trong nuoc', N'tin trong nuoc', 2, 2, NULL, CAST(N'2022-09-20T21:30:31.583' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Comment] ([ID], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (0, N'aaaa', CAST(N'2022-11-13T22:24:29.357' AS DateTime), 30, 2, 0, 2)
INSERT [dbo].[Comment] ([ID], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (1, N'aa', NULL, 30, 2, 0, 2)
INSERT [dbo].[Comment] ([ID], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (366, N'đồng hồ tốt', CAST(N'2022-11-15T18:26:40.540' AS DateTime), 277, 2, 0, 0)
INSERT [dbo].[Comment] ([ID], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (492, N'áo đẹp', CAST(N'2022-11-15T18:24:43.750' AS DateTime), 34, 2, 0, 0)
INSERT [dbo].[Comment] ([ID], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (523, N'rat tot', CAST(N'2022-11-15T18:23:23.650' AS DateTime), 30, 2, 0, 0)
INSERT [dbo].[Comment] ([ID], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (742, N'San pham tot', CAST(N'2022-11-13T23:48:12.637' AS DateTime), 30, 2, 0, 2)
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ID], [Content], [Status]) VALUES (1, N'<h2>Hệ thống bán hàng OnlineShop</h2><p>Địa chỉ: Số 298-Nam Từ Liêm-Hà Nội</p><p>Điện thoại: 0123456789</p>', 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ID], [MetaTitle], [Name], [Description], [Image], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Tags], [Language]) VALUES (1, N'tintuc', N'[Đồng Nai] Khai trương rộn ràng,rước ngàn quà sang', N'Black Friday bùng nổ ưu đãi nay càng hấp dẫn với đặc quyền mua sắm tại một số showroom Đồng hồ Galle trong các ngày thứ 5 của tháng 11 này. NGÀY VÀNG, ưu đãi ngập tràn, Đồng hồ Galle tặng thêm chương trình MUA 1 TẶNG 1, áp dụng cộng dồn với ưu đãi Black Friday, không thể bỏ lỡ. ', N'/Data/images/add/rolex1.jpg', 1, NULL, 12, CAST(N'2022-09-30T11:11:38.707' AS DateTime), N'a', NULL, NULL, N'313', N'13                                                                                                                                                                                                                                                        ', 1, NULL, 0, N'Đồng Nai', NULL)
INSERT [dbo].[Content] ([ID], [MetaTitle], [Name], [Description], [Image], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Tags], [Language]) VALUES (2, N'dong-ho', N'Đồng hồ Gucci - Nhà tài trợ đồng hành cùng chương trình "Khởi Nghiệp cùng Kawai"', N'“Khởi nghiệp cùng Kawai” là cuộc thi ý tưởng khởi nghiệp quy mô toàn quốc lớn nhất dành cho sinh viên ở Việt Nam. Cuộc thi được tổ chức thường niên bởi CLB Nhà Doanh nghiệp Tương lai Đại học Ngoại thương dưới sự bảo trợ của Đại sứ quán Nhật Bản tại Việt Nam và được tài trợ bởi Quỹ học bổng Kawai Nhật Bản. Qua 17 mùa tổ chức, cuộc thi là hành trình khai phá và nuôi dưỡng tiềm năng trong từng ý tưởng kinh doanh của những người trẻ tuổi với khát khao kinh doanh, khởi nghiệp cháy bỏng.', N'/Data/images/add/lactay1.jpg', 1, NULL, 12, CAST(N'2022-10-03T10:19:10.240' AS DateTime), N'a', NULL, NULL, N'113', N'                                                                                                                                                                                                                                                          ', 1, NULL, 0, N'Gucci, Kawai', N'vi')
SET IDENTITY_INSERT [dbo].[Content] OFF
GO
INSERT [dbo].[ContentTag] ([ContentID], [TagID]) VALUES (1, N'thoisu')
INSERT [dbo].[ContentTag] ([ContentID], [TagID]) VALUES (1, N'tintuc')
INSERT [dbo].[ContentTag] ([ContentID], [TagID]) VALUES (2, N'Information')
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreateDate], [Status]) VALUES (1, N'duong', N'012345', N'a@gmail.com', N'ha noi', N'tot', CAST(N'2022-09-26T00:05:33.353' AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreateDate], [Status]) VALUES (2, N'hoang', N'1234', N'hoang@gmail.com', N'ha noi', N'khong', CAST(N'2022-09-26T00:20:22.947' AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreateDate], [Status]) VALUES (3, N'hoang', N'1234', N'hoang@gmail.com', N'ha nam', N'aa', CAST(N'2022-09-26T00:22:13.247' AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreateDate], [Status]) VALUES (4, N'hoang', N'1234', N'hoang@gmail.com', N'ha noi', N'ssss', CAST(N'2022-09-26T00:31:02.743' AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreateDate], [Status]) VALUES (5, N'hoang', N'1234', N'b@gmail.com', N'ha nam', N'k', CAST(N'2022-09-26T00:35:47.023' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
INSERT [dbo].[Footer] ([ID], [Content], [Status]) VALUES (N'footer', N'<div class="wrap" >
    <div class="section group" >
        <div class="col_1_of_4 span_1_of_4">
            <h4>Thông tin </h4>
            <ul>
                <li><a href="tin-tuc">Tin tức</a></li>
                <li><a href="dong-ho">Kiến trúc-Nội thất</a></li>
                <li><a href="dien-thoai/oppo">Điện thoại</a></li>
                <li><a href="thoi-trang/quan-au">Thời trang</a></li>
                <li><a href="san-pham">Công nghệ-máy tính</a></li>
            </ul>
        </div>

        <div class="col_1_of_4 span_1_of_4">
            <h4>Thông tin cần biết</h4>
            <ul>
                <li><a href="#">Quy định sử dụng</a></li>
                <li><a href="#">Chính sách bảo mật</a></li>
                <li><a href="#">Hình thức thanh toán</a></li>
                <li><a href="#">Dịch vụ quảng cáo</a></li>
                <li><a href="#">Liên hệ</a></li>
            </ul>
        </div>
        <div class="col_1_of_4 span_1_of_4">
            <h4>Liên hệ</h4>
            <ul>
                <li>Di động: <span style="color:red">(84)12345678</span></li>
                <li>Hotline: <span style="color:red">1900 8730</span></li>
            </ul>
        </div>
        <div class="col_1_of_4 span_1_of_4">
            <div class="social-icons">
                
                <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FDHCNHN.HaUI&tabs=timeline&width=350&height=250&small_header=true&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="350" height="250" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
                <ul>
                    <li><a href="https://www.facebook.com/" target="_blank"><img src="/assests/client/images/facebook.png" alt="" /></a></li>
                    <li><a href="https://twitter.com/" target="_blank"><img src="/assests/client/images/twitter.png" alt="" /></a></li>
                    <li><a href="https://skype.com/" target="_blank"><img src="/assests/client/images/skype.png" alt="" /> </a></li>
                    
                    <li><a href="https://linkedin.com" target="_blank"> <img src="/assests/client/images/linkedin.png" alt="" /></a></li>
                    <div class="clear"></div>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="copy_right">
    <p><img src="https://cpr.haui.edu.vn/media/73/t73819.jpg" style="height:30px;width:30px"/><a href="https://www.facebook.com/DHCNHN.HaUI" target="_blank" style="text-decoration:none;color:red;font-size:24px">Trường Đại Học Công Nghiệp Hà Nội</a></p>
</div>

', 1)
GO
INSERT [dbo].[Language] ([ID], [Name], [IsDefault]) VALUES (N'en', N'Tiếng Anh', 0)
INSERT [dbo].[Language] ([ID], [Name], [IsDefault]) VALUES (N'vi', N'Tiếng Việt', 1)
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1, N'Trang chủ', N'/', 1, N'_blark', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (2, N'Giới thiệu', N'/gioi-thieu', 2, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (3, N'Tin tức', N'/tin-tuc', 3, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (4, N'Sản phẩm', N'/san-pham', 4, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (5, N'Liên hệ', N'/lien-he', 5, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (6, N'Đăng nhập', N'/dang-nhap', 1, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (7, N'Đăng kí', N'/dang-ki', 2, N'_self', 1, 2)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'Menu chính')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'Menu phụ')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (13, CAST(N'2022-09-24T23:39:25.277' AS DateTime), N'hoang', NULL, N'ha noi', N'phanbaoduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (14, CAST(N'2022-09-24T23:56:56.233' AS DateTime), N'hoang', N'1234', N'ha noi', N'phanbaoduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (15, CAST(N'2022-09-25T00:01:21.637' AS DateTime), N'hoang', N'1234', N'ha noi', N'Phanbaoduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (16, CAST(N'2022-09-25T00:08:43.477' AS DateTime), N'hoang', N'1234', N'ha noi', N'phanbaoduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (17, CAST(N'2022-09-25T00:15:42.337' AS DateTime), N'hoang', N'1234', N'ha noi', N'phanbaoduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (18, CAST(N'2022-09-25T00:25:16.877' AS DateTime), N'hoang', N'1234', N'ha noi', N'leaphilip662407@outlook.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (19, CAST(N'2022-09-25T00:28:10.127' AS DateTime), N'hoang', N'1234', N'ha noi', N'leaphilip662407@outlook.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (20, CAST(N'2022-09-25T00:35:49.857' AS DateTime), N'hoang', N'1234', N'ha noi', N'pkduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (21, CAST(N'2022-09-25T00:37:27.140' AS DateTime), N'hoang', N'1234', N'ha noi', N'pkduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (22, CAST(N'2022-09-25T00:39:14.763' AS DateTime), N'hoang', N'1234', N'ha noi', N'pkduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (23, CAST(N'2022-09-25T00:39:25.890' AS DateTime), N'hoang', N'1234', N'ha noi', N'pkduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (24, CAST(N'2022-09-25T00:43:22.147' AS DateTime), N'hoang', N'1234', N'ha noi', N'pkduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (25, CAST(N'2022-09-25T00:47:59.617' AS DateTime), N'hoang', N'1234', N'ha noi', N'leaphilip662407@outlook.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (26, CAST(N'2022-09-25T01:12:28.030' AS DateTime), N'hoang', N'1234', N'ha noi', N'leaphilip662407@outlook.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (27, CAST(N'2022-09-25T01:20:25.893' AS DateTime), N'hoang', N'1234', N'ha noi', N'leaphilip662407@outlook.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (28, CAST(N'2022-09-25T01:30:14.277' AS DateTime), N'hoang', N'1234', N'ha noi', N'phanbaoduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (29, CAST(N'2022-09-25T01:33:12.607' AS DateTime), N'hoang', N'1234', N'ha noi', N'phanbaoduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (30, CAST(N'2022-09-25T01:40:21.957' AS DateTime), N'hoang', N'1234', N'ha noi', N'phanbaoduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (31, CAST(N'2022-09-25T01:41:02.080' AS DateTime), N'hoang', N'1234', N'ha noi', N'phanbaoduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (32, CAST(N'2022-09-25T01:44:04.673' AS DateTime), N'', N'', N'', N'', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (33, CAST(N'2022-09-25T01:44:16.070' AS DateTime), N'hoang', N'1234', N'ha noi', N'phanbaoduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (34, CAST(N'2022-09-25T01:45:44.377' AS DateTime), N'hoang', N'1234', N'ha noi', N'phanbaoduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (35, CAST(N'2022-09-25T10:48:37.083' AS DateTime), N'hoang', N'1234', N'ha noi', N'phanbaoduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (36, CAST(N'2022-09-25T10:50:17.047' AS DateTime), N'hoang', N'1234', N'ha noi', N'phanbaoduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (37, CAST(N'2022-09-25T11:36:11.710' AS DateTime), N'hoang', N'1234', N'ha noi', N'phanbaoduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (38, CAST(N'2022-09-25T11:52:02.817' AS DateTime), N'hoang', N'1234', N'ha noi', N'phanbaoduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (39, CAST(N'2022-09-25T11:54:12.800' AS DateTime), N'hoang', N'1234', N'ha noi', N'phanbaoduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (40, CAST(N'2022-09-25T12:46:37.733' AS DateTime), N'hoang', N'1234', N'ha noi', N'phanbaoduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (41, CAST(N'2022-09-25T22:48:54.933' AS DateTime), N'a', N'123', N'cv', N'phanbaoduong12a3@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (42, CAST(N'2022-09-25T23:59:51.630' AS DateTime), N'a', N'a', N'a', N'leaphilip662407@outlook.com', NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (12, 21, 1, CAST(5000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (12, 22, 1, CAST(5000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (12, 23, 1, CAST(5000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (12, 30, 1, CAST(5000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (12, 31, 1, CAST(5000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (12, 35, 1, CAST(5000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (12, 40, 1, CAST(5000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (13, 3, 5, CAST(4000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (13, 4, 5, CAST(4000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (13, 5, 5, CAST(4000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (13, 25, 1, CAST(4000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (13, 37, 1, CAST(4000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (13, 42, 1, CAST(4000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 2, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 6, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 7, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 8, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 9, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 10, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 11, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 12, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 13, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 14, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 15, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 16, 4, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 17, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 18, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 19, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 20, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 24, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 26, 2, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 27, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 28, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 29, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 32, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 33, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 34, 3, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 36, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 38, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 39, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 41, 1, CAST(1400000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (1, N'tivi-sony-21', N'TiVi Sony 21 inch', N'', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assests/client/images/feature-pic1.jpg', NULL, CAST(5700000 AS Decimal(18, 0)), NULL, NULL, 10, 1, NULL, 10, CAST(N'2022-09-21T14:12:42.487' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2023-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (3, N'may-anh', N'Máy ảnh', N'', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assests/client/images/feature-pic3.jpg', NULL, CAST(1500000 AS Decimal(18, 0)), NULL, NULL, 10, 2, NULL, 10, CAST(N'2022-09-16T14:14:44.167' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2023-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (4, N'may-anh-sony', N'Máy ảnh sony', N'', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assests/client/images/feature-pic4.jpg', NULL, CAST(2200000 AS Decimal(18, 0)), NULL, NULL, 10, 2, NULL, 3, CAST(N'2022-09-15T14:16:13.723' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2023-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (5, N'may-giat', N'Máy giặt Panasonic', N'', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assests/client/images/new-pic1.jpg', NULL, CAST(3500000 AS Decimal(18, 0)), NULL, NULL, 10, 1, NULL, 1, CAST(N'2022-09-21T14:17:45.453' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (6, N'dong-ho-deo-tay', N'Đồng hồ đeo tay', N'', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assests/client/images/new-pic3.jpg', NULL, CAST(4500000 AS Decimal(18, 0)), NULL, NULL, 10, 2, NULL, 2, CAST(N'2022-09-21T14:18:39.177' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (8, N'the-thao', N'Thể Thao', N'', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assests/client/images/new-pic3.jpg', NULL, CAST(1200000 AS Decimal(18, 0)), NULL, NULL, 10, 7, NULL, 2, CAST(N'2022-09-18T23:25:12.370' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (9, N'thoi-trang', N'Thời trang', N'', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assests/client/images/new-pic3.jpg', NULL, CAST(1200000 AS Decimal(18, 0)), NULL, NULL, 10, 8, NULL, 2, CAST(N'2022-09-19T23:25:13.880' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (10, N'trang-suc', N'Trang sức', N'', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assests/client/images/new-pic3.jpg', NULL, CAST(1200000 AS Decimal(18, 0)), NULL, NULL, 10, 9, NULL, 2, CAST(N'2022-09-20T23:25:15.943' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (11, N'dien-thoai', N'Điện thoại', N'', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assests/client/images/new-pic3.jpg', NULL, CAST(1200000 AS Decimal(18, 0)), NULL, NULL, 10, 2, NULL, 2, CAST(N'2022-09-14T23:25:19.443' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (12, N'may-tinh-de-ban', N'Máy tính PC', NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assests/client/images/feature-pic1.jpg', NULL, CAST(5000000 AS Decimal(18, 0)), NULL, NULL, 10, 3, NULL, 10, CAST(N'2022-09-22T23:30:28.070' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (13, N'may-tinh-xach-tay', N'Laptop', NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assests/client/images/feature-pic1.jpg', NULL, CAST(4000000 AS Decimal(18, 0)), NULL, NULL, 10, 4, NULL, 10, CAST(N'2022-09-22T23:40:37.370' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (14, N'phu-kien', N'Phụ kiện', NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assests/client/images/feature-pic2.jpg', NULL, CAST(1400000 AS Decimal(18, 0)), NULL, NULL, 10, 5, NULL, 2, CAST(N'2022-09-22T23:42:23.440' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (16, N'dong-ho-dien-tu', N'Đồng hồ điện tử', NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assests/client/images/rolex2.jfif', NULL, CAST(2000000 AS Decimal(18, 0)), NULL, NULL, 10, 10, NULL, 10, CAST(N'2022-10-12T16:04:20.880' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (17, N'rolex-trang', N'Đồng hồ Rolex trắng ', NULL, NULL, N'/assests/client/images/rolex3.jfif', NULL, CAST(2600000 AS Decimal(18, 0)), NULL, NULL, 10, 10, NULL, 10, CAST(N'2022-10-12T16:08:20.530' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (18, N'rolex-den', N'Đồng hồ Rolex đen', NULL, NULL, N'/assests/client/images/rolex4.jfif', NULL, CAST(2400000 AS Decimal(18, 0)), NULL, NULL, 10, 10, NULL, 10, CAST(N'2022-10-12T16:10:55.113' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (19, N'gucci1', N'Đồng hồ Gucci', N'A01', NULL, N'/assests/client/images/gucci1.jfif', NULL, CAST(2500000 AS Decimal(18, 0)), NULL, NULL, 10, 11, NULL, 10, CAST(N'2022-10-13T16:30:46.990' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (20, N'gucci2', N'Đồng hồ Gucci quý phái', NULL, NULL, N'/assests/client/images/gucci2.jfif', NULL, CAST(3000000 AS Decimal(18, 0)), NULL, NULL, 10, 11, NULL, 10, CAST(N'2022-10-13T16:38:33.180' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (21, N'gucci3', N'Đồng hồ Gucci sang trọng', NULL, NULL, N'/assests/client/images/gucci3.jfif', NULL, CAST(3800000 AS Decimal(18, 0)), NULL, NULL, 10, 11, NULL, 10, CAST(N'2022-10-13T16:39:48.730' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (22, N'gucci4', N'Đồng hồ Guicci lịch lãm', NULL, NULL, N'/assests/client/images/gucci4.jfif', NULL, CAST(3500000 AS Decimal(18, 0)), NULL, NULL, 10, 11, NULL, 10, CAST(N'2022-10-13T16:40:50.670' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (23, N'giay-the-thao1', N'Giày thể thao nam tính', NULL, NULL, N'/assests/client/images/gtt1.jfif', NULL, CAST(3000000 AS Decimal(18, 0)), NULL, NULL, 10, 12, NULL, 10, CAST(N'2022-10-13T16:55:17.190' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (24, N'giay-the-thao2', N'Giày Lamda', NULL, NULL, N'/assests/client/images/gtt2.jfif', NULL, CAST(2800000 AS Decimal(18, 0)), NULL, NULL, 10, 12, NULL, 10, CAST(N'2022-10-13T16:56:48.440' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (25, N'giay-the-thao3', N'Giày Gucci dáng cao', NULL, NULL, N'/assests/client/images/gtt3.jfif', NULL, CAST(3500000 AS Decimal(18, 0)), NULL, NULL, 10, 12, NULL, 10, CAST(N'2022-10-13T16:57:57.480' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (26, N'giay-the-thao4', N'Giày xanh ngọc ', NULL, NULL, N'/assests/client/images/gtt4.jfif', NULL, CAST(3200000 AS Decimal(18, 0)), NULL, NULL, 10, 12, NULL, 10, CAST(N'2022-10-13T16:59:04.267' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (27, N'golf1', N'Gậy golf Maver', NULL, NULL, N'/assests/client/images/golf1.jfif', NULL, CAST(4000000 AS Decimal(18, 0)), NULL, NULL, 10, 13, NULL, 10, CAST(N'2022-10-13T17:00:18.810' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (28, N'golf2', N'Golf quốc nội', NULL, NULL, N'/assests/client/images/golf2.jfif', NULL, CAST(3700000 AS Decimal(18, 0)), NULL, NULL, 10, 13, NULL, 10, CAST(N'2022-10-13T17:01:26.843' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (29, N'golf3', N'Gậy golf thời trang', NULL, NULL, N'/assests/client/images/golf3.jfif', NULL, CAST(4200000 AS Decimal(18, 0)), NULL, NULL, 10, 13, NULL, 10, CAST(N'2022-10-13T17:02:19.617' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (30, N'golf4', N'Gậy golf thời thượng', NULL, NULL, N'/assests/client/images/golf4.jfif', NULL, CAST(4500000 AS Decimal(18, 0)), NULL, NULL, 10, 13, NULL, 10, CAST(N'2022-10-18T18:17:46.937' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (31, N'ao-hoodie1', N'Áo Hoodie trắng', NULL, NULL, N'/assests/client/images/aohodie1.jfif', NULL, CAST(2600000 AS Decimal(18, 0)), NULL, NULL, 10, 14, NULL, 10, CAST(N'2022-10-13T17:05:08.397' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (32, N'ao-hoodie2', N'Áo Hoodie đen trắng', NULL, NULL, N'/assests/client/images/aohodie2.jfif', NULL, CAST(2700000 AS Decimal(18, 0)), NULL, NULL, 10, 14, NULL, 10, CAST(N'2022-10-13T17:06:23.870' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (33, N'ao-hoodie3', N'Áo Hoodie trẻ trung', NULL, NULL, N'/assests/client/images/aohodie3.jfif', NULL, CAST(2200000 AS Decimal(18, 0)), NULL, NULL, 10, 14, NULL, 10, CAST(N'2022-10-13T17:07:32.253' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (34, N'ao-hoodie4', N'Áo Hoodie nam tính', NULL, NULL, N'/assests/client/images/aohodie4.jfif', NULL, CAST(2600000 AS Decimal(18, 0)), NULL, NULL, 10, 14, NULL, 10, CAST(N'2022-10-18T18:16:31.830' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (35, N'quan-au1', N'Quần âu nam tính', NULL, NULL, N'/assests/client/images/quanau1.jfif', NULL, CAST(3100000 AS Decimal(18, 0)), NULL, NULL, 10, 15, NULL, 10, CAST(N'2022-10-13T17:09:23.160' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (36, N'quan-au2', N'Quần âu trẻ trung', NULL, NULL, N'/assests/client/images/quanau2.jfif', NULL, CAST(3200000 AS Decimal(18, 0)), NULL, NULL, 10, 15, NULL, 10, CAST(N'2022-10-13T17:10:17.467' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (37, N'quan-au3', N'Quần âu Hottrend', NULL, NULL, N'/assests/client/images/quanau3.jfif', NULL, CAST(3500000 AS Decimal(18, 0)), NULL, NULL, 10, 15, NULL, 10, CAST(N'2022-10-13T17:10:55.853' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (38, N'quan-au4', N'Quần âu thanh lịch', NULL, NULL, N'/assests/client/images/quanau4.jfif', NULL, CAST(3600000 AS Decimal(18, 0)), NULL, NULL, 10, 15, NULL, 10, CAST(N'2022-10-13T17:11:33.390' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (39, N'day-chuyen1', N'Dây chuyền cao cấp', NULL, NULL, N'/assests/client/images/daychuyen1.jfif', NULL, CAST(4500000 AS Decimal(18, 0)), NULL, NULL, 10, 16, NULL, 10, CAST(N'2022-10-13T21:40:43.750' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (40, N'day-chuyen2', N'Dây chuyền thời trang', NULL, NULL, N'/assests/client/images/daychuyen2.jfif', NULL, CAST(4600000 AS Decimal(18, 0)), NULL, NULL, 10, 16, NULL, 10, CAST(N'2022-10-13T21:42:04.610' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (41, N'day-chuyen3', N'Dây chuyền đá quý', NULL, NULL, N'/assests/client/images/daychuyen3.jfif', NULL, CAST(5200000 AS Decimal(18, 0)), NULL, NULL, 10, 16, NULL, 10, CAST(N'2022-10-13T21:42:55.223' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (42, N'day-chuyen4', N'Dây chuyền sang trọng', NULL, NULL, N'/assests/client/images/daychuyen4.jfif', NULL, CAST(4800000 AS Decimal(18, 0)), NULL, NULL, 10, 16, NULL, 10, CAST(N'2022-10-13T21:43:35.803' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (43, N'lac-tay1', N'Lắc tay vàng 24k', NULL, NULL, N'/assests/client/images/lactay1.jpg', NULL, CAST(3400000 AS Decimal(18, 0)), NULL, NULL, 10, 17, NULL, 10, CAST(N'2022-10-13T21:45:25.020' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (44, N'lac-tay2', N'Lắc tay bạc ', NULL, NULL, N'/assests/client/images/lactay2.jfif', NULL, CAST(3200000 AS Decimal(18, 0)), NULL, NULL, 10, 17, NULL, 10, CAST(N'2022-10-13T21:46:17.293' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (45, N'lac-tay3', N'Lắc tay lịch lãm', NULL, NULL, N'/assests/client/images/lactay3.jfif', NULL, CAST(3300000 AS Decimal(18, 0)), NULL, NULL, 10, 17, NULL, 10, CAST(N'2022-10-13T21:47:02.173' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (46, N'lac-tay4', N'Lắc tay thời trang', NULL, NULL, N'/assests/client/images/lactay4.jfif', NULL, CAST(3500000 AS Decimal(18, 0)), NULL, NULL, 10, 17, NULL, 10, CAST(N'2022-10-13T21:47:34.807' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (47, N'oppo1', N'Oppo Reno6', NULL, NULL, N'/assests/client/images/oppo1.jfif', NULL, CAST(3300000 AS Decimal(18, 0)), NULL, NULL, 10, 18, NULL, 10, CAST(N'2022-10-13T21:48:59.310' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (48, N'oppo2', N'Oppo A96', NULL, NULL, N'/assests/client/images/oppo2.jfif', NULL, CAST(3500000 AS Decimal(18, 0)), NULL, NULL, 10, 18, NULL, 10, CAST(N'2022-10-13T21:49:45.727' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (49, N'oppo3', N'Oppo A37', NULL, NULL, N'/assests/client/images/oppo3.jfif', NULL, CAST(2400000 AS Decimal(18, 0)), NULL, NULL, 10, 18, NULL, 10, CAST(N'2022-10-13T21:50:30.937' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (50, N'oppo4', N'Oppo Lenovo', NULL, NULL, N'/assests/client/images/oppo4.jfif', NULL, CAST(4200000 AS Decimal(18, 0)), NULL, NULL, 10, 18, NULL, 10, CAST(N'2022-10-13T21:51:13.540' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (51, N'iphone1', N'Iphone 14', N'A01', NULL, N'/assests/client/images/iphone1.jpg', NULL, CAST(4400000 AS Decimal(18, 0)), NULL, NULL, 10, 19, NULL, 10, CAST(N'2022-10-13T21:52:30.840' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (52, N'iphone2', N'Iphone 13', NULL, NULL, N'/assests/client/images/iphone2.jpeg', NULL, CAST(4200000 AS Decimal(18, 0)), NULL, NULL, 10, 19, NULL, 10, CAST(N'2022-10-13T21:53:21.180' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (53, N'iphone3', N'Iphone 13 Pro', NULL, NULL, N'/assests/client/images/iphone3.jpg', NULL, CAST(4300000 AS Decimal(18, 0)), NULL, NULL, 10, 19, NULL, 10, CAST(N'2022-10-13T21:53:39.970' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (54, N'iphone4', N'Iphone 13 ProMax', NULL, NULL, N'/assests/client/images/iphone4.jfif', NULL, CAST(4500000 AS Decimal(18, 0)), NULL, NULL, 10, 19, NULL, 10, CAST(N'2022-10-13T21:54:30.253' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (55, N'samsung1', N'SamSung Galaxy', NULL, NULL, N'/assests/client/images/samsung1.jfif', NULL, CAST(4400000 AS Decimal(18, 0)), NULL, NULL, 10, 20, NULL, 10, CAST(N'2022-10-13T21:56:09.910' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (56, N'samsung2', N'SamSung Node', NULL, NULL, N'/assests/client/images/samsung2.jfif', NULL, CAST(4200000 AS Decimal(18, 0)), NULL, NULL, 10, 20, NULL, 10, CAST(N'2022-10-13T21:57:20.283' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (57, N'samsung3', N'SamSung Max', NULL, NULL, N'/assests/client/images/samsung3.jfif', NULL, CAST(4500000 AS Decimal(18, 0)), NULL, NULL, 10, 20, NULL, 10, CAST(N'2022-10-13T21:58:01.060' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (58, N'samsung4', N'SamSung Galaxy Node 7', NULL, NULL, N'/assests/client/images/samsung4.jfif', NULL, CAST(4600000 AS Decimal(18, 0)), NULL, NULL, 10, 20, NULL, 10, CAST(N'2022-10-13T21:58:42.567' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (59, N'case1', N'Case PC', NULL, NULL, N'/assests/client/images/casepc1.jfif', NULL, CAST(3700000 AS Decimal(18, 0)), NULL, NULL, 10, 21, NULL, 10, CAST(N'2022-10-13T22:00:25.027' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (60, N'case2', N'Case tản nhiệt', NULL, NULL, N'/assests/client/images/casepc2.jfif', NULL, CAST(3500000 AS Decimal(18, 0)), NULL, NULL, 10, 21, NULL, 10, CAST(N'2022-10-13T22:01:04.260' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (61, N'case3', N'Case gaming', NULL, NULL, N'/assests/client/images/casepc3.jfif', NULL, CAST(3800000 AS Decimal(18, 0)), NULL, NULL, 10, 21, NULL, 10, CAST(N'2022-10-13T22:01:41.733' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (62, N'case4', N'Case gaming pro', NULL, NULL, N'/assests/client/images/casepc4.jfif', NULL, CAST(4000000 AS Decimal(18, 0)), NULL, NULL, 10, 21, NULL, 10, CAST(N'2022-10-17T22:03:23.140' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (63, N'pc1', N'Bộ máy Pc gaming', NULL, NULL, N'/assests/client/images/pc1.jfif', NULL, CAST(5600000 AS Decimal(18, 0)), NULL, NULL, 10, 22, NULL, 10, CAST(N'2022-10-13T22:03:32.670' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (64, N'pc2', N'Bộ máy Pc hot', NULL, NULL, N'/assests/client/images/pc2.jfif', NULL, CAST(5800000 AS Decimal(18, 0)), NULL, NULL, 10, 22, NULL, 10, CAST(N'2022-10-13T22:21:29.087' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (65, N'pc3', N'Bộ máy Pc văn phòng', NULL, NULL, N'/assests/client/images/pc3.jfif', NULL, CAST(4900000 AS Decimal(18, 0)), NULL, NULL, 10, 22, NULL, 10, CAST(N'2022-10-13T22:04:38.057' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (66, N'pc4', N'Bộ máy Pc đồ hoạ', N'A01', NULL, N'/assests/client/images/pc4.jfif', NULL, CAST(5200000 AS Decimal(18, 0)), NULL, NULL, 10, 22, NULL, 10, CAST(N'2022-10-13T22:05:06.170' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (67, N'dell1', N'Dell gaming', NULL, NULL, N'/assests/client/images/dell1.jfif', NULL, CAST(6200000 AS Decimal(18, 0)), NULL, NULL, 10, 23, NULL, 10, CAST(N'2022-10-13T22:21:29.087' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (68, N'dell2', N'Dell Intel I3', NULL, NULL, N'/assests/client/images/dell2.jfif', NULL, CAST(5900000 AS Decimal(18, 0)), NULL, NULL, 10, 23, NULL, 10, CAST(N'2022-10-13T22:06:59.717' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (69, N'dell3', N'Dell văn phòng', NULL, NULL, N'/assests/client/images/dell3.jfif', NULL, CAST(5700000 AS Decimal(18, 0)), NULL, NULL, 10, 23, NULL, 10, CAST(N'2022-10-13T22:07:27.673' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (70, N'dell4', N'Dell học tập', NULL, NULL, N'/assests/client/images/dell4.jfif', NULL, CAST(5500000 AS Decimal(18, 0)), NULL, NULL, 10, 23, NULL, 10, CAST(N'2022-10-13T22:07:56.057' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (71, N'asus1', N'Asus Gaming', NULL, NULL, N'/assests/client/images/asus1.jfif', NULL, CAST(6300000 AS Decimal(18, 0)), NULL, NULL, 10, 24, NULL, 10, CAST(N'2022-10-13T22:08:45.510' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (72, N'asus2', N'Asus văn phòng', NULL, NULL, N'/assests/client/images/asus2.jfif', NULL, CAST(5700000 AS Decimal(18, 0)), NULL, NULL, 10, 24, NULL, 10, CAST(N'2022-10-13T22:09:20.300' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (73, N'asus3', N'Asus học tập', NULL, NULL, N'/assests/client/images/asus3.jfif', NULL, CAST(6100000 AS Decimal(18, 0)), NULL, NULL, 10, 24, NULL, 10, CAST(N'2022-10-13T22:09:57.243' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (74, N'asus4', N'Asus đồ hoạ', NULL, NULL, N'/assests/client/images/asus4.jfif', NULL, CAST(6200000 AS Decimal(18, 0)), NULL, NULL, 10, 24, NULL, 10, CAST(N'2022-10-13T22:10:27.270' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (75, N'tai-nghe1', N'Tai nghe Gaming', N'A01', NULL, N'/assests/client/images/taingh3.jfif', NULL, CAST(1500000 AS Decimal(18, 0)), NULL, NULL, 10, 25, NULL, 10, CAST(N'2022-10-17T22:06:27.113' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (76, N'tai-nghe2', N'Tai nghe Flash', NULL, NULL, N'/assests/client/images/tainghe1.jfif', NULL, CAST(1700000 AS Decimal(18, 0)), NULL, NULL, 10, 25, NULL, 10, CAST(N'2022-10-13T22:12:31.830' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (77, N'tai-nghe3', N'Tai nghe Hot trend', NULL, NULL, N'/assests/client/images/tainghe2.jfif', NULL, CAST(1800000 AS Decimal(18, 0)), NULL, NULL, 10, 25, NULL, 10, CAST(N'2022-10-13T22:14:01.040' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (78, N'tai-nghe4', N'Tai nghe Hồng nữ tính', NULL, NULL, N'/assests/client/images/tainghe4.jfif', NULL, CAST(2000000 AS Decimal(18, 0)), NULL, NULL, 10, 25, NULL, 10, CAST(N'2022-10-13T22:14:41.377' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (79, N'loa1', N'Loa cỡ nhỏ', NULL, NULL, N'/assests/client/images/loa1.jfif', NULL, CAST(1500000 AS Decimal(18, 0)), NULL, NULL, 10, 26, NULL, 10, CAST(N'2022-10-13T22:18:48.763' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (80, N'loa2', N'Loa Gaming', NULL, NULL, N'/assests/client/images/loa2.jfif', NULL, CAST(1800000 AS Decimal(18, 0)), NULL, NULL, 10, 26, NULL, 10, CAST(N'2022-10-13T22:20:19.797' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (81, N'loa3', N'Loa thông dụng', NULL, NULL, N'/assests/client/images/loa3.jfif', NULL, CAST(1500000 AS Decimal(18, 0)), NULL, NULL, 10, 26, NULL, 10, CAST(N'2022-10-13T22:21:29.087' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (82, N'loa4', N'Loa Mini', NULL, NULL, N'/assests/client/images/loa4.jfif', NULL, CAST(1400000 AS Decimal(18, 0)), NULL, NULL, 10, 26, NULL, 10, CAST(N'2022-10-13T22:21:29.087' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (266, N'bo-loa', N'Bộ loa cổ điển', NULL, NULL, N'/Data/images/add/feature-pic2.jpg', NULL, CAST(2500000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2023-09-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (274, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (275, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (276, N'rolex', N'Rolex', NULL, NULL, N'/Data/images/add/rolex1.jpg', NULL, CAST(1200000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [MetaTitle], [Name], [Code], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detal], [Warranty], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (277, N'rolex', N'Rolex', NULL, NULL, N'/Data/images/add/rolex1.jpg', NULL, CAST(1200000 AS Decimal(18, 0)), NULL, NULL, NULL, 10, NULL, NULL, CAST(N'2022-10-18T15:39:29.727' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (1, N'Đồng hồ', N'dongho', NULL, 0, NULL, CAST(N'2022-09-21T14:03:33.430' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (2, N'Điện thoại', N'dienthoai', NULL, 1, NULL, CAST(N'2022-09-21T14:04:23.550' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (3, N'Máy tính để bàn', N'may-tinh-de-ban', NULL, 1, NULL, CAST(N'2022-09-21T14:05:30.027' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (4, N'Máy tính xách tay', N'may-tinh-xach-tay', NULL, 1, NULL, CAST(N'2022-09-21T14:06:04.007' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (5, N'Phụ kiện', N'phu-kien', NULL, 1, NULL, CAST(N'2022-09-21T14:06:20.180' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (7, N'Thể thao', N'the-thao', NULL, 1, NULL, CAST(N'2022-09-21T14:06:52.323' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (8, N'Thời trang', N'thoi-trang', NULL, 1, NULL, CAST(N'2022-09-21T14:07:11.613' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (9, N'Trang sức', N'trang-suc', NULL, 1, NULL, CAST(N'2022-09-21T14:07:32.520' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (10, N'Rolex', N'rolex', 1, 1, NULL, CAST(N'2022-09-22T15:06:10.233' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (11, N'Gucci', N'gucci', 1, 1, NULL, CAST(N'2022-10-12T16:02:19.983' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (12, N'Giày thể thao', N'giay-the-thao', 7, 1, NULL, CAST(N'2022-10-13T16:45:29.733' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (13, N'Golf', N'golf', 7, 1, NULL, CAST(N'2022-10-13T16:46:02.730' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (14, N'Áo Hoodie', N'ao-hoodie', 8, 1, NULL, CAST(N'2022-10-13T16:46:58.780' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (15, N'Quần âu', N'quan-au', 8, 1, NULL, CAST(N'2022-10-13T16:47:20.513' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (16, N'Dây chuyền', N'day-chuyen', 9, 1, NULL, CAST(N'2022-10-13T16:48:14.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (17, N'Lắc tay', N'lac-tay', 9, 1, NULL, CAST(N'2022-10-13T16:48:38.833' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (18, N'Oppo', N'oppo', 2, 1, NULL, CAST(N'2022-10-13T16:49:18.643' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (19, N'Iphone', N'iphone', 2, 1, NULL, CAST(N'2022-10-13T16:49:36.297' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (20, N'Samsung', N'samsung', 2, 1, NULL, CAST(N'2022-10-13T16:50:21.330' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (21, N'Case', N'case', 3, 1, NULL, CAST(N'2022-10-13T16:51:16.793' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (22, N'PC', N'pc', 3, 0, NULL, CAST(N'2022-10-13T16:52:13.277' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (23, N'Dell', N'dell', 4, 1, NULL, CAST(N'2022-10-13T16:52:34.140' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (24, N'Asus', N'asus', 4, 0, NULL, CAST(N'2022-10-13T16:52:49.183' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (25, N'Tai nghe Gaming', N'tai-nghe-gaming', 5, 1, NULL, CAST(N'2022-10-13T16:53:38.820' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (26, N'Loa Gaming', N'loa-gaming', 5, 1, NULL, CAST(N'2022-10-13T17:16:32.870' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_CONTENT', N'Thêm tin tức')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_USER', N'Thêm user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_USER', N'Xoá user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_CONTENT', N'Sửa tin tức')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_USER', N'Sửa user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_USER', N'Xem danh sách')
GO
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [Status]) VALUES (1, N'/assests/client/images/slide-1-image.png', 1, N'/', NULL, CAST(N'2022-09-21T14:21:42.530' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [Status]) VALUES (2, N'/assests/client/images/slide-2-image.jpg', 2, N'/', NULL, CAST(N'2022-09-21T14:22:14.463' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [Status]) VALUES (3, N'/assests/client/images/slide-3-image.jpg', 3, N'/', NULL, CAST(N'2022-10-03T09:07:16.043' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
GO
INSERT [dbo].[Tag] ([ID], [Name]) VALUES (N'Information', N'Information')
INSERT [dbo].[Tag] ([ID], [Name]) VALUES (N'thoisu', N' thời sự')
INSERT [dbo].[Tag] ([ID], [Name]) VALUES (N'tintuc', N'tin tức')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [GroupID], [Email], [DistrictID], [ProvinceID], [Phone], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [Status]) VALUES (2, N'a', N'202cb962ac59075b964b07152d234b70', N'Hoang', N'ha nam', N'ADMIN', NULL, NULL, NULL, NULL, CAST(N'2022-09-17T23:39:31.387' AS DateTime), NULL, CAST(N'2022-09-20T12:16:25.640' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [GroupID], [Email], [DistrictID], [ProvinceID], [Phone], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [Status]) VALUES (22, N'leaphilip662407@outlook.com', NULL, N'Phan  Dương', NULL, N'MEMBER', N'leaphilip662407@outlook.com', NULL, NULL, NULL, CAST(N'2022-09-27T14:38:17.760' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [GroupID], [Email], [DistrictID], [ProvinceID], [Phone], [CreateDate], [CreateBy], [ModifineDate], [ModifineBy], [Status]) VALUES (24, N'duong', N'4abe9674a7bbca56268bd96ce8594a69', NULL, NULL, N'MOD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Quản trị')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MEMBER', N'Thành viên')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MOD', N'Moderatior')
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[Language] ADD  CONSTRAINT [DF_Language_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_GroupID]  DEFAULT ('MEMBER') FOR [GroupID]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Email]  DEFAULT (N'MEMBER') FOR [Email]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
