CREATE DATABASE [DBPeople]
USE DBPeople
GO

CREATE TABLE [SignIn]
(
	[ID]				INT IDENTITY(1,1),
	[UserName]			NVARCHAR(100)					NOT NULL,
	[Password]			NVARCHAR(100)					NOT NULL,
	[RoleID]			NCHAR(1) CONSTRAINT FK_SignIn_RoleID_Role_IDRole FOREIGN KEY REFERENCES [Role] ([IDRole]) NOT NULL,
	CONSTRAINT PK_SignIn_ID PRIMARY KEY ([ID])
)
GO

SELECT * FROM [SignIn]
INSERT INTO [SignIn] ([UserName],[Password],[RoleID]) VALUES ('Sali','1004','A')
INSERT INTO [SignIn] ([UserName],[Password],[RoleID]) VALUES ('User','1234','U')

CREATE TABLE [Role]
(
	[IDRole]			NCHAR(1)						NOT NULL,
	[Title]				NVARCHAR(100)					NOT NULL,
	CONSTRAINT PK_Role_IDRole PRIMARY KEY ([IDRole])
)

SELECT * FROM [Role]
INSERT INTO [Role] ([IDRole], [Title]) VALUES ('A','Admin')
INSERT INTO [Role] ([IDRole], [Title]) VALUES ('U','User')

CREATE TABLE [Human]
(
	[ID]				INT IDENTITY(1,1),
	[HumanImg]			IMAGE							NOT NULL,
	[Surname]			NVARCHAR(100)					NOT NULL,
	[Name]				NVARCHAR(100)					NOT NULL,
	[Patronymic]		NVARCHAR(100)					NOT NULL,
	[Age]				INT								NOT NULL,
	[PassportID]		INT CONSTRAINT FK_Human_PassportID_Passport_ID FOREIGN KEY REFERENCES [Passport] ([ID]) NOT NULL,
	CONSTRAINT PK_Human_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Passport]
(
	[ID]				INT IDENTITY(1,1),
	[Series]			INT								NOT NULL,
	[Number]			INT								NOT NULL,
	[BankID]			INT CONSTRAINT FK_Passport_BankID_Bank_ID FOREIGN KEY REFERENCES [Bank] ([ID]) NOT NULL,
	CONSTRAINT PK_Passport_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Bank]
(
	[ID]				INT IDENTITY(1,1),
	[BankNameID]		INT CONSTRAINT FK_Bank_BankNameID_BankNames_ID FOREIGN KEY REFERENCES [BankNames] ([ID]) NOT NULL,
	[Balance]			NVARCHAR(100)					NOT NULL,
	CONSTRAINT PK_Bank_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [BankNames]
(
	[ID]				INT IDENTITY(1,1),
	[Name]				NVARCHAR(100)					NOT NULL,
	CONSTRAINT PK_BankNames_ID PRIMARY KEY ([ID])
)

SELECT * FROM [BankNames]
INSERT INTO [BankNames] ([Name]) VALUES ('Сбербанк')
INSERT INTO [BankNames] ([Name]) VALUES ('Альфа-банк')
INSERT INTO [BankNames] ([Name]) VALUES ('Почта банк')
INSERT INTO [BankNames] ([Name]) VALUES ('Тинькофф')