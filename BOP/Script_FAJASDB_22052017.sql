USE [FAJAS_BD]
GO
/****** Object:  Table [dbo].[Buy_Bill]    Script Date: 22/5/2017 9:03:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buy_Bill](
	[BuyBil_Date] [datetime] NOT NULL,
	[BuyBil_Description] [nvarchar](50) NULL,
	[BuyBil_Total] [float] NOT NULL,
	[BuyBil_PK] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Buy_Bill] PRIMARY KEY CLUSTERED 
(
	[BuyBil_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 22/5/2017 9:03:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Com_Name] [nvarchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[Detail_Buy_Bill]    Script Date: 22/5/2017 9:03:15 p. m. ******/
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
/****** Object:  Table [dbo].[Detail_Sale_Bill]    Script Date: 22/5/2017 9:03:15 p. m. ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 22/5/2017 9:03:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Pro_Name] [nvarchar](50) NOT NULL,
	[Pro_Description] [nvarchar](50) NULL,
	[Pro_Code] [nvarchar](50) NOT NULL,
	[Pro_Photo] [nvarchar](50) NULL,
	[Pro_SalePrice] [float] NOT NULL,
	[Pro_Pk] [int] IDENTITY(1,1) NOT NULL,
	[Pro_Fk_ProTyp] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Pro_Pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Color]    Script Date: 22/5/2017 9:03:15 p. m. ******/
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
/****** Object:  Table [dbo].[Product_Detail]    Script Date: 22/5/2017 9:03:15 p. m. ******/
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
/****** Object:  Table [dbo].[Product_Size]    Script Date: 22/5/2017 9:03:15 p. m. ******/
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
/****** Object:  Table [dbo].[Product_Type]    Script Date: 22/5/2017 9:03:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Type](
	[ProTyp_Name] [nvarchar](50) NOT NULL,
	[ProTyp_Pk] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Product_Type] PRIMARY KEY CLUSTERED 
(
	[ProTyp_Pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sale_Bill]    Script Date: 22/5/2017 9:03:15 p. m. ******/
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
 CONSTRAINT [PK_SaleBill] PRIMARY KEY CLUSTERED 
(
	[SalBil_Pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 22/5/2017 9:03:15 p. m. ******/
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
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Pro_Name], [Pro_Description], [Pro_Code], [Pro_Photo], [Pro_SalePrice], [Pro_Pk], [Pro_Fk_ProTyp]) VALUES (N'FAJA PARA GORDITAS', N'Faja para las más gorditas del salón', N'001', N'agg', 10000, 1, 1)
INSERT [dbo].[Product] ([Pro_Name], [Pro_Description], [Pro_Code], [Pro_Photo], [Pro_SalePrice], [Pro_Pk], [Pro_Fk_ProTyp]) VALUES (N'FAJA PARA DELGADAS', N'Las flacas ya estan flacas :v', N'002', N'agg', 20000, 4, 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Product_Type] ON 

INSERT [dbo].[Product_Type] ([ProTyp_Name], [ProTyp_Pk]) VALUES (N'TIPO 1 >:v', 1)
INSERT [dbo].[Product_Type] ([ProTyp_Name], [ProTyp_Pk]) VALUES (N'TIPO 2 :v', 2)
SET IDENTITY_INSERT [dbo].[Product_Type] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Use_Name], [Use_Password], [Use_PK]) VALUES (N'Jittan              ', N'1234                ', 1)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
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
/****** Object:  StoredProcedure [dbo].[BOP_FAJAS_spListarDetalleProductos]    Script Date: 22/5/2017 9:03:15 p. m. ******/
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
		
		WHERE PD.ProDet_FKk_Pro = @PK_PRODUCTO
END
GO
/****** Object:  StoredProcedure [dbo].[BOP_FAJAS_spListarProducto]    Script Date: 22/5/2017 9:03:15 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[BOP_FAJAS_spListarProductos]    Script Date: 22/5/2017 9:03:15 p. m. ******/
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
		
END
GO
/****** Object:  StoredProcedure [dbo].[BOP_FAJAS_spListarUsuarios]    Script Date: 22/5/2017 9:03:15 p. m. ******/
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
USE [master]
GO
ALTER DATABASE [FAJAS_BD] SET  READ_WRITE 
GO
