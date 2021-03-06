USE [master]
GO
/****** Object:  Database [sisterwave]    Script Date: 26/12/2017 22:16:11 ******/
CREATE DATABASE [sisterwave]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sisterwave', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\sisterwave.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'sisterwave_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\sisterwave_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [sisterwave] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sisterwave].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sisterwave] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sisterwave] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sisterwave] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sisterwave] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sisterwave] SET ARITHABORT OFF 
GO
ALTER DATABASE [sisterwave] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sisterwave] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sisterwave] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sisterwave] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sisterwave] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sisterwave] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sisterwave] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sisterwave] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sisterwave] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sisterwave] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sisterwave] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sisterwave] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sisterwave] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sisterwave] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sisterwave] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sisterwave] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sisterwave] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sisterwave] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sisterwave] SET  MULTI_USER 
GO
ALTER DATABASE [sisterwave] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sisterwave] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sisterwave] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sisterwave] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [sisterwave] SET DELAYED_DURABILITY = DISABLED 
GO
USE [sisterwave]
GO
/****** Object:  Table [dbo].[user]    Script Date: 26/12/2017 22:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[surname] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[nickname] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spChangePassword]    Script Date: 26/12/2017 22:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spChangePassword]
@userId int,
@password varchar(50)
as
update dbo.[user] set
password = @password
where userId=@userId
GO
/****** Object:  StoredProcedure [dbo].[spGetUsers]    Script Date: 26/12/2017 22:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetUsers]
as
select * from  dbo.[user]
GO
/****** Object:  StoredProcedure [dbo].[spRegisterUser]    Script Date: 26/12/2017 22:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegisterUser]
@userName varchar(50),
@userSurname varchar(50),
@userEmail varchar(50),
@nickname varchar(50),
@password varchar(50)
as
insert into dbo.[user] (name, surname, email,nickname,password)values (@userName, @userSurname, @userEmail,@nickname,@password)
GO
USE [master]
GO
ALTER DATABASE [sisterwave] SET  READ_WRITE 
GO
