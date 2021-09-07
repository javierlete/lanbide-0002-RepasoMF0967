USE [master]
GO
/****** Object:  Database [mf0966]    Script Date: 07/09/2021 9:18:08 ******/
CREATE DATABASE [mf0966]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mf0966', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\mf0966.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mf0966_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\mf0966_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [mf0966] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mf0966].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mf0966] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mf0966] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mf0966] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mf0966] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mf0966] SET ARITHABORT OFF 
GO
ALTER DATABASE [mf0966] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mf0966] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mf0966] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mf0966] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mf0966] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mf0966] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mf0966] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mf0966] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mf0966] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mf0966] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mf0966] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mf0966] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mf0966] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mf0966] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mf0966] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mf0966] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mf0966] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mf0966] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [mf0966] SET  MULTI_USER 
GO
ALTER DATABASE [mf0966] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mf0966] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mf0966] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mf0966] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mf0966] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mf0966] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [mf0966] SET QUERY_STORE = OFF
GO
USE [mf0966]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 07/09/2021 9:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteId] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](100) NULL,
	[FechaNacimiento] [date] NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Muebles]    Script Date: 07/09/2021 9:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Muebles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Precio] [money] NULL,
	[Largo] [float] NULL,
	[Ancho] [float] NULL,
	[Alto] [float] NULL,
	[FechaFabricacion] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (1, N'Javier', N'Lete', NULL)
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (4, N'Supermodificado', N'Supermodificadez', CAST(N'2021-09-03' AS Date))
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (5, N'Nuevo', N'Nuevez', CAST(N'2000-01-02' AS Date))
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (6, N'Nuevo', N'Nuevez', CAST(N'2000-01-02' AS Date))
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (7, N'Nuevo', N'Nuevez', NULL)
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (8, N'Nuevo', N'Nuevez', CAST(N'2000-01-02' AS Date))
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (9, N'Nuevo', N'Nuevez', CAST(N'2000-01-02' AS Date))
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (10, N'Nuevazo', N'Nuevecez', CAST(N'2021-09-03' AS Date))
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (11, N'Nuevazo', N'Nuevecez', CAST(N'2021-09-03' AS Date))
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (12, N'Nuevazo', N'Nuevecez', CAST(N'2021-09-03' AS Date))
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Muebles] ON 

INSERT [dbo].[Muebles] ([Id], [Nombre], [Precio], [Largo], [Ancho], [Alto], [FechaFabricacion]) VALUES (1, N'Armario modificado', 321.4000, 1, 2, 3, NULL)
INSERT [dbo].[Muebles] ([Id], [Nombre], [Precio], [Largo], [Ancho], [Alto], [FechaFabricacion]) VALUES (3, N'Mesa', 123.4000, NULL, 6, NULL, CAST(N'2021-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Muebles] OFF
GO
USE [master]
GO
ALTER DATABASE [mf0966] SET  READ_WRITE 
GO
