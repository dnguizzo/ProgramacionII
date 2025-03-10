--create database Qatar2022

USE [Qatar2022]
GO
/****** Object:  Table [dbo].[Equipos]    Script Date: 29/9/2022 19:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipos](
	[id_equipo] [int] IDENTITY(1,1) NOT NULL,
	[pais] [varchar](50) NOT NULL,
	[director_tecnico] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Equipo] PRIMARY KEY CLUSTERED 
(
	[id_equipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jugadores_Equipo]    Script Date: 29/9/2022 19:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugadores_Equipo](
	[id_equipo] [int] NOT NULL,
	[id_persona] [int] NOT NULL,
	[camiseta] [int] NOT NULL,
	[posicion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Jugadores_Equipo] PRIMARY KEY CLUSTERED 
(
	[id_equipo] ASC,
	[id_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 29/9/2022 19:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[id_persona] [int] NOT NULL,
	[nombre_completo] [varchar](100) NOT NULL,
	[clase] [int] NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[id_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Personas] ([id_persona], [nombre_completo], [clase]) VALUES (1, N'Leonel Messi', 86)
INSERT [dbo].[Personas] ([id_persona], [nombre_completo], [clase]) VALUES (2, N'Juan Acem', 80)
INSERT [dbo].[Personas] ([id_persona], [nombre_completo], [clase]) VALUES (3, N'Ahmed Alaaeldin', 85)
INSERT [dbo].[Personas] ([id_persona], [nombre_completo], [clase]) VALUES (4, N'Akram Afif', 83)
GO
ALTER TABLE [dbo].[Jugadores_Equipo]  WITH CHECK ADD  CONSTRAINT [FK_Jugadores_Equipo_Equipo] FOREIGN KEY([id_equipo])
REFERENCES [dbo].[Equipos] ([id_equipo])
GO
ALTER TABLE [dbo].[Jugadores_Equipo] CHECK CONSTRAINT [FK_Jugadores_Equipo_Equipo]
GO
ALTER TABLE [dbo].[Jugadores_Equipo]  WITH CHECK ADD  CONSTRAINT [FK_Jugadores_Equipo_Personas] FOREIGN KEY([id_persona])
REFERENCES [dbo].[Personas] ([id_persona])
GO
ALTER TABLE [dbo].[Jugadores_Equipo] CHECK CONSTRAINT [FK_Jugadores_Equipo_Personas]
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_PERSONAS]    Script Date: 29/9/2022 19:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_PERSONAS]
AS
BEGIN
	
	SELECT * from Personas ORDER BY 2;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_DETALLES_EQUIPO]    Script Date: 29/9/2022 19:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERTAR_DETALLES_EQUIPO] 
	@id_equipo int,
	@id_persona int, 
	@camiseta int,
	@posicion varchar(50)
	
AS
BEGIN
	INSERT INTO Jugadores_Equipo(id_equipo,id_persona,camiseta, posicion)
    VALUES (@id_equipo, @id_persona, @camiseta, @posicion);  
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_EQUIPO]    Script Date: 29/9/2022 19:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_INSERTAR_EQUIPO] 
	@pais varchar(50),
	@director_tecnico varchar(50), 
	@id int output
AS
BEGIN
	INSERT INTO Equipos (pais, director_tecnico)
    VALUES (@pais, @director_tecnico);
    
    SET @id = SCOPE_IDENTITY();

END;
GO
