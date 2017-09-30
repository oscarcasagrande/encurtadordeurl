﻿
USE [master]
GO

/****** Object:  Database [devd]    Script Date: 07/19/2011 12:25:29 ******/
CREATE DATABASE [devd] ON  PRIMARY 
( NAME = N'devd', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\devd.mdf' , SIZE = 137216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'devd_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\devd_log.ldf' , SIZE = 43264KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [devd] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [devd].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [devd] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [devd] SET ANSI_NULLS OFF
GO

ALTER DATABASE [devd] SET ANSI_PADDING OFF
GO

ALTER DATABASE [devd] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [devd] SET ARITHABORT OFF
GO

ALTER DATABASE [devd] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [devd] SET AUTO_CREATE_STATISTICS ON
GO

ALTER DATABASE [devd] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [devd] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [devd] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [devd] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [devd] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [devd] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [devd] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [devd] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [devd] SET  DISABLE_BROKER
GO

ALTER DATABASE [devd] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO

ALTER DATABASE [devd] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [devd] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [devd] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [devd] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [devd] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [devd] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [devd] SET  READ_WRITE
GO

ALTER DATABASE [devd] SET RECOVERY SIMPLE
GO

ALTER DATABASE [devd] SET  MULTI_USER
GO

ALTER DATABASE [devd] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [devd] SET DB_CHAINING OFF
GO

USE [devd]
GO

/****** Object:  Table [dbo].[acessoConsolidadoTotal]    Script Date: 07/19/2011 12:25:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[acessoConsolidadoMensal]    Script Date: 07/19/2011 12:25:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[acesso]    Script Date: 07/19/2011 12:25:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[url]    Script Date: 07/19/2011 12:25:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING OFF
GO

/****** Object:  StoredProcedure [dbo].[procUrlUltima_ler]    Script Date: 07/19/2011 12:25:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[procUrlEndereco_Ler]    Script Date: 07/19/2011 12:25:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[procUrl_ler]    Script Date: 07/19/2011 12:25:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[procUrl_criar]    Script Date: 07/19/2011 12:25:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[procAcessoConsolidadoTotal_Criar]    Script Date: 07/19/2011 12:25:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[procAcessoConsolidadoMensal_Criar]    Script Date: 07/19/2011 12:25:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[procAcesso_criar]    Script Date: 07/19/2011 12:25:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO