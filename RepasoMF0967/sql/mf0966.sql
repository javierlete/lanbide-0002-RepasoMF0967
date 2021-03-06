USE [master]
GO
/****** Object:  Database [mf0966]    Script Date: 08/09/2021 13:23:49 ******/
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
/****** Object:  Table [dbo].[Clientes]    Script Date: 08/09/2021 13:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [bigint] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](100) NULL,
	[FechaNacimiento] [date] NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 08/09/2021 13:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[JefeId] [bigint] NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 08/09/2021 13:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Numero] [char](8) NOT NULL,
	[Fecha] [date] NOT NULL,
	[ClienteId] [bigint] NOT NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturasProductos]    Script Date: 08/09/2021 13:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturasProductos](
	[FacturaId] [bigint] NOT NULL,
	[ProductoId] [bigint] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_FacturasProductos] PRIMARY KEY CLUSTERED 
(
	[FacturaId] ASC,
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Muebles]    Script Date: 08/09/2021 13:23:49 ******/
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
/****** Object:  Table [dbo].[Productos]    Script Date: 08/09/2021 13:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Precio] [money] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 08/09/2021 13:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Facturas]    Script Date: 08/09/2021 13:23:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Facturas] ON [dbo].[Facturas]
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Usuarios]    Script Date: 08/09/2021 13:23:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Usuarios] ON [dbo].[Usuarios]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Usuarios] FOREIGN KEY([Id])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Usuarios]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Jefes] FOREIGN KEY([JefeId])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Jefes]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_Clientes]
GO
ALTER TABLE [dbo].[FacturasProductos]  WITH CHECK ADD  CONSTRAINT [FK_FacturasProductos_Facturas] FOREIGN KEY([FacturaId])
REFERENCES [dbo].[Facturas] ([Id])
GO
ALTER TABLE [dbo].[FacturasProductos] CHECK CONSTRAINT [FK_FacturasProductos_Facturas]
GO
ALTER TABLE [dbo].[FacturasProductos]  WITH CHECK ADD  CONSTRAINT [FK_FacturasProductos_Productos] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[FacturasProductos] CHECK CONSTRAINT [FK_FacturasProductos_Productos]
GO
USE [master]
GO
ALTER DATABASE [mf0966] SET  READ_WRITE 
GO
