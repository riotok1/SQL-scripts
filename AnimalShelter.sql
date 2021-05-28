CREATE DATABASE [AnimalShelter]
USE AnimalShelter
GO

/* Авторизация */
CREATE TABLE [Staff]
(
	[ID]			INT IDENTITY(1,1),
	[Surname]		NVARCHAR(100)				NOT NULL,
	[Name]			NVARCHAR(100)				NOT NULL,
	[Position]		NVARCHAR(100)				NOT NULL,
	[SignInId]		INT CONSTRAINT FK_Staff_SignInId_SignIn_ID FOREIGN KEY REFERENCES [SignIn] ([ID]) NOT NULL,
	CONSTRAINT PK_Staff_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [Staff] ([Surname],[Name],[Position],[SignInId]) VALUES ('Черкашина','Анастасия','Руководитель','1')
INSERT INTO [Staff] ([Surname],[Name],[Position],[SignInId]) VALUES ('Иванов','Дмитрий','Рабочий по уходу за животными','2')

CREATE TABLE [SignIn]
(
	[ID]			INT IDENTITY(1,1),
	[LogIn]			NVARCHAR(100)				NOT NULL,
	[Password]		NVARCHAR(100)				NOT NULL,
	[RoleID]		NCHAR(1) CONSTRAINT FK_SignIn_RoleID_Role_ID FOREIGN KEY REFERENCES [Role] ([ID]) NOT NULL,
	CONSTRAINT PK_SignIn_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [SignIn] ([LogIn],[Password],[RoleID]) VALUES ('Nastya','1598753','L')
INSERT INTO [SignIn] ([LogIn],[Password],[RoleID]) VALUES ('Dima','10203040','A')
INSERT INTO [SignIn] ([LogIn],[Password],[RoleID]) VALUES ('User','12345','U')

CREATE TABLE [Role]
(
	[ID]			NCHAR(1)					NOT NULL,
	[Title]			NVARCHAR(20)				NOT NULL,
	CONSTRAINT PK_Role_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [Role] ([ID],[Title]) VALUES ('L','Leader')
INSERT INTO [Role] ([ID],[Title]) VALUES ('A','Admin')
INSERT INTO [Role] ([ID],[Title]) VALUES ('U','User')
/*------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE [ClientAnimals]
(
	[ID]				INT IDENTITY(1,1),
	[ClientsID]			INT CONSTRAINT FK_ClientAnimals_ClientsID_Clients_ID FOREIGN KEY REFERENCES [Clients] ([ID]) NOT NULL,
	[AnimalsID]			INT CONSTRAINT FK_ClientAnimals_AnimalsID_Animals_ID FOREIGN KEY REFERENCES [Animals] ([ID]) NOT NULL,
	[DateOfRegistr]		DATE						NOT NULL,
	CONSTRAINT PK_ClinetAnimals_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Clients]
(
	[ID]				INT IDENTITY(1,1),
	[Surname]			NVARCHAR(100)				NOT NULL,
	[Name]				NVARCHAR(100)				NOT NULL,
	[SignInId]			INT CONSTRAINT FK_Clients_SignInId_SignIn_ID FOREIGN KEY REFERENCES [SignIn] ([ID]),
	CONSTRAINT PK_Clients_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [Clients] ([Surname],[Name],[SignInId]) VALUES ('Петров','Михаил','3')

CREATE TABLE [Animals]
(
	[ID]				INT IDENTITY(1,1),
	[AnimalImg]			IMAGE						NOT NULL,
	[AnimalClassID]		INT CONSTRAINT FK_Animals_AnimalClassID_AnimalClass_ID FOREIGN KEY REFERENCES [AnimalClass] ([ID]) NOT NULL,
	[Alias]				NVARCHAR(100)				NOT NULL,
	[Description]		NVARCHAR(MAX)				NOT NULL,
	CONSTRAINT PK_Animals_ID PRIMARY KEY ([ID])	
)
GO

CREATE TABLE [AnimalClass]
(
	[ID]				INT IDENTITY(1,1),
	[Title]				NVARCHAR(100)				NOT NULL,
	CONSTRAINT PK_AnimalClass_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [AnimalClass] ([Title]) VALUES ('Кошка')
INSERT INTO [AnimalClass] ([Title]) VALUES ('Собака')
INSERT INTO [AnimalClass] ([Title]) VALUES ('Хомяк')
INSERT INTO [AnimalClass] ([Title]) VALUES ('Кролик')