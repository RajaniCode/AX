/****** Object:  Table [dbo].[Person]    Script Date: 04/07/2008 07:40:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person]') AND type in (N'U'))
DROP TABLE [dbo].[Person]
GO
/****** Object:  Default [DF_Person_KindKey]    Script Date: 04/07/2008 07:40:39 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Person_KindKey]') AND parent_object_id = OBJECT_ID(N'[dbo].[Person]'))
Begin
ALTER TABLE [dbo].[Person] DROP CONSTRAINT [DF_Person_KindKey]

End
GO
/****** Object:  Table [dbo].[Person]    Script Date: 04/07/2008 07:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[KindKey] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FirstName] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastName] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Gender] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Age] [int] NULL,
	[DateOfLastVisit] [datetime] NULL,
	[Title] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[Person] ON
INSERT [dbo].[Person] ([PersonID], [KindKey], [FirstName], [LastName], [Gender], [Age], [DateOfLastVisit], [Title], [CompanyID]) VALUES (1, N'A', N'Paul', N'Kimmel', N'M', 42, CAST(0x00009A5500000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Person] ([PersonID], [KindKey], [FirstName], [LastName], [Gender], [Age], [DateOfLastVisit], [Title], [CompanyID]) VALUES (2, N'A', N'Joe', N'Swanson', N'M', 4, CAST(0x00009AB200000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Person] ([PersonID], [KindKey], [FirstName], [LastName], [Gender], [Age], [DateOfLastVisit], [Title], [CompanyID]) VALUES (3, N'V', N'Dena', N'Swanson', NULL, NULL, NULL, N'Ms.', 0)
SET IDENTITY_INSERT [dbo].[Person] OFF
/****** Object:  Default [DF_Person_KindKey]    Script Date: 04/07/2008 07:40:39 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Person_KindKey]') AND parent_object_id = OBJECT_ID(N'[dbo].[Person]'))
Begin
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_KindKey]  DEFAULT ('P') FOR [KindKey]

End
GO
