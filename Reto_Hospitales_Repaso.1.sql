USE [ASIR_RicardoAvila_DEV]
GO
/****** Object:  Schema [Hospital]    Script Date: 12/06/2020 17:21:22 ******/
CREATE SCHEMA [Hospital]
GO
/****** Object:  UserDefinedFunction [Hospital].[fn_ContarlosPacientes]    Script Date: 12/06/2020 17:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [Hospital].[fn_ContarlosPacientes]()
RETURNS INT
AS
BEGIN
	DECLARE @NumTotal INT
	
	SELECT @NumTotal = COUNT(NumDeHistorial) FROM Pacientes

	RETURN @NumTotal
END
GO
/****** Object:  UserDefinedFunction [Hospital].[fn_PacienteGeneros]    Script Date: 12/06/2020 17:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [Hospital].[fn_PacienteGeneros](@genero CHAR)
RETURNS INT
AS
BEGIN
	DECLARE @NumTotal INT

	SELECT @NumTotal = COUNT(Sexo) FROM Pacientes

	RETURN @NumTotal
END
GO
/****** Object:  Table [dbo].[Ingresos]    Script Date: 12/06/2020 17:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingresos](
	[NumDeIngresos] [int] NOT NULL,
	[NumDeHistorial] [char](9) NULL,
	[FechaDeIngreso] [datetime] NULL,
	[CodigoDeIdentificacion] [char](4) NULL,
	[NumDePlanta] [tinyint] NULL,
	[NumDeCama] [tinyint] NULL,
	[Alergico] [char](2) NULL,
	[Observaciones] [varchar](600) NULL,
	[CosteDelTratamiento] [money] NULL,
	[Diagnostico] [varchar](40) NULL,
 CONSTRAINT [PK_Ingresos] PRIMARY KEY CLUSTERED 
(
	[NumDeIngresos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 12/06/2020 17:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[CodigoDeIdentificacion] [char](4) NOT NULL,
	[NombreDelMedico] [varchar](15) NULL,
	[ApllidosDelMedico] [varchar](30) NULL,
	[Especialidad] [nchar](25) NULL,
	[FechaDeIngreso] [datetime] NULL,
	[Cargo] [varchar](25) NULL,
	[NumeroDeColegiado] [int] NULL,
	[Observaciones] [varchar](600) NULL,
 CONSTRAINT [PK_Medicos] PRIMARY KEY CLUSTERED 
(
	[CodigoDeIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 12/06/2020 17:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[NumSeguridadSocial] [char](15) NULL,
	[Nombre] [varchar](15) NULL,
	[Apellidos] [varchar](30) NULL,
	[Domicilio] [varchar](30) NULL,
	[Poblacion] [varchar](25) NULL,
	[Provincia] [varchar](15) NULL,
	[CodigoPostal] [char](5) NULL,
	[Telefono] [char](12) NULL,
	[NumDeHistorial] [char](9) NOT NULL,
	[Sexo] [char](1) NULL,
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[NumDeHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Ingresos] ([NumDeIngresos], [NumDeHistorial], [FechaDeIngreso], [CodigoDeIdentificacion], [NumDePlanta], [NumDeCama], [Alergico], [Observaciones], [CosteDelTratamiento], [Diagnostico]) VALUES (2, N'15413-S  ', CAST(N'2009-03-13T00:00:00.000' AS DateTime), N'RLQ ', 2, 5, N'Si', N'Alergico a la penicilina', NULL, NULL)
INSERT [dbo].[Ingresos] ([NumDeIngresos], [NumDeHistorial], [FechaDeIngreso], [CodigoDeIdentificacion], [NumDePlanta], [NumDeCama], [Alergico], [Observaciones], [CosteDelTratamiento], [Diagnostico]) VALUES (3, N'11454-L  ', CAST(N'2009-05-25T00:00:00.000' AS DateTime), N'RLQ ', 3, 31, N'No', NULL, NULL, NULL)
INSERT [dbo].[Ingresos] ([NumDeIngresos], [NumDeHistorial], [FechaDeIngreso], [CodigoDeIdentificacion], [NumDePlanta], [NumDeCama], [Alergico], [Observaciones], [CosteDelTratamiento], [Diagnostico]) VALUES (4, N'15413-S  ', CAST(N'2010-01-29T00:00:00.000' AS DateTime), N'CEM ', 2, 13, N'NO', NULL, NULL, NULL)
INSERT [dbo].[Medicos] ([CodigoDeIdentificacion], [NombreDelMedico], [ApllidosDelMedico], [Especialidad], [FechaDeIngreso], [Cargo], [NumeroDeColegiado], [Observaciones]) VALUES (N'AHJ ', N'Antonio', N'Jean Hernandez', N'Pediatria                ', CAST(N'1982-08-12T00:00:00.000' AS DateTime), N'Adjunto', 2113, N'Esta proxima su retirada')
INSERT [dbo].[Medicos] ([CodigoDeIdentificacion], [NombreDelMedico], [ApllidosDelMedico], [Especialidad], [FechaDeIngreso], [Cargo], [NumeroDeColegiado], [Observaciones]) VALUES (N'CEM ', N'Angela', N'Estrill Manrique', N'Psiquiatria              ', CAST(N'1992-02-13T00:00:00.000' AS DateTime), N'Jefe de seccion', 1231, NULL)
INSERT [dbo].[Medicos] ([CodigoDeIdentificacion], [NombreDelMedico], [ApllidosDelMedico], [Especialidad], [FechaDeIngreso], [Cargo], [NumeroDeColegiado], [Observaciones]) VALUES (N'RLQ ', N'Esther', N'Rocio', N'Lopez Quijada            ', CAST(N'1994-09-23T00:00:00.000' AS DateTime), N'Titular', 1331, NULL)
INSERT [dbo].[Pacientes] ([NumSeguridadSocial], [Nombre], [Apellidos], [Domicilio], [Poblacion], [Provincia], [CodigoPostal], [Telefono], [NumDeHistorial], [Sexo]) VALUES (N'08/7888888     ', N'Jose', N'Romerales Pinto', N'C/ Azoran, 30', N'Mostoles', N'Madrid', N'28935', N'913458745   ', N'10203-F  ', N'H')
INSERT [dbo].[Pacientes] ([NumSeguridadSocial], [Nombre], [Apellidos], [Domicilio], [Poblacion], [Provincia], [CodigoPostal], [Telefono], [NumDeHistorial], [Sexo]) VALUES (N'08/7234823     ', N'Angel', N'Ruiz Picaso', N'C/ Salmeron, 12', N'Madrid', N'Madrid', N'28028', N'915653433   ', N'11454-L  ', N'H')
INSERT [dbo].[Pacientes] ([NumSeguridadSocial], [Nombre], [Apellidos], [Domicilio], [Poblacion], [Provincia], [CodigoPostal], [Telefono], [NumDeHistorial], [Sexo]) VALUES (N'08/7333333     ', N'Mercedes', N'Gonzales Perez', N'C/ Malaga, 13', N'Mostoles', N'Madrid', N'28935', N'914556745   ', N'14546-E  ', N'M')
INSERT [dbo].[Pacientes] ([NumSeguridadSocial], [Nombre], [Apellidos], [Domicilio], [Poblacion], [Provincia], [CodigoPostal], [Telefono], [NumDeHistorial], [Sexo]) VALUES (N'08/7555555     ', N'Martin', N'Fenandez Lopez', N'C/ Sastres, 21', N'Madrid', N'Madrid', N'28028', N'913333333   ', N'15413-S  ', N'H')
ALTER TABLE [dbo].[Ingresos]  WITH CHECK ADD  CONSTRAINT [FK_Ingresos_Medicos] FOREIGN KEY([CodigoDeIdentificacion])
REFERENCES [dbo].[Medicos] ([CodigoDeIdentificacion])
GO
ALTER TABLE [dbo].[Ingresos] CHECK CONSTRAINT [FK_Ingresos_Medicos]
GO
ALTER TABLE [dbo].[Ingresos]  WITH CHECK ADD  CONSTRAINT [FK_Ingresos_Pacientes1] FOREIGN KEY([NumDeHistorial])
REFERENCES [dbo].[Pacientes] ([NumDeHistorial])
GO
ALTER TABLE [dbo].[Ingresos] CHECK CONSTRAINT [FK_Ingresos_Pacientes1]
GO
/****** Object:  StoredProcedure [Hospital].[pr_AltaMedico]    Script Date: 12/06/2020 17:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Ricardo
-- Create date: 10/06/2020
-- Description: Introducir un médico a la base de datos, con los siguientes restricciones	
-- =============================================
CREATE PROCEDURE [Hospital].[pr_AltaMedico] 
	-- Add the parameters for the stored procedure here
	@p_CodigoDeIdentificacion CHAR (4), 
	@p_NombreDelMedico VARCHAR (15), 
	@p_ApellidosDelMedico VARCHAR (30), 
	@p_Especialidad NCHAR (25),
	@p_FechaDeIngreso DATETIME,
	@p_Cargo VARCHAR (25),
	@p_NumeroDeColegiado INT,
	@p_Observaciones VARCHAR (600)
	
AS
BEGIN
		 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 



    -- Insert statements for procedure here
  IF @p_NumeroDeColegiado < 1000
		 

	BEGIN
		PRINT 'El numero de colegiado tiene que ser superior a 999'
		 RETURN -1
	
END

INSERT INTO Medicos (NumeroDeColegiado)
	VALUES (@p_NumeroDeColegiado)
	RETURN 0 
END
GO
/****** Object:  StoredProcedure [Hospital].[pr_IngresosPacientes]    Script Date: 12/06/2020 17:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Ricardo
-- Create date:  10/06/2020
-- Description:	Mostrar los nombres y otros datos (fecha, planta, cama, etc..) de los pacientes ingresados entre dos fechas.
-- =============================================
CREATE PROCEDURE [Hospital].[pr_IngresosPacientes] 
	-- Add the parameters for the stored procedure here
	@p_FechaIngreso1 DATE,
    @p_FechaIngreso2 DATE

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
AS
BEGIN
    SELECT P.*
    from dbo.Pacientes AS P
    INNER JOIN dbo.Ingresos AS I ON P.NumDeHistorial = I.NumDeHistorial
	WHERE FechaDeIngreso BETWEEN @p_FechaIngreso1 AND @p_FechaIngreso2
	END
GO
