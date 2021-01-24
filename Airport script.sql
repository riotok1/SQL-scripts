CREATE DATABASE [Airport]
USE Airport
GO

CREATE TABLE [SignIn]
(
	[ID]				INT IDENTITY(0,1),
	[UserName]			NVARCHAR(100)																					NOT NULL,
	[Password]			NVARCHAR(100)																					NOT NULL,
	[RoleID]			NCHAR(1) CONSTRAINT FK_SignIn_RoleID_Role_IDRole FOREIGN KEY REFERENCES [Role] ([IDRole])		NOT NULL,
	CONSTRAINT PK_SignIn_ID PRIMARY KEY ([ID])
)
GO

SELECT * FROM [SignIn]
INSERT INTO [SignIn] ([UserName], [Password], [RoleID]) VALUES ('Sali','1004','A')
INSERT INTO [SignIn] ([UserName], [Password], [RoleID]) VALUES ('User','1234','U')
GO

CREATE TABLE [Role]
(
	[IDRole]			NCHAR(1)																						NOT NULL,
	[Title]				NVARCHAR(20)																					NOT NULL,
	CONSTRAINT PK_Role_IDRole PRIMARY KEY ([IDRole])
)

SELECT * FROM [Role]
INSERT INTO [Role] ([IDRole], [Title]) VALUES ('A','Admin')
INSERT INTO [Role] ([IDRole], [Title]) VALUES ('U','User')
GO

CREATE TABLE [Plane]
(
	[ID]				INT IDENTITY(1,1),
	[PlaneNumber]		NVARCHAR(100)																					NOT NULL,
	[Type]				NVARCHAR(100)																					NOT NULL,
	[NumberOfPlace]		INT																								NOT NULL,
	[PlaneSpeed]		INT																								NOT NULL,
	[PassengersID]		INT CONSTRAINT FK_Plane_PassengersID_Passengers_ID FOREIGN KEY REFERENCES [Passengers] ([ID])	NOT NULL,
	CONSTRAINT PK_Plane_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Passengers]
(
	[ID]				INT IDENTITY(1,1),
	[PassNumber]		INT																								NOT NULL,
	CONSTRAINT PK_Passengers_ID PRIMARY KEY ([ID])
)

CREATE TABLE [Route]
(
	[ID]				INT IDENTITY(1,1),
	[RouteNumber]		NVARCHAR(100)																					NOT NULL,
	[Distance]			NVARCHAR(100)																					NOT NULL,
	[DepPoint]			NVARCHAR(100)																					NOT NULL,
	[ArrPoint]			NVARCHAR(100)																					NOT NULL,
	[PlaneID]			INT CONSTRAINT FK_Route_PlaneID_Plane_ID FOREIGN KEY REFERENCES [Plane] ([ID])					NOT NULL, 
	[ParamID]			INT CONSTRAINT FK_Route_ParamID_PlaneParam_ID FOREIGN KEY REFERENCES [PlaneParameters] ([ID])   NOT NULL,
	CONSTRAINT PK_Route_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [PlaneParameters]
(
	[ID]				INT IDENTITY(1,1),
	[DepDateTime]		DATETIME																						NOT NULL,
	[ArrDateTime]		DATETIME																						NOT NULL,	
	[Tickets]			INT																								NOT NULL,
	CONSTRAINT PK_PlaneParameters_ID PRIMARY KEY ([ID])
)
GO

DROP TABLE [Route]
DROP TABLE [Plane]
DROP TABLE [PlaneParameters]
DROP TABLE [Passengers]