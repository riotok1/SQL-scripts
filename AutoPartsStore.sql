CREATE DATABASE [AutoPartStore]
USE AutoPartStore
GO

/* Autorization and registration */
CREATE TABLE [Employee]
(
	[ID]					INT IDENTITY(1,1),
	[Surname]				NVARCHAR(100)				NOT NULL,
	[Name]					NVARCHAR(100)				NOT NULL,
	[Position]				NVARCHAR(100)				NOT NULL,
	[SignInID]				INT CONSTRAINT FK_Employee_SignInID_SignIn_ID FOREIGN KEY REFERENCES [SignIn] ([ID]) NOT NULL,	
	[SpareConID]			INT CONSTRAINT FK_Employee_SpareConID_SpareConnect_ID FOREIGN KEY REFERENCES [SpareConnect] ([ID]) NULL,
	CONSTRAINT PK_Employee_ID PRIMARY KEY ([ID])
)
GO

DROP TABLE [Employee]
DROP TABLE [SpareConnect]
DROP TABLE [SparePart]

CREATE TABLE [SignIn]
(
	[ID]					INT IDENTITY(1,1),
	[LogIn]					NVARCHAR(50)				NOT NULL,
	[Password]				NVARCHAR(50)				NOT NULL,
	[RoleID]				NCHAR(1) CONSTRAINT FK_SignIn_RoleID_Role_ID FOREIGN KEY REFERENCES [Role] ([ID]) NULL,
	CONSTRAINT PK_SignIn_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Role]
(
	[ID]					NCHAR(1)					NOT NULL,
	[Title]					NVARCHAR(20)				NOT NULL,
	CONSTRAINT PK_Role_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [Role] ([ID],[Title]) VALUES ('A', 'Admin')
/* ------------------------------------------------------ */

CREATE TABLE [SpareConnect]
(
	[ID]					INT IDENTITY(1,1),
	[SpareID]				INT CONSTRAINT FK_SpareConnect_SpareID_SparePart_ID FOREIGN KEY REFERENCES [SparePart] ([ID]),
	[ClientID]				INT CONSTRAINT FK_SpareConnect_ClientID_Clients_ID FOREIGN KEY REFERENCES [Clients] ([ID]) NOT NULL,
	[AnnualCount]			INT							NOT NULL,
	[TotalSum]				INT							NOT NULL,
	CONSTRAINT PK_SpareConnect_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [SparePart]
(
	[ID]					INT IDENTITY(1,1),
	[PartImg]				IMAGE						NOT NULL,				
	[PartName]				NVARCHAR(MAX)				NOT NULL,
	[CarModel]				NVARCHAR(MAX)				NOT NULL,
	[ProdCountry]			NVARCHAR(200)				NOT NULL,
	[Price]					BIGINT						NOT NULL,
	[DateOfRegistr]			DATE						NOT NULL,
	CONSTRAINT PK_SparePart_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Clients]
(
	[ID]					INT IDENTITY(1,1),
	[Surname]				NVARCHAR(50)				NOT NULL,
	[Name]					NVARCHAR(50)				NOT NULL,
	[Patronymic]			NVARCHAR(50)				NOT NULL,
	CONSTRAINT PK_Clients_ID PRIMARY KEY ([ID])
)
GO
