USE [master]
GO
/****** Object:  Database [HCSSecurityDB]    Script Date: 3/26/2023 3:47:13 AM ******/
CREATE DATABASE [HCSSecurityDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HCSSecurityDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQL12\MSSQL\DATA\HCSSecurityDB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HCSSecurityDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQL12\MSSQL\DATA\HCSSecurityDB_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HCSSecurityDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HCSSecurityDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HCSSecurityDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HCSSecurityDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HCSSecurityDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HCSSecurityDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HCSSecurityDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HCSSecurityDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HCSSecurityDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HCSSecurityDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HCSSecurityDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HCSSecurityDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HCSSecurityDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HCSSecurityDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HCSSecurityDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HCSSecurityDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HCSSecurityDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HCSSecurityDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HCSSecurityDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HCSSecurityDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HCSSecurityDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HCSSecurityDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HCSSecurityDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HCSSecurityDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [HCSSecurityDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HCSSecurityDB] SET RECOVERY FULL 
GO
ALTER DATABASE [HCSSecurityDB] SET  MULTI_USER 
GO
ALTER DATABASE [HCSSecurityDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HCSSecurityDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HCSSecurityDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HCSSecurityDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HCSSecurityDB', N'ON'
GO
USE [HCSSecurityDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/26/2023 3:47:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SecurityLogs]    Script Date: 3/26/2023 3:47:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[MessageTemplate] [nvarchar](max) NULL,
	[Level] [nvarchar](max) NULL,
	[TimeStamp] [datetime] NULL,
	[Exception] [nvarchar](max) NULL,
	[Properties] [nvarchar](max) NULL,
 CONSTRAINT [PK_SecurityLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfos]    Script Date: 3/26/2023 3:47:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfos](
	[Id] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[SaltKey] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[UserRole] [nvarchar](max) NOT NULL,
	[LastLoginAttemptAt] [datetime2](7) NULL,
	[LoginFailedAttemptsCount] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_UserInfos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230319010404_SeedingData', N'7.0.4')
SET IDENTITY_INSERT [dbo].[SecurityLogs] ON 

INSERT [dbo].[SecurityLogs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (1, N'Application is starting', N'Application is starting', N'Information', CAST(0x0000AFD1003D3142 AS DateTime), NULL, N'<properties><property key=''MachineName''>SREE-PC</property><property key=''EnvironmentUserName''>SREE-PC\Sreemonta</property></properties>')
INSERT [dbo].[SecurityLogs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (2, N'
**********************************************************************
**                      HCS Services                                **
**                    [Version 1.0.0]                               **
**  ©2022-2023 Health Care Solutions. All rights reserved           **
**********************************************************************
', N'
**********************************************************************
**                      HCS Services                                **
**                    [Version 1.0.0]                               **
**  ©2022-2023 Health Care Solutions. All rights reserved           **
**********************************************************************
', N'Information', CAST(0x0000AFD1003D3157 AS DateTime), NULL, N'<properties><property key=''MachineName''>SREE-PC</property><property key=''EnvironmentUserName''>SREE-PC\Sreemonta</property></properties>')
SET IDENTITY_INSERT [dbo].[SecurityLogs] OFF
INSERT [dbo].[UserInfos] ([Id], [FullName], [UserName], [Password], [SaltKey], [Email], [UserRole], [LastLoginAttemptAt], [LoginFailedAttemptsCount], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'c1c93a83-9c7f-4320-b96b-133ef401990d', N'Sreemonta Bhowmik', N'sree', N'$2b$10$dqPNaHnCGjUcvxXHTRXmDeNwNRQ0YI8kT9376noZw8i8tDj8KKoEa', N'$2b$10$dqPNaHnCGjUcvxXHTRXmDe', N'sbhowmikcse08@gmail.com', N'Admin', CAST(0x07F795AD491626450B AS DateTime2), 4, NULL, CAST(0x07224F00F30825450B AS DateTime2), NULL, CAST(0x07234F00F30825450B AS DateTime2))
INSERT [dbo].[UserInfos] ([Id], [FullName], [UserName], [Password], [SaltKey], [Email], [UserRole], [LastLoginAttemptAt], [LoginFailedAttemptsCount], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'83d321a1-e5e1-4f7c-9ede-7382b1ec2917', N'Anannya Rohine1', N'rohine', N'$2b$13$tvzE2fQQ9TQ.6ru59OOrWOTH5Kd70C8QYc3wFmuB.PtVcgkakooxa', N'$2b$13$tvzE2fQQ9TQ.6ru59OOrWO', N'rohine2008@gmail.com', N'User', CAST(0x074FAF1EA31E2C450B AS DateTime2), 0, N'c1c93a83-9c7f-4320-b96b-133ef401990d', CAST(0x0715CFDC2E0925450B AS DateTime2), N'c1c93a83-9c7f-4320-b96b-133ef401990d', CAST(0x07DF3336B7BD25450B AS DateTime2))
INSERT [dbo].[UserInfos] ([Id], [FullName], [UserName], [Password], [SaltKey], [Email], [UserRole], [LastLoginAttemptAt], [LoginFailedAttemptsCount], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'47cbe207-9162-4b1b-bda9-bc343db22545', N'Abu Hail', N'abu', N'$2b$13$wuPe9vcYftzsgFTK21tTTeOS/ZFZvmkcMR7MANsZF2yhqLlvDLKc2', N'$2b$13$wuPe9vcYftzsgFTK21tTTe', N'sreemonta@gmail.com', N'User', NULL, 0, N'c1c93a83-9c7f-4320-b96b-133ef401990d', CAST(0x0779AC25D6BD25450B AS DateTime2), NULL, NULL)
USE [master]
GO
ALTER DATABASE [HCSSecurityDB] SET  READ_WRITE 
GO
