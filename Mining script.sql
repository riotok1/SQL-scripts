CREATE DATABASE [mining]
USE mining
GO

/* Autorization script */
CREATE TABLE [SignIn]
(
	[ID]			INT IDENTITY(0,1),
	[UserName]		NVARCHAR(MAX)				NOT NULL,
	[Password]		NVARCHAR(MAX)				NOT NULL,
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
INSERT INTO [Role] ([IDRole],[Title]) VALUES ('A','Admin')
INSERT INTO [Role] ([IDRole],[Title]) VALUES ('U','User')
GO

/* Script for application working */

/* Script for table mineral and for all linked tables */
CREATE TABLE [Mineral]
(
	[ID]			INT IDENTITY(0,1),
	[MineralName]	NVARCHAR(MAX)				NOT NULL,
	[MinUnitID]		INT CONSTRAINT FK_Mineral_MinUnitID_MineralUnit_ID FOREIGN KEY REFERENCES [MineralUnit] ([ID]) NOT NULL,
	[AnnualOfYear]	NVARCHAR(MAX)				NOT NULL,
	[PriceForUnit]	NVARCHAR(MAX)				NOT NULL,
	[TypeID]		INT CONSTRAINT FK_Mineral_TypeID_MineralType_ID FOREIGN KEY REFERENCES [MineralType] ([ID]) NOT NULL,
	CONSTRAINT PK_Mineral_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [MineralUnit]
(
	[ID]			INT IDENTITY(0,1),
	[Unit]			NVARCHAR(MAX)				NOT NULL,
	CONSTRAINT PK_MineralUnit_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [MineralType]
(
	[ID]			INT IDENTITY(0,1),
	[Type]			NVARCHAR(MAX)				NOT NULL,
	CONSTRAINT PK_MineralType_ID PRIMARY KEY ([ID])
)
GO

SELECT * FROM [MineralType]
INSERT INTO [MineralType] ([Type]) VALUES ('Горючие полезные ископаемые')
INSERT INTO [MineralType] ([Type]) VALUES ('Руды')
INSERT INTO [MineralType] ([Type]) VALUES ('Гидроминеральные')
INSERT INTO [MineralType] ([Type]) VALUES ('Нерудные полезные ископаемые')
INSERT INTO [MineralType] ([Type]) VALUES ('Камнесамоцветное сырье')
INSERT INTO [MineralType] ([Type]) VALUES ('Горнохимическре сырьё')
/* --------------------------------------------------------- */

CREATE TABLE [Field]
(
	[ID]			INT IDENTITY(0,1),
	[FieldName]		NVARCHAR(MAX)				NOT NULL,
	[Stocks]		NVARCHAR(MAX)				NOT NULL,
	[DevMethod]		NVARCHAR(MAX)				NOT NULL,
	[AnnualProd]	NVARCHAR(MAX)				NOT NULL,
	[CostForUnit]	NVARCHAR(MAX)				NOT NULL,
	[MineralID]		INT CONSTRAINT FK_Field_MineralID_Mineral_ID FOREIGN KEY REFERENCES [Mineral] ([ID]) NOT NULL,
	CONSTRAINT PK_Field_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [PickupPoint]
(
	[ID]			INT IDENTITY(0,1)			NOT NULL,
	[PointName]		NVARCHAR(MAX)				NOT NULL,
	[Capacity]		NVARCHAR(MAX)				NOT NULL,
	[FieldID]		INT CONSTRAINT FK_PickupPoint_FieldID_Field_ID FOREIGN KEY REFERENCES [Field] ([ID]) NOT NULL,
	CONSTRAINT PK_PickupPoint_ID PRIMARY KEY ([ID])
)
GO
