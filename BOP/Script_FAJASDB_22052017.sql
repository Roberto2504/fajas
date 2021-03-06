USE [FAJAS_BD]
GO
/****** Object:  Table [dbo].[Buy_Bill]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buy_Bill](
	[BuyBil_Date] [datetime] NOT NULL,
	[BuyBil_Description] [nvarchar](100) NULL,
	[BuyBil_Total] [float] NOT NULL,
	[BuyBil_PK] [int] IDENTITY(1,1) NOT NULL,
	[BuyBil_Status] [nvarchar](1) NULL,
 CONSTRAINT [PK_Buy_Bill] PRIMARY KEY CLUSTERED 
(
	[BuyBil_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Com_Name] [nvarchar](100) NULL,
	[Com_Id] [nvarchar](50) NOT NULL,
	[Com_Phone] [nvarchar](50) NOT NULL,
	[Com_Email] [nvarchar](50) NOT NULL,
	[Com_NickName] [nvarchar](50) NOT NULL,
	[Com_PK] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Com_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Detail_Buy_Bill]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detail_Buy_Bill](
	[DetBuyBil_Quantity] [int] NULL,
	[DetBuyBil_BuyPrice] [float] NOT NULL,
	[DetBuyBil_PK] [int] IDENTITY(1,1) NOT NULL,
	[DetBuyBil_FK_BuyBil] [int] NULL,
	[DetBuyBil_FK_DetPro] [int] NOT NULL,
	[DetBuyBil_Status] [nvarchar](1) NULL,
 CONSTRAINT [PK_Detail_Buy_Bill] PRIMARY KEY CLUSTERED 
(
	[DetBuyBil_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Detail_Sale_Bill]    Script Date: 2/7/2017 1:00:35 p. m. ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Pro_Name] [nvarchar](200) NULL,
	[Pro_Description] [nvarchar](200) NULL,
	[Pro_Code] [nvarchar](50) NOT NULL,
	[Pro_Photo] [nvarchar](50) NULL,
	[Pro_SalePrice] [float] NOT NULL,
	[Pro_Pk] [int] IDENTITY(1,1) NOT NULL,
	[Pro_Fk_ProTyp] [int] NOT NULL,
	[Pro_Status] [nvarchar](1) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Pro_Pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Color]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Color](
	[ProCol_Name] [nvarchar](50) NOT NULL,
	[ProCol_PK] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Product_Color] PRIMARY KEY CLUSTERED 
(
	[ProCol_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Detail]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Detail](
	[ProDet_FK_ProCol] [int] NOT NULL,
	[ProDet_FK_ProSiz] [int] NOT NULL,
	[ProDet_FKk_Pro] [int] NOT NULL,
	[ProDet_PK] [int] NOT NULL,
	[ProDet_Quantity] [int] NULL,
	[ProDet_Status] [nvarchar](1) NULL,
 CONSTRAINT [PK_Product_Detail] PRIMARY KEY CLUSTERED 
(
	[ProDet_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Size]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Size](
	[Siz_Name] [nvarchar](50) NOT NULL,
	[Siz_Pk] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Product_Size] PRIMARY KEY CLUSTERED 
(
	[Siz_Pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Type]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Type](
	[ProTyp_Name] [nvarchar](200) NULL,
	[ProTyp_Pk] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Product_Type] PRIMARY KEY CLUSTERED 
(
	[ProTyp_Pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sale_Bill]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale_Bill](
	[SalBil_ClientName] [nvarchar](50) NULL,
	[SalBil_IdClient] [nvarchar](50) NULL,
	[SalBil_PhoneClient] [nvarchar](50) NULL,
	[SalBil_Description] [nvarchar](50) NULL,
	[SalBil_GrossTotal] [float] NOT NULL,
	[SalBil_Tax] [float] NOT NULL,
	[SalBil_NetTotal] [float] NOT NULL,
	[SalBil_ClientEmail] [nvarchar](50) NULL,
	[SalBil_Discount] [float] NULL,
	[SalBil_Date] [datetime] NOT NULL,
	[SalBil_Pk] [int] IDENTITY(1,1) NOT NULL,
	[SalBil_FK_Com] [int] NOT NULL,
	[SalBil_Status] [nvarchar](1) NULL,
 CONSTRAINT [PK_SaleBill] PRIMARY KEY CLUSTERED 
(
	[SalBil_Pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Use_Name] [nvarchar](20) NOT NULL,
	[Use_Password] [nvarchar](20) NOT NULL,
	[Use_PK] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Use_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Com_Name], [Com_Id], [Com_Phone], [Com_Email], [Com_NickName], [Com_PK]) VALUES (N'Osorio Bolivar ', N'123456789', N'13456879', N'caro@gmail.com', N'caro', 1)
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Pro_Name], [Pro_Description], [Pro_Code], [Pro_Photo], [Pro_SalePrice], [Pro_Pk], [Pro_Fk_ProTyp], [Pro_Status]) VALUES (N'Fajas 1', N'Faja senos libres con tiras cambiables, espalda cubierta, banda levanta glúteos y cierre inferior (p', N'004', NULL, 41400, 1, 1, N'A')
INSERT [dbo].[Product] ([Pro_Name], [Pro_Description], [Pro_Code], [Pro_Photo], [Pro_SalePrice], [Pro_Pk], [Pro_Fk_ProTyp], [Pro_Status]) VALUES (N'Fajas 2', N'Referencia 004 con refuerzo abdominal.', N'004R', N'../img/error-bg.jpg', 41800, 2, 1, N'A')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Product_Color] ON 

INSERT [dbo].[Product_Color] ([ProCol_Name], [ProCol_PK]) VALUES (N'BEIGE', 1)
INSERT [dbo].[Product_Color] ([ProCol_Name], [ProCol_PK]) VALUES (N'NEGRO', 2)
INSERT [dbo].[Product_Color] ([ProCol_Name], [ProCol_PK]) VALUES (N'VARIADO', 3)
SET IDENTITY_INSERT [dbo].[Product_Color] OFF
SET IDENTITY_INSERT [dbo].[Product_Size] ON 

INSERT [dbo].[Product_Size] ([Siz_Name], [Siz_Pk]) VALUES (N'XXS', 1)
INSERT [dbo].[Product_Size] ([Siz_Name], [Siz_Pk]) VALUES (N'XS', 2)
INSERT [dbo].[Product_Size] ([Siz_Name], [Siz_Pk]) VALUES (N'S', 3)
INSERT [dbo].[Product_Size] ([Siz_Name], [Siz_Pk]) VALUES (N'M', 4)
INSERT [dbo].[Product_Size] ([Siz_Name], [Siz_Pk]) VALUES (N'L', 5)
INSERT [dbo].[Product_Size] ([Siz_Name], [Siz_Pk]) VALUES (N'XL', 6)
INSERT [dbo].[Product_Size] ([Siz_Name], [Siz_Pk]) VALUES (N'XLL', 7)
INSERT [dbo].[Product_Size] ([Siz_Name], [Siz_Pk]) VALUES (N'Talla Unica', 8)
SET IDENTITY_INSERT [dbo].[Product_Size] OFF
SET IDENTITY_INSERT [dbo].[Product_Type] ON 

INSERT [dbo].[Product_Type] ([ProTyp_Name], [ProTyp_Pk]) VALUES (N'FAJAS POSTQUIRÚGICAS Y DE USO DIARIO (CONTIENEN VITAMINA E)', 1)
INSERT [dbo].[Product_Type] ([ProTyp_Name], [ProTyp_Pk]) VALUES (N'FAJAS DE CONTROL MEDIO CON TECNOLOGÍA EMANA (DISPONIBLE SOLO EN COLOR BEIGE)', 2)
INSERT [dbo].[Product_Type] ([ProTyp_Name], [ProTyp_Pk]) VALUES (N'FAJAS COMPLEMENTARIAS', 3)
INSERT [dbo].[Product_Type] ([ProTyp_Name], [ProTyp_Pk]) VALUES (N'BRASIERES PARA USO DIARIO, POSTQUIRÚRGICOS Y DEPORTIVOS (CONTIENEN VITAMINA E)', 4)
INSERT [dbo].[Product_Type] ([ProTyp_Name], [ProTyp_Pk]) VALUES (N'SHORTS POSTQUIRÚRGICOS Y DE USO DIARIO (CONTIENE VITAMINA E)', 5)
INSERT [dbo].[Product_Type] ([ProTyp_Name], [ProTyp_Pk]) VALUES (N'OTROS POSTQUIRÚRGICOS', 6)
INSERT [dbo].[Product_Type] ([ProTyp_Name], [ProTyp_Pk]) VALUES (N'FAJAS POSTQUIRÚRGICAS Y DE USO DIARIO PARA HOMBRE (CON VITAMINA E)', 7)
SET IDENTITY_INSERT [dbo].[Product_Type] OFF
SET IDENTITY_INSERT [dbo].[Sale_Bill] ON 

INSERT [dbo].[Sale_Bill] ([SalBil_ClientName], [SalBil_IdClient], [SalBil_PhoneClient], [SalBil_Description], [SalBil_GrossTotal], [SalBil_Tax], [SalBil_NetTotal], [SalBil_ClientEmail], [SalBil_Discount], [SalBil_Date], [SalBil_Pk], [SalBil_FK_Com], [SalBil_Status]) VALUES (N'', N'', N'', N'', 0, 0, 0, N'', 0, CAST(N'2017-07-02 12:37:04.437' AS DateTime), 2, 1, N'P')
SET IDENTITY_INSERT [dbo].[Sale_Bill] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Use_Name], [Use_Password], [Use_PK]) VALUES (N'OsorioBolivar', N'123456', 1)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
ALTER TABLE [dbo].[Detail_Buy_Bill]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Buy_Bill_Buy_Bill] FOREIGN KEY([DetBuyBil_FK_BuyBil])
REFERENCES [dbo].[Buy_Bill] ([BuyBil_PK])
GO
ALTER TABLE [dbo].[Detail_Buy_Bill] CHECK CONSTRAINT [FK_Detail_Buy_Bill_Buy_Bill]
GO
ALTER TABLE [dbo].[Detail_Buy_Bill]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Buy_Bill_Product_Detail] FOREIGN KEY([DetBuyBil_FK_DetPro])
REFERENCES [dbo].[Product_Detail] ([ProDet_PK])
GO
ALTER TABLE [dbo].[Detail_Buy_Bill] CHECK CONSTRAINT [FK_Detail_Buy_Bill_Product_Detail]
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
ALTER TABLE [dbo].[Product_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Product_Detail_Product_Color] FOREIGN KEY([ProDet_FK_ProCol])
REFERENCES [dbo].[Product_Color] ([ProCol_PK])
GO
ALTER TABLE [dbo].[Product_Detail] CHECK CONSTRAINT [FK_Product_Detail_Product_Color]
GO
ALTER TABLE [dbo].[Product_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Product_Detail_Product_Size] FOREIGN KEY([ProDet_FK_ProSiz])
REFERENCES [dbo].[Product_Size] ([Siz_Pk])
GO
ALTER TABLE [dbo].[Product_Detail] CHECK CONSTRAINT [FK_Product_Detail_Product_Size]
GO
ALTER TABLE [dbo].[Sale_Bill]  WITH CHECK ADD  CONSTRAINT [FK_SaleBill_Company] FOREIGN KEY([SalBil_FK_Com])
REFERENCES [dbo].[Company] ([Com_PK])
GO
ALTER TABLE [dbo].[Sale_Bill] CHECK CONSTRAINT [FK_SaleBill_Company]
GO
/****** Object:  StoredProcedure [dbo].[BOP_FAJAS_spBuscarProductos]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		EDUARDO VENEGAS
-- Create date: 22/05/2017
-- Description:	Obtiene los Detalles de PRODUCTOS  
-- =============================================
Create PROCEDURE [dbo].[BOP_FAJAS_spBuscarProductos]
@color INT = null,
@size int = null
AS
BEGIN
	SET NOCOUNT ON; 
		select 
		pd.ProDet_PK,
		pd.ProDet_Quantity,

		P.Pro_Pk,
		p.Pro_Fk_ProTyp, 
		P.Pro_Code,
		P.Pro_Description,
		P.Pro_Name,
		P.Pro_Photo,		
		p.Pro_SalePrice,
		
		pc.ProCol_PK,
		pc.ProCol_Name,

		ps.Siz_Pk,
		ps.Siz_Name,

		pt.ProTyp_Pk,
		pt.ProTyp_Name
		
		from Product_Detail PD 
		join Product P ON PD.ProDet_FKk_Pro = P.Pro_Pk
		JOIN Product_Color PC ON PD.ProDet_FK_ProCol = PC.ProCol_PK
		JOIN Product_Size PS ON PD.ProDet_FK_ProSiz = PS.Siz_Pk
		JOIN Product_Type PT ON P.Pro_Fk_ProTyp = pt.ProTyp_Pk
		
		WHERE PD.ProDet_FK_ProSiz = @size and PD.ProDet_FK_ProCol = @color AND PD.ProDet_Status = 'A'
END

GO
/****** Object:  StoredProcedure [dbo].[BOP_FAJAS_spCuerpoVenta]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		EDUARDO VENEGAS
-- Create date: 29/07/2017
-- Description:	Obtiene Encabezado de factura
-- =============================================
CREATE PROCEDURE [dbo].[BOP_FAJAS_spCuerpoVenta]
@Venta INT = null
AS
BEGIN
	SET NOCOUNT ON; 
		select  
		DSB.DetSalBil_Detail,
		DSB.DetSalBil_Quantity,
		P.Pro_Code,
		P.Pro_Description,
		p.Pro_SalePrice,
		p.Pro_SalePrice*DSB.DetSalBil_Quantity-DSB.DetSalBil_Detail as neto,
		
		concat(PS.Siz_Name,'/',PC.ProCol_Name) as Descripcion
		 
		from Detail_Sale_Bill DSB
		join Product_Detail PD ON DSB.DetBil_FK_ProDet = PD.ProDet_PK
		JOIN Product P ON P.Pro_Pk = PD.ProDet_FKk_Pro
		JOIN Product_Size PS ON PD.ProDet_FK_ProSiz = PS.Siz_Pk
		JOIN Product_Color PC ON PD.ProDet_FK_ProCol = PC.ProCol_PK
		where  DSB.DetBil_FK_BuyBil = @Venta
END

GO
/****** Object:  StoredProcedure [dbo].[BOP_FAJAS_spEncabezadoVenta]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		EDUARDO VENEGAS
-- Create date: 29/07/2017
-- Description:	Obtiene Encabezado de factura
-- =============================================
CREATE PROCEDURE [dbo].[BOP_FAJAS_spEncabezadoVenta]
@Venta INT = null
AS
BEGIN
	SET NOCOUNT ON; 
		select 
		C.Com_Email,
		C.Com_Id,
		C.Com_Name,
		C.Com_NickName,
		C.Com_Phone,
		C.Com_PK,

		ISNULL(SB.SalBil_ClientEmail,'') as SalBil_ClientEmail,
		ISNULL(SB.SalBil_PhoneClient,'') as SalBil_PhoneClient,
		ISNULL(SB.SalBil_IdClient,'') as SalBil_IdClient,
		ISNULL(SB.SalBil_ClientName,'') as SalBil_ClientName,
		SB.SalBil_Date,
		SB.SalBil_Description,
		SB.SalBil_Discount,
		SB.SalBil_GrossTotal,
		SB.SalBil_NetTotal,
		SB.SalBil_Tax,
		SB.SalBil_Pk
		from  Company C, Sale_Bill SB 

		where C.Com_PK = 1 and SB.SalBil_Pk = @Venta
END

GO
/****** Object:  StoredProcedure [dbo].[BOP_FAJAS_spListarDetalleCompras]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		EDUARDO VENEGAS
-- Create date: 27/07/2017
-- Description:	Obtiene las Compras 
-- =============================================
CREATE PROCEDURE [dbo].[BOP_FAJAS_spListarDetalleCompras] 
@PK_BILL INT = null,
@Estado varchar(1) = null
AS
BEGIN
	SET NOCOUNT ON; 
		select 
		DBB.DetBuyBil_PK,
		DBB.DetBuyBil_Quantity,
		DBB.DetBuyBil_BuyPrice,
		
		P.Pro_Pk,
		P.Pro_Name,
		P.Pro_Code,

		PS.Siz_Pk,
		PS.Siz_Name,

		PC.ProCol_PK,
		PC.ProCol_Name

		FROM Detail_Buy_Bill DBB
		JOIN Product_Detail PD ON DBB.DetBuyBil_FK_DetPro = PD.ProDet_PK
		JOIN Product P ON PD.ProDet_FKk_Pro = P.Pro_Pk
		JOIN Product_Size PS ON PD.ProDet_FK_ProSiz = PS.Siz_Pk
		JOIN Product_Color PC ON PD.ProDet_FK_ProCol = PC.ProCol_PK
		WHERE DBB.DetBuyBil_FK_BuyBil = @PK_BILL AND DBB.DetBuyBil_Status = @Estado
END

GO
/****** Object:  StoredProcedure [dbo].[BOP_FAJAS_spListarDetalleProductos]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		EDUARDO VENEGAS
-- Create date: 22/05/2017
-- Description:	Obtiene los Detalles de PRODUCTOS  
-- =============================================
CREATE PROCEDURE [dbo].[BOP_FAJAS_spListarDetalleProductos]
@PK_PRODUCTO INT = null
AS
BEGIN
	SET NOCOUNT ON; 
		select 
		pd.ProDet_PK,
		pd.ProDet_Quantity,

		P.Pro_Pk,
		p.Pro_Fk_ProTyp, 
		P.Pro_Code,
		P.Pro_Description,
		P.Pro_Name,
		P.Pro_Photo,		
		p.Pro_SalePrice,
		
		pc.ProCol_PK,
		pc.ProCol_Name,

		ps.Siz_Pk,
		ps.Siz_Name,

		pt.ProTyp_Pk,
		pt.ProTyp_Name
		
		from Product_Detail PD 
		join Product P ON PD.ProDet_FKk_Pro = P.Pro_Pk
		JOIN Product_Color PC ON PD.ProDet_FK_ProCol = PC.ProCol_PK
		JOIN Product_Size PS ON PD.ProDet_FK_ProSiz = PS.Siz_Pk
		JOIN Product_Type PT ON P.Pro_Fk_ProTyp = pt.ProTyp_Pk
		
		WHERE PD.ProDet_FKk_Pro = @PK_PRODUCTO AND PD.ProDet_Status = 'A'
END

GO
/****** Object:  StoredProcedure [dbo].[BOP_FAJAS_spListarDetalleVentas]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		EDUARDO VENEGAS
-- Create date: 27/07/2017
-- Description:	Obtiene las Compras 
-- =============================================
CREATE PROCEDURE [dbo].[BOP_FAJAS_spListarDetalleVentas] 
@PK_BILL INT = null
AS
BEGIN
	SET NOCOUNT ON; 
		select 
		SB.SalBil_Status,

		DSB.DetBil_PK,
		DSB.DetSalBil_Detail,
		DSB.DetSalBil_Quantity,
		DSB.DetBil_FK_ProDet,

		P.Pro_Pk,
		P.Pro_Name,
		P.Pro_Code,
		P.Pro_SalePrice,

		PS.Siz_Pk,
		PS.Siz_Name,

		PC.ProCol_PK,
		PC.ProCol_Name

		FROM Detail_Sale_Bill DSB
		JOIN Product_Detail PD ON DSB.DetBil_FK_ProDet = PD.ProDet_PK
		JOIN Product P ON PD.ProDet_FKk_Pro = P.Pro_Pk
		JOIN Product_Size PS ON PD.ProDet_FK_ProSiz = PS.Siz_Pk
		JOIN Product_Color PC ON PD.ProDet_FK_ProCol = PC.ProCol_PK
		JOIN Sale_Bill SB ON DSB.DetBil_FK_BuyBil = SB.SalBil_Pk 
		WHERE DSB.DetBil_FK_BuyBil = @PK_BILL 
END

GO
/****** Object:  StoredProcedure [dbo].[BOP_FAJAS_spListarProducto]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		EDUARDO VENEGAS
-- Create date: 22/05/2017
-- Description:	Obtiene UN  PRODUCTO  
-- =============================================
CREATE PROCEDURE [dbo].[BOP_FAJAS_spListarProducto]
@PK_PRODUCTO INT = null
AS
BEGIN
	SET NOCOUNT ON; 
		select 
		P.Pro_Pk,
		p.Pro_Fk_ProTyp, 
		P.Pro_Code,
		P.Pro_Description,
		P.Pro_Name,
		P.Pro_Photo,		
		p.Pro_SalePrice,
		pt.ProTyp_Name
		from  Product P
		join Product_Type pt on p.Pro_Fk_ProTyp = pt.ProTyp_Pk
		where p.Pro_Pk = @PK_PRODUCTO
		
END

GO
/****** Object:  StoredProcedure [dbo].[BOP_FAJAS_spListarProductos]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		EDUARDO VENEGAS
-- Create date: 22/05/2017
-- Description:	Obtiene los PRODUCTOS  
-- =============================================
CREATE PROCEDURE [dbo].[BOP_FAJAS_spListarProductos]
AS
BEGIN
	SET NOCOUNT ON; 
		select 
		P.Pro_Pk,
		p.Pro_Fk_ProTyp, 
		P.Pro_Code,
		P.Pro_Description,
		P.Pro_Name,
		P.Pro_Photo,		
		p.Pro_SalePrice,
		pt.ProTyp_Name
		from  Product P
		join Product_Type pt on p.Pro_Fk_ProTyp = pt.ProTyp_Pk 
		where p.Pro_Status = 'A'
		
END

GO
/****** Object:  StoredProcedure [dbo].[BOP_FAJAS_spListarUsuarios]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		EDUARDO VENEGAS
-- Create date: 22/05/2017
-- Description:	Obtiene los Usuarios  
-- =============================================
CREATE PROCEDURE [dbo].[BOP_FAJAS_spListarUsuarios]
AS
BEGIN
	SET NOCOUNT ON; 
		select  
		u.Use_PK,
		u.Use_Name,
		u.Use_Password
		from  Usuarios U
END

GO
/****** Object:  StoredProcedure [dbo].[BOP_FAJAS_spReporteCompraRangoFechas]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		EDUARDO VENEGAS
-- Create date: 29/07/2017
-- Description:	Obtiene Encabezado de factura
-- =============================================
CREATE PROCEDURE [dbo].[BOP_FAJAS_spReporteCompraRangoFechas]
@Inicio Datetime = null,
@Final Datetime = null
AS
BEGIN
	SET NOCOUNT ON; 
		select 
		@Inicio as FechaInicio,
		@Final as FechaFinal,
		BB.BuyBil_Date,
		BB.BuyBil_Total,
		BB.BuyBil_Description,
		BB.BuyBil_PK
		FROM Buy_Bill BB 
		where BB.BuyBil_Status = 'A' AND BB.BuyBil_Date BETWEEN @Inicio AND @Final
END

GO
/****** Object:  StoredProcedure [dbo].[BOP_FAJAS_spReporteVentaRangoFechas]    Script Date: 2/7/2017 1:00:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		EDUARDO VENEGAS
-- Create date: 29/07/2017
-- Description:	Obtiene Encabezado de factura
-- =============================================
CREATE PROCEDURE [dbo].[BOP_FAJAS_spReporteVentaRangoFechas]
@Inicio Datetime = null,
@Final Datetime = null
AS
BEGIN
	SET NOCOUNT ON; 
		select 
		@Inicio as FechaInicio,
		@Final as FechaFinal,
		ISNULL(SB.SalBil_ClientEmail,'') as SalBil_ClientEmail,
		ISNULL(SB.SalBil_PhoneClient,'') as SalBil_PhoneClient,
		ISNULL(SB.SalBil_IdClient,'') as SalBil_IdClient,
		ISNULL(SB.SalBil_ClientName,'') as SalBil_ClientName,
		SB.SalBil_Date,
		SB.SalBil_Description,
		SB.SalBil_Discount,
		SB.SalBil_GrossTotal,
		SB.SalBil_NetTotal,
		SB.SalBil_Tax,
		SB.SalBil_Pk
		
		FROM Sale_Bill SB 
		where SB.SalBil_Status = 'A' AND SB.SalBil_Date BETWEEN @Inicio AND @Final
END

GO
