USE [master]
GO
/****** Object:  Database [BASEBRIRESTCSHARP]    Script Date: 17/03/2020 14:04:00 ******/
CREATE DATABASE [BASEBRIRESTCSHARP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BASEBRIRESTCSHARP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BASEBRIRESTCSHARP.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BASEBRIRESTCSHARP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BASEBRIRESTCSHARP_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BASEBRIRESTCSHARP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET ARITHABORT OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET  MULTI_USER 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BASEBRIRESTCSHARP]
GO
/****** Object:  Table [dbo].[Mesas]    Script Date: 17/03/2020 14:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mesas](
	[Id_mesa] [int] IDENTITY(1,1) NOT NULL,
	[Mesa] [varchar](50) NULL,
	[Id_salon] [int] NULL,
	[Estado_de_vida] [varchar](50) NULL,
	[Estado_de_Disponibilidad] [varchar](50) NULL,
 CONSTRAINT [PK_Mesas] PRIMARY KEY CLUSTERED 
(
	[Id_mesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Propiedades_de_mesas]    Script Date: 17/03/2020 14:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propiedades_de_mesas](
	[Id_propiedades] [int] IDENTITY(1,1) NOT NULL,
	[x] [int] NULL,
	[y] [int] NULL,
	[Tamanio_letra] [int] NULL,
 CONSTRAINT [PK_Propìedades_de_mesas] PRIMARY KEY CLUSTERED 
(
	[Id_propiedades] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SALON]    Script Date: 17/03/2020 14:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALON](
	[Id_salon] [int] IDENTITY(1,1) NOT NULL,
	[Salon] [varchar](50) NULL,
	[Estado] [varchar](50) NULL,
 CONSTRAINT [PK_SALON] PRIMARY KEY CLUSTERED 
(
	[Id_salon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Mesas]  WITH CHECK ADD  CONSTRAINT [FK_Mesas_SALON] FOREIGN KEY([Id_salon])
REFERENCES [dbo].[SALON] ([Id_salon])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Mesas] CHECK CONSTRAINT [FK_Mesas_SALON]
GO
/****** Object:  StoredProcedure [dbo].[aumentar_tamanio_letra]    Script Date: 17/03/2020 14:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[aumentar_tamanio_letra]


as

update Propiedades_de_mesas set Tamanio_letra=Tamanio_letra+10




GO
/****** Object:  StoredProcedure [dbo].[aumentar_tamanio_mesa]    Script Date: 17/03/2020 14:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[aumentar_tamanio_mesa]


as
update Propiedades_de_mesas set x=x+10,y=y+10

GO
/****** Object:  StoredProcedure [dbo].[disminuir_tamanio_letra]    Script Date: 17/03/2020 14:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[disminuir_tamanio_letra]


as
if exists(select Tamanio_letra  from  Propiedades_de_mesas Where Tamanio_letra<=9)
RAISERROR ('Exede el Limite de Medida', 16,1)
else
update Propiedades_de_mesas set Tamanio_letra=Tamanio_letra-10
GO
/****** Object:  StoredProcedure [dbo].[disminuir_tamanio_mesa]    Script Date: 17/03/2020 14:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[disminuir_tamanio_mesa]


as

if exists(select x,y from  Propiedades_de_mesas Where x=92 and y=77)
RAISERROR ('Exede el Limite de medida', 16,1)
else
update Propiedades_de_mesas set x=x-10,y=y-10


GO
/****** Object:  StoredProcedure [dbo].[editar_mesa]    Script Date: 17/03/2020 14:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editar_mesa]

@mesa as varchar(50)
,@id_mesa as int
as
if EXISTS (SELECT Mesa FROM Mesas  where (Mesa  = @mesa and Id_mesa  <>@Id_mesa ))

RAISERROR ('Ya Existe una mesa con este Nombre, POR FAVOR INGRESE DE NUEVO', 16,1)
else
update Mesas set Mesa=@mesa 
where Id_mesa=@id_mesa 


GO
/****** Object:  StoredProcedure [dbo].[insertar_mesa]    Script Date: 17/03/2020 14:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_mesa]
@mesa varchar(50),
@idsalon int
AS
declare @Estado_de_vida varchar(50)
declare @Estado_de_Disponibilidad varchar(50)
set @Estado_de_vida ='ACTIVO'
set @Estado_de_Disponibilidad = 'LIBRE'
if EXISTS(select Mesa  from Mesas  where Mesa= @mesa and Mesa <>'NULO')
RAISERROR('YA EXISTE UNA MESA CON ESE NOMBRE, ingrese de nuevo', 16,1)
else
insert into Mesas values (@mesa, @idsalon ,@Estado_de_vida , @Estado_de_Disponibilidad )

GO
/****** Object:  StoredProcedure [dbo].[insertar_Salon]    Script Date: 17/03/2020 14:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insertar_Salon]
@Salon varchar(50)
as
declare @Estado varchar(50)
set @Estado ='ACTIVO'
if EXISTS(select Salon  from SALON  where Salon = @Salon )
RAISERROR('YA EXISTE UN SALON CON ESTE NOMBRE, ingrese de nuevo', 16,1)
else
insert into SALON values(@Salon , @Estado )

GO
/****** Object:  StoredProcedure [dbo].[mostrar_id_salon_recien_ingresado]    Script Date: 17/03/2020 14:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_id_salon_recien_ingresado]
@Salon as varchar(50)
AS
select Id_salon from SALON
where Salon= @Salon

GO
/****** Object:  StoredProcedure [dbo].[mostrar_mesas_por_salon]    Script Date: 17/03/2020 14:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrar_mesas_por_salon]
@id_salon int
AS
select Mesas.*,Propiedades_de_mesas.*  from Mesas inner join SALON on SALON.Id_salon = Mesas.Id_salon  
cross join Propiedades_de_mesas
wHERE Mesas.Id_salon = @id_salon 

GO
/****** Object:  StoredProcedure [dbo].[mostrar_SALON]    Script Date: 17/03/2020 14:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_SALON]
@buscar varchar(50)
as
select*from SALON where Salon LIKE '%' + @buscar + '%'

GO
USE [master]
GO
ALTER DATABASE [BASEBRIRESTCSHARP] SET  READ_WRITE 
GO
