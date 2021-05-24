CREATE DATABASE [JewelryStore]
USE JewelryStore
GO

/* Autorization */
CREATE TABLE [SignIn]
(
	[ID]					INT IDENTITY(1,1),
	[LogIn]					NVARCHAR(100)				NOT NULL,
	[Password]				NVARCHAR(100)				NOT NULL,
	[RoleID]				NCHAR(1) CONSTRAINT FK_SignIn_RoleID_Role_ID FOREIGN KEY REFERENCES [Role] ([ID]) NOT NULL,
	CONSTRAINT PK_SignIn_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [SignIn] ([LogIn], [Password], [RoleID]) VALUES ('Zarina','12345','A')
INSERT INTO [SignIn] ([LogIn], [Password], [RoleID]) VALUES ('zarina','12345','A')

CREATE TABLE [Role]
(
	[ID]					NCHAR(1)					NOT NULL,
	[Title]					NVARCHAR(20)				NOT NULL,
	CONSTRAINT PK_Role_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [Role] ([ID], [Title]) VALUES ('A','Admin')
/* ----------------------------------------------------- */

CREATE TABLE [Jewelry]
(
	[ID]					INT IDENTITY(1,1),
	[JewImg]				IMAGE						NULL,
	[JewName]				NVARCHAR(100)				NOT NULL,
	[CategoryID]			INT CONSTRAINT FK_Jewerly_CategoryID_Category_ID FOREIGN KEY REFERENCES [Category] ([ID]) NOT NULL,
	[Material]				NVARCHAR(100)				NOT NULL,
	[Pice]					BIGINT						NOT NULL,
	[ParametersID]			INT CONSTRAINT FK_Jewerly_ParametersID_Parameters_ID FOREIGN KEY REFERENCES [Parameters] ([ID]) NOT NULL,
	CONSTRAINT PK_Jewerly_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Category]
(
	[ID]					INT IDENTITY(1,1),
	[Title]					NVARCHAR(100)				NOT NULL,
	CONSTRAINT PK_Category_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [Category] ([Title]) VALUES ('Арт-деко')
INSERT INTO [Category] ([Title]) VALUES ('Винтаж')
INSERT INTO [Category] ([Title]) VALUES ('Ретро')
INSERT INTO [Category] ([Title]) VALUES ('Ар-нуво')
INSERT INTO [Category] ([Title]) VALUES ('Гламур')
 
CREATE TABLE [Parameters]
(
	[ID]					INT IDENTITY(1,1),
	[Height]				NVARCHAR(100)				NOT NULL,
	[Width]					NVARCHAR(100)				NOT NULL,
	[Weight]				NVARCHAR(100)				NOT NULL,
	CONSTRAINT PK_Parameters_ID PRIMARY KEY ([ID])
)
GO
