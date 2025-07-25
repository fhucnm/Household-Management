create table Household
USE [Household]
GO
ALTER TABLE [dbo].[Registrations] DROP CONSTRAINT [CK__Registrat__statu__6FE99F9F]
GO
ALTER TABLE [dbo].[Registrations] DROP CONSTRAINT [CK__Registrat__regis__6EF57B66]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK__Users__roleID__6E01572D]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK__Users__addressID__6D0D32F4]
GO
ALTER TABLE [dbo].[Registrations] DROP CONSTRAINT [FK__Registrati__cccd__6C190EBB]
GO
ALTER TABLE [dbo].[Registrations] DROP CONSTRAINT [FK__Registrat__appro__6B24EA82]
GO
ALTER TABLE [dbo].[PendingHousehold] DROP CONSTRAINT [FK__PendingHo__regis__6A30C649]
GO
ALTER TABLE [dbo].[Notifications] DROP CONSTRAINT [FK__Notificati__cccd__693CA210]
GO
ALTER TABLE [dbo].[Logs] DROP CONSTRAINT [FK__Logs__cccd__68487DD7]
GO
ALTER TABLE [dbo].[Households] DROP CONSTRAINT [FK__Household__headO__6754599E]
GO
ALTER TABLE [dbo].[Households] DROP CONSTRAINT [FK__Household__addre__66603565]
GO
ALTER TABLE [dbo].[HouseholdMembers] DROP CONSTRAINT [FK__HouseholdM__cccd__656C112C]
GO
ALTER TABLE [dbo].[HouseholdMembers] DROP CONSTRAINT [FK__Household__house__6477ECF3]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__isActive__6383C8BA]
GO
ALTER TABLE [dbo].[Registrations] DROP CONSTRAINT [DF__Registrat__statu__628FA481]
GO
ALTER TABLE [dbo].[PendingHousehold] DROP CONSTRAINT [DF__PendingHo__creat__619B8048]
GO
ALTER TABLE [dbo].[Notifications] DROP CONSTRAINT [DF__Notificat__isRea__60A75C0F]
GO
ALTER TABLE [dbo].[Notifications] DROP CONSTRAINT [DF__Notificat__sentD__5FB337D6]
GO
ALTER TABLE [dbo].[Logs] DROP CONSTRAINT [DF__Logs__Timestamp__5EBF139D]
GO
ALTER TABLE [dbo].[Households] DROP CONSTRAINT [DF__Household__creat__5DCAEF64]
GO
/****** Object:  Index [UQ__Users__AB6E616410487F1F]    Script Date: 7/5/2025 4:54:07 PM ******/
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [UQ__Users__AB6E616410487F1F]
GO
/****** Object:  Index [UQ__Users__4849DA0193FC4917]    Script Date: 7/5/2025 4:54:07 PM ******/
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [UQ__Users__4849DA0193FC4917]
GO
/****** Object:  Index [UQ__Roles__B194786164550FB6]    Script Date: 7/5/2025 4:54:07 PM ******/
ALTER TABLE [dbo].[Roles] DROP CONSTRAINT [UQ__Roles__B194786164550FB6]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/5/2025 4:54:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/5/2025 4:54:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[Registrations]    Script Date: 7/5/2025 4:54:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Registrations]') AND type in (N'U'))
DROP TABLE [dbo].[Registrations]
GO
/****** Object:  Table [dbo].[PendingHousehold]    Script Date: 7/5/2025 4:54:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PendingHousehold]') AND type in (N'U'))
DROP TABLE [dbo].[PendingHousehold]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 7/5/2025 4:54:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Notifications]') AND type in (N'U'))
DROP TABLE [dbo].[Notifications]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 7/5/2025 4:54:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Logs]') AND type in (N'U'))
DROP TABLE [dbo].[Logs]
GO
/****** Object:  Table [dbo].[Households]    Script Date: 7/5/2025 4:54:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Households]') AND type in (N'U'))
DROP TABLE [dbo].[Households]
GO
/****** Object:  Table [dbo].[HouseholdMembers]    Script Date: 7/5/2025 4:54:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HouseholdMembers]') AND type in (N'U'))
DROP TABLE [dbo].[HouseholdMembers]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 7/5/2025 4:54:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address]') AND type in (N'U'))
DROP TABLE [dbo].[Address]
GO
USE [master]
GO
/****** Object:  Database [Household]    Script Date: 7/5/2025 4:54:07 PM ******/
DROP DATABASE [Household]
GO
/****** Object:  Database [Household]    Script Date: 7/5/2025 4:54:07 PM ******/
CREATE DATABASE [Household]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Household', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.FHUC\MSSQL\DATA\Household.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Household_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.FHUC\MSSQL\DATA\Household_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Household] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Household].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Household] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Household] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Household] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Household] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Household] SET ARITHABORT OFF 
GO
ALTER DATABASE [Household] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Household] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Household] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Household] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Household] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Household] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Household] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Household] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Household] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Household] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Household] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Household] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Household] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Household] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Household] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Household] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Household] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Household] SET RECOVERY FULL 
GO
ALTER DATABASE [Household] SET  MULTI_USER 
GO
ALTER DATABASE [Household] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Household] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Household] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Household] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Household] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Household] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Household', N'ON'
GO
ALTER DATABASE [Household] SET QUERY_STORE = ON
GO
ALTER DATABASE [Household] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Household]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 7/5/2025 4:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[addressId] [int] IDENTITY(1,1) NOT NULL,
	[street] [nvarchar](255) NULL,
	[ward] [nvarchar](100) NULL,
	[district] [nvarchar](100) NULL,
	[city] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[addressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HouseholdMembers]    Script Date: 7/5/2025 4:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseholdMembers](
	[memberId] [int] IDENTITY(1,1) NOT NULL,
	[householdId] [int] NULL,
	[cccd] [varchar](12) NULL,
	[relationship] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[memberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Households]    Script Date: 7/5/2025 4:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Households](
	[householdId] [int] IDENTITY(1,1) NOT NULL,
	[headOfHouseholdCccd] [varchar](12) NULL,
	[addressId] [int] NOT NULL,
	[createdDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[householdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 7/5/2025 4:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[logId] [int] IDENTITY(1,1) NOT NULL,
	[cccd] [varchar](12) NULL,
	[action] [nvarchar](100) NOT NULL,
	[Timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[logId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 7/5/2025 4:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[notificationID] [int] IDENTITY(1,1) NOT NULL,
	[cccd] [varchar](12) NOT NULL,
	[message] [nvarchar](200) NOT NULL,
	[sentDate] [datetime] NULL,
	[isRead] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[notificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PendingHousehold]    Script Date: 7/5/2025 4:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PendingHousehold](
	[pendingId] [int] IDENTITY(1,1) NOT NULL,
	[registrationId] [int] NOT NULL,
	[headOfHouseholdCccd] [nvarchar](12) NOT NULL,
	[addressId] [int] NOT NULL,
	[relationship] [nvarchar](50) NOT NULL,
	[cccd] [nvarchar](12) NOT NULL,
	[createDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[pendingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registrations]    Script Date: 7/5/2025 4:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registrations](
	[registrationId] [int] IDENTITY(1,1) NOT NULL,
	[cccd] [varchar](12) NOT NULL,
	[registrationType] [nvarchar](50) NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NULL,
	[status] [nvarchar](20) NULL,
	[approvedBy] [varchar](12) NULL,
	[comments] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[registrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/5/2025 4:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/5/2025 4:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[cccd] [varchar](12) NOT NULL,
	[fullName] [nvarchar](100) NOT NULL,
	[birthday] [date] NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phoneNumber] [varchar](10) NOT NULL,
	[gender] [char](1) NULL,
	[password] [varchar](255) NOT NULL,
	[roleID] [int] NOT NULL,
	[addressID] [int] NOT NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cccd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (1, N'Đông Cựu', N'Đông Sơn', N'Chương Mỹ', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (2, N'Yên Kiện', N'Đông Sơn', N'Chương Mỹ', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (3, N'Phố Tràng Tiền', N'Phường Tràng Tiền', N'Quận Hoàn Kiếm', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (4, N'Phố Hàng Bài', N'Phường Hàng Bài', N'Quận Hoàn Kiếm', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (5, N'Phố Đội Cấn', N'Phường Đội Cấn', N'Quận Ba Đình', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (6, N'Đường Kim Mã', N'Phường Ngọc Khánh', N'Quận Ba Đình', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (7, N'Phố Tôn Đức Thắng', N'Phường Hàng Bột', N'Quận Đống Đa', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (8, N'Phố Xã Đàn', N'Phường Nam Đồng', N'Quận Đống Đa', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (9, N'Phố Bạch Mai', N'Phường Bạch Mai', N'Quận Hai Bà Trưng', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (10, N'Phố Minh Khai', N'Phường Vĩnh Tuy', N'Quận Hai Bà Trưng', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (11, N'Đường Nguyễn Phong Sắc', N'Phường Dịch Vọng Hậu', N'Quận Cầu Giấy', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (12, N'Đường Trần Duy Hưng', N'Phường Trung Hòa', N'Quận Cầu Giấy', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (13, N'Phố Nguyễn Trãi', N'Phường Thượng Đình', N'Quận Thanh Xuân', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (14, N'Đường Khuất Duy Tiến', N'Phường Nhân Chính', N'Quận Thanh Xuân', N'Hà Nội')
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[HouseholdMembers] ON 

INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (99, 2, N'001200000001', N'Chủ hộ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (101, 2, N'001202000006', N'Cha/Mẹ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (102, 2, N'001202000007', N'Ông/Bà')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (103, 2, N'001202000008', N'Vợ/Chồng')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (104, 3, N'001200000006', N'Chủ hộ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (105, 3, N'001200000007', N'Vợ/Chồng')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (106, 3, N'001200000010', N'Anh/Em')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (107, 3, N'001200000011', N'Con')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (109, 3, N'001200000111', N'Ông/bà')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (110, 7, N'002200000019', N'Chủ hộ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (111, 7, N'001200000111', N'Vợ/Chồng')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (112, 7, N'001202000002', N'Con')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (113, 7, N'001202000003', N'Con')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (116, 2, N'001200000011', N'Tạm trú')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (122, 16, N'001204050446', N'Chủ hộ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (125, 8, N'003300000021', N'Chủ hộ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (131, 3, N'001204050461', N'Lưu trú tạm thời')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (133, 16, N'001204050461', N'Tạm trú')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (134, 16, N'001200000001', N'Tạm trú')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (135, 3, N'001200000001', N'Lưu trú tạm thời')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (137, 29, N'005500000041', N'Chủ hộ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (138, 22, N'001202000004', N'Chủ hộ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (139, 9, N'002200000020', N'Chủ hộ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (140, 21, N'001202000001', N'Chủ hộ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (142, 25, N'004400000032', N'Chủ hộ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (143, 23, N'002200000011', N'Chủ hộ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (146, 31, N'001204050461', N'Chủ hộ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (147, 31, N'001200000012', N'Con')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (148, 2, N'001200000012', N'Tạm trú')
SET IDENTITY_INSERT [dbo].[HouseholdMembers] OFF
GO
SET IDENTITY_INSERT [dbo].[Households] ON 

INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (2, N'001200000001', 1, CAST(N'2025-03-09' AS Date))
INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (3, N'001200000006', 14, CAST(N'2025-03-10' AS Date))
INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (7, N'002200000019', 4, CAST(N'2025-03-12' AS Date))
INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (8, N'003300000021', 11, CAST(N'2025-03-12' AS Date))
INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (9, N'002200000020', 4, CAST(N'2025-03-12' AS Date))
INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (16, N'001204050446', 1, CAST(N'2025-03-19' AS Date))
INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (21, N'001202000001', 3, CAST(N'2025-03-19' AS Date))
INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (22, N'001202000004', 4, CAST(N'2025-03-19' AS Date))
INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (23, N'002200000011', 5, CAST(N'2025-03-19' AS Date))
INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (24, N'003300000023', 7, CAST(N'2025-03-19' AS Date))
INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (25, N'004400000032', 10, CAST(N'2025-03-19' AS Date))
INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (29, N'005500000041', 11, CAST(N'2025-03-23' AS Date))
INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (31, N'001204050461', 2, CAST(N'2025-03-25' AS Date))
SET IDENTITY_INSERT [dbo].[Households] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 

INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (1, N'005500000050', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-11T23:02:24.207' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (2, N'001200000004', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-11T23:32:43.880' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (3, N'002200000016', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-12T12:02:25.773' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (4, N'002200000016', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-12T12:02:42.423' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (5, N'002200000016', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-12T12:05:58.037' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (6, N'001200000012', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-12T13:04:33.117' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (7, N'001200000012', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-12T13:04:44.063' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (8, N'001200000012', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-12T13:04:46.570' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (9, N'001204050456', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-12T13:08:14.660' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (10, N'002200000019', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-12T13:11:46.940' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (11, N'002200000019', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-12T13:15:02.617' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (12, N'003300000021', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-12T13:22:39.837' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (13, N'003300000021', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-12T13:22:49.533' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (14, N'001200000004', N'Đơn của bạn đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-12T16:12:34.823' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (15, N'001200000004', N'Đơn của bạn đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-12T16:14:44.977' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (16, N'002200000020', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-12T16:16:04.440' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (17, N'001200000012', N'Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-12T16:30:27.387' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (18, N'001200000010', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-12T17:00:39.680' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (19, N'001200000010', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-12T17:00:51.903' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (20, N'001200000010', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-12T17:02:16.513' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (21, N'001200000010', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-12T17:02:26.210' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (22, N'001200000012', N'Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-12T17:15:36.317' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (23, N'001200000012', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-12T17:15:45.777' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (24, N'001200000004', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-12T17:15:52.980' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (25, N'001200000004', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-12T17:15:58.080' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (26, N'001204050461', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-12T17:16:01.903' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (27, N'001200000012', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-12T17:16:19.487' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (28, N'001200000010', N'Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-12T17:16:57.330' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (29, N'001200000010', N'Đơn tách hộ khẩu của bạn đã được duyệt!', CAST(N'2025-03-12T17:22:53.907' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (30, N'002200000020', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-12T17:28:31.153' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (31, N'001200000001', N'Đơn của bạn đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-12T17:54:43.783' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (32, N'001200000001', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-12T17:59:17.503' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (33, N'001200000001', N'Đơn của bạn đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-12T17:59:31.490' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (34, N'001200000001', N'Đơn tách hộ khẩu của bạn đã được duyệt!', CAST(N'2025-03-12T18:20:51.353' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (35, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-14T14:47:52.160' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (36, N'001204050461', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-14T14:50:07.377' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (37, N'001204050461', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-14T14:50:19.090' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (38, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-14T14:50:47.800' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (39, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-14T14:51:00.223' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (40, N'001200000011', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-15T12:07:31.127' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (41, N'001200000011', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-15T12:07:59.190' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (42, N'001200000011', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-15T12:08:03.933' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (43, N'001200000111', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-15T12:30:40.333' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (44, N'001200000111', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-15T12:31:23.980' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (45, N'001200000011', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-15T12:34:42.863' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (46, N'001200000011', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-15T12:41:50.650' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (47, N'001200000011', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-15T12:41:54.583' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (48, N'001202000010', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-15T12:44:23.680' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (49, N'001204050446', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-19T08:17:39.160' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (50, N'001204050446', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-19T08:19:30.053' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (51, N'001204050446', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-19T08:20:07.833' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (52, N'001204050446', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-19T10:15:15.813' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (53, N'001202000010', N'Đơn của bạn bị từ chối vì: KHông thích duyệt', CAST(N'2025-03-19T16:16:53.277' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (54, N'001200000011', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-19T16:22:14.287' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (55, N'001200000011', N'Đơn của bạn bị từ chối vì: KHông thích duyệt', CAST(N'2025-03-19T16:22:21.750' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (56, N'001200000011', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-19T16:22:56.570' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (57, N'001200000011', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-19T16:23:08.130' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (58, N'001200000011', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-19T16:25:12.340' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (59, N'001200000011', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-19T16:25:26.383' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (60, N'001200000011', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-19T16:42:04.160' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (61, N'001200000011', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-19T16:42:46.210' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (62, N'001200000011', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-19T16:47:33.020' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (63, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-19T19:05:25.460' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (64, N'001204050461', N'Đơn của bạn bị từ chối vì: KHông thích duyệt', CAST(N'2025-03-19T19:05:32.023' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (65, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-19T23:38:43.550' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (66, N'001204050461', N'Đơn của bạn bị từ chối vì: Không thích duyệt', CAST(N'2025-03-19T23:39:16.920' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (67, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-19T23:40:20.547' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (68, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-20T08:02:09.287' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (69, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-20T08:02:50.090' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (70, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-20T08:02:57.120' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (71, N'001200000010', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-20T08:09:11.250' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (72, N'001200000010', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-20T08:10:11.417' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (73, N'001204050461', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-20T08:26:06.720' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (74, N'001204050461', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-20T08:26:09.040' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (75, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-20T08:27:18.107' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (76, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-20T08:27:18.150' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (77, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-20T08:27:34.610' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (78, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-20T08:27:56.703' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (79, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-20T08:27:56.717' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (80, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-20T08:28:21.720' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (81, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-20T08:28:36.370' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (82, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-20T09:15:26.013' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (83, N'001204050461', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-20T09:15:34.243' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (84, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-20T09:15:39.210' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (85, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-20T09:18:08.343' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (86, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-20T09:18:17.087' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (87, N'001200000011', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-20T16:10:25.433' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (88, N'001200000011', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-20T16:10:42.550' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (89, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-20T16:13:56.943' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (90, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-20T16:17:02.283' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (91, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-20T16:17:10.380' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (92, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-20T16:17:16.370' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (93, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-20T16:19:54.447' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (94, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-20T16:19:57.607' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (95, N'001204050461', N'Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-20T16:21:01.577' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (96, N'001204050461', N'Đơn tách hộ khẩu của bạn đã được duyệt!', CAST(N'2025-03-20T16:21:09.543' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (97, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-20T16:21:21.563' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (98, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-20T16:21:30.200' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (99, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-20T16:21:39.383' AS DateTime), 0)
GO
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (100, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-20T16:21:43.890' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (101, N'001204050461', N'Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-20T16:22:43.340' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (102, N'001204050461', N'Đơn tách hộ khẩu của bạn đã được duyệt!', CAST(N'2025-03-20T16:22:50.647' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (103, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-22T22:06:00.620' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (104, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-22T22:06:06.700' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (105, N'001204050461', N'Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-22T22:06:41.527' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (106, N'001204050461', N'Đơn tách hộ khẩu của bạn đã được duyệt!', CAST(N'2025-03-22T22:06:44.870' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (107, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-23T01:34:55.550' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (108, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-23T01:35:03.290' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (109, N'001204050461', N'Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-23T01:42:19.967' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (110, N'001204050461', N'Đơn tách hộ khẩu của bạn đã được duyệt!', CAST(N'2025-03-23T01:42:36.213' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (111, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-23T01:51:19.990' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (112, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-23T01:51:27.273' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (113, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-23T01:52:35.510' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (114, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-23T01:52:44.407' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (115, N'001204050461', N'Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-23T01:53:58.070' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (116, N'001204050461', N'Đơn tách hộ khẩu của bạn đã được duyệt!', CAST(N'2025-03-23T01:54:01.997' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (117, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-23T01:54:21.087' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (118, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-23T01:54:26.210' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (119, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-23T01:54:34.117' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (120, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-23T01:54:40.197' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (121, N'001204050461', N'Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-23T01:56:11.783' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (122, N'001204050461', N'Đơn tách hộ khẩu của bạn đã được duyệt!', CAST(N'2025-03-23T01:56:15.840' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (123, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-23T13:04:34.320' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (124, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-23T13:04:38.940' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (125, N'001204050461', N'Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-23T13:05:58.337' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (126, N'001200000001', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-23T13:06:43.130' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (127, N'001200000001', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-23T13:06:56.493' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (128, N'001200000001', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-23T13:07:15.460' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (129, N'001200000001', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-23T13:07:17.223' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (130, N'001200000001', N'Đơn của bạn đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-23T13:08:28.377' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (131, N'001200000011', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-23T13:13:02.097' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (132, N'001200000011', N'Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-23T14:10:07.430' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (133, N'001200000011', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-25T09:24:37.970' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (134, N'001204050461', N'Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-25T10:36:43.627' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (135, N'001204050461', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-25T10:37:14.847' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (136, N'001204050461', N'Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-25T11:26:07.073' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (137, N'001204050461', N'Đơn tách hộ khẩu của bạn đã được duyệt!', CAST(N'2025-03-25T11:26:13.030' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (138, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-25T11:26:33.833' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (139, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-25T11:26:40.650' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (140, N'001200000012', N'Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-25T11:27:24.143' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (141, N'001200000012', N'Đơn tách hộ khẩu của bạn đã được duyệt!', CAST(N'2025-03-25T11:27:34.800' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (142, N'001200000012', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-25T11:28:02.160' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (143, N'001200000012', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-25T11:28:14.150' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (144, N'001200000012', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-25T11:31:52.907' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (145, N'001200000012', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-25T11:33:46.877' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[PendingHousehold] ON 

INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (1, 1, N'001200000001', 0, N'Vợ/Chồng', N'001200000004', CAST(N'2025-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (2, 2, N'001200000001', 0, N'Anh/Chị/Em', N'001200000004', CAST(N'2025-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (3, 3, N'001200000001', 0, N'Con', N'001200000004', CAST(N'2025-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (4, 4, N'001204050461', 0, N'Con', N'001200000004', CAST(N'2025-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (5, 7, N'001204050461', 0, N'Con', N'001200000012', CAST(N'2025-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (7, 8, N'001204050461', 1, N'Chủ hộ', N'001204050461', CAST(N'2025-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (8, 10, N'001204050456', 13, N'Chủ hộ', N'001204050456', CAST(N'2025-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (9, 11, N'005500000050', 12, N'Chủ hộ', N'005500000050', CAST(N'2025-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (10, 12, N'002200000016', 7, N'Chủ hộ', N'002200000016', CAST(N'2025-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (11, 13, N'001200000006', 0, N'Anh/Chị/Em', N'001200000012', CAST(N'2025-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (12, 14, N'002200000019', 4, N'Chủ hộ', N'002200000019', CAST(N'2025-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (13, 15, N'003300000021', 11, N'Chủ hộ', N'003300000021', CAST(N'2025-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (14, 18, N'002200000020', 4, N'Chủ hộ', N'002200000020', CAST(N'2025-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (15, 20, N'001200000001', 0, N'Con', N'001200000010', CAST(N'2025-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (16, 21, N'001200000001', 0, N'Con', N'001200000010', CAST(N'2025-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (17, 25, N'001200000001', 1, N'Chủ hộ', N'001200000001', CAST(N'2025-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (18, 26, N'001200000001', 0, N'Con', N'001204050461', CAST(N'2025-03-14T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (19, 27, N'001200000001', 1, N'Con', N'001204050461', CAST(N'2025-03-14T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (20, 28, N'001200000001', 1, N'Anh/Chị/Em', N'001200000011', CAST(N'2025-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (21, 29, N'001200000011', 11, N'Chủ hộ', N'001200000011', CAST(N'2025-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (22, 30, N'003300000021', 11, N'Cha/Mẹ', N'001200000111', CAST(N'2025-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (23, 31, N'001200000011', 11, N'Chủ hộ', N'001200000011', CAST(N'2025-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (24, 32, N'001200000011', 11, N'Con', N'001202000010', CAST(N'2025-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (25, 33, N'001204050446', 14, N'Chủ hộ', N'001204050446', CAST(N'2025-03-19T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (26, 34, N'001204050446', 2, N'Chủ hộ', N'001204050446', CAST(N'2025-03-19T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (27, 35, N'001200000011', 11, N'Chủ hộ', N'001200000011', CAST(N'2025-03-19T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (28, 36, N'001200000011', 11, N'Chủ hộ', N'001200000011', CAST(N'2025-03-19T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (29, 37, N'001200000011', 11, N'Chủ hộ', N'001200000011', CAST(N'2025-03-19T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (30, 38, N'001204050446', 2, N'Con', N'001200000011', CAST(N'2025-03-19T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (31, 39, N'001204050461', 1, N'Chủ hộ', N'001204050461', CAST(N'2025-03-19T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (32, 40, N'001204050446', 2, N'Ông/Bà', N'001204050461', CAST(N'2025-03-19T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (33, 41, N'001204050461', 1, N'Chủ hộ', N'001204050461', CAST(N'2025-03-19T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (34, 42, N'001204050446', 1, N'Khác', N'001204050461', CAST(N'2025-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (35, 43, N'001204050446', 1, N'Con', N'001204050461', CAST(N'2025-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (36, 44, N'001204050446', 1, N'Khác', N'001200000010', CAST(N'2025-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (37, 45, N'001204050446', 1, N'Tạm trú', N'001204050461', CAST(N'2025-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (38, 46, N'001204050446', 1, N'Tạm trú', N'001204050461', CAST(N'2025-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (39, 47, N'002200000020', 4, N'Tạm trú', N'001204050461', CAST(N'2025-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (40, 48, N'002200000020', 4, N'Tạm trú', N'001204050461', CAST(N'2025-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (41, 49, N'001200000001', 1, N'Tạm trú', N'001204050461', CAST(N'2025-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (42, 50, N'001200000006', 14, N'Tạm trú', N'001204050461', CAST(N'2025-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (43, 51, N'001200000001', 1, N'Tạm trú', N'001200000011', CAST(N'2025-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (44, 52, N'001204050446', 1, N'Lưu trú tạm thời', N'001204050461', CAST(N'2025-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (45, 53, N'001204050446', 1, N'Tạm trú', N'001204050461', CAST(N'2025-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (46, 54, N'001204050446', 1, N'Tạm trú', N'001204050461', CAST(N'2025-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (47, 56, N'001204050446', 1, N'Con', N'001204050461', CAST(N'2025-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (48, 57, N'001200000001', 1, N'Tạm trú', N'001204050461', CAST(N'2025-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (49, 59, N'001200000001', 1, N'Tạm trú', N'001204050461', CAST(N'2025-03-22T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (50, 61, N'001200000001', 1, N'Tạm trú', N'001204050461', CAST(N'2025-03-22T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (51, 63, N'001204050461', 1, N'Tạm trú', N'001204050461', CAST(N'2025-03-22T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (52, 64, N'001204050446', 1, N'Tạm trú', N'001204050461', CAST(N'2025-03-22T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (53, 65, N'001200000001', 1, N'Con', N'001204050461', CAST(N'2025-03-22T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (54, 66, N'001204050461', 1, N'Con', N'001204050461', CAST(N'2025-03-22T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (55, 67, N'001200000006', 14, N'Lưu trú tạm thời', N'001204050461', CAST(N'2025-03-22T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (56, 68, N'001200000001', 1, N'Con', N'001204050461', CAST(N'2025-03-22T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (57, 69, N'001204050461', 1, N'Tạm trú', N'001204050461', CAST(N'2025-03-22T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (58, 70, N'001204050446', 1, N'Tạm trú', N'001204050461', CAST(N'2025-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (59, 71, N'001204050461', 1, N'Tạm trú', N'001204050461', CAST(N'2025-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (60, 72, N'001204050446', 1, N'Tạm trú', N'001200000001', CAST(N'2025-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (61, 73, N'001200000006', 14, N'Lưu trú tạm thời', N'001200000001', CAST(N'2025-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (62, 74, N'001200000001', 11, N'Chủ hộ', N'001200000001', CAST(N'2025-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (63, 75, N'005500000041', 11, N'Lưu trú tạm thời', N'001200000011', CAST(N'2025-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (64, 76, N'001200000011', 14, N'Con', N'001200000011', CAST(N'2025-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (65, 77, N'001204050461', 14, N'Lưu trú tạm thời', N'001204050461', CAST(N'2025-03-25T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (66, 78, N'001204050461', 1, N'Con', N'001204050461', CAST(N'2025-03-25T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (67, 79, N'001204050461', 2, N'Chủ hộ', N'001204050461', CAST(N'2025-03-25T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (68, 80, N'001200000012', 1, N'Con', N'001200000012', CAST(N'2025-03-25T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (69, 81, N'001204050461', 2, N'Con', N'001200000012', CAST(N'2025-03-25T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (70, 82, N'001200000001', 1, N'Tạm trú', N'001200000012', CAST(N'2025-03-25T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[PendingHousehold] OFF
GO
SET IDENTITY_INSERT [dbo].[Registrations] ON 

INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (1, N'001200000004', N'Dài hạn', CAST(N'2025-03-11' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (2, N'001200000004', N'Tạm thời', CAST(N'2025-03-11' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (3, N'001200000004', N'Tạm thời', CAST(N'2025-03-11' AS Date), NULL, N'Bị từ chối', NULL, N'B?n d? ? trong h? kh?u r')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (4, N'001200000004', N'Dài hạn', CAST(N'2025-03-11' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (7, N'001200000012', N'Dài hạn', CAST(N'2025-03-11' AS Date), NULL, N'Bị từ chối', NULL, N'Không t?n t?i h? kh?u')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (8, N'001204050461', N'Tạo hộ khẩu', CAST(N'2025-03-11' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (9, N'001204050461', N'Tạo hộ khẩu', CAST(N'2025-03-11' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (10, N'001204050456', N'Tạo hộ khẩu', CAST(N'2025-03-11' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (11, N'005500000050', N'Tạo hộ khẩu', CAST(N'2025-03-11' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (12, N'002200000016', N'Tạo hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (13, N'001200000012', N'Tạm thời', CAST(N'2025-03-12' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (14, N'002200000019', N'Tạo hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (15, N'003300000021', N'Tạo hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (16, N'001200000004', N'Tách hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (17, N'001200000004', N'Tách hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (18, N'002200000020', N'Tạo hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (19, N'001200000012', N'Tách hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (20, N'001200000010', N'Dài hạn', CAST(N'2025-03-12' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (21, N'001200000010', N'Dài hạn', CAST(N'2025-03-12' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (22, N'001200000012', N'Tách hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (23, N'001200000010', N'Tách hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (24, N'001200000001', N'Chuyển hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (25, N'001200000001', N'Chuyển hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (26, N'001204050461', N'Dài hạn', CAST(N'2025-03-14' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (27, N'001204050461', N'Dài hạn', CAST(N'2025-03-14' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (28, N'001200000011', N'Dài hạn', CAST(N'2025-03-15' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (29, N'001200000011', N'Tạo hộ khẩu', CAST(N'2025-03-15' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (30, N'001200000111', N'Dài hạn', CAST(N'2025-03-15' AS Date), NULL, N'Đã được chấp thuận', N'001200000011', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (31, N'001200000011', N'Tạo hộ khẩu', CAST(N'2025-03-15' AS Date), NULL, N'Đã được chấp thuận', N'001200000011', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (32, N'001202000010', N'Dài hạn', CAST(N'2025-03-15' AS Date), NULL, N'Bị từ chối', NULL, N'KHông thích duy?t')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (33, N'001204050446', N'Tạo hộ khẩu', CAST(N'2025-03-19' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (34, N'001204050446', N'Tạo hộ khẩu', CAST(N'2025-03-19' AS Date), NULL, N'Đã được chấp thuận', N'001204050446', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (35, N'001200000011', N'Tạo hộ khẩu', CAST(N'2025-03-19' AS Date), NULL, N'Bị từ chối', NULL, N'KHông thích duy?t')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (36, N'001200000011', N'Tạo hộ khẩu', CAST(N'2025-03-19' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (37, N'001200000011', N'Tạo hộ khẩu', CAST(N'2025-03-19' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (38, N'001200000011', N'Dài hạn', CAST(N'2025-03-19' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (39, N'001204050461', N'Tạo hộ khẩu', CAST(N'2025-03-19' AS Date), NULL, N'Bị từ chối', NULL, N'KHông thích duy?t')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (40, N'001204050461', N'Dài hạn', CAST(N'2025-03-19' AS Date), NULL, N'Bị từ chối', NULL, N'Không thích duy?t')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (41, N'001204050461', N'Tạo hộ khẩu', CAST(N'2025-03-19' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (42, N'001204050461', N'Tạm thời', CAST(N'2025-03-20' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (43, N'001204050461', N'Dài hạn', CAST(N'2025-03-20' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (44, N'001200000010', N'Tạm thời', CAST(N'2025-03-20' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (45, N'001204050461', N'Tạm thời', CAST(N'2025-03-20' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (46, N'001204050461', N'Tạm thời', CAST(N'2025-03-20' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (47, N'001204050461', N'Tạm thời', CAST(N'2025-03-20' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (48, N'001204050461', N'Tạm thời', CAST(N'2025-03-20' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (49, N'001204050461', N'Tạm thời', CAST(N'2025-03-20' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (50, N'001204050461', N'Tạm thời', CAST(N'2025-03-20' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (51, N'001200000011', N'Tạm thời', CAST(N'2025-03-20' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (52, N'001204050461', N'Lưu trú tạm thời', CAST(N'2025-03-20' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (53, N'001204050461', N'Tạm thời', CAST(N'2025-03-20' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (54, N'001204050461', N'Tạm thời', CAST(N'2025-03-20' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (55, N'001204050461', N'Tách hộ khẩu', CAST(N'2025-03-20' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (56, N'001204050461', N'Dài hạn', CAST(N'2025-03-20' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (57, N'001204050461', N'Tạm thời', CAST(N'2025-03-20' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (58, N'001204050461', N'Tách hộ khẩu', CAST(N'2025-03-20' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (59, N'001204050461', N'Tạm thời', CAST(N'2025-03-22' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (60, N'001204050461', N'Tách hộ khẩu', CAST(N'2025-03-22' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (61, N'001204050461', N'Tạm thời', CAST(N'2025-03-22' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (62, N'001204050461', N'Tách hộ khẩu', CAST(N'2025-03-22' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (63, N'001204050461', N'Tách hộ khẩu', CAST(N'2025-03-22' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (64, N'001204050461', N'Tạm thời', CAST(N'2025-03-22' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (65, N'001204050461', N'Dài hạn', CAST(N'2025-03-22' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (66, N'001204050461', N'Tách hộ khẩu', CAST(N'2025-03-22' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (67, N'001204050461', N'Lưu trú tạm thời', CAST(N'2025-03-22' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (68, N'001204050461', N'Dài hạn', CAST(N'2025-03-22' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (69, N'001204050461', N'Tách hộ khẩu', CAST(N'2025-03-22' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (70, N'001204050461', N'Tạm thời', CAST(N'2025-03-23' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (71, N'001204050461', N'Tách hộ khẩu', CAST(N'2025-03-23' AS Date), NULL, N'Đang chờ xử lý', NULL, NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (72, N'001200000001', N'Tạm thời', CAST(N'2025-03-23' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (73, N'001200000001', N'Lưu trú tạm thời', CAST(N'2025-03-23' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (74, N'001200000001', N'Chuyển hộ khẩu', CAST(N'2025-03-23' AS Date), NULL, N'Đang chờ xử lý', NULL, NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (75, N'001200000011', N'Lưu trú tạm thời', CAST(N'2025-03-23' AS Date), NULL, N'Đã được chấp thuận', N'001200000011', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (76, N'001200000011', N'Tách hộ khẩu', CAST(N'2025-03-23' AS Date), NULL, N'Đang chờ xử lý', NULL, NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (77, N'001204050461', N'Tách hộ khẩu', CAST(N'2025-03-25' AS Date), NULL, N'Đang chờ xử lý', NULL, NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (78, N'001204050461', N'Tách hộ khẩu', CAST(N'2025-03-25' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (79, N'001204050461', N'Tạo hộ khẩu', CAST(N'2025-03-25' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (80, N'001200000012', N'Tách hộ khẩu', CAST(N'2025-03-25' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (81, N'001200000012', N'Dài hạn', CAST(N'2025-03-25' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (82, N'001200000012', N'Tạm thời', CAST(N'2025-03-25' AS Date), NULL, N'Đã được chấp thuận', N'001200000010', NULL)
SET IDENTITY_INSERT [dbo].[Registrations] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (3, N'Cảnh sát')
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (2, N'Công dân')
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (4, N'Tổ trưởng')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001200000001', N'Nguyễn Văn Chỉnh', CAST(N'1990-05-15' AS Date), N'nam.nguyen90@gmail.com', N'0912000111', N'M', N'1', 2, 11, 1)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001200000004', N'Lê Thị Hạnh', CAST(N'1995-03-25' AS Date), N'hanh.le250395@gmail.com', N'0912000004', N'F', N'123', 2, 1, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001200000006', N'Hoàng Thị Mai', CAST(N'1988-06-05' AS Date), N'mai.hoang88@gmail.com', N'0912000006', N'F', N'1', 2, 14, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001200000007', N'Đỗ Văn Tùng', CAST(N'1998-01-30' AS Date), N'tung.do98@gmail.com', N'0912000007', N'M', N'123456', 2, 1, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001200000010', N'Tạ Thị Thu', CAST(N'1996-08-07' AS Date), N'thu.ta96@gmail.com', N'0912000010', N'F', N'1', 3, 1, 1)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001200000011', N'Nguyễn Thùy Linh', CAST(N'2004-03-02' AS Date), N'thuylinhnguyen@gmail.com', N'0862234599', N'F', N'1', 4, 11, 1)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001200000012', N'Nguyễn Minh Đức', CAST(N'2025-02-26' AS Date), N'minhducnguyen@gmail.com', N'0862234598', N'M', N'1', 2, 1, 1)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001200000111', N'Trần Thị Mẫn', CAST(N'1980-03-26' AS Date), N'tranthiman123@gmail.com', N'0365544759', N'F', N'1', 2, 1, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000001', N'Nguyễn Văn An', CAST(N'1985-04-12' AS Date), N'an.nguyen85@gmail.com', N'0912000115', N'M', N'1', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000002', N'Trần Thị Bích', CAST(N'1992-07-20' AS Date), N'bich.tran92@gmail.com', N'0912000116', N'F', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000003', N'Lê Minh Tuấn', CAST(N'1990-10-05' AS Date), N'tuan.le90@gmail.com', N'0912000117', N'M', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000004', N'Phạm Hoàng Nam', CAST(N'1988-03-15' AS Date), N'nam.pham88@gmail.com', N'0912000118', N'M', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000006', N'Bùi Văn Hậu', CAST(N'1993-06-30' AS Date), N'hau.bui93@gmail.com', N'0912000120', N'M', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000007', N'Võ Thị Lan', CAST(N'1991-11-22' AS Date), N'lan.vo91@gmail.com', N'0912000121', N'F', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000008', N'Hoàng Minh Hải', CAST(N'1987-08-14' AS Date), N'hai.hoang87@gmail.com', N'0912000122', N'M', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000009', N'Nguyễn Thị Thu', CAST(N'1996-05-18' AS Date), N'thu.nguyen96@gmail.com', N'0912000123', N'F', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000010', N'Trịnh Công Thành', CAST(N'1989-12-09' AS Date), N'thanh.trinh89@gmail.com', N'0912000124', N'M', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000011', N'Lê Thị Mai', CAST(N'1994-07-07' AS Date), N'mai.le94@gmail.com', N'0912000125', N'F', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000012', N'Nguyễn Hữu Tùng', CAST(N'1992-01-28' AS Date), N'tung.nguyen92@gmail.com', N'0912000126', N'M', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000013', N'Phạm Thùy Linh', CAST(N'1997-04-05' AS Date), N'linh.pham97@gmail.com', N'0912000127', N'F', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000014', N'Đoàn Văn Tiến', CAST(N'1990-02-17' AS Date), N'tien.doan90@gmail.com', N'0912000128', N'M', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000015', N'Lý Thu Hương', CAST(N'1993-10-31' AS Date), N'huong.ly93@gmail.com', N'0912000129', N'F', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000016', N'Trần Đăng Khoa', CAST(N'1991-06-06' AS Date), N'khoa.tran91@gmail.com', N'0912000130', N'M', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001204050446', N'Nguyễn Minh Phúc', CAST(N'2004-12-29' AS Date), N'nguyenminhphuc@gmail.com', N'0326930890', N'M', N'1', 3, 2, 1)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001204050456', N'Tạ Thanh Tùng', CAST(N'2004-02-01' AS Date), N'tathanhtung@gmail.com', N'0332435454', N'M', N'1', 2, 2, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001204050461', N'Đỗ Hữu Đức', CAST(N'2004-01-01' AS Date), N'dohuuduc@gmail.com', N'0376226204', N'M', N'1', 1, 1, 1)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000011', N'Nguyễn Hữu Long', CAST(N'1987-02-15' AS Date), N'long.nguyen87@gmail.com', N'0912000011', N'M', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000012', N'Trần Minh Hoàng', CAST(N'1994-05-10' AS Date), N'hoang.tran94@gmail.com', N'0912000012', N'M', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000013', N'Phan Thị Hương', CAST(N'1989-07-25' AS Date), N'huong.phan89@gmail.com', N'0912000013', N'F', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000014', N'Bùi Văn Hải', CAST(N'1991-09-08' AS Date), N'hai.bui91@gmail.com', N'0912000014', N'M', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000015', N'Lê Hoàng Phúc', CAST(N'1995-12-22' AS Date), N'phuc.le95@gmail.com', N'0912000015', N'M', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000016', N'Đặng Thị Hoa', CAST(N'1986-10-01' AS Date), N'hoa.dang86@gmail.com', N'0912000016', N'F', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000017', N'Vũ Văn Thịnh', CAST(N'1993-06-14' AS Date), N'thinh.vu93@gmail.com', N'0912000017', N'M', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000018', N'Tạ Thị Hiền', CAST(N'1980-11-29' AS Date), N'hien.ta80@gmail.com', N'0912000018', N'F', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000019', N'Hoàng Minh Tâm', CAST(N'1999-03-05' AS Date), N'tam.hoang99@gmail.com', N'0912000019', N'M', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000020', N'Nguyễn Văn Hùng', CAST(N'2002-08-17' AS Date), N'hung.nguyen02@gmail.com', N'0912000020', N'M', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000021', N'Nguyễn Văn An', CAST(N'1990-01-10' AS Date), N'an.nguyen90@gmail.com', N'0912000021', N'M', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000022', N'Trần Thị Bình', CAST(N'1995-06-22' AS Date), N'binh.tran95@gmail.com', N'0912000022', N'F', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000023', N'Phạm Hoàng Sơn', CAST(N'1988-03-14' AS Date), N'son.pham88@gmail.com', N'0912000023', N'M', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000024', N'Lê Minh Châu', CAST(N'1992-12-05' AS Date), N'chau.le92@gmail.com', N'0912000024', N'F', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000025', N'Hoàng Văn Kiên', CAST(N'1994-09-30' AS Date), N'kien.hoang94@gmail.com', N'0912000025', N'M', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000026', N'Ngô Thị Lan', CAST(N'1987-07-07' AS Date), N'lan.ngo87@gmail.com', N'0912000026', N'F', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000027', N'Vũ Hữu Hạnh', CAST(N'1996-11-18' AS Date), N'hanh.vu96@gmail.com', N'0912000027', N'M', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000028', N'Bùi Văn Hùng', CAST(N'1989-05-24' AS Date), N'hung.bui89@gmail.com', N'0912000028', N'M', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000029', N'Đỗ Minh Tú', CAST(N'1993-04-11' AS Date), N'tu.do93@gmail.com', N'0912000029', N'F', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000030', N'Tạ Văn Tín', CAST(N'2001-08-08' AS Date), N'tin.ta01@gmail.com', N'0912000030', N'M', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000031', N'Nguyễn Thị Hương', CAST(N'1990-10-15' AS Date), N'huong.nguyen90@gmail.com', N'0912000031', N'F', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000032', N'Trần Văn Hải', CAST(N'1985-12-22' AS Date), N'hai.tran85@gmail.com', N'0912000032', N'M', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000033', N'Phạm Minh Đức', CAST(N'1998-04-04' AS Date), N'duc.pham98@gmail.com', N'0912000033', N'M', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000034', N'Lê Thanh Hoa', CAST(N'1991-06-14' AS Date), N'hoa.le91@gmail.com', N'0912000034', N'F', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000035', N'Bùi Hữu Nghĩa', CAST(N'1993-08-19' AS Date), N'nghia.bui93@gmail.com', N'0912000035', N'M', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000036', N'Hoàng Thị Bích', CAST(N'2000-05-29' AS Date), N'bich.hoang00@gmail.com', N'0912000036', N'F', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000037', N'Ngô Minh Tuấn', CAST(N'1995-02-10' AS Date), N'tuan.ngo95@gmail.com', N'0912000037', N'M', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000038', N'Vũ Thị Vân', CAST(N'1986-07-17' AS Date), N'van.vu86@gmail.com', N'0912000038', N'F', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000039', N'Đỗ Văn Thanh', CAST(N'1997-03-03' AS Date), N'thanh.do97@gmail.com', N'0912000039', N'M', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000040', N'Tạ Hữu Lâm', CAST(N'2002-01-20' AS Date), N'lam.ta02@gmail.com', N'0912000040', N'M', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'005500000041', N'Nguyễn Văn Tuấn', CAST(N'1990-09-12' AS Date), N'tuan.nguyen90@gmail.com', N'0912000041', N'M', N'123456', 2, 10, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'005500000042', N'Trần Thị Ngọc', CAST(N'1993-06-24' AS Date), N'ngoc.tran93@gmail.com', N'0912000042', N'F', N'123456', 2, 10, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'005500000044', N'Lê Văn Lộc', CAST(N'1992-04-08' AS Date), N'loc.le92@gmail.com', N'0912000044', N'M', N'123456', 2, 10, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'005500000045', N'Hoàng Thị Kim', CAST(N'2000-02-02' AS Date), N'kim.hoang00@gmail.com', N'0912000045', N'F', N'123456', 2, 10, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'005500000046', N'Ngô Minh Hưng', CAST(N'1987-08-30' AS Date), N'hung.ngo87@gmail.com', N'0912000046', N'M', N'123456', 2, 10, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'005500000050', N'Nguyễn Văn Tiến', CAST(N'2001-12-12' AS Date), N'tien.nguyen01@gmail.com', N'0912000050', N'M', N'1', 2, 10, 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__B194786164550FB6]    Script Date: 7/5/2025 4:54:07 PM ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[roleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__4849DA0193FC4917]    Script Date: 7/5/2025 4:54:07 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[phoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E616410487F1F]    Script Date: 7/5/2025 4:54:07 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Households] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Logs] ADD  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (getdate()) FOR [sentDate]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [isRead]
GO
ALTER TABLE [dbo].[PendingHousehold] ADD  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Registrations] ADD  DEFAULT (N'Đang chờ xử lý') FOR [status]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[HouseholdMembers]  WITH CHECK ADD FOREIGN KEY([householdId])
REFERENCES [dbo].[Households] ([householdId])
GO
ALTER TABLE [dbo].[HouseholdMembers]  WITH CHECK ADD FOREIGN KEY([cccd])
REFERENCES [dbo].[Users] ([cccd])
GO
ALTER TABLE [dbo].[Households]  WITH CHECK ADD FOREIGN KEY([addressId])
REFERENCES [dbo].[Address] ([addressId])
GO
ALTER TABLE [dbo].[Households]  WITH CHECK ADD FOREIGN KEY([headOfHouseholdCccd])
REFERENCES [dbo].[Users] ([cccd])
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD FOREIGN KEY([cccd])
REFERENCES [dbo].[Users] ([cccd])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK__Notificati__cccd__693CA210] FOREIGN KEY([cccd])
REFERENCES [dbo].[Users] ([cccd])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK__Notificati__cccd__693CA210]
GO
ALTER TABLE [dbo].[PendingHousehold]  WITH CHECK ADD FOREIGN KEY([registrationId])
REFERENCES [dbo].[Registrations] ([registrationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD FOREIGN KEY([approvedBy])
REFERENCES [dbo].[Users] ([cccd])
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD FOREIGN KEY([cccd])
REFERENCES [dbo].[Users] ([cccd])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([addressID])
REFERENCES [dbo].[Address] ([addressId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[Roles] ([roleId])
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD CHECK  (([registrationType]=N'Tạo hộ khẩu' OR [registrationType]=N'Chuyển hộ khẩu' OR [registrationType]=N'Tách hộ khẩu' OR [registrationType]=N'Lưu trú tạm thời' OR [registrationType]=N'Tạm thời' OR [registrationType]=N'Dài hạn'))
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD CHECK  (([status]=N'Bị từ chối' OR [status]=N'Đã được chấp thuận' OR [status]=N'Đang chờ xử lý'))
GO
USE [master]
GO
ALTER DATABASE [Household] SET  READ_WRITE 
GO
