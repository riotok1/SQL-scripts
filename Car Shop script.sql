CREATE DATABASE [CarShop]
USE CarShop
GO

CREATE TABLE [SignIn]
(
	[ID]			INT IDENTITY(0,1),
	[UserName]		NVARCHAR(50)			NOT NULL,
	[Password]		NVARCHAR(50)			NOT NULL,
	[RoleID]		NCHAR(1) CONSTRAINT FK_SignIn_RoleID_Role_IDRole FOREIGN KEY REFERENCES [Role] ([IDRole]) NOT NULL,
	CONSTRAINT PK_SignIn_ID PRIMARY KEY ([ID])
)
GO

SELECT * FROM [SignIn]
INSERT INTO [SignIn] ([UserName],[Password],[RoleID]) VALUES ('Sali','1004','A')
INSERT INTO [SignIn] ([UserName],[Password],[RoleID]) VALUES ('User','1234','U')
GO

CREATE TABLE [Role]
(
	[IDRole]		NCHAR(1)				NOT NULL,
	[Title]			NVARCHAR(50)			NOT NULL,
	CONSTRAINT PK_Role_IDRole PRIMARY KEY (IDRole)
)
GO

SELECT * FROM [Role]
INSERT INTO [Role] ([IDRole],[Title]) VALUES ('A','Admin')
INSERT INTO [Role] ([IDRole],[Title]) VALUES ('U','User')
GO

CREATE TABLE [Car]
(
	[ID]			INT IDENTITY(0,1),
	[CarImg]		IMAGE					NOT NULL,
	[CarName]		NVARCHAR(MAX)			NOT NULL,
	[Model]			NVARCHAR(20)			NOT NULL,
	[Class]			NVARCHAR(50)			NOT NULL,
	[CarBody]		NVARCHAR(MAX)			NOT NULL,
	[YearOfProd]	DATE					NOT NULL,
	[Price]			MONEY					NOT NULL,
	[CountryID]		INT CONSTRAINT FK_Car_CountryID_CountryManufacture_ID FOREIGN KEY REFERENCES [CountryManufacture] ([ID]) NOT NULL,
	[SpecID]		INT CONSTRAINT FK_Car_SpecID_Specifications_ID FOREIGN KEY REFERENCES [Specifications] ([ID])
	CONSTRAINT PK_Car_ID PRIMARY KEY ([ID])
)
GO

SELECT * FROM [Car]

CREATE TABLE [CountryManufacture]
(	
	[ID]			INT IDENTITY(0,1),
	[Country]		NVARCHAR(MAX)			NOT NULL,
	CONSTRAINT PK_CountryManufacture_ID PRIMARY KEY ([ID])
)
GO

SELECT * FROM [CountryManufacture]
INSERT INTO [CountryManufacture] ([Country]) VALUES ('Россия')
INSERT INTO [CountryManufacture] ([Country]) VALUES ('США')
INSERT INTO [CountryManufacture] ([Country]) VALUES ('Япония')
INSERT INTO [CountryManufacture] ([Country]) VALUES ('Китай')
INSERT INTO [CountryManufacture] ([Country]) VALUES ('Швейцария')
GO

CREATE TABLE [Specifications]
(
	[ID]			INT IDENTITY(0,1),
	[Engine]		NVARCHAR(20)			NOT NULL,
	[DriveUnit]		NVARCHAR(50)			NOT NULL,
	[Fuel]			NVARCHAR(30)			NOT NULL,
	[SizeID]		INT CONSTRAINT FK_Specifications_SizeID_Size_ID FOREIGN KEY REFERENCES [Size] ([ID])
	CONSTRAINT PK_Specifications_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Size]
(
	[ID]			INT IDENTITY(0,1),
	[Width]			NVARCHAR(50)			NOT NULL,
	[Length]		NVARCHAR(50)			NOT NULL,
	[Height]		NVARCHAR(50)			NOT NULL,
	CONSTRAINT PK_Size_ID PRIMARY KEY ([ID])
)
GO