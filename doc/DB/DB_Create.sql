USE [master]
GO
/****** Object:  Database [CMP]    Script Date: 10/19/2018 16:49:32 ******/
CREATE DATABASE [CMP] ON  PRIMARY 
( NAME = N'CMP', FILENAME = N'xxxxxxx:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\CMP.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CMP_log', FILENAME = N'xxxxxxxx:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\CMP_log.ldf' , SIZE = 1792KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CMP] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CMP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CMP] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [CMP] SET ANSI_NULLS OFF
GO
ALTER DATABASE [CMP] SET ANSI_PADDING OFF
GO
ALTER DATABASE [CMP] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [CMP] SET ARITHABORT OFF
GO
ALTER DATABASE [CMP] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [CMP] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CMP] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [CMP] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [CMP] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [CMP] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [CMP] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [CMP] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [CMP] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [CMP] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [CMP] SET  DISABLE_BROKER
GO
ALTER DATABASE [CMP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [CMP] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [CMP] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [CMP] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [CMP] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [CMP] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [CMP] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [CMP] SET  READ_WRITE
GO
ALTER DATABASE [CMP] SET RECOVERY FULL
GO
ALTER DATABASE [CMP] SET  MULTI_USER
GO
ALTER DATABASE [CMP] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [CMP] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'CMP', N'ON'
GO
USE [CMP]
GO
/****** Object:  Table [dbo].[Sys_UserShortCutMenu]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_UserShortCutMenu](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_Sys_UserShortCutFeature] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserShortCutMenu', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserShortCutMenu', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserShortCutMenu', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'常用功能' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserShortCutMenu'
GO
/****** Object:  Table [dbo].[Sys_UserLoginState]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_UserLoginState](
	[Id] [uniqueidentifier] NOT NULL,
	[SessionId] [varchar](50) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginName] [varchar](50) NULL,
	[UserCode] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[EqpMark] [varchar](50) NULL,
	[EqpName] [varchar](50) NULL,
	[LastTime] [datetime] NOT NULL,
	[PeriodTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_UserLoginSession] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来源设备Mark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserLoginState', @level2type=N'COLUMN',@level2name=N'EqpMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来源设备描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserLoginState', @level2type=N'COLUMN',@level2name=N'EqpName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserLoginState', @level2type=N'COLUMN',@level2name=N'PeriodTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录Session记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserLoginState'
GO
INSERT [dbo].[Sys_UserLoginState] ([Id], [SessionId], [UserId], [LoginName], [UserCode], [UserName], [EqpMark], [EqpName], [LastTime], [PeriodTime]) VALUES (N'08fcab2c-417d-4352-b60f-9407fe8eb420', N'ae7ba7d6788244ed8560faff3c00eaf5', N'99999999-9999-9999-9999-999999999999', N'sysadmin', NULL, NULL, NULL, NULL, CAST(0x0000A97E00E15CDA AS DateTime), CAST(0x0000A97E0102525A AS DateTime))
/****** Object:  Table [dbo].[Sys_UserLoginHistory]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_UserLoginHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[SessionId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginName] [varchar](50) NULL,
	[UserCode] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[EqpMark] [varchar](50) NULL,
	[EqpName] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[Status] [smallint] NOT NULL,
 CONSTRAINT [PK_Sys_UserLoginHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来源设备' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserLoginHistory', @level2type=N'COLUMN',@level2name=N'EqpMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来源设备' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserLoginHistory', @level2type=N'COLUMN',@level2name=N'EqpName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserLoginHistory', @level2type=N'COLUMN',@level2name=N'BeginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserLoginHistory', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户登录日志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserLoginHistory'
GO
/****** Object:  Table [dbo].[Sys_StaticData]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_StaticData](
	[Id] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Value] [varchar](500) NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_Sys_StaticData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_StaticData', @level2type=N'COLUMN',@level2name=N'ApplicationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_StaticData', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_StaticData', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_StaticData', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'静态数据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_StaticData'
GO
INSERT [dbo].[Sys_StaticData] ([Id], [ApplicationId], [Code], [Name], [Value], [Sort]) VALUES (N'e1ebaeb5-88b9-41de-9919-2a33df90483e', N'99999999-9999-9999-9999-999999999999', N'Domain', N'顶级域名', N'192.168.0.1', 0)
INSERT [dbo].[Sys_StaticData] ([Id], [ApplicationId], [Code], [Name], [Value], [Sort]) VALUES (N'45568377-8a42-4a73-bfaa-63ea1017da62', N'99999999-9999-9999-9999-999999999999', N'LoginStateTime', N'登录失效时间(小时)', N'2', 0)
/****** Object:  Table [dbo].[Sys_Region]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Region](
	[Id] [uniqueidentifier] NOT NULL,
	[RegionName] [varchar](50) NOT NULL,
	[RegionCode] [varchar](20) NOT NULL,
	[PinYin] [varchar](200) NOT NULL,
	[ShortPinYin] [varchar](200) NOT NULL,
	[FullPath] [varchar](200) NULL,
	[HaveChild] [bit] NOT NULL,
	[Level] [smallint] NOT NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_System_Region] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Region', @level2type=N'COLUMN',@level2name=N'RegionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RegionCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Region', @level2type=N'COLUMN',@level2name=N'RegionCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PinYin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Region', @level2type=N'COLUMN',@level2name=N'PinYin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ShortPinYin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Region', @level2type=N'COLUMN',@level2name=N'ShortPinYin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完整路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Region', @level2type=N'COLUMN',@level2name=N'FullPath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有子菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Region', @level2type=N'COLUMN',@level2name=N'HaveChild'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'层级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Region', @level2type=N'COLUMN',@level2name=N'Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排列顺序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Region', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'行政区域表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Region'
GO
/****** Object:  Table [dbo].[Sys_OpenInterfaceType]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_OpenInterfaceType](
	[Id] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Remark] [nvarchar](100) NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_Sys_OpenInterfaceType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterfaceType', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterfaceType', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterfaceType', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterfaceType', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterfaceType', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开发接口类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterfaceType'
GO
/****** Object:  Table [dbo].[Sys_OpenInterface]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_OpenInterface](
	[Id] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[OpenInterfaceTypeId] [uniqueidentifier] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Url] [varchar](50) NOT NULL,
	[HttpType] [varchar](50) NOT NULL,
	[Assembly] [varchar](100) NOT NULL,
	[Params] [varchar](100) NULL,
	[Class] [varchar](100) NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Remark] [nvarchar](100) NULL,
	[Sort] [int] NOT NULL,
	[IsFreeze] [bit] NOT NULL,
 CONSTRAINT [PK_Sys_OpenInterface] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterface', @level2type=N'COLUMN',@level2name=N'ApplicationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterface', @level2type=N'COLUMN',@level2name=N'OpenInterfaceTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterface', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterface', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Url' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterface', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Http类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterface', @level2type=N'COLUMN',@level2name=N'HttpType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'程序集' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterface', @level2type=N'COLUMN',@level2name=N'Assembly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterface', @level2type=N'COLUMN',@level2name=N'Params'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterface', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生效时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterface', @level2type=N'COLUMN',@level2name=N'StartTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'失效时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterface', @level2type=N'COLUMN',@level2name=N'EndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterface', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterface', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否冻结' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterface', @level2type=N'COLUMN',@level2name=N'IsFreeze'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开发接口定义' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_OpenInterface'
GO
/****** Object:  Table [dbo].[Sys_Menu]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Menu](
	[Id] [uniqueidentifier] NOT NULL,
	[ApplicationModuleId] [uniqueidentifier] NOT NULL,
	[FeatureId] [uniqueidentifier] NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Level] [int] NOT NULL,
	[Sort] [int] NOT NULL,
	[Url] [varchar](300) NULL,
	[Remark] [nvarchar](100) NULL,
	[Icon] [varchar](200) NULL,
 CONSTRAINT [PK_Sys_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'ApplicationModuleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'FeatureId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'层级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Url' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu'
GO
/****** Object:  Table [dbo].[Sys_Feature]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Feature](
	[Id] [uniqueidentifier] NOT NULL,
	[ApplicationModuleId] [uniqueidentifier] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ControllerName] [varchar](200) NULL,
	[ActionName] [varchar](100) NULL,
	[Url] [varchar](400) NULL,
	[Level] [int] NOT NULL,
	[Sort] [int] NOT NULL,
	[Remark] [nvarchar](100) NULL,
	[IsMenu] [bit] NOT NULL,
	[IsShortCut] [bit] NOT NULL,
 CONSTRAINT [PK_Sys_Feature] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Feature', @level2type=N'COLUMN',@level2name=N'ApplicationModuleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Feature', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Feature', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制器名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Feature', @level2type=N'COLUMN',@level2name=N'ControllerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方法名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Feature', @level2type=N'COLUMN',@level2name=N'ActionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Url' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Feature', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'层级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Feature', @level2type=N'COLUMN',@level2name=N'Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Feature', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Feature', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Feature', @level2type=N'COLUMN',@level2name=N'IsMenu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否快捷菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Feature', @level2type=N'COLUMN',@level2name=N'IsShortCut'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Feature'
GO
/****** Object:  Table [dbo].[Sys_ApplicationModule]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_ApplicationModule](
	[Id] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Sort] [int] NOT NULL,
	[IsFreeze] [bit] NOT NULL,
	[Icon] [varchar](200) NULL,
 CONSTRAINT [PK_Sys_ApplicationModule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ApplicationModule', @level2type=N'COLUMN',@level2name=N'ApplicationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ApplicationModule', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ApplicationModule', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ApplicationModule', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否冻结' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ApplicationModule', @level2type=N'COLUMN',@level2name=N'IsFreeze'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ApplicationModule', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统模块' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ApplicationModule'
GO
INSERT [dbo].[Sys_ApplicationModule] ([Id], [ApplicationId], [Code], [Name], [Sort], [IsFreeze], [Icon]) VALUES (N'99999999-9999-9999-9999-999999999999', N'99999999-9999-9999-9999-999999999999', N'999999', N'默认模块', 0, 0, NULL)
/****** Object:  Table [dbo].[Sys_Application]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Application](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [varchar](100) NULL,
	[VisitUrl] [varchar](300) NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsFreeze] [bit] NOT NULL,
	[Sort] [int] NOT NULL,
	[Icon] [varchar](200) NULL,
 CONSTRAINT [PK_Sys_Application] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Application', @level2type=N'COLUMN',@level2name=N'Domain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Url' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Application', @level2type=N'COLUMN',@level2name=N'VisitUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Application', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Application', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否冻结' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Application', @level2type=N'COLUMN',@level2name=N'IsFreeze'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Application', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Application', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应用系统' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Application'
GO
INSERT [dbo].[Sys_Application] ([Id], [Domain], [VisitUrl], [Code], [Name], [IsFreeze], [Sort], [Icon]) VALUES (N'99999999-9999-9999-9999-999999999999', N'center.com', N'http://192.168.0.1:10000/', N'GGNCenterManage', N'基础平台系统', 0, 0, NULL)
/****** Object:  Table [dbo].[Schedule_Type]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Schedule_Type](
	[Id] [uniqueidentifier] NOT NULL,
	[TypeMark] [varchar](50) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[ParentMark] [varchar](50) NULL,
	[Sort] [int] NOT NULL,
	[Status] [smallint] NOT NULL,
 CONSTRAINT [PK_Schedule_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标示值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Type', @level2type=N'COLUMN',@level2name=N'TypeMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Type', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级标示值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Type', @level2type=N'COLUMN',@level2name=N'ParentMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Type', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Type', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划任务类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Type'
GO
/****** Object:  Table [dbo].[Schedule_Task]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Schedule_Task](
	[Id] [uniqueidentifier] NOT NULL,
	[GroupMark] [varchar](50) NOT NULL,
	[GroupName] [varchar](50) NULL,
	[ScheduleTypeMark] [varchar](50) NOT NULL,
	[ScheduleTypeName] [varchar](50) NOT NULL,
	[JobCode] [varchar](50) NOT NULL,
	[JobName] [varchar](50) NOT NULL,
	[JobRemark] [varchar](200) NULL,
	[JobExpress] [varchar](500) NULL,
	[JobBeginTime] [datetime] NULL,
	[JobEndTime] [datetime] NULL,
	[Sort] [int] NOT NULL,
	[Status] [smallint] NOT NULL,
	[AppUrl] [varchar](400) NOT NULL,
	[RequestMode] [varchar](5) NOT NULL,
	[RequestContentType] [varchar](50) NULL,
	[RequestParam] [varchar](600) NULL,
	[LastUserId] [uniqueidentifier] NOT NULL,
	[LastUserName] [varchar](50) NOT NULL,
	[LastTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Schedule_Task] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属组标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task', @level2type=N'COLUMN',@level2name=N'GroupMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属组描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task', @level2type=N'COLUMN',@level2name=N'GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划任务类型mark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task', @level2type=N'COLUMN',@level2name=N'ScheduleTypeMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划任务类型Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task', @level2type=N'COLUMN',@level2name=N'ScheduleTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task', @level2type=N'COLUMN',@level2name=N'JobCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task', @level2type=N'COLUMN',@level2name=N'JobName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task', @level2type=N'COLUMN',@level2name=N'JobRemark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表达式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task', @level2type=N'COLUMN',@level2name=N'JobExpress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'job启动时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task', @level2type=N'COLUMN',@level2name=N'JobBeginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Job停止时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task', @level2type=N'COLUMN',@level2name=N'JobEndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'运行状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接口地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task', @level2type=N'COLUMN',@level2name=N'AppUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'访问方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task', @level2type=N'COLUMN',@level2name=N'RequestMode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数json字符串' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task', @level2type=N'COLUMN',@level2name=N'RequestParam'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后操作人id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task', @level2type=N'COLUMN',@level2name=N'LastUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后操作人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task', @level2type=N'COLUMN',@level2name=N'LastUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task', @level2type=N'COLUMN',@level2name=N'LastTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划任务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Task'
GO
/****** Object:  Table [dbo].[Schedule_Log]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Schedule_Log](
	[Id] [uniqueidentifier] NOT NULL,
	[JobId] [uniqueidentifier] NOT NULL,
	[JobCode] [varchar](50) NOT NULL,
	[JobName] [varchar](50) NOT NULL,
	[TriggerTime] [datetime] NOT NULL,
	[ExecuteStatus] [smallint] NOT NULL,
	[ResultMessage] [varchar](500) NULL,
 CONSTRAINT [PK_Schedule_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'JobId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Log', @level2type=N'COLUMN',@level2name=N'JobId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Log', @level2type=N'COLUMN',@level2name=N'JobCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Log', @level2type=N'COLUMN',@level2name=N'JobName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Log', @level2type=N'COLUMN',@level2name=N'TriggerTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'执行状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Log', @level2type=N'COLUMN',@level2name=N'ExecuteStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Log', @level2type=N'COLUMN',@level2name=N'ResultMessage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划任务运行日志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule_Log'
GO
/****** Object:  Table [dbo].[Org_UserPosition]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Org_UserPosition](
	[Id] [uniqueidentifier] NOT NULL,
	[PositionId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Org_UserPosition] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_UserPosition', @level2type=N'COLUMN',@level2name=N'PositionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_UserPosition', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户所属岗位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_UserPosition'
GO
/****** Object:  Table [dbo].[Org_User]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Org_User](
	[Id] [uniqueidentifier] NOT NULL,
	[LoginName] [varchar](50) NOT NULL,
	[Code] [varchar](20) NULL,
	[UserName] [nvarchar](20) NULL,
	[ShortName] [nvarchar](10) NULL,
	[SourcePW] [varchar](100) NOT NULL,
	[Random] [varchar](3) NOT NULL,
	[PassWord] [varchar](200) NOT NULL,
	[Gender] [bit] NOT NULL,
	[IdCard] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[Telephone] [varchar](20) NULL,
	[Phone] [varchar](20) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[QQ] [varchar](20) NULL,
	[BankName] [nvarchar](50) NULL,
	[BankAccount] [varchar](50) NULL,
	[CreateTime] [datetime] NOT NULL,
	[IsFreeze] [bit] NOT NULL,
	[FreezeReason] [nvarchar](200) NULL,
	[Remark] [nvarchar](100) NULL,
	[IsOutSide] [bit] NOT NULL,
	[IsSuperMgr] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'LoginName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'员工编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名缩写' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'ShortName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'PassWord'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'IdCard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'座机电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'Telephone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'QQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开户银行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'BankName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'银行账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'BankAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否冻结' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'IsFreeze'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'冻结原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'FreezeReason'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否外部员工' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'IsOutSide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'超级管理员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User', @level2type=N'COLUMN',@level2name=N'IsSuperMgr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_User'
GO
INSERT [dbo].[Org_User] ([Id], [LoginName], [Code], [UserName], [ShortName], [SourcePW], [Random], [PassWord], [Gender], [IdCard], [Email], [Telephone], [Phone], [Address], [QQ], [BankName], [BankAccount], [CreateTime], [IsFreeze], [FreezeReason], [Remark], [IsOutSide], [IsSuperMgr]) VALUES (N'99999999-9999-9999-9999-999999999999', N'sysadmin', N'999999', N'超级管理员', N'Admin', N'96e79218965eb72c92a549dd5a330112', N'999', N'e9007996fc9456890bef7c3408657670', 1, NULL, NULL, NULL, N'9999999999999', NULL, NULL, NULL, NULL, CAST(0x0000A96E01487D82 AS DateTime), 0, NULL, NULL, 0, 1)
/****** Object:  Table [dbo].[Org_PositionDefine]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Org_PositionDefine](
	[Id] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Sort] [int] NOT NULL,
	[LV] [int] NOT NULL,
 CONSTRAINT [PK_Org_PositionDefine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_PositionDefine', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_PositionDefine', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_PositionDefine', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_PositionDefine', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_PositionDefine', @level2type=N'COLUMN',@level2name=N'LV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位定义' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_PositionDefine'
GO
/****** Object:  Table [dbo].[Org_PositionCategory]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Org_PositionCategory](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Sort] [int] NOT NULL,
	[LV] [int] NOT NULL,
 CONSTRAINT [PK_PositionCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_PositionCategory', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_PositionCategory', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_PositionCategory', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_PositionCategory', @level2type=N'COLUMN',@level2name=N'LV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位类别定义' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_PositionCategory'
GO
/****** Object:  Table [dbo].[Org_Position]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Org_Position](
	[Id] [uniqueidentifier] NOT NULL,
	[OrgId] [uniqueidentifier] NOT NULL,
	[PositionCategoryId] [uniqueidentifier] NOT NULL,
	[PositionId] [uniqueidentifier] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Sort] [int] NOT NULL,
	[LV] [int] NOT NULL,
 CONSTRAINT [PK_Org_Position] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Position', @level2type=N'COLUMN',@level2name=N'OrgId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Position', @level2type=N'COLUMN',@level2name=N'PositionCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Position', @level2type=N'COLUMN',@level2name=N'PositionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Position', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Position', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Position', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Position', @level2type=N'COLUMN',@level2name=N'LV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织机构配置岗位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Position'
GO
/****** Object:  Table [dbo].[Org_OrganizationCategory]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Org_OrganizationCategory](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Remark] [nvarchar](300) NULL,
	[Sort] [int] NOT NULL,
	[IsUsing] [bit] NOT NULL,
 CONSTRAINT [PK_Org_OrganizationCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_OrganizationCategory', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_OrganizationCategory', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_OrganizationCategory', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_OrganizationCategory', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_OrganizationCategory', @level2type=N'COLUMN',@level2name=N'IsUsing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门(组织机构)类别定义' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_OrganizationCategory'
GO
INSERT [dbo].[Org_OrganizationCategory] ([Id], [Code], [Name], [Remark], [Sort], [IsUsing]) VALUES (N'99999999-9999-9999-9999-999999999999', N'999999', N'默认类型', NULL, 0, 1)
/****** Object:  Table [dbo].[Org_Organization]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Org_Organization](
	[Id] [uniqueidentifier] NOT NULL,
	[GroupId] [uniqueidentifier] NOT NULL,
	[OrganizationCategoryId] [uniqueidentifier] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Remark] [nvarchar](300) NULL,
	[Level] [smallint] NOT NULL,
	[Sort] [int] NOT NULL,
	[IsUsing] [bit] NOT NULL,
	[ParentOrganizationId] [uniqueidentifier] NULL,
	[ParentCode] [varchar](50) NULL,
	[ParentName] [varchar](50) NULL,
	[BankName] [nvarchar](50) NULL,
	[BankAccount] [varchar](50) NULL,
	[RelationShipCode] [varchar](500) NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关系Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Organization', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Organization', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Organization', @level2type=N'COLUMN',@level2name=N'OrganizationCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Organization', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Organization', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Organization', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'层级(不显示,自动生成)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Organization', @level2type=N'COLUMN',@level2name=N'Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Organization', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Organization', @level2type=N'COLUMN',@level2name=N'IsUsing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级组织机构Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Organization', @level2type=N'COLUMN',@level2name=N'ParentOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级组织机构编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Organization', @level2type=N'COLUMN',@level2name=N'ParentCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级组织机构描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Organization', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开户银行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Organization', @level2type=N'COLUMN',@level2name=N'BankName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'银行账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Organization', @level2type=N'COLUMN',@level2name=N'BankAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关系code,(不显示),自动生成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Organization', @level2type=N'COLUMN',@level2name=N'RelationShipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织机构定义' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Organization'
GO
INSERT [dbo].[Org_Organization] ([Id], [GroupId], [OrganizationCategoryId], [Code], [Name], [Remark], [Level], [Sort], [IsUsing], [ParentOrganizationId], [ParentCode], [ParentName], [BankName], [BankAccount], [RelationShipCode]) VALUES (N'99999999-9999-9999-9999-999999999999', N'99999999-9999-9999-9999-999999999999', N'99999999-9999-9999-9999-999999999999', N'999999', N'默认机构', NULL, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, N'[999999]')
/****** Object:  Table [dbo].[Org_Group]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Org_Group](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Remark] [nvarchar](300) NULL,
	[Address] [nvarchar](100) NULL,
	[Postcodes] [varchar](20) NULL,
	[Sort] [int] NOT NULL,
	[IsUsing] [bit] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Group', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Group', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Group', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Group', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮编' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Group', @level2type=N'COLUMN',@level2name=N'Postcodes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Group', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Group', @level2type=N'COLUMN',@level2name=N'IsUsing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'集团定义' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org_Group'
GO
INSERT [dbo].[Org_Group] ([Id], [Code], [Name], [Remark], [Address], [Postcodes], [Sort], [IsUsing]) VALUES (N'99999999-9999-9999-9999-999999999999', N'999999', N'默认集团', NULL, NULL, NULL, 0, 1)
/****** Object:  Table [dbo].[Auth_UserFeatureRole]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auth_UserFeatureRole](
	[Id] [uniqueidentifier] NOT NULL,
	[FeatureId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_Auth_UserFeatureRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_UserFeatureRole', @level2type=N'COLUMN',@level2name=N'FeatureId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_UserFeatureRole', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_UserFeatureRole', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户和功能角色关联' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_UserFeatureRole'
GO
/****** Object:  Table [dbo].[Auth_UserDataRole]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auth_UserDataRole](
	[Id] [uniqueidentifier] NOT NULL,
	[DataRoleId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_Auth_UserDataRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_UserDataRole', @level2type=N'COLUMN',@level2name=N'DataRoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_UserDataRole', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_UserDataRole', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户和数据角色关联' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_UserDataRole'
GO
/****** Object:  Table [dbo].[Auth_PositionSpecialMenuConfig]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auth_PositionSpecialMenuConfig](
	[Id] [uniqueidentifier] NOT NULL,
	[PositionId] [uniqueidentifier] NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_Auth_UserSpecialFeatureConfig] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_PositionSpecialMenuConfig', @level2type=N'COLUMN',@level2name=N'PositionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_PositionSpecialMenuConfig', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_PositionSpecialMenuConfig', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位特别配置菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_PositionSpecialMenuConfig'
GO
/****** Object:  Table [dbo].[Auth_PositionFeatureRole]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auth_PositionFeatureRole](
	[Id] [uniqueidentifier] NOT NULL,
	[PositionId] [uniqueidentifier] NOT NULL,
	[FeatureRoleId] [uniqueidentifier] NOT NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_Auth_PositionFeatureRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_PositionFeatureRole', @level2type=N'COLUMN',@level2name=N'PositionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_PositionFeatureRole', @level2type=N'COLUMN',@level2name=N'FeatureRoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_PositionFeatureRole', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位配置功能角色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_PositionFeatureRole'
GO
/****** Object:  Table [dbo].[Auth_PositionDataRole]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auth_PositionDataRole](
	[Id] [uniqueidentifier] NOT NULL,
	[PositionId] [uniqueidentifier] NOT NULL,
	[DataRoleId] [uniqueidentifier] NOT NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_Auth_PositionDataRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_PositionDataRole', @level2type=N'COLUMN',@level2name=N'PositionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_PositionDataRole', @level2type=N'COLUMN',@level2name=N'DataRoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_PositionDataRole', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位配置数据角色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_PositionDataRole'
GO
/****** Object:  Table [dbo].[Auth_FeatureRoleDirectory]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Auth_FeatureRoleDirectory](
	[Id] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Sort] [int] NOT NULL,
	[Remark] [nvarchar](100) NULL,
 CONSTRAINT [PK_Auth_FeatureRoleDirectory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_FeatureRoleDirectory', @level2type=N'COLUMN',@level2name=N'ApplicationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_FeatureRoleDirectory', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_FeatureRoleDirectory', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_FeatureRoleDirectory', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_FeatureRoleDirectory', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_FeatureRoleDirectory', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能角色目录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_FeatureRoleDirectory'
GO
/****** Object:  Table [dbo].[Auth_FeatureRoleConfig]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auth_FeatureRoleConfig](
	[Id] [uniqueidentifier] NOT NULL,
	[FeatureId] [uniqueidentifier] NOT NULL,
	[FeatureRoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Auth_FeatureRoleConfig] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_FeatureRoleConfig', @level2type=N'COLUMN',@level2name=N'FeatureId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_FeatureRoleConfig', @level2type=N'COLUMN',@level2name=N'FeatureRoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能角色-功能项配置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_FeatureRoleConfig'
GO
/****** Object:  Table [dbo].[Auth_FeatureRole]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Auth_FeatureRole](
	[Id] [uniqueidentifier] NOT NULL,
	[FeatureRoleDirectoryId] [uniqueidentifier] NOT NULL,
	[PositionId] [uniqueidentifier] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Sort] [int] NOT NULL,
	[Remark] [nvarchar](50) NULL,
 CONSTRAINT [PK_Auth_FeatureRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_FeatureRole', @level2type=N'COLUMN',@level2name=N'FeatureRoleDirectoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_FeatureRole', @level2type=N'COLUMN',@level2name=N'PositionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_FeatureRole', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_FeatureRole', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_FeatureRole', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_FeatureRole', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能角色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_FeatureRole'
GO
/****** Object:  Table [dbo].[Auth_DataRoleDirectory]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Auth_DataRoleDirectory](
	[Id] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Sort] [int] NOT NULL,
	[Remark] [nvarchar](100) NULL,
 CONSTRAINT [PK_Auth_DataRoleDirectory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRoleDirectory', @level2type=N'COLUMN',@level2name=N'ApplicationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRoleDirectory', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRoleDirectory', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRoleDirectory', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRoleDirectory', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRoleDirectory', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据角色目录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRoleDirectory'
GO
/****** Object:  Table [dbo].[Auth_DataRoleConfig]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auth_DataRoleConfig](
	[Id] [uniqueidentifier] NOT NULL,
	[DataRoleId] [uniqueidentifier] NOT NULL,
	[DataObjectId] [uniqueidentifier] NOT NULL,
	[DataItemId] [uniqueidentifier] NOT NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_Auth_DataRoleConfig] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRoleConfig', @level2type=N'COLUMN',@level2name=N'DataRoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRoleConfig', @level2type=N'COLUMN',@level2name=N'DataObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据对象中选中的item.Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRoleConfig', @level2type=N'COLUMN',@level2name=N'DataItemId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRoleConfig', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据角色数据项配置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRoleConfig'
GO
/****** Object:  Table [dbo].[Auth_DataRole]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Auth_DataRole](
	[Id] [uniqueidentifier] NOT NULL,
	[DataRoleDirectoryId] [uniqueidentifier] NOT NULL,
	[PositionId] [uniqueidentifier] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Sort] [int] NOT NULL,
	[Remark] [nvarchar](100) NULL,
 CONSTRAINT [PK_Auth_DataRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRole', @level2type=N'COLUMN',@level2name=N'DataRoleDirectoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRole', @level2type=N'COLUMN',@level2name=N'PositionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRole', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRole', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRole', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRole', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据角色定义' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataRole'
GO
/****** Object:  Table [dbo].[Auth_DataObject]    Script Date: 10/19/2018 16:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Auth_DataObject](
	[Id] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Sort] [int] NOT NULL,
	[Assembly] [varchar](100) NOT NULL,
	[ClassFullName] [varchar](100) NOT NULL,
	[DataBase] [varchar](50) NOT NULL,
	[TableName] [varchar](50) NOT NULL,
	[ShowType] [varchar](50) NULL,
	[TreeColomnBase] [varchar](50) NULL,
	[TreeColomnParent] [varchar](50) NULL,
 CONSTRAINT [PK_Auth_DataObject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联表Id(不显示)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataObject', @level2type=N'COLUMN',@level2name=N'ApplicationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataObject', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataObject', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataObject', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'程序集' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataObject', @level2type=N'COLUMN',@level2name=N'Assembly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类全名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataObject', @level2type=N'COLUMN',@level2name=N'ClassFullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataObject', @level2type=N'COLUMN',@level2name=N'DataBase'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataObject', @level2type=N'COLUMN',@level2name=N'TableName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataObject', @level2type=N'COLUMN',@level2name=N'ShowType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'树形依赖字段基本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataObject', @level2type=N'COLUMN',@level2name=N'TreeColomnBase'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'树形依赖字段父级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataObject', @level2type=N'COLUMN',@level2name=N'TreeColomnParent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据对象定义' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auth_DataObject'
GO
/****** Object:  View [dbo].[View_UserOrgInfo]    Script Date: 10/19/2018 16:49:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_UserOrgInfo]
AS
SELECT     userbase.Id, userbase.LoginName, userbase.Code, userbase.UserName, userbase.ShortName, userbase.PassWord, userbase.Gender, userbase.IdCard, userbase.Email, userbase.Telephone, 
                      userbase.Phone, userbase.Address, userbase.QQ, userbase.CreateTime, userbase.IsFreeze, userbase.FreezeReason, userbase.Remark, userbase.IsOutSide, userbase.IsSuperMgr, 
                      position.Id AS PositionId, position.Code AS PositionCode, position.Name AS PositionName, position.Sort AS PositionSort, positioncategory.Id AS PositionCategoryId, 
                      positioncategory.Code AS PositionCategoryCode, positioncategory.Name AS PositionCategoryName, positioncategory.LV AS PositionCategoryLV, positioncategory.Sort AS PositionCategorySort, 
                      organization.Id AS OrgId, organization.Code AS OrganizationCode, organization.Name AS OrganizationName, organization.ParentOrganizationId, 
                      organization.ParentCode AS ParentOrganizationCode, organization.ParentName AS ParentOrganizationName, organization.[Level] AS OrganizationLevel, 
                      organization.RelationShipCode AS OrganizationRelationShipCode, organization.Sort AS OrganizationSort, organization.Remark AS OrganizationRemark, 
                      organization.IsUsing AS OrganizationIsUsing, organizationcategory.Id AS OrganizationCategoryId, organizationcategory.Code AS OrganizationCategoryCode, 
                      organizationcategory.Name AS OrganizationCategoryName, organizationcategory.Sort AS OrganizationCategorySort, organizationcategory.Remark AS OrganizationCategoryRemark, 
                      organizationcategory.IsUsing AS OrganizationCategoryIsUsing, orggroup.Id AS GroupId, orggroup.Code AS GroupCode, orggroup.Name AS GroupName, orggroup.Address AS GroupAddress, 
                      orggroup.Postcodes AS GroupPostcodes, orggroup.Remark AS GroupRemark, orggroup.Sort AS GroupSort, orggroup.IsUsing AS OrgGroupIsUsing
FROM         dbo.Org_User AS userbase LEFT OUTER JOIN
                      dbo.Org_UserPosition AS userposition ON userbase.Id = userposition.UserId LEFT OUTER JOIN
                      dbo.Org_Position AS position ON userposition.PositionId = position.Id LEFT OUTER JOIN
                      dbo.Org_PositionCategory AS positioncategory ON positioncategory.Id = position.PositionCategoryId LEFT OUTER JOIN
                      dbo.Org_Organization AS organization ON organization.Id = position.OrgId LEFT OUTER JOIN
                      dbo.Org_OrganizationCategory AS organizationcategory ON organizationcategory.Id = organization.OrganizationCategoryId LEFT OUTER JOIN
                      dbo.Org_Group AS orggroup ON orggroup.Id = organization.GroupId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ViewUserOrgInfo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_UserOrgInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[37] 4[15] 2[32] 3) )"
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
         Top = -288
         Left = 0
      End
      Begin Tables = 
         Begin Table = "userbase"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 196
            End
            DisplayFlags = 280
            TopColumn = 19
         End
         Begin Table = "userposition"
            Begin Extent = 
               Top = 6
               Left = 234
               Bottom = 110
               Right = 376
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "position"
            Begin Extent = 
               Top = 6
               Left = 414
               Bottom = 125
               Right = 595
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "positioncategory"
            Begin Extent = 
               Top = 6
               Left = 633
               Bottom = 125
               Right = 775
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "organization"
            Begin Extent = 
               Top = 6
               Left = 813
               Bottom = 125
               Right = 1018
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "organizationcategory"
            Begin Extent = 
               Top = 165
               Left = 244
               Bottom = 284
               Right = 386
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "orggroup"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 245
               Right = 180
            E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_UserOrgInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'nd
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_UserOrgInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_UserOrgInfo'
GO
/****** Object:  View [dbo].[View_MenuSys]    Script Date: 10/19/2018 16:49:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_MenuSys]
AS
SELECT     smenu.Id, smenu.Id AS MenuId, smenu.ParentId AS MenuParentId, smenu.Code AS MenuCode, smenu.Name AS MenuName, smenu.Url AS MenuUrl, 
                      smenu.Sort AS MenuSort, sfeature.Id AS FeatureId, sfeature.Code AS FeatureCode, sfeature.Name AS FeatureName, 
                      sfeature.ControllerName AS FeatureControllerName, sfeature.ActionName AS FeatureActionName, sfeature.Url AS FeatureUrl, 
                      sfeature.ApplicationModuleId AS FeatureAppModuleId, sfeature.IsMenu AS FeatureIsMenu, sfeature.IsShortCut AS FeatureIsShortCut, sappmodle.Id AS AppModelId, 
                      sappmodle.Code AS AppModelCode, sappmodle.Name AS AppModelName, sappmodle.Sort AS AppModelSort, sappmodle.IsFreeze AS AppModelIsFreeze, 
                      sspp.Id AS SysAppId, sspp.Code AS SysAppCode, sspp.Name AS SysAppName, sspp.Sort AS SysAppSort, sspp.IsFreeze AS SysAppIsFreeze, 
                      sspp.Domain AS SysAppDomain, sspp.VisitUrl AS SysAppVisitUrl
FROM         dbo.Sys_Menu AS smenu LEFT OUTER JOIN
                      dbo.Sys_Feature AS sfeature ON smenu.FeatureId = sfeature.Id LEFT OUTER JOIN
                      dbo.Sys_ApplicationModule AS sappmodle ON smenu.ApplicationModuleId = sappmodle.Id LEFT OUTER JOIN
                      dbo.Sys_Application AS sspp ON sappmodle.ApplicationId = sspp.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ViewMenuSys' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_MenuSys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[43] 4[19] 2[22] 3) )"
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
         Begin Table = "smenu"
            Begin Extent = 
               Top = 23
               Left = 36
               Bottom = 206
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sfeature"
            Begin Extent = 
               Top = 20
               Left = 249
               Bottom = 201
               Right = 434
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sappmodle"
            Begin Extent = 
               Top = 6
               Left = 484
               Bottom = 205
               Right = 668
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sspp"
            Begin Extent = 
               Top = 6
               Left = 717
               Bottom = 125
               Right = 859
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_MenuSys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_MenuSys'
GO
/****** Object:  View [dbo].[View_FeaturePosition]    Script Date: 10/19/2018 16:49:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_FeaturePosition]
AS
SELECT     FeatureRoleConfig.Id, Feature.Id AS FeatureId, Feature.Code AS FeatureCode, Feature.Name AS FeatureName, Feature.ControllerName AS FeatureControllerName, 
                      Feature.ActionName AS FeatureActionName, Feature.Url AS FeatureUrl, Feature.IsMenu AS FeatureIsMenu, Feature.IsShortCut AS FeatureIsShortCut, Feature.[Level] AS FeatureLevel, 
                      Feature.Sort AS FeatureSort, Feature.Remark AS FeatureRemark, Feature.ApplicationModuleId AS FeatureApplicationModuleId, aa.PositionId, aa.PositionCode, aa.PositionName, 
                      aa.PositionCategoryId, aa.FeatureRoleId, aa.FeatureRoleCode, aa.FeatureRoleName, aa.FeatureRoleRemark, aa.FeatureRoleDirectoryId, aa.FeatureRoleSort
FROM         dbo.Auth_FeatureRoleConfig AS FeatureRoleConfig LEFT OUTER JOIN
                      dbo.Sys_Feature AS Feature ON FeatureRoleConfig.FeatureId = Feature.Id INNER JOIN
                          (SELECT     Position.Id AS PositionId, Position.Code AS PositionCode, Position.Name AS PositionName, Position.PositionCategoryId, Position.OrgId, FeatureRole.Id AS FeatureRoleId, 
                                                   FeatureRole.Code AS FeatureRoleCode, FeatureRole.Name AS FeatureRoleName, FeatureRole.Remark AS FeatureRoleRemark, FeatureRole.FeatureRoleDirectoryId, 
                                                   FeatureRole.Sort AS FeatureRoleSort
                            FROM          dbo.Auth_PositionFeatureRole AS PositionFeatureRole LEFT OUTER JOIN
                                                   dbo.Org_Position AS Position ON PositionFeatureRole.PositionId = Position.Id LEFT OUTER JOIN
                                                   dbo.Auth_FeatureRole AS FeatureRole ON PositionFeatureRole.FeatureRoleId = FeatureRole.Id) AS aa ON FeatureRoleConfig.FeatureRoleId = aa.FeatureRoleId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ViewFeaturePosition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_FeaturePosition'
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
         Begin Table = "FeatureRoleConfig"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 110
               Right = 196
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Feature"
            Begin Extent = 
               Top = 0
               Left = 304
               Bottom = 119
               Right = 489
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "aa"
            Begin Extent = 
               Top = 6
               Left = 527
               Bottom = 126
               Right = 729
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1125
         Table = 2295
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_FeaturePosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_FeaturePosition'
GO
/****** Object:  View [dbo].[View_DataRolePosition]    Script Date: 10/19/2018 16:49:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_DataRolePosition]
AS
SELECT     drc.Id, drc.DataRoleId, drc.DataObjectId, drc.DataItemId, drc.Sort AS DataRoleConfigSort, dr.Code AS DataRoleCode, dr.Name AS DataRoleName, dr.DataRoleDirectoryId, 
                      dr.Remark AS DataRoleRemark, dr.Sort AS DataRoleSort, ado.Code AS DataObjectCode, ado.Name AS DataObjectName, ado.ApplicationId AS DataObjectApplicationId, 
                      ado.[Assembly] AS DataObjectAssembly, ado.ClassFullName AS DataObjectClassFullName, ado.[DataBase] AS DataObjectDataBase, ado.TableName AS DataObjectTableName, 
                      ado.Sort AS DataObjectSort, pdr.PositionId, pdr.Sort AS PositionDataRoleSort, op.Code AS PositionCode, op.Name AS PositionName, op.PositionCategoryId, op.Sort AS PositionSort, op.OrgId
FROM         dbo.Auth_DataRoleConfig AS drc LEFT OUTER JOIN
                      dbo.Auth_DataObject AS ado ON drc.DataObjectId = ado.Id LEFT OUTER JOIN
                      dbo.Auth_DataRole AS dr ON drc.DataRoleId = dr.Id LEFT OUTER JOIN
                      dbo.Auth_PositionDataRole AS pdr ON drc.DataRoleId = pdr.DataRoleId LEFT OUTER JOIN
                      dbo.Org_Position AS op ON pdr.PositionId = op.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ViewDataRolePosition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DataRolePosition'
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
         Begin Table = "drc"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ado"
            Begin Extent = 
               Top = 6
               Left = 855
               Bottom = 125
               Right = 1012
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "dr"
            Begin Extent = 
               Top = 4
               Left = 180
               Bottom = 123
               Right = 367
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "pdr"
            Begin Extent = 
               Top = 29
               Left = 407
               Bottom = 148
               Right = 550
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "op"
            Begin Extent = 
               Top = 6
               Left = 636
               Bottom = 125
               Right = 817
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         O' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DataRolePosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'utput = 720
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DataRolePosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DataRolePosition'
GO
/****** Object:  View [dbo].[View_Company]    Script Date: 10/19/2018 16:49:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Company]
AS
SELECT     TOP (100) PERCENT dbo.Org_Organization.Id, dbo.Org_Organization.GroupId, dbo.Org_Organization.OrganizationCategoryId, dbo.Org_Organization.Code, dbo.Org_Organization.Name, 
                      dbo.Org_Organization.Remark, dbo.Org_Organization.[Level], dbo.Org_Organization.Sort, dbo.Org_Organization.IsUsing, dbo.Org_Organization.ParentOrganizationId, 
                      dbo.Org_Organization.ParentCode, dbo.Org_Organization.ParentName, dbo.Org_Organization.BankName, dbo.Org_Organization.BankAccount, dbo.Org_Organization.RelationShipCode
FROM         dbo.Org_Organization INNER JOIN
                      dbo.Org_OrganizationCategory ON dbo.Org_Organization.OrganizationCategoryId = dbo.Org_OrganizationCategory.Id
WHERE     (dbo.Org_OrganizationCategory.Code = 'Company')
ORDER BY dbo.Org_Organization.Code
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Company'
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
         Begin Table = "Org_Organization"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 179
               Right = 248
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "Org_OrganizationCategory"
            Begin Extent = 
               Top = 16
               Left = 362
               Bottom = 164
               Right = 680
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Company'
GO
/****** Object:  Default [DF_Sys_UserShortCutFeature_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_UserShortCutMenu] ADD  CONSTRAINT [DF_Sys_UserShortCutFeature_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Sys_UserLoginHistory_Status]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_UserLoginHistory] ADD  CONSTRAINT [DF_Sys_UserLoginHistory_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_Sys_StaticData_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_StaticData] ADD  CONSTRAINT [DF_Sys_StaticData_Sort]  DEFAULT ((0)) FOR [Sort]
GO
/****** Object:  Default [DF_System_Region_HaveChild]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_Region] ADD  CONSTRAINT [DF_System_Region_HaveChild]  DEFAULT ((0)) FOR [HaveChild]
GO
/****** Object:  Default [DF_System_Region_Level]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_Region] ADD  CONSTRAINT [DF_System_Region_Level]  DEFAULT ((1)) FOR [Level]
GO
/****** Object:  Default [DF_System_Region_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_Region] ADD  CONSTRAINT [DF_System_Region_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Sys_OpenInterfaceType_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_OpenInterfaceType] ADD  CONSTRAINT [DF_Sys_OpenInterfaceType_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Sys_OpenInterface_HttpType]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_OpenInterface] ADD  CONSTRAINT [DF_Sys_OpenInterface_HttpType]  DEFAULT ('post') FOR [HttpType]
GO
/****** Object:  Default [DF_Sys_OpenInterface_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_OpenInterface] ADD  CONSTRAINT [DF_Sys_OpenInterface_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Sys_OpenInterface_IsFreeze]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_OpenInterface] ADD  CONSTRAINT [DF_Sys_OpenInterface_IsFreeze]  DEFAULT ((0)) FOR [IsFreeze]
GO
/****** Object:  Default [DF_Sys_Menu_Level]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_Menu] ADD  CONSTRAINT [DF_Sys_Menu_Level]  DEFAULT ((1)) FOR [Level]
GO
/****** Object:  Default [DF_Sys_Menu_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_Menu] ADD  CONSTRAINT [DF_Sys_Menu_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Sys_Feature_Level]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_Feature] ADD  CONSTRAINT [DF_Sys_Feature_Level]  DEFAULT ((1)) FOR [Level]
GO
/****** Object:  Default [DF_Sys_Feature_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_Feature] ADD  CONSTRAINT [DF_Sys_Feature_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Sys_Feature_IsMenu]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_Feature] ADD  CONSTRAINT [DF_Sys_Feature_IsMenu]  DEFAULT ((0)) FOR [IsMenu]
GO
/****** Object:  Default [DF_Sys_Feature_IsShortCut]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_Feature] ADD  CONSTRAINT [DF_Sys_Feature_IsShortCut]  DEFAULT ((0)) FOR [IsShortCut]
GO
/****** Object:  Default [DF_Sys_ApplicationModule_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_ApplicationModule] ADD  CONSTRAINT [DF_Sys_ApplicationModule_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Sys_ApplicationModule_IsFreeze]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_ApplicationModule] ADD  CONSTRAINT [DF_Sys_ApplicationModule_IsFreeze]  DEFAULT ((0)) FOR [IsFreeze]
GO
/****** Object:  Default [DF_Sys_Application_IsFreeze]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_Application] ADD  CONSTRAINT [DF_Sys_Application_IsFreeze]  DEFAULT ((0)) FOR [IsFreeze]
GO
/****** Object:  Default [DF_Sys_Application_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Sys_Application] ADD  CONSTRAINT [DF_Sys_Application_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Schedule_Type_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Schedule_Type] ADD  CONSTRAINT [DF_Schedule_Type_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Schedule_Type_Status]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Schedule_Type] ADD  CONSTRAINT [DF_Schedule_Type_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_Schedule_Task_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Schedule_Task] ADD  CONSTRAINT [DF_Schedule_Task_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Schedule_Task_Status]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Schedule_Task] ADD  CONSTRAINT [DF_Schedule_Task_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_Schedule_Task_RequestMode]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Schedule_Task] ADD  CONSTRAINT [DF_Schedule_Task_RequestMode]  DEFAULT ('post') FOR [RequestMode]
GO
/****** Object:  Default [DF_Org_UserPosition_OrganizationId]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_UserPosition] ADD  CONSTRAINT [DF_Org_UserPosition_OrganizationId]  DEFAULT (newid()) FOR [PositionId]
GO
/****** Object:  Default [DF_User_Gender]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_User] ADD  CONSTRAINT [DF_User_Gender]  DEFAULT ((1)) FOR [Gender]
GO
/****** Object:  Default [DF_Org_User_Phone]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_User] ADD  CONSTRAINT [DF_Org_User_Phone]  DEFAULT ('0') FOR [Phone]
GO
/****** Object:  Default [DF_User_IsFreeze]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_User] ADD  CONSTRAINT [DF_User_IsFreeze]  DEFAULT ((0)) FOR [IsFreeze]
GO
/****** Object:  Default [DF_Org_User_IsInner]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_User] ADD  CONSTRAINT [DF_Org_User_IsInner]  DEFAULT ((0)) FOR [IsOutSide]
GO
/****** Object:  Default [DF_Org_User_IsSuperMgr]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_User] ADD  CONSTRAINT [DF_Org_User_IsSuperMgr]  DEFAULT ((0)) FOR [IsSuperMgr]
GO
/****** Object:  Default [DF_Org_PositionDefine_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_PositionDefine] ADD  CONSTRAINT [DF_Org_PositionDefine_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Org_PositionDefine_LV]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_PositionDefine] ADD  CONSTRAINT [DF_Org_PositionDefine_LV]  DEFAULT ((0)) FOR [LV]
GO
/****** Object:  Default [DF_PositionCategory_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_PositionCategory] ADD  CONSTRAINT [DF_PositionCategory_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_PositionCategory_Level]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_PositionCategory] ADD  CONSTRAINT [DF_PositionCategory_Level]  DEFAULT ((0)) FOR [LV]
GO
/****** Object:  Default [DF_Org_Position_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_Position] ADD  CONSTRAINT [DF_Org_Position_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Org_Position_LV]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_Position] ADD  CONSTRAINT [DF_Org_Position_LV]  DEFAULT ((1)) FOR [LV]
GO
/****** Object:  Default [DF_Org_OrganizationCategory_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_OrganizationCategory] ADD  CONSTRAINT [DF_Org_OrganizationCategory_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Org_OrganizationCategory_IsUsing]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_OrganizationCategory] ADD  CONSTRAINT [DF_Org_OrganizationCategory_IsUsing]  DEFAULT ((1)) FOR [IsUsing]
GO
/****** Object:  Default [DF_Org_Organization_Level]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_Organization] ADD  CONSTRAINT [DF_Org_Organization_Level]  DEFAULT ((1)) FOR [Level]
GO
/****** Object:  Default [DF_Organization_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_Organization] ADD  CONSTRAINT [DF_Organization_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Org_Organization_IsUsing]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_Organization] ADD  CONSTRAINT [DF_Org_Organization_IsUsing]  DEFAULT ((1)) FOR [IsUsing]
GO
/****** Object:  Default [DF_Group_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_Group] ADD  CONSTRAINT [DF_Group_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Org_Group_IsUsing]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Org_Group] ADD  CONSTRAINT [DF_Org_Group_IsUsing]  DEFAULT ((1)) FOR [IsUsing]
GO
/****** Object:  Default [DF_Auth_UserFeatureRole_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Auth_UserFeatureRole] ADD  CONSTRAINT [DF_Auth_UserFeatureRole_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Auth_UserDataRole_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Auth_UserDataRole] ADD  CONSTRAINT [DF_Auth_UserDataRole_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Auth_UserSpecialFeatureConfig_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Auth_PositionSpecialMenuConfig] ADD  CONSTRAINT [DF_Auth_UserSpecialFeatureConfig_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Auth_PositionFeatureRole_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Auth_PositionFeatureRole] ADD  CONSTRAINT [DF_Auth_PositionFeatureRole_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Auth_PositionDataRole_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Auth_PositionDataRole] ADD  CONSTRAINT [DF_Auth_PositionDataRole_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Auth_FeatureRoleDirectory_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Auth_FeatureRoleDirectory] ADD  CONSTRAINT [DF_Auth_FeatureRoleDirectory_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Auth_FeatureRole_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Auth_FeatureRole] ADD  CONSTRAINT [DF_Auth_FeatureRole_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Auth_DataRoleDirectory_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Auth_DataRoleDirectory] ADD  CONSTRAINT [DF_Auth_DataRoleDirectory_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Auth_DataRoleConfig_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Auth_DataRoleConfig] ADD  CONSTRAINT [DF_Auth_DataRoleConfig_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Auth_DataRole_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Auth_DataRole] ADD  CONSTRAINT [DF_Auth_DataRole_Sort]  DEFAULT ((1)) FOR [Sort]
GO
/****** Object:  Default [DF_Auth_DataObject_Sort]    Script Date: 10/19/2018 16:49:34 ******/
ALTER TABLE [dbo].[Auth_DataObject] ADD  CONSTRAINT [DF_Auth_DataObject_Sort]  DEFAULT ((1)) FOR [Sort]
GO
