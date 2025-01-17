
/****** Object:  Database [SchooolDB_api]    Script Date: 9/16/2024 9:28:40 PM ******/
CREATE DATABASE [SchooolDB_api]
GO

use SchooolDB_api
go

CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuildingRooms]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildingRooms](
	[BuildingRoomId] [int] IDENTITY(1,1) NOT NULL,
	[BuildingId] [int] NOT NULL,
	[RoomNumber] [int] NOT NULL,
 CONSTRAINT [PK_BuildingRooms] PRIMARY KEY CLUSTERED 
(
	[BuildingRoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buildings](
	[BuildingId] [int] IDENTITY(1,1) NOT NULL,
	[BuildingName] [nvarchar](max) NOT NULL,
	[SchoolId] [int] NOT NULL,
 CONSTRAINT [PK_Buildings] PRIMARY KEY CLUSTERED 
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campus]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campus](
	[CampusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CurriculumId] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[ShiftId] [int] NOT NULL,
	[GenderId] [int] NOT NULL,
 CONSTRAINT [PK_Campus] PRIMARY KEY CLUSTERED 
(
	[CampusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CampusClasses]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampusClasses](
	[CampusClassId] [int] IDENTITY(1,1) NOT NULL,
	[CampusId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
 CONSTRAINT [PK_CampusClasses] PRIMARY KEY CLUSTERED 
(
	[CampusClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CampusClassSections]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampusClassSections](
	[CampusClassSectionId] [int] IDENTITY(1,1) NOT NULL,
	[CampusClassId] [int] NOT NULL,
	[SectionId] [int] NOT NULL,
 CONSTRAINT [PK_CampusClassSections] PRIMARY KEY CLUSTERED 
(
	[CampusClassSectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curriculum]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curriculum](
	[CurriculumId] [int] IDENTITY(1,1) NOT NULL,
	[CurriculumName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Curriculum] PRIMARY KEY CLUSTERED 
(
	[CurriculumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderId] [int] IDENTITY(1,1) NOT NULL,
	[GenderName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guardians]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guardians](
	[GuardianId] [int] IDENTITY(1,1) NOT NULL,
	[GuardianName] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[NIDNumber] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Guardians] PRIMARY KEY CLUSTERED 
(
	[GuardianId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schools]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schools](
	[SchoolId] [int] IDENTITY(1,1) NOT NULL,
	[SchoolName] [nvarchar](max) NOT NULL,
	[SchoolLocation] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[EstablishedYear] [date] NOT NULL,
	[SchoolTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Schools] PRIMARY KEY CLUSTERED 
(
	[SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolsType]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolsType](
	[SchoolTypeId] [int] IDENTITY(1,1) NOT NULL,
	[SchoolTypeName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SchoolsType] PRIMARY KEY CLUSTERED 
(
	[SchoolTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sections]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sections](
	[SectionId] [int] IDENTITY(1,1) NOT NULL,
	[SectionName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Sections] PRIMARY KEY CLUSTERED 
(
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shifts]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shifts](
	[ShiftId] [int] IDENTITY(1,1) NOT NULL,
	[ShiftName] [nvarchar](max) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
 CONSTRAINT [PK_Shifts] PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCampusClassSections]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCampusClassSections](
	[StudentCampusClassSectionId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CampusClassSectionId] [int] NOT NULL,
 CONSTRAINT [PK_StudentCampusClassSections] PRIMARY KEY CLUSTERED 
(
	[StudentCampusClassSectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentGuardian]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGuardian](
	[StudentGuardianId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[GuardianId] [int] NOT NULL,
 CONSTRAINT [PK_StudentGuardian] PRIMARY KEY CLUSTERED 
(
	[StudentGuardianId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentFName] [nvarchar](max) NOT NULL,
	[StudentLName] [nvarchar](max) NOT NULL,
	[FatherName] [nvarchar](max) NOT NULL,
	[MotherName] [nvarchar](max) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[BirthCertificateNumber] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[GenderId] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](max) NOT NULL,
	[ClassId] [int] NOT NULL,
	[CurriculumId] [int] NOT NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [nvarchar](max) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[TeacherImage] [nvarchar](max) NULL,
	[Qualification] [nvarchar](max) NOT NULL,
	[JoinDate] [date] NOT NULL,
	[GenderId] [int] NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeachersSubject]    Script Date: 9/16/2024 9:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachersSubject](
	[TeacherSubjectId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
 CONSTRAINT [PK_TeachersSubject] PRIMARY KEY CLUSTERED 
(
	[TeacherSubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240916141645_init', N'8.0.8')
GO
SET IDENTITY_INSERT [dbo].[BuildingRooms] ON 

INSERT [dbo].[BuildingRooms] ([BuildingRoomId], [BuildingId], [RoomNumber]) VALUES (1, 1, 101)
INSERT [dbo].[BuildingRooms] ([BuildingRoomId], [BuildingId], [RoomNumber]) VALUES (2, 1, 102)
INSERT [dbo].[BuildingRooms] ([BuildingRoomId], [BuildingId], [RoomNumber]) VALUES (3, 1, 103)
INSERT [dbo].[BuildingRooms] ([BuildingRoomId], [BuildingId], [RoomNumber]) VALUES (4, 2, 104)
SET IDENTITY_INSERT [dbo].[BuildingRooms] OFF
GO
SET IDENTITY_INSERT [dbo].[Buildings] ON 

INSERT [dbo].[Buildings] ([BuildingId], [BuildingName], [SchoolId]) VALUES (1, N'Rose', 1)
INSERT [dbo].[Buildings] ([BuildingId], [BuildingName], [SchoolId]) VALUES (2, N'Sunflower', 1)
INSERT [dbo].[Buildings] ([BuildingId], [BuildingName], [SchoolId]) VALUES (4, N'Beli', 1)
SET IDENTITY_INSERT [dbo].[Buildings] OFF
GO
SET IDENTITY_INSERT [dbo].[Campus] ON 

INSERT [dbo].[Campus] ([CampusId], [Name], [CurriculumId], [SchoolId], [ShiftId], [GenderId]) VALUES (2, N'Campus-One', 1, 1, 1, 1)
INSERT [dbo].[Campus] ([CampusId], [Name], [CurriculumId], [SchoolId], [ShiftId], [GenderId]) VALUES (3, N'Campus-Two', 1, 1, 1, 2)
INSERT [dbo].[Campus] ([CampusId], [Name], [CurriculumId], [SchoolId], [ShiftId], [GenderId]) VALUES (7, N'Campus-Three', 2, 1, 2, 1)
SET IDENTITY_INSERT [dbo].[Campus] OFF
GO
SET IDENTITY_INSERT [dbo].[CampusClasses] ON 

INSERT [dbo].[CampusClasses] ([CampusClassId], [CampusId], [ClassId]) VALUES (4, 2, 1)
INSERT [dbo].[CampusClasses] ([CampusClassId], [CampusId], [ClassId]) VALUES (5, 3, 2)
INSERT [dbo].[CampusClasses] ([CampusClassId], [CampusId], [ClassId]) VALUES (6, 7, 3)
SET IDENTITY_INSERT [dbo].[CampusClasses] OFF
GO
SET IDENTITY_INSERT [dbo].[CampusClassSections] ON 

INSERT [dbo].[CampusClassSections] ([CampusClassSectionId], [CampusClassId], [SectionId]) VALUES (1, 4, 1)
INSERT [dbo].[CampusClassSections] ([CampusClassSectionId], [CampusClassId], [SectionId]) VALUES (3, 5, 1)
SET IDENTITY_INSERT [dbo].[CampusClassSections] OFF
GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (1, N'One')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (2, N'Two')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (3, N'Three')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (4, N'Four')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (5, N'Five')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (6, N'Six')
SET IDENTITY_INSERT [dbo].[Class] OFF
GO
SET IDENTITY_INSERT [dbo].[Curriculum] ON 

INSERT [dbo].[Curriculum] ([CurriculumId], [CurriculumName], [Description]) VALUES (1, N'Bangla', N'Bangla Version')
INSERT [dbo].[Curriculum] ([CurriculumId], [CurriculumName], [Description]) VALUES (2, N'English', N'English Version')
INSERT [dbo].[Curriculum] ([CurriculumId], [CurriculumName], [Description]) VALUES (3, N'Oxford', N'Oxford Version')
SET IDENTITY_INSERT [dbo].[Curriculum] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([GenderId], [GenderName]) VALUES (1, N'Male')
INSERT [dbo].[Gender] ([GenderId], [GenderName]) VALUES (2, N'Female')
INSERT [dbo].[Gender] ([GenderId], [GenderName]) VALUES (3, N'Others')
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[Guardians] ON 

INSERT [dbo].[Guardians] ([GuardianId], [GuardianName], [Phone], [NIDNumber], [Email]) VALUES (1, N'Morjina Islam', N'0123456789', N'0123654789', N'mor@gmail.com')
INSERT [dbo].[Guardians] ([GuardianId], [GuardianName], [Phone], [NIDNumber], [Email]) VALUES (2, N'Habib Khan', N'1236584555', N'65824596', N'habib@gmail.com')
SET IDENTITY_INSERT [dbo].[Guardians] OFF
GO
SET IDENTITY_INSERT [dbo].[Schools] ON 

INSERT [dbo].[Schools] ([SchoolId], [SchoolName], [SchoolLocation], [Email], [EstablishedYear], [SchoolTypeId]) VALUES (1, N'ABC High School', N'Farmgate', N'abc@gmail.com', CAST(N'2010-10-10' AS Date), 1)
INSERT [dbo].[Schools] ([SchoolId], [SchoolName], [SchoolLocation], [Email], [EstablishedYear], [SchoolTypeId]) VALUES (3, N'YWCA High School', N'HatirPool', N'ywca@gmail.com', CAST(N'2005-05-05' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Schools] OFF
GO
SET IDENTITY_INSERT [dbo].[SchoolsType] ON 

INSERT [dbo].[SchoolsType] ([SchoolTypeId], [SchoolTypeName]) VALUES (1, N'Main')
INSERT [dbo].[SchoolsType] ([SchoolTypeId], [SchoolTypeName]) VALUES (2, N'Branch')
SET IDENTITY_INSERT [dbo].[SchoolsType] OFF
GO
SET IDENTITY_INSERT [dbo].[Sections] ON 

INSERT [dbo].[Sections] ([SectionId], [SectionName]) VALUES (1, N'A')
INSERT [dbo].[Sections] ([SectionId], [SectionName]) VALUES (2, N'B')
INSERT [dbo].[Sections] ([SectionId], [SectionName]) VALUES (3, N'C')
INSERT [dbo].[Sections] ([SectionId], [SectionName]) VALUES (4, N'D')
INSERT [dbo].[Sections] ([SectionId], [SectionName]) VALUES (5, N'E')
SET IDENTITY_INSERT [dbo].[Sections] OFF
GO
SET IDENTITY_INSERT [dbo].[Shifts] ON 

INSERT [dbo].[Shifts] ([ShiftId], [ShiftName], [StartTime], [EndTime]) VALUES (1, N'Morning', CAST(N'07:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftName], [StartTime], [EndTime]) VALUES (2, N'Day', CAST(N'12:00:00' AS Time), CAST(N'05:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Shifts] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentCampusClassSections] ON 

INSERT [dbo].[StudentCampusClassSections] ([StudentCampusClassSectionId], [StudentId], [CampusClassSectionId]) VALUES (4, 1, 1)
INSERT [dbo].[StudentCampusClassSections] ([StudentCampusClassSectionId], [StudentId], [CampusClassSectionId]) VALUES (5, 2, 3)
SET IDENTITY_INSERT [dbo].[StudentCampusClassSections] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentGuardian] ON 

INSERT [dbo].[StudentGuardian] ([StudentGuardianId], [StudentId], [GuardianId]) VALUES (1, 1, 1)
INSERT [dbo].[StudentGuardian] ([StudentGuardianId], [StudentId], [GuardianId]) VALUES (2, 2, 2)
SET IDENTITY_INSERT [dbo].[StudentGuardian] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentId], [StudentFName], [StudentLName], [FatherName], [MotherName], [DateOfBirth], [Image], [BirthCertificateNumber], [Address], [GenderId]) VALUES (1, N'Mamun Khan', N'Islam', N'abm islam', N'rojina islam', CAST(N'2010-10-10' AS Date), N'null', N'1236547789', N'Dhaka', 1)
INSERT [dbo].[Students] ([StudentId], [StudentFName], [StudentLName], [FatherName], [MotherName], [DateOfBirth], [Image], [BirthCertificateNumber], [Address], [GenderId]) VALUES (2, N'Jamal Khan', N'Bepari', N'Habib Ulllah', N'Rohima', CAST(N'2010-06-05' AS Date), N'null', N'123654789', N'Chittagon', 2)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [ClassId], [CurriculumId]) VALUES (1, N'Bangla', 1, 1)
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [ClassId], [CurriculumId]) VALUES (2, N'English', 1, 1)
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [ClassId], [CurriculumId]) VALUES (3, N'Math', 2, 1)
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [DateOfBirth], [Phone], [TeacherImage], [Qualification], [JoinDate], [GenderId]) VALUES (1, N'Azman Ali', CAST(N'1960-10-10' AS Date), N'0145632879', N'null', N'M.A', CAST(N'2000-10-10' AS Date), 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [DateOfBirth], [Phone], [TeacherImage], [Qualification], [JoinDate], [GenderId]) VALUES (2, N'Nisa Akter', CAST(N'1996-10-10' AS Date), N'016357488', N'null', N'M.A', CAST(N'2004-10-10' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
SET IDENTITY_INSERT [dbo].[TeachersSubject] ON 

INSERT [dbo].[TeachersSubject] ([TeacherSubjectId], [TeacherId], [SubjectId]) VALUES (1, 1, 1)
INSERT [dbo].[TeachersSubject] ([TeacherSubjectId], [TeacherId], [SubjectId]) VALUES (2, 1, 1)
INSERT [dbo].[TeachersSubject] ([TeacherSubjectId], [TeacherId], [SubjectId]) VALUES (3, 2, 2)
INSERT [dbo].[TeachersSubject] ([TeacherSubjectId], [TeacherId], [SubjectId]) VALUES (4, 2, 3)
SET IDENTITY_INSERT [dbo].[TeachersSubject] OFF
GO
/****** Object:  Index [IX_BuildingRooms_BuildingId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_BuildingRooms_BuildingId] ON [dbo].[BuildingRooms]
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Buildings_SchoolId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Buildings_SchoolId] ON [dbo].[Buildings]
(
	[SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Campus_CurriculumId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Campus_CurriculumId] ON [dbo].[Campus]
(
	[CurriculumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Campus_GenderId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Campus_GenderId] ON [dbo].[Campus]
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Campus_SchoolId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Campus_SchoolId] ON [dbo].[Campus]
(
	[SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Campus_ShiftId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Campus_ShiftId] ON [dbo].[Campus]
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CampusClasses_CampusId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_CampusClasses_CampusId] ON [dbo].[CampusClasses]
(
	[CampusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CampusClasses_ClassId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_CampusClasses_ClassId] ON [dbo].[CampusClasses]
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CampusClassSections_CampusClassId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_CampusClassSections_CampusClassId] ON [dbo].[CampusClassSections]
(
	[CampusClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CampusClassSections_SectionId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_CampusClassSections_SectionId] ON [dbo].[CampusClassSections]
(
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Schools_SchoolTypeId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Schools_SchoolTypeId] ON [dbo].[Schools]
(
	[SchoolTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentCampusClassSections_CampusClassSectionId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentCampusClassSections_CampusClassSectionId] ON [dbo].[StudentCampusClassSections]
(
	[CampusClassSectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentCampusClassSections_StudentId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentCampusClassSections_StudentId] ON [dbo].[StudentCampusClassSections]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentGuardian_GuardianId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentGuardian_GuardianId] ON [dbo].[StudentGuardian]
(
	[GuardianId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentGuardian_StudentId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentGuardian_StudentId] ON [dbo].[StudentGuardian]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Students_GenderId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Students_GenderId] ON [dbo].[Students]
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Subjects_ClassId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Subjects_ClassId] ON [dbo].[Subjects]
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Subjects_CurriculumId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Subjects_CurriculumId] ON [dbo].[Subjects]
(
	[CurriculumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Teachers_GenderId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Teachers_GenderId] ON [dbo].[Teachers]
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeachersSubject_SubjectId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_TeachersSubject_SubjectId] ON [dbo].[TeachersSubject]
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeachersSubject_TeacherId]    Script Date: 9/16/2024 9:28:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_TeachersSubject_TeacherId] ON [dbo].[TeachersSubject]
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BuildingRooms]  WITH CHECK ADD  CONSTRAINT [FK_BuildingRooms_Buildings_BuildingId] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[Buildings] ([BuildingId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BuildingRooms] CHECK CONSTRAINT [FK_BuildingRooms_Buildings_BuildingId]
GO
ALTER TABLE [dbo].[Buildings]  WITH CHECK ADD  CONSTRAINT [FK_Buildings_Schools_SchoolId] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[Schools] ([SchoolId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Buildings] CHECK CONSTRAINT [FK_Buildings_Schools_SchoolId]
GO
ALTER TABLE [dbo].[Campus]  WITH CHECK ADD  CONSTRAINT [FK_Campus_Curriculum_CurriculumId] FOREIGN KEY([CurriculumId])
REFERENCES [dbo].[Curriculum] ([CurriculumId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Campus] CHECK CONSTRAINT [FK_Campus_Curriculum_CurriculumId]
GO
ALTER TABLE [dbo].[Campus]  WITH CHECK ADD  CONSTRAINT [FK_Campus_Gender_GenderId] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([GenderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Campus] CHECK CONSTRAINT [FK_Campus_Gender_GenderId]
GO
ALTER TABLE [dbo].[Campus]  WITH CHECK ADD  CONSTRAINT [FK_Campus_Schools_SchoolId] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[Schools] ([SchoolId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Campus] CHECK CONSTRAINT [FK_Campus_Schools_SchoolId]
GO
ALTER TABLE [dbo].[Campus]  WITH CHECK ADD  CONSTRAINT [FK_Campus_Shifts_ShiftId] FOREIGN KEY([ShiftId])
REFERENCES [dbo].[Shifts] ([ShiftId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Campus] CHECK CONSTRAINT [FK_Campus_Shifts_ShiftId]
GO
ALTER TABLE [dbo].[CampusClasses]  WITH CHECK ADD  CONSTRAINT [FK_CampusClasses_Campus_CampusId] FOREIGN KEY([CampusId])
REFERENCES [dbo].[Campus] ([CampusId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CampusClasses] CHECK CONSTRAINT [FK_CampusClasses_Campus_CampusId]
GO
ALTER TABLE [dbo].[CampusClasses]  WITH CHECK ADD  CONSTRAINT [FK_CampusClasses_Class_ClassId] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CampusClasses] CHECK CONSTRAINT [FK_CampusClasses_Class_ClassId]
GO
ALTER TABLE [dbo].[CampusClassSections]  WITH CHECK ADD  CONSTRAINT [FK_CampusClassSections_CampusClasses_CampusClassId] FOREIGN KEY([CampusClassId])
REFERENCES [dbo].[CampusClasses] ([CampusClassId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CampusClassSections] CHECK CONSTRAINT [FK_CampusClassSections_CampusClasses_CampusClassId]
GO
ALTER TABLE [dbo].[CampusClassSections]  WITH CHECK ADD  CONSTRAINT [FK_CampusClassSections_Sections_SectionId] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Sections] ([SectionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CampusClassSections] CHECK CONSTRAINT [FK_CampusClassSections_Sections_SectionId]
GO
ALTER TABLE [dbo].[Schools]  WITH CHECK ADD  CONSTRAINT [FK_Schools_SchoolsType_SchoolTypeId] FOREIGN KEY([SchoolTypeId])
REFERENCES [dbo].[SchoolsType] ([SchoolTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Schools] CHECK CONSTRAINT [FK_Schools_SchoolsType_SchoolTypeId]
GO
ALTER TABLE [dbo].[StudentCampusClassSections]  WITH CHECK ADD  CONSTRAINT [FK_StudentCampusClassSections_CampusClassSections_CampusClassSectionId] FOREIGN KEY([CampusClassSectionId])
REFERENCES [dbo].[CampusClassSections] ([CampusClassSectionId])
GO
ALTER TABLE [dbo].[StudentCampusClassSections] CHECK CONSTRAINT [FK_StudentCampusClassSections_CampusClassSections_CampusClassSectionId]
GO
ALTER TABLE [dbo].[StudentCampusClassSections]  WITH CHECK ADD  CONSTRAINT [FK_StudentCampusClassSections_Students_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[StudentCampusClassSections] CHECK CONSTRAINT [FK_StudentCampusClassSections_Students_StudentId]
GO
ALTER TABLE [dbo].[StudentGuardian]  WITH CHECK ADD  CONSTRAINT [FK_StudentGuardian_Guardians_GuardianId] FOREIGN KEY([GuardianId])
REFERENCES [dbo].[Guardians] ([GuardianId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentGuardian] CHECK CONSTRAINT [FK_StudentGuardian_Guardians_GuardianId]
GO
ALTER TABLE [dbo].[StudentGuardian]  WITH CHECK ADD  CONSTRAINT [FK_StudentGuardian_Students_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentGuardian] CHECK CONSTRAINT [FK_StudentGuardian_Students_StudentId]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Gender_GenderId] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([GenderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Gender_GenderId]
GO
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD  CONSTRAINT [FK_Subjects_Class_ClassId] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Subjects] CHECK CONSTRAINT [FK_Subjects_Class_ClassId]
GO
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD  CONSTRAINT [FK_Subjects_Curriculum_CurriculumId] FOREIGN KEY([CurriculumId])
REFERENCES [dbo].[Curriculum] ([CurriculumId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Subjects] CHECK CONSTRAINT [FK_Subjects_Curriculum_CurriculumId]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Gender_GenderId] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([GenderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Gender_GenderId]
GO
ALTER TABLE [dbo].[TeachersSubject]  WITH CHECK ADD  CONSTRAINT [FK_TeachersSubject_Subjects_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([SubjectId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeachersSubject] CHECK CONSTRAINT [FK_TeachersSubject_Subjects_SubjectId]
GO
ALTER TABLE [dbo].[TeachersSubject]  WITH CHECK ADD  CONSTRAINT [FK_TeachersSubject_Teachers_TeacherId] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([TeacherId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeachersSubject] CHECK CONSTRAINT [FK_TeachersSubject_Teachers_TeacherId]
GO
USE [master]
GO
ALTER DATABASE [SchooolDB_api] SET  READ_WRITE 
GO
