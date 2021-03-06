USE [FAJAS_BD]
GO
/****** Object:  Table [dbo].[Buy_Bill]    Script Date: 5/21/2017 9:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Buy_Bill](
	[BuyBil_Date] [datetime] NOT NULL,
	[BuyBil_Description] [varchar](50) NULL,
	[BuyBil_Total] [float] NOT NULL,
	[BuyBil_PK] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Buy_Bill] PRIMARY KEY CLUSTERED 
(
	[BuyBil_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 5/21/2017 9:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[Com_Name] [varchar](50) NOT NULL,
	[Com_Id] [varchar](50) NOT NULL,
	[Com_Phone] [varchar](50) NOT NULL,
	[Com_Email] [varchar](50) NOT NULL,
	[Com_NickName] [varchar](50) NOT NULL,
	[Com_PK] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Com_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Detail_Buy_Bill]    Script Date: 5/21/2017 9:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detail_Buy_Bill](
	[DetBuyBil_Quantity] [float] NOT NULL,
	[DetBuyBil_BuyPrice] [float] NOT NULL,
	[DetBuyBil_PK] [int] IDENTITY(1,1) NOT NULL,
	[DetBuyBil_FK_BuyBil] [int] NULL,
 CONSTRAINT [PK_Detail_Buy_Bill] PRIMARY KEY CLUSTERED 
(
	[DetBuyBil_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Detail_Sale_Bill]    Script Date: 5/21/2017 9:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detail_Sale_Bill](
	[DetSalBil_Quantity] [float] NOT NULL,
	[DetSalBil_Detail] [float] NULL,
	[DetBil_PK] [int] IDENTITY(1,1) NOT NULL,
	[DetBil_FK_BuyBil] [int] NOT NULL,
	[DetBil_FK_ProDet] [int] NOT NULL,
 CONSTRAINT [PK_Detail_Bill] PRIMARY KEY CLUSTERED 
(
	[DetBil_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/21/2017 9:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Pro_Name] [varchar](50) NOT NULL,
	[Pro_Description] [varchar](50) NULL,
	[Pro_Code] [varchar](50) NOT NULL,
	[Pro_Photo] [varchar](50) NULL,
	[Pro_SalePrice] [float] NOT NULL,
	[Pro_Pk] [int] IDENTITY(1,1) NOT NULL,
	[Pro_Fk_ProTyp] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Pro_Pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_Color]    Script Date: 5/21/2017 9:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_Color](
	[ProCol_Name] [varchar](50) NOT NULL,
	[ProCol_PK] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Product_Color] PRIMARY KEY CLUSTERED 
(
	[ProCol_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_Detail]    Script Date: 5/21/2017 9:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Detail](
	[ProDet_FK_ProCol] [int] NOT NULL,
	[ProDet_FK_ProSiz] [int] NOT NULL,
	[ProDet_FKk_Pro] [int] NOT NULL,
	[ProDet_PK] [int] NOT NULL,
 CONSTRAINT [PK_Product_Detail] PRIMARY KEY CLUSTERED 
(
	[ProDet_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Size]    Script Date: 5/21/2017 9:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_Size](
	[Siz_Name] [varchar](50) NOT NULL,
	[Siz_Pk] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Product_Size] PRIMARY KEY CLUSTERED 
(
	[Siz_Pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_Type]    Script Date: 5/21/2017 9:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_Type](
	[ProTyp_Name] [varchar](50) NOT NULL,
	[ProTyp_Pk] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Product_Type] PRIMARY KEY CLUSTERED 
(
	[ProTyp_Pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sale_Bill]    Script Date: 5/21/2017 9:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sale_Bill](
	[SalBil_ClientName] [varchar](50) NULL,
	[SalBil_IdClient] [varchar](50) NULL,
	[SalBil_PhoneClient] [varchar](50) NULL,
	[SalBil_Description] [varchar](50) NULL,
	[SalBil_GrossTotal] [float] NOT NULL,
	[SalBil_Tax] [float] NOT NULL,
	[SalBil_NetTotal] [float] NOT NULL,
	[SalBil_ClientEmail] [varchar](50) NULL,
	[SalBil_Discount] [float] NULL,
	[SalBil_Date] [datetime] NOT NULL,
	[SalBil_Pk] [int] IDENTITY(1,1) NOT NULL,
	[SalBil_FK_Com] [int] NOT NULL,
 CONSTRAINT [PK_SaleBill] PRIMARY KEY CLUSTERED 
(
	[SalBil_Pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/21/2017 9:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Use_Name] [varchar](20) NOT NULL,
	[Use_Password] [varchar](20) NOT NULL,
	[Use_PK] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Use_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Detail_Buy_Bill]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Buy_Bill_Buy_Bill] FOREIGN KEY([DetBuyBil_FK_BuyBil])
REFERENCES [dbo].[Buy_Bill] ([BuyBil_PK])
GO
ALTER TABLE [dbo].[Detail_Buy_Bill] CHECK CONSTRAINT [FK_Detail_Buy_Bill_Buy_Bill]
GO
ALTER TABLE [dbo].[Detail_Sale_Bill]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Sale_Bill_Product_Detail] FOREIGN KEY([DetBil_FK_ProDet])
REFERENCES [dbo].[Product_Detail] ([ProDet_PK])
GO
ALTER TABLE [dbo].[Detail_Sale_Bill] CHECK CONSTRAINT [FK_Detail_Sale_Bill_Product_Detail]
GO
ALTER TABLE [dbo].[Detail_Sale_Bill]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Sale_Bill_Sale_Bill] FOREIGN KEY([DetBil_FK_BuyBil])
REFERENCES [dbo].[Sale_Bill] ([SalBil_Pk])
GO
ALTER TABLE [dbo].[Detail_Sale_Bill] CHECK CONSTRAINT [FK_Detail_Sale_Bill_Sale_Bill]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product_Type] FOREIGN KEY([Pro_Fk_ProTyp])
REFERENCES [dbo].[Product_Type] ([ProTyp_Pk])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product_Type]
GO
ALTER TABLE [dbo].[Product_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Product_Detail_Product] FOREIGN KEY([ProDet_FKk_Pro])
REFERENCES [dbo].[Product] ([Pro_Pk])
GO
ALTER TABLE [dbo].[Product_Detail] CHECK CONSTRAINT [FK_Product_Detail_Product]
GO
ALTER TABLE [dbo].[Product_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Product_Detail_Product_Color] FOREIGN KEY([ProDet_FKk_Pro])
REFERENCES [dbo].[Product_Color] ([ProCol_PK])
GO
ALTER TABLE [dbo].[Product_Detail] CHECK CONSTRAINT [FK_Product_Detail_Product_Color]
GO
ALTER TABLE [dbo].[Product_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Product_Detail_Product_Size] FOREIGN KEY([ProDet_FKk_Pro])
REFERENCES [dbo].[Product_Size] ([Siz_Pk])
GO
ALTER TABLE [dbo].[Product_Detail] CHECK CONSTRAINT [FK_Product_Detail_Product_Size]
GO
ALTER TABLE [dbo].[Sale_Bill]  WITH CHECK ADD  CONSTRAINT [FK_SaleBill_Company] FOREIGN KEY([SalBil_FK_Com])
REFERENCES [dbo].[Company] ([Com_PK])
GO
ALTER TABLE [dbo].[Sale_Bill] CHECK CONSTRAINT [FK_SaleBill_Company]
GO
