USE [master]
GO
/****** Objeto: Database [AcadDB(RDGC0002)] Fecha de script: 22/6/2026 8:43:56 a. m. ******/
CREATE DATABASE [AcadDB(RDGC0002)]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AcadDB(RDGC0002)', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\AcadDB(RDGC0002).mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AcadDB(RDGC0002)_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\AcadDB(RDGC0002)_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AcadDB(RDGC0002)].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET ARITHABORT OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET RECOVERY FULL 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET  MULTI_USER 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET QUERY_STORE = ON
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AcadDB(RDGC0002)]
GO
/****** Objeto: Table [dbo].[Asignatura] Fecha de script: 22/6/2026 8:43:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignatura](
	[codigo] [nchar](8) NOT NULL,
	[nombre] [varchar](30) NULL,
	[creditos] [tinyint] NULL,
	[horasTeoricas] [tinyint] NULL,
	[horasPracticas] [tinyint] NULL,
 CONSTRAINT [PK_Asignatura] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Carrera] Fecha de script: 22/6/2026 8:43:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrera](
	[id] [nchar](5) NOT NULL,
	[nombreCarrera] [varchar](50) NULL,
 CONSTRAINT [PK_Carrera] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[CategoriaPago] Fecha de script: 22/6/2026 8:43:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriaPago](
	[id] [nchar](3) NOT NULL,
	[descripcion] [varchar](80) NULL,
 CONSTRAINT [PK_CategoriaPago] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[DiaSemana] Fecha de script: 22/6/2026 8:43:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaSemana](
	[dia] [tinyint] NOT NULL,
	[descripcion] [varchar](9) NULL,
	[nombreCorto] [nchar](2) NULL,
 CONSTRAINT [PK_DiaSemana] PRIMARY KEY CLUSTERED 
(
	[dia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Estudiante] Fecha de script: 22/6/2026 8:43:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiante](
	[id] [nchar](8) NOT NULL,
	[nombre] [varchar](25) NULL,
	[apellido] [varchar](20) NULL,
	[idCarrera] [nchar](5) NULL,
	[idCategoriaPago] [nchar](3) NULL,
	[idNacionalidad] [nchar](3) NULL,
	[direccion] [varchar](200) NULL,
 CONSTRAINT [PK_Estudiante] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Grupo] Fecha de script: 22/6/2026 8:43:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupo](
	[codigoPeriodo] [nchar](10) NOT NULL,
	[codigoAsignatura] [nchar](8) NOT NULL,
	[numeroGrupo] [nchar](4) NOT NULL,
	[cupoGrupo] [int] NULL,
	[horario] [varchar](60) NULL,
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[codigoPeriodo] ASC,
	[codigoAsignatura] ASC,
	[numeroGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[GruposInscritos] Fecha de script: 22/6/2026 8:43:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GruposInscritos](
	[codigoPeriodo] [nchar](10) NOT NULL,
	[idEstudiante] [nchar](8) NOT NULL,
	[codigoAsignatura] [nchar](8) NOT NULL,
	[numeroGrupo] [nchar](4) NOT NULL,
 CONSTRAINT [PK_GruposInscritos] PRIMARY KEY CLUSTERED 
(
	[codigoPeriodo] ASC,
	[idEstudiante] ASC,
	[codigoAsignatura] ASC,
	[numeroGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[HorarioGrupo] Fecha de script: 22/6/2026 8:43:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HorarioGrupo](
	[codigoPeriodo] [nchar](10) NOT NULL,
	[codigoAsignatura] [nchar](8) NOT NULL,
	[numeroGrupo] [nchar](4) NOT NULL,
	[dia] [tinyint] NOT NULL,
	[horaInicio] [time](7) NOT NULL,
	[horaFin] [time](7) NULL,
 CONSTRAINT [PK_HorarioGrupo] PRIMARY KEY CLUSTERED 
(
	[codigoPeriodo] ASC,
	[codigoAsignatura] ASC,
	[numeroGrupo] ASC,
	[dia] ASC,
	[horaInicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Inscripcion] Fecha de script: 22/6/2026 8:43:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscripcion](
	[codigoPeriodo] [nchar](10) NOT NULL,
	[idEstudiante] [nchar](8) NOT NULL,
	[fechaInscripcion] [date] NULL,
 CONSTRAINT [PK_Inscripcion] PRIMARY KEY CLUSTERED 
(
	[codigoPeriodo] ASC,
	[idEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Nacionalidad] Fecha de script: 22/6/2026 8:43:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nacionalidad](
	[id] [nchar](3) NOT NULL,
	[nombre] [varchar](30) NULL,
 CONSTRAINT [PK_Nacionalidad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[PeriodoAcademico] Fecha de script: 22/6/2026 8:43:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeriodoAcademico](
	[codigo] [nchar](10) NOT NULL,
	[descripcion] [varchar](25) NULL,
	[fechaPrematricula] [date] NULL,
	[fechaRetiro] [date] NULL,
	[fechaPublicacion] [date] NULL,
 CONSTRAINT [PK_PeriodoAcademico] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'ADM-101 ', N'Administracion', 3, 3, 0)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'CON-101 ', N'Contabilidad Basica', 3, 3, 0)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'ECO-101 ', N'Economia General', 3, 3, 0)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'ESP-101 ', N'Espanol', 4, 4, 0)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'FIL-101 ', N'Filosofia', 2, 2, 0)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'FIS-101 ', N'Fisica I', 4, 2, 2)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'FIS-102 ', N'Fisica II', 4, 2, 2)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'ICC-101 ', N'Introduccion a la Algoritmia', 4, 2, 3)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'ICC-102 ', N'Fundamentos de la programacion', 4, 3, 3)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'ICC-201 ', N'Base de Datos', 4, 3, 3)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'ICC-203 ', N'Sistemas Operativos', 4, 3, 3)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'ILE-101 ', N'Ingles I', 3, 3, 0)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'ITT-202 ', N'Redes I', 3, 3, 2)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'LOG-101 ', N'Razonamiento Logico', 3, 3, 0)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'MAT-111 ', N'Precalculo', 4, 2, 3)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'MAT-113 ', N'Calculo I', 4, 2, 2)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'MAT-114 ', N'Calculo II', 4, 2, 2)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'MAT-121 ', N'Algebra Lineal', 4, 2, 2)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'MAT-131 ', N'Estadistica', 4, 3, 2)
GO
INSERT [dbo].[Asignatura] ([codigo], [nombre], [creditos], [horasTeoricas], [horasPracticas]) VALUES (N'QUI-101 ', N'Quimica I', 4, 2, 2)
GO
INSERT [dbo].[Carrera] ([id], [nombreCarrera]) VALUES (N'ADM  ', N'Administracion de Empresas')
GO
INSERT [dbo].[Carrera] ([id], [nombreCarrera]) VALUES (N'IAR  ', N'Ingenieria en Arquitectura')
GO
INSERT [dbo].[Carrera] ([id], [nombreCarrera]) VALUES (N'ICC  ', N'Ingenieria en Ciencias de la Computacion')
GO
INSERT [dbo].[Carrera] ([id], [nombreCarrera]) VALUES (N'ICV  ', N'Ingenieria Civil')
GO
INSERT [dbo].[Carrera] ([id], [nombreCarrera]) VALUES (N'IEC  ', N'Ingenieria Electrica')
GO
INSERT [dbo].[Carrera] ([id], [nombreCarrera]) VALUES (N'IIN  ', N'Ingenieria Industrial')
GO
INSERT [dbo].[Carrera] ([id], [nombreCarrera]) VALUES (N'IMC  ', N'Ingenieria Mecanica')
GO
INSERT [dbo].[Carrera] ([id], [nombreCarrera]) VALUES (N'IQU  ', N'Ingenieria Quimica')
GO
INSERT [dbo].[Carrera] ([id], [nombreCarrera]) VALUES (N'ITT  ', N'Ingenieria Telematica')
GO
INSERT [dbo].[Carrera] ([id], [nombreCarrera]) VALUES (N'MER  ', N'Mercadeo')
GO
INSERT [dbo].[CategoriaPago] ([id], [descripcion]) VALUES (N'A01', N'Beca Completa')
GO
INSERT [dbo].[CategoriaPago] ([id], [descripcion]) VALUES (N'A02', N'Media Beca')
GO
INSERT [dbo].[CategoriaPago] ([id], [descripcion]) VALUES (N'A03', N'Pago Regular')
GO
INSERT [dbo].[CategoriaPago] ([id], [descripcion]) VALUES (N'A04', N'Descuento deportivo')
GO
INSERT [dbo].[CategoriaPago] ([id], [descripcion]) VALUES (N'A05', N'Convenio Institucional')
GO
INSERT [dbo].[DiaSemana] ([dia], [descripcion], [nombreCorto]) VALUES (1, N'Lunes', N'Lu')
GO
INSERT [dbo].[DiaSemana] ([dia], [descripcion], [nombreCorto]) VALUES (2, N'Martes', N'Ma')
GO
INSERT [dbo].[DiaSemana] ([dia], [descripcion], [nombreCorto]) VALUES (3, N'Miercoles', N'Mi')
GO
INSERT [dbo].[DiaSemana] ([dia], [descripcion], [nombreCorto]) VALUES (4, N'Jueves', N'Ju')
GO
INSERT [dbo].[DiaSemana] ([dia], [descripcion], [nombreCorto]) VALUES (5, N'Viernes', N'Vi')
GO
INSERT [dbo].[DiaSemana] ([dia], [descripcion], [nombreCorto]) VALUES (6, N'Sabado', N'Sa')
GO
INSERT [dbo].[DiaSemana] ([dia], [descripcion], [nombreCorto]) VALUES (7, N'Domingo', N'Do')
GO
INSERT [dbo].[Estudiante] ([id], [nombre], [apellido], [idCarrera], [idCategoriaPago], [idNacionalidad], [direccion]) VALUES (N'10160001', N'Juan', N'Perez', N'ICC  ', N'A03', N'DOM', N'Santiago')
GO
INSERT [dbo].[Estudiante] ([id], [nombre], [apellido], [idCarrera], [idCategoriaPago], [idNacionalidad], [direccion]) VALUES (N'10160002', N'Maria', N'Gomez', N'ICC  ', N'A02', N'DOM', N'La Vega')
GO
INSERT [dbo].[Estudiante] ([id], [nombre], [apellido], [idCarrera], [idCategoriaPago], [idNacionalidad], [direccion]) VALUES (N'10160003', N'Carlos', N'Lopez', N'ITT  ', N'A03', N'USA', N'Santiago')
GO
INSERT [dbo].[Estudiante] ([id], [nombre], [apellido], [idCarrera], [idCategoriaPago], [idNacionalidad], [direccion]) VALUES (N'10160004', N'Ana', N'Martinez', N'ICV  ', N'A01', N'COL', N'Moca')
GO
INSERT [dbo].[Estudiante] ([id], [nombre], [apellido], [idCarrera], [idCategoriaPago], [idNacionalidad], [direccion]) VALUES (N'10160005', N'Luis', N'Rodriguez', N'IMC  ', N'A03', N'VEN', N'Santiago')
GO
INSERT [dbo].[Estudiante] ([id], [nombre], [apellido], [idCarrera], [idCategoriaPago], [idNacionalidad], [direccion]) VALUES (N'10160006', N'Pedro', N'Santos', N'IEC  ', N'A04', N'DOM', N'Puerto Plata')
GO
INSERT [dbo].[Estudiante] ([id], [nombre], [apellido], [idCarrera], [idCategoriaPago], [idNacionalidad], [direccion]) VALUES (N'10160007', N'Laura', N'Diaz', N'ADM  ', N'A05', N'ESP', N'Santiago')
GO
INSERT [dbo].[Estudiante] ([id], [nombre], [apellido], [idCarrera], [idCategoriaPago], [idNacionalidad], [direccion]) VALUES (N'10160008', N'Jose', N'Torres', N'MER  ', N'A03', N'MEX', N'La Vega')
GO
INSERT [dbo].[Estudiante] ([id], [nombre], [apellido], [idCarrera], [idCategoriaPago], [idNacionalidad], [direccion]) VALUES (N'10160009', N'Sofia', N'Castillo', N'IIN  ', N'A02', N'ARG', N'Moca')
GO
INSERT [dbo].[Estudiante] ([id], [nombre], [apellido], [idCarrera], [idCategoriaPago], [idNacionalidad], [direccion]) VALUES (N'10160010', N'Miguel', N'Fernandez', N'IQU  ', N'A03', N'BRA', N'Santiago')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-2    ', N'ESP-101 ', N'1874', 25, N'10-12 Sa')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-2    ', N'FIS-101 ', N'1870', 25, N'08-11 Vi')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-2    ', N'FIS-102 ', N'1871', 25, N'14-17 Vi')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-2    ', N'ICC-101 ', N'1865', 20, N'14-17 LMi')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-2    ', N'ICC-102 ', N'1866', 20, N'14-17 MaJu')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-2    ', N'ICC-201 ', N'1867', 20, N'18-21 LMi')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-2    ', N'ICC-203 ', N'1869', 20, N'18-21 Vi')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-2    ', N'ITT-202 ', N'1868', 25, N'18-20 MaJu')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-2    ', N'LOG-101 ', N'1873', 25, N'08-10 Sa')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-2    ', N'MAT-111 ', N'1860', 25, N'08-10 LMiV')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-2    ', N'MAT-113 ', N'1861', 25, N'10-12 LMiV')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-2    ', N'MAT-114 ', N'1862', 20, N'14-16 LMi')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-2    ', N'MAT-121 ', N'1863', 25, N'08-10 MaJu')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-2    ', N'MAT-131 ', N'1864', 22, N'10-12 MaJu')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-2    ', N'QUI-101 ', N'1872', 20, N'10-13 Vi')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-3    ', N'FIS-101 ', N'1907', 25, N'08-11 Vi')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-3    ', N'ICC-101 ', N'1904', 20, N'14-17 LMi')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-3    ', N'ICC-102 ', N'1905', 20, N'14-17 MaJu')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-3    ', N'ICC-201 ', N'1906', 20, N'18-21 LMi')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-3    ', N'ILE-101 ', N'1909', 25, N'10-12 Sa')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-3    ', N'LOG-101 ', N'1908', 25, N'08-10 Sa')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-3    ', N'MAT-111 ', N'1900', 25, N'08-10 LMiV')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-3    ', N'MAT-113 ', N'1901', 25, N'10-12 LMiV')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-3    ', N'MAT-121 ', N'1902', 25, N'08-10 MaJu')
GO
INSERT [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [cupoGrupo], [horario]) VALUES (N'2026-3    ', N'MAT-131 ', N'1903', 22, N'10-12 MaJu')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-2    ', N'10160001', N'ICC-101 ', N'1865')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-2    ', N'10160001', N'LOG-101 ', N'1873')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-2    ', N'10160001', N'MAT-111 ', N'1860')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-2    ', N'10160002', N'ESP-101 ', N'1874')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-2    ', N'10160002', N'ICC-102 ', N'1866')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-2    ', N'10160002', N'MAT-113 ', N'1861')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-2    ', N'10160003', N'FIS-101 ', N'1870')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-2    ', N'10160003', N'ICC-201 ', N'1867')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-2    ', N'10160003', N'MAT-121 ', N'1863')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-2    ', N'10160004', N'FIS-102 ', N'1871')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-2    ', N'10160004', N'MAT-131 ', N'1864')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-2    ', N'10160004', N'QUI-101 ', N'1872')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-2    ', N'10160005', N'ICC-203 ', N'1869')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-2    ', N'10160005', N'ITT-202 ', N'1868')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-2    ', N'10160005', N'LOG-101 ', N'1873')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-3    ', N'10160001', N'FIS-101 ', N'1907')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-3    ', N'10160001', N'ICC-201 ', N'1906')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-3    ', N'10160001', N'MAT-113 ', N'1901')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-3    ', N'10160002', N'ICC-201 ', N'1906')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-3    ', N'10160002', N'ILE-101 ', N'1909')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-3    ', N'10160002', N'MAT-121 ', N'1902')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-3    ', N'10160003', N'ICC-101 ', N'1904')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-3    ', N'10160003', N'LOG-101 ', N'1908')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-3    ', N'10160003', N'MAT-131 ', N'1903')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-3    ', N'10160004', N'ILE-101 ', N'1909')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-3    ', N'10160004', N'LOG-101 ', N'1908')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-3    ', N'10160004', N'MAT-113 ', N'1901')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-3    ', N'10160005', N'FIS-101 ', N'1907')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-3    ', N'10160005', N'ICC-101 ', N'1904')
GO
INSERT [dbo].[GruposInscritos] ([codigoPeriodo], [idEstudiante], [codigoAsignatura], [numeroGrupo]) VALUES (N'2026-3    ', N'10160005', N'MAT-121 ', N'1902')
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'ESP-101 ', N'1874', 6, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'FIS-101 ', N'1870', 5, CAST(N'08:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'FIS-102 ', N'1871', 5, CAST(N'14:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'ICC-101 ', N'1865', 1, CAST(N'14:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'ICC-101 ', N'1865', 3, CAST(N'14:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'ICC-102 ', N'1866', 2, CAST(N'14:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'ICC-102 ', N'1866', 4, CAST(N'14:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'ICC-201 ', N'1867', 1, CAST(N'18:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'ICC-201 ', N'1867', 3, CAST(N'18:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'ICC-203 ', N'1869', 5, CAST(N'18:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'ITT-202 ', N'1868', 2, CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'ITT-202 ', N'1868', 4, CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'LOG-101 ', N'1873', 6, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'MAT-111 ', N'1860', 1, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'MAT-111 ', N'1860', 3, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'MAT-111 ', N'1860', 5, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'MAT-113 ', N'1861', 1, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'MAT-113 ', N'1861', 3, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'MAT-113 ', N'1861', 5, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'MAT-114 ', N'1862', 1, CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'MAT-114 ', N'1862', 3, CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'MAT-121 ', N'1863', 2, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'MAT-121 ', N'1863', 4, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'MAT-131 ', N'1864', 2, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'MAT-131 ', N'1864', 4, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-2    ', N'QUI-101 ', N'1872', 5, CAST(N'10:00:00' AS Time), CAST(N'13:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'FIS-101 ', N'1907', 5, CAST(N'08:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'ICC-101 ', N'1904', 1, CAST(N'14:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'ICC-101 ', N'1904', 3, CAST(N'14:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'ICC-102 ', N'1905', 2, CAST(N'14:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'ICC-102 ', N'1905', 4, CAST(N'14:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'ICC-201 ', N'1906', 1, CAST(N'18:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'ICC-201 ', N'1906', 3, CAST(N'18:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'ILE-101 ', N'1909', 6, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'LOG-101 ', N'1908', 6, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'MAT-111 ', N'1900', 1, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'MAT-111 ', N'1900', 3, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'MAT-111 ', N'1900', 5, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'MAT-113 ', N'1901', 1, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'MAT-113 ', N'1901', 3, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'MAT-113 ', N'1901', 5, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'MAT-121 ', N'1902', 2, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'MAT-121 ', N'1902', 4, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'MAT-131 ', N'1903', 2, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[HorarioGrupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo], [dia], [horaInicio], [horaFin]) VALUES (N'2026-3    ', N'MAT-131 ', N'1903', 4, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[Inscripcion] ([codigoPeriodo], [idEstudiante], [fechaInscripcion]) VALUES (N'2026-2    ', N'10160001', CAST(N'2026-04-15' AS Date))
GO
INSERT [dbo].[Inscripcion] ([codigoPeriodo], [idEstudiante], [fechaInscripcion]) VALUES (N'2026-2    ', N'10160002', CAST(N'2026-04-15' AS Date))
GO
INSERT [dbo].[Inscripcion] ([codigoPeriodo], [idEstudiante], [fechaInscripcion]) VALUES (N'2026-2    ', N'10160003', CAST(N'2026-04-16' AS Date))
GO
INSERT [dbo].[Inscripcion] ([codigoPeriodo], [idEstudiante], [fechaInscripcion]) VALUES (N'2026-2    ', N'10160004', CAST(N'2026-04-16' AS Date))
GO
INSERT [dbo].[Inscripcion] ([codigoPeriodo], [idEstudiante], [fechaInscripcion]) VALUES (N'2026-2    ', N'10160005', CAST(N'2026-04-17' AS Date))
GO
INSERT [dbo].[Inscripcion] ([codigoPeriodo], [idEstudiante], [fechaInscripcion]) VALUES (N'2026-3    ', N'10160001', CAST(N'2026-08-15' AS Date))
GO
INSERT [dbo].[Inscripcion] ([codigoPeriodo], [idEstudiante], [fechaInscripcion]) VALUES (N'2026-3    ', N'10160002', CAST(N'2026-08-15' AS Date))
GO
INSERT [dbo].[Inscripcion] ([codigoPeriodo], [idEstudiante], [fechaInscripcion]) VALUES (N'2026-3    ', N'10160003', CAST(N'2026-08-16' AS Date))
GO
INSERT [dbo].[Inscripcion] ([codigoPeriodo], [idEstudiante], [fechaInscripcion]) VALUES (N'2026-3    ', N'10160004', CAST(N'2026-08-16' AS Date))
GO
INSERT [dbo].[Inscripcion] ([codigoPeriodo], [idEstudiante], [fechaInscripcion]) VALUES (N'2026-3    ', N'10160005', CAST(N'2026-08-17' AS Date))
GO
INSERT [dbo].[Nacionalidad] ([id], [nombre]) VALUES (N'ARG', N'Argentina')
GO
INSERT [dbo].[Nacionalidad] ([id], [nombre]) VALUES (N'BRA', N'Brasileña')
GO
INSERT [dbo].[Nacionalidad] ([id], [nombre]) VALUES (N'CHI', N'Chilena')
GO
INSERT [dbo].[Nacionalidad] ([id], [nombre]) VALUES (N'COL', N'Colombiana')
GO
INSERT [dbo].[Nacionalidad] ([id], [nombre]) VALUES (N'DOM', N'Dominicana')
GO
INSERT [dbo].[Nacionalidad] ([id], [nombre]) VALUES (N'ESP', N'Española')
GO
INSERT [dbo].[Nacionalidad] ([id], [nombre]) VALUES (N'MEX', N'Mexicana')
GO
INSERT [dbo].[Nacionalidad] ([id], [nombre]) VALUES (N'PER', N'Peruana')
GO
INSERT [dbo].[Nacionalidad] ([id], [nombre]) VALUES (N'USA', N'Estadounidense')
GO
INSERT [dbo].[Nacionalidad] ([id], [nombre]) VALUES (N'VEN', N'Venezolana')
GO
INSERT [dbo].[PeriodoAcademico] ([codigo], [descripcion], [fechaPrematricula], [fechaRetiro], [fechaPublicacion]) VALUES (N'2024-3    ', N'Septiembre-Diciembre 2024', CAST(N'2024-08-01' AS Date), CAST(N'2024-09-15' AS Date), CAST(N'2024-12-20' AS Date))
GO
INSERT [dbo].[PeriodoAcademico] ([codigo], [descripcion], [fechaPrematricula], [fechaRetiro], [fechaPublicacion]) VALUES (N'2025-1    ', N'Enero-Abril 2025', CAST(N'2024-12-01' AS Date), CAST(N'2025-01-15' AS Date), CAST(N'2025-04-20' AS Date))
GO
INSERT [dbo].[PeriodoAcademico] ([codigo], [descripcion], [fechaPrematricula], [fechaRetiro], [fechaPublicacion]) VALUES (N'2025-2    ', N'Mayo-Agosto 2025', CAST(N'2025-04-01' AS Date), CAST(N'2025-05-15' AS Date), CAST(N'2025-08-20' AS Date))
GO
INSERT [dbo].[PeriodoAcademico] ([codigo], [descripcion], [fechaPrematricula], [fechaRetiro], [fechaPublicacion]) VALUES (N'2025-3    ', N'Septiembre-Diciembre 2025', CAST(N'2025-08-01' AS Date), CAST(N'2025-09-15' AS Date), CAST(N'2025-12-20' AS Date))
GO
INSERT [dbo].[PeriodoAcademico] ([codigo], [descripcion], [fechaPrematricula], [fechaRetiro], [fechaPublicacion]) VALUES (N'2026-1    ', N'Enero-Abril 2026', CAST(N'2025-12-01' AS Date), CAST(N'2026-01-15' AS Date), CAST(N'2026-04-20' AS Date))
GO
INSERT [dbo].[PeriodoAcademico] ([codigo], [descripcion], [fechaPrematricula], [fechaRetiro], [fechaPublicacion]) VALUES (N'2026-2    ', N'Mayo-Agosto 2026', CAST(N'2026-04-01' AS Date), CAST(N'2026-05-15' AS Date), CAST(N'2026-08-20' AS Date))
GO
INSERT [dbo].[PeriodoAcademico] ([codigo], [descripcion], [fechaPrematricula], [fechaRetiro], [fechaPublicacion]) VALUES (N'2026-3    ', N'Septiembre-Diciembre 2026', CAST(N'2026-08-01' AS Date), CAST(N'2026-09-15' AS Date), CAST(N'2026-12-20' AS Date))
GO
INSERT [dbo].[PeriodoAcademico] ([codigo], [descripcion], [fechaPrematricula], [fechaRetiro], [fechaPublicacion]) VALUES (N'2027-1    ', N'Enero-Abril 2027', CAST(N'2026-12-01' AS Date), CAST(N'2027-01-15' AS Date), CAST(N'2027-04-20' AS Date))
GO
INSERT [dbo].[PeriodoAcademico] ([codigo], [descripcion], [fechaPrematricula], [fechaRetiro], [fechaPublicacion]) VALUES (N'2027-2    ', N'Mayo-Agosto 2027', CAST(N'2027-04-01' AS Date), CAST(N'2027-05-15' AS Date), CAST(N'2027-08-20' AS Date))
GO
INSERT [dbo].[PeriodoAcademico] ([codigo], [descripcion], [fechaPrematricula], [fechaRetiro], [fechaPublicacion]) VALUES (N'2027-3    ', N'Septiembre-Diciembre 2027', CAST(N'2027-08-01' AS Date), CAST(N'2027-09-15' AS Date), CAST(N'2027-12-20' AS Date))
GO
ALTER TABLE [dbo].[Estudiante]  WITH CHECK ADD  CONSTRAINT [FK_Estudiante_Carrera] FOREIGN KEY([idCarrera])
REFERENCES [dbo].[Carrera] ([id])
GO
ALTER TABLE [dbo].[Estudiante] CHECK CONSTRAINT [FK_Estudiante_Carrera]
GO
ALTER TABLE [dbo].[Estudiante]  WITH CHECK ADD  CONSTRAINT [FK_Estudiante_CategoriaPago] FOREIGN KEY([idCategoriaPago])
REFERENCES [dbo].[CategoriaPago] ([id])
GO
ALTER TABLE [dbo].[Estudiante] CHECK CONSTRAINT [FK_Estudiante_CategoriaPago]
GO
ALTER TABLE [dbo].[Estudiante]  WITH CHECK ADD  CONSTRAINT [FK_Estudiante_Nacionalidad] FOREIGN KEY([idNacionalidad])
REFERENCES [dbo].[Nacionalidad] ([id])
GO
ALTER TABLE [dbo].[Estudiante] CHECK CONSTRAINT [FK_Estudiante_Nacionalidad]
GO
ALTER TABLE [dbo].[Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Grupo_Asignatura] FOREIGN KEY([codigoAsignatura])
REFERENCES [dbo].[Asignatura] ([codigo])
GO
ALTER TABLE [dbo].[Grupo] CHECK CONSTRAINT [FK_Grupo_Asignatura]
GO
ALTER TABLE [dbo].[Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Grupo_PeriodoAcademico] FOREIGN KEY([codigoPeriodo])
REFERENCES [dbo].[PeriodoAcademico] ([codigo])
GO
ALTER TABLE [dbo].[Grupo] CHECK CONSTRAINT [FK_Grupo_PeriodoAcademico]
GO
ALTER TABLE [dbo].[GruposInscritos]  WITH CHECK ADD  CONSTRAINT [FK_GruposInscritos_Estudiante] FOREIGN KEY([idEstudiante])
REFERENCES [dbo].[Estudiante] ([id])
GO
ALTER TABLE [dbo].[GruposInscritos] CHECK CONSTRAINT [FK_GruposInscritos_Estudiante]
GO
ALTER TABLE [dbo].[GruposInscritos]  WITH CHECK ADD  CONSTRAINT [FK_GruposInscritos_Grupo] FOREIGN KEY([codigoPeriodo], [codigoAsignatura], [numeroGrupo])
REFERENCES [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo])
GO
ALTER TABLE [dbo].[GruposInscritos] CHECK CONSTRAINT [FK_GruposInscritos_Grupo]
GO
ALTER TABLE [dbo].[HorarioGrupo]  WITH CHECK ADD  CONSTRAINT [FK_HorarioGrupo_DiaSemana] FOREIGN KEY([dia])
REFERENCES [dbo].[DiaSemana] ([dia])
GO
ALTER TABLE [dbo].[HorarioGrupo] CHECK CONSTRAINT [FK_HorarioGrupo_DiaSemana]
GO
ALTER TABLE [dbo].[HorarioGrupo]  WITH CHECK ADD  CONSTRAINT [FK_HorarioGrupo_Grupo] FOREIGN KEY([codigoPeriodo], [codigoAsignatura], [numeroGrupo])
REFERENCES [dbo].[Grupo] ([codigoPeriodo], [codigoAsignatura], [numeroGrupo])
GO
ALTER TABLE [dbo].[HorarioGrupo] CHECK CONSTRAINT [FK_HorarioGrupo_Grupo]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Estudiante] FOREIGN KEY([idEstudiante])
REFERENCES [dbo].[Estudiante] ([id])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Estudiante]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_PeriodoAcademico] FOREIGN KEY([codigoPeriodo])
REFERENCES [dbo].[PeriodoAcademico] ([codigo])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_PeriodoAcademico]
GO
USE [master]
GO
ALTER DATABASE [AcadDB(RDGC0002)] SET  READ_WRITE 
GO
