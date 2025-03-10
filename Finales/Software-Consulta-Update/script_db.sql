USE [db_proyectos]
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_EMPLEADOS]    Script Date: 13/02/2022 22:28:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_EMPLEADOS]
AS
BEGIN
	
	SELECT * from Empleados ORDER BY 3;
END


GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_PROYECTOS]    Script Date: 13/02/2022 22:28:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_PROYECTOS]
AS
BEGIN
	
	SELECT * from Proyectos ORDER BY 2;
END


GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_PROYECTOS_POR_FECHA]    Script Date: 13/02/2022 22:28:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_PROYECTOS_POR_FECHA]
@fec_inicio date,
@fec_fin date 
AS
BEGIN
	SELECT * 
	from Proyectos
	WHERE fecha_inicio between @fec_inicio and @fec_fin 
	ORDER BY 2;
END


GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_PROYECTOS_POR_ID]    Script Date: 13/02/2022 22:28:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_PROYECTOS_POR_ID]
@id_proyecto int
AS
BEGIN
	
	SELECT * from Proyectos WHERE id_proyecto = @id_proyecto;
END


GO
/****** Object:  Table [dbo].[Detalles_Recurso]    Script Date: 13/02/2022 22:28:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Detalles_Recurso](
	[id_empleado] [int] NOT NULL,
	[id_proyecto] [int] NOT NULL,
	[rol] [varchar](50) NULL,
	[hrsSemana] [int] NOT NULL,
 CONSTRAINT [PK_Detalles_Recurso] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC,
	[id_proyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 13/02/2022 22:28:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleados](
	[id_empleado] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[dni] [int] NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proyectos]    Script Date: 13/02/2022 22:28:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proyectos](
	[id_proyecto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NULL,
 CONSTRAINT [PK_Proyectos] PRIMARY KEY CLUSTERED 
(
	[id_proyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Empleados] ([id_empleado], [nombre], [apellido], [dni]) VALUES (1, N'Juan', N'Artista', 23567888)
INSERT [dbo].[Empleados] ([id_empleado], [nombre], [apellido], [dni]) VALUES (2, N'José ', N'Rodriguez', 20987226)
INSERT [dbo].[Empleados] ([id_empleado], [nombre], [apellido], [dni]) VALUES (3, N'Ana', N'Soriano', 30987322)
ALTER TABLE [dbo].[Detalles_Recurso] ADD  CONSTRAINT [DF_Detalles_Recurso_hrsSemana]  DEFAULT ((0)) FOR [hrsSemana]
GO
ALTER TABLE [dbo].[Detalles_Recurso]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Recurso_Empleados] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleados] ([id_empleado])
GO
ALTER TABLE [dbo].[Detalles_Recurso] CHECK CONSTRAINT [FK_Detalles_Recurso_Empleados]
GO
ALTER TABLE [dbo].[Detalles_Recurso]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Recurso_Proyectos] FOREIGN KEY([id_proyecto])
REFERENCES [dbo].[Proyectos] ([id_proyecto])
GO
ALTER TABLE [dbo].[Detalles_Recurso] CHECK CONSTRAINT [FK_Detalles_Recurso_Proyectos]
GO
