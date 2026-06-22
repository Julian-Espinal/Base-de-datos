USE [master]
GO
/****** Objeto: Database [bookstore10160278] Fecha de script: 22/6/2026 8:35:12 a. m. ******/
CREATE DATABASE [bookstore10160278]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bookstore10160278', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\bookstore10160278.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bookstore10160278_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\bookstore10160278_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [bookstore10160278] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bookstore10160278].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bookstore10160278] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bookstore10160278] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bookstore10160278] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bookstore10160278] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bookstore10160278] SET ARITHABORT OFF 
GO
ALTER DATABASE [bookstore10160278] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bookstore10160278] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bookstore10160278] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bookstore10160278] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bookstore10160278] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bookstore10160278] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bookstore10160278] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bookstore10160278] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bookstore10160278] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bookstore10160278] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bookstore10160278] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bookstore10160278] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bookstore10160278] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bookstore10160278] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bookstore10160278] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bookstore10160278] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bookstore10160278] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bookstore10160278] SET RECOVERY FULL 
GO
ALTER DATABASE [bookstore10160278] SET  MULTI_USER 
GO
ALTER DATABASE [bookstore10160278] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bookstore10160278] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bookstore10160278] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bookstore10160278] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bookstore10160278] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bookstore10160278] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [bookstore10160278] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [bookstore10160278] SET QUERY_STORE = ON
GO
ALTER DATABASE [bookstore10160278] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [bookstore10160278]
GO
/****** Objeto: UserDefinedFunction [dbo].[AutoresLibro] Fecha de script: 22/6/2026 8:35:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[AutoresLibro] 
(
	-- Add the parameters for the function here
	@idLibro varchar(5)
)
RETURNS varchar(500)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result varchar(500) = ''

	DECLARE @IdAutorActual varchar(5) = ''

	WHILE 1 = 1
	BEGIN
		SELECT @IdAutorActual = MIN(IdAutor)
		FROM AutorLibro
		WHERE IdLibro = @idLibro
		AND IdAutor > @IdAutorActual

		IF @IdAutorActual IS NULL BREAK

		SET @Result = @Result+' '+dbo.NombreAutor(@IdAutorActual, 2)+'.'


END
	

	
	RETURN LTRIM(@Result)

END
GO
/****** Objeto: UserDefinedFunction [dbo].[AutoresPorLibro] Fecha de script: 22/6/2026 8:35:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[AutoresPorLibro] 
(
	-- Add the parameters for the function here
	@p1 varchar(5)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = COUNT(*)
	FROM AutorLibro 
	WHERE IdLibro = @p1

	-- Return the result of the function
	RETURN @Result

END
GO
/****** Objeto: UserDefinedFunction [dbo].[AutoresPorLibroEditorial] Fecha de script: 22/6/2026 8:35:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[AutoresPorLibroEditorial] 
(
	-- Add the parameters for the function here
	@p1 varchar(5)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = COUNT(*)
	FROM AutorLibro al
	JOIN Libro l ON l.IdLibro  = al.IdLibro
	WHERE l.IdEditorial IS NOT NULL 
	AND l.IdLibro = @p1

	-- Return the result of the function
	RETURN @Result

END
GO
/****** Objeto: UserDefinedFunction [dbo].[NombreAutor] Fecha de script: 22/6/2026 8:35:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[NombreAutor] 
(
	-- Add the parameters for the function here
	@idAutor varchar(5),
	@formato int
)
RETURNS varchar(40)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result varchar(40) 
	
	DECLARE @nombreCompleto varchar(40), @primerNombre varchar(40), @segundoNombre varchar(40), 
	@primerApellido varchar(40), @segundoApellido varchar(40), @contador int

	SELECT @nombreCompleto = RTRIM(a.Nombre)
	FROM Autor a
	WHERE a.IdAutor = @idAutor

	SELECT @contador= COUNT(*)
	FROM STRING_SPLIT(@nombreCompleto, ' ')

	IF @contador = 2
	BEGIN
		SELECT @primerNombre = value FROM STRING_SPLIT(@nombreCompleto, ' ', 1) WHERE ordinal = 1
		SELECT @primerApellido = value FROM STRING_SPLIT(@nombreCompleto, ' ', 1) WHERE ordinal = 2
		SET @segundoNombre = NULL
		SET @segundoApellido = NULL
	END


	ELSE
	BEGIN

		SELECT @segundoApellido = value
		FROM STRING_SPLIT(@nombreCompleto, ' ', 1)	
		WHERE ordinal = @contador

		SELECT @primerApellido = value
		FROM STRING_SPLIT(@nombreCompleto, ' ', 1)
		WHERE ordinal = @contador - 1

		SELECT @segundoNombre = value
		FROM STRING_SPLIT(@nombreCompleto, ' ', 1)
		WHERE ordinal = 2 AND @contador >= 4

		SELECT @primerNombre = value
		FROM STRING_SPLIT(@nombreCompleto, ' ', 1)
		WHERE ordinal = 1	
	END

	

	SET @Result = @nombreCompleto

	IF @formato = 1
	BEGIN
	
		SET @Result = @primerNombre
		IF @segundoNombre IS NOT NULL SET @Result = @Result + ' ' + LEFT(@segundoNombre, 1) + '.'
		SET @Result = @Result + ' ' + @primerApellido
		IF @segundoApellido IS NOT NULL SET @Result = @Result + ' ' + @segundoApellido
		
	END

	ELSE IF @formato = 2
	BEGIN

		SET @Result =@primerNombre
		IF @segundoNombre IS NOT NULL SET @Result = @Result +' '+LEFT(@segundoNombre, 1) +'.'
		SET @Result = @Result+' '+@primerApellido
		IF @segundoApellido IS NOT NULL SET @Result = @Result +' '+LEFT(@segundoApellido, 1) +'.'

	END

	-- Return the result of the function
	RETURN @Result

END
GO
/****** Objeto: Table [dbo].[Libro] Fecha de script: 22/6/2026 8:35:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[IdLibro] [varchar](5) NOT NULL,
	[ISBN] [char](40) NULL,
	[IdEditorial] [varchar](5) NULL,
	[Titulo] [char](50) NOT NULL,
	[Año de Edicion] [char](50) NULL,
 CONSTRAINT [PK_Libro] PRIMARY KEY CLUSTERED 
(
	[IdLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[AutorLibro] Fecha de script: 22/6/2026 8:35:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutorLibro](
	[IdAutor] [varchar](5) NOT NULL,
	[IdLibro] [varchar](5) NOT NULL,
 CONSTRAINT [PK_AutorLibro] PRIMARY KEY CLUSTERED 
(
	[IdAutor] ASC,
	[IdLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: UserDefinedFunction [dbo].[LibrosAutorEditorial] Fecha de script: 22/6/2026 8:35:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[LibrosAutorEditorial] 
(	
	-- Add the parameters for the function here
	@idAutor varchar(5), 
	@idEditorial varchar(5)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT l.IdLibro, l.Titulo
	FROM Libro l
	JOIN AutorLibro al ON al.IdLibro = l.IdLibro
	WHERE al.IdAutor = @idAutor
	AND l.IdEditorial = @idEditorial

)
GO
/****** Objeto: Table [dbo].[Autor] Fecha de script: 22/6/2026 8:35:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[IdAutor] [varchar](5) NOT NULL,
	[Nombre] [char](40) NOT NULL,
	[Fecha de nacimiento] [date] NULL,
 CONSTRAINT [PK_Autor] PRIMARY KEY CLUSTERED 
(
	[IdAutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Editorial] Fecha de script: 22/6/2026 8:35:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editorial](
	[IdEditorial] [varchar](5) NOT NULL,
	[Nombre] [char](50) NULL,
 CONSTRAINT [PK_Editorial] PRIMARY KEY CLUSTERED 
(
	[IdEditorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[AutorEditorial] Fecha de script: 22/6/2026 8:35:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutorEditorial](
	[IdAutor] [varchar](5) NOT NULL,
	[IdEditorial] [varchar](5) NOT NULL,
 CONSTRAINT [PK_AutorEditorial] PRIMARY KEY CLUSTERED 
(
	[IdAutor] ASC,
	[IdEditorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: View [dbo].[AutoresPorCasaEditora] Fecha de script: 22/6/2026 8:35:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AutoresPorCasaEditora]
AS
SELECT TOP (100) PERCENT dbo.Libro.Titulo, dbo.Autor.Nombre, dbo.Editorial.Nombre AS Expr1
FROM     dbo.Autor INNER JOIN
                  dbo.AutorEditorial ON dbo.Autor.IdAutor = dbo.AutorEditorial.IdAutor INNER JOIN
                  dbo.AutorLibro ON dbo.Autor.IdAutor = dbo.AutorLibro.IdAutor INNER JOIN
                  dbo.Editorial ON dbo.AutorEditorial.IdEditorial = dbo.Editorial.IdEditorial INNER JOIN
                  dbo.Libro ON dbo.AutorLibro.IdLibro = dbo.Libro.IdLibro AND dbo.Editorial.IdEditorial = dbo.Libro.IdEditorial
ORDER BY Expr1 DESC
GO
/****** Objeto: View [dbo].[LibrosConEditorialYAutores] Fecha de script: 22/6/2026 8:35:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LibrosConEditorialYAutores]
AS
SELECT dbo.Libro.Titulo, dbo.Editorial.Nombre, dbo.Autor.Nombre AS Autor
FROM     dbo.Autor INNER JOIN
                  dbo.AutorLibro ON dbo.Autor.IdAutor = dbo.AutorLibro.IdAutor INNER JOIN
                  dbo.Libro ON dbo.AutorLibro.IdLibro = dbo.Libro.IdLibro INNER JOIN
                  dbo.Editorial ON dbo.Libro.IdEditorial = dbo.Editorial.IdEditorial
GO
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Fecha de nacimiento]) VALUES (N'Au001', N'Gabriel Garcia Marquez                  ', CAST(N'1927-03-06' AS Date))
GO
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Fecha de nacimiento]) VALUES (N'Au002', N'Isabel Allende                          ', CAST(N'1942-08-02' AS Date))
GO
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Fecha de nacimiento]) VALUES (N'Au003', N'Mario Vargas Llosa                      ', CAST(N'1936-03-28' AS Date))
GO
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Fecha de nacimiento]) VALUES (N'Au004', N'Jorge Luis Borges                       ', CAST(N'1899-08-24' AS Date))
GO
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Fecha de nacimiento]) VALUES (N'Au005', N'Pablo Neruda                            ', CAST(N'1904-07-12' AS Date))
GO
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Fecha de nacimiento]) VALUES (N'Au006', N'Julio Cortazar                          ', CAST(N'1914-08-26' AS Date))
GO
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Fecha de nacimiento]) VALUES (N'Au007', N'Octavio Paz                             ', CAST(N'1914-03-31' AS Date))
GO
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Fecha de nacimiento]) VALUES (N'Au008', N'Laura Esquivel                          ', CAST(N'1950-09-30' AS Date))
GO
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Fecha de nacimiento]) VALUES (N'Au009', N'Carlos Fuentes                          ', CAST(N'1928-11-11' AS Date))
GO
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Fecha de nacimiento]) VALUES (N'Au010', N'Rosario Ferre                           ', CAST(N'1938-09-28' AS Date))
GO
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (N'Au001', N'Ed004')
GO
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (N'Au002', N'Ed004')
GO
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (N'Au003', N'Ed005')
GO
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (N'Au004', N'Ed003')
GO
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (N'Au005', N'Ed005')
GO
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (N'Au006', N'Ed008')
GO
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (N'Au007', N'Ed006')
GO
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (N'Au008', N'Ed002')
GO
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (N'Au009', N'Ed006')
GO
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (N'Au010', N'Ed010')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au001', N'Li001')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au001', N'Li002')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au001', N'Li009')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au002', N'Li001')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au003', N'Li002')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au003', N'Li003')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au003', N'Li008')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au004', N'Li007')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au005', N'Li003')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au005', N'Li004')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au006', N'Li004')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au006', N'Li006')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au007', N'Li005')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au007', N'Li007')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au008', N'Li008')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au009', N'Li007')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au009', N'Li009')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au010', N'Li005')
GO
INSERT [dbo].[AutorLibro] ([IdAutor], [IdLibro]) VALUES (N'Au010', N'Li010')
GO
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre]) VALUES (N'Ed001', N'Alfaguara                                         ')
GO
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre]) VALUES (N'Ed002', N'Planeta                                           ')
GO
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre]) VALUES (N'Ed003', N'Anagrama                                          ')
GO
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre]) VALUES (N'Ed004', N'Sudamericana                                      ')
GO
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre]) VALUES (N'Ed005', N'Seix Barral                                       ')
GO
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre]) VALUES (N'Ed006', N'Fondo de Cultura Economica                        ')
GO
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre]) VALUES (N'Ed007', N'Santillana                                        ')
GO
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre]) VALUES (N'Ed008', N'Tusquets                                          ')
GO
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre]) VALUES (N'Ed009', N'Ediciones B                                       ')
GO
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre]) VALUES (N'Ed010', N'Norma                                             ')
GO
INSERT [dbo].[Libro] ([IdLibro], [ISBN], [IdEditorial], [Titulo], [Año de Edicion]) VALUES (N'Li001', N'978-0307474                             ', N'Ed004', N'Cien años de soledad                              ', N'1967                                              ')
GO
INSERT [dbo].[Libro] ([IdLibro], [ISBN], [IdEditorial], [Titulo], [Año de Edicion]) VALUES (N'Li002', N'978-0307429                             ', N'Ed002', N'La casa de los espiritus                          ', N'1982                                              ')
GO
INSERT [dbo].[Libro] ([IdLibro], [ISBN], [IdEditorial], [Titulo], [Año de Edicion]) VALUES (N'Li003', N'978-8432214                             ', N'Ed005', N'La ciudad y los perros                            ', N'1963                                              ')
GO
INSERT [dbo].[Libro] ([IdLibro], [ISBN], [IdEditorial], [Titulo], [Año de Edicion]) VALUES (N'Li004', N'978-8420633                             ', N'Ed003', N'Ficciones                                         ', N'1944                                              ')
GO
INSERT [dbo].[Libro] ([IdLibro], [ISBN], [IdEditorial], [Titulo], [Año de Edicion]) VALUES (N'Li005', N'978-8437604                             ', N'Ed001', N'Veinte poemas de amor                             ', N'1924                                              ')
GO
INSERT [dbo].[Libro] ([IdLibro], [ISBN], [IdEditorial], [Titulo], [Año de Edicion]) VALUES (N'Li006', N'978-8466330                             ', N'Ed008', N'Rayuela                                           ', N'1963                                              ')
GO
INSERT [dbo].[Libro] ([IdLibro], [ISBN], [IdEditorial], [Titulo], [Año de Edicion]) VALUES (N'Li007', N'978-6071607                             ', N'Ed006', N'El laberinto de la soledad                        ', N'1950                                              ')
GO
INSERT [dbo].[Libro] ([IdLibro], [ISBN], [IdEditorial], [Titulo], [Año de Edicion]) VALUES (N'Li008', N'978-6070702                             ', N'Ed002', N'Como agua para chocolate                          ', N'1989                                              ')
GO
INSERT [dbo].[Libro] ([IdLibro], [ISBN], [IdEditorial], [Titulo], [Año de Edicion]) VALUES (N'Li009', N'978-9681640                             ', N'Ed006', N'El gringo viejo                                   ', N'1985                                              ')
GO
INSERT [dbo].[Libro] ([IdLibro], [ISBN], [IdEditorial], [Titulo], [Año de Edicion]) VALUES (N'Li010', N'978-8498006                             ', N'Ed010', N'La casa de la laguna                              ', N'1995                                              ')
GO
ALTER TABLE [dbo].[AutorEditorial]  WITH CHECK ADD  CONSTRAINT [FK_AutorEditorial_Autor] FOREIGN KEY([IdAutor])
REFERENCES [dbo].[Autor] ([IdAutor])
GO
ALTER TABLE [dbo].[AutorEditorial] CHECK CONSTRAINT [FK_AutorEditorial_Autor]
GO
ALTER TABLE [dbo].[AutorEditorial]  WITH CHECK ADD  CONSTRAINT [FK_AutorEditorial_Editorial] FOREIGN KEY([IdEditorial])
REFERENCES [dbo].[Editorial] ([IdEditorial])
GO
ALTER TABLE [dbo].[AutorEditorial] CHECK CONSTRAINT [FK_AutorEditorial_Editorial]
GO
ALTER TABLE [dbo].[AutorLibro]  WITH CHECK ADD  CONSTRAINT [FK_AutorLibro_Autor] FOREIGN KEY([IdAutor])
REFERENCES [dbo].[Autor] ([IdAutor])
GO
ALTER TABLE [dbo].[AutorLibro] CHECK CONSTRAINT [FK_AutorLibro_Autor]
GO
ALTER TABLE [dbo].[AutorLibro]  WITH CHECK ADD  CONSTRAINT [FK_AutorLibro_Libro] FOREIGN KEY([IdLibro])
REFERENCES [dbo].[Libro] ([IdLibro])
GO
ALTER TABLE [dbo].[AutorLibro] CHECK CONSTRAINT [FK_AutorLibro_Libro]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Editorial] FOREIGN KEY([IdEditorial])
REFERENCES [dbo].[Editorial] ([IdEditorial])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Editorial]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Autor"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 292
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AutorEditorial"
            Begin Extent = 
               Top = 7
               Left = 340
               Bottom = 126
               Right = 584
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AutorLibro"
            Begin Extent = 
               Top = 7
               Left = 632
               Bottom = 126
               Right = 876
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Editorial"
            Begin Extent = 
               Top = 7
               Left = 924
               Bottom = 126
               Right = 1168
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Libro"
            Begin Extent = 
               Top = 7
               Left = 1216
               Bottom = 170
               Right = 1460
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AutoresPorCasaEditora'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AutoresPorCasaEditora'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AutoresPorCasaEditora'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Autor"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 292
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AutorLibro"
            Begin Extent = 
               Top = 7
               Left = 340
               Bottom = 126
               Right = 584
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Editorial"
            Begin Extent = 
               Top = 7
               Left = 632
               Bottom = 126
               Right = 876
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Libro"
            Begin Extent = 
               Top = 7
               Left = 924
               Bottom = 170
               Right = 1168
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LibrosConEditorialYAutores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LibrosConEditorialYAutores'
GO
USE [master]
GO
ALTER DATABASE [bookstore10160278] SET  READ_WRITE 
GO
