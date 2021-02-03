CREATE DATABASE [Games]
USE Games
GO

CREATE TABLE [SignIn]
(
	[ID]			INT IDENTITY(1,1),
	[UserName]		NVARCHAR(100)				NOT NULL,
	[Password]		NVARCHAR(100)				NOT NULL,
	[RoleID]		NCHAR(1) CONSTRAINT FK_SignIn_RoleID_Role_IDRole FOREIGN KEY REFERENCES [Role] ([IDRole]) NOT NULL,
	CONSTRAINT PK_SignIn_ID PRIMARY KEY ([ID])
)
GO

SELECT * FROM [SignIn]
INSERT INTO [SignIn] ([UserName], [Password], [RoleID]) VALUES ('Sali','1004','A')
INSERT INTO [SignIn] ([UserName], [Password], [RoleID]) VALUES ('User','1234','U')
GO

CREATE TABLE [Role]
(
	[IDRole]		NCHAR(1)					NOT NULL,
	[Title]			NVARCHAR(30)				NOT NULL,
	CONSTRAINT PK_Role_IDRole PRIMARY KEY ([IDRole])
)
GO

SELECT * FROM [Role]
INSERT INTO [Role] ([IDRole], [Title]) VALUES ('A','Admin')
INSERT INTO [Role] ([IDRole], [Title]) VALUES ('U','User')
GO


CREATE TABLE [Game]
(
	[ID]			INT IDENTITY(1,1),
	[GameImg]		IMAGE						NOT NULL,		
	[GameName]		NVARCHAR(100)				NOT NULL,
	[Price]			MONEY						NOT NULL,
	[AddParamID]	INT	CONSTRAINT FK_Game_AddParamID_AddParameters_ID FOREIGN KEY REFERENCES [AddParameters] ([ID]) NOT NULL,
	[SpecificID]	INT	CONSTRAINT FK_Game_SpecificID_Specifications_ID FOREIGN KEY REFERENCES [Specifications] ([ID]) NOT NULL,
	CONSTRAINT PK_Game_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [AddParameters]
(
	[ID]			INT IDENTITY(1,1),
	[YearOfProd]	DATE						NOT NULL,
	[CategoryID]	INT CONSTRAINT FK_AddParameters_CaregoryID_Category_ID FOREIGN KEY REFERENCES [Category] ([ID]) NOT NULL,
	CONSTRAINT PK_AddParameters_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Category]
(
	[ID]			INT IDENTITY(1,1),
	[Title]			NVARCHAR(150)				NOT NULL,
	CONSTRAINT PK_Category_ID PRIMARY KEY ([ID])
)
GO


SELECT * FROM [Category]
INSERT INTO [Category] ([Title]) VALUES ('Симулятор')
INSERT INTO [Category] ([Title]) VALUES ('Стретегия')
INSERT INTO [Category] ([Title]) VALUES ('Спортивная')
INSERT INTO [Category] ([Title]) VALUES ('Приключение')
INSERT INTO [Category] ([Title]) VALUES ('Ролевая')
INSERT INTO [Category] ([Title]) VALUES ('Головоломка')

CREATE TABLE [Specifications]
(
	[ID]			INT IDENTITY(1,1),
	[CPU]			NVARCHAR(100)				NOT NULL,
	[VideoCard]		NVARCHAR(150)				NOT NULL,
	[RAM]			INT							NOT NULL,
	[OS]			NVARCHAR(100)				NOT NULL,
	CONSTRAINT PK_Specifications_ID PRIMARY KEY ([ID])
)	
GO

DROP TABLE [Category]