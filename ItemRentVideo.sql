CREATE DATABASE [ItemRentVideo]
USE ItemRentVideo
GO

/* Авторизация */
CREATE TABLE [SignIn] 
(
	[ID]				INT IDENTITY(1,1),
	[Code]				NCHAR(4)					NOT NULL,
	[RoleID]			NCHAR(1) CONSTRAINT FK_SignIn_RoleID_Role_IDRole FOREIGN KEY REFERENCES [Role] ([IDRole]) NOT NULL,
	CONSTRAINT PK_SignIn_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [SignIn] ([Code], [RoleId]) VALUES ('0000','A')
 
CREATE TABLE [Role]
(
	[IDRole]			NCHAR(1)					NOT NULL,
	[Title]				NVARCHAR(50)				NOT NULL,
	CONSTRAINT FK_Role_IDRole PRIMARY KEY ([IDRole])
)
GO

INSERT INTO [Role] ([IDRole], [Title]) VALUES ('A','Admin')
/*----- Конец -----*/


/* Связующая таблица */
CREATE TABLE [ClientCassette]
(
	[ID]				INT IDENTITY(1,1),
	[ClientID]			INT CONSTRAINT FK_ClientCassette_ClientID_Client_ID FOREIGN KEY REFERENCES [Client] ([ID]),
	[CassetteID]		INT CONSTRAINT FK_ClientCassette_CassetteID_Cassette_ID FOREIGN KEY REFERENCES [Cassette] ([ID]),
	CONSTRAINT PK_ClientCassette_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [ClientCassette] ([ClientID],[CassetteID]) VALUES ('25','15') /* Добавление */
UPDATE [ClientCassette] SET ClientID=24, CassetteID=14 WHERE ID=15 /* Обновление - изменение данных */
DELETE FROM [ClientCassette] WHERE ID = '15' /* Удаление */
SELECT * FROM [ClientCassette] WHERE ID = '14'  /* Фильтрация */

/* Первая часть */
CREATE TABLE [Cassette]
(
	[ID]				INT IDENTITY(1,1),
	[CassImage]			IMAGE						NULL,
	[CassTypeID]		INT	CONSTRAINT FK_Cassette_CassTypeID_CassetteType_ID FOREIGN KEY REFERENCES [CassetteType] ([ID]) NULL,
	[CreateDate]		DATE						NULL,
	[SuppCompanyID]		INT CONSTRAINT FK_Cassette_SuppCompanyID_CompannySupplier_ID FOREIGN KEY REFERENCES [CompanySupplier] ([ID]) NULL,
	[CassDuration]		INT							NULL,
	[CassRecordingID]	INT CONSTRAINT FK_Cassette_CassRecordingID_VideoRecording_ID FOREIGN KEY REFERENCES [VideoRecording] ([ID]) NULL,
	CONSTRAINT PK_Cassette_ID PRIMARY KEY ([ID])
)
GO

DROP TABLE [Cassette]

/* Таблица с типами касеты их количеством */
CREATE TABLE [CassetteType]
(
	[ID]				INT IDENTITY(1,1),
	[TypeTitle]			NVARCHAR(100)				NOT NULL,
	[NumberOfPiecesID]	INT CONSTRAINT FK_CassetteType_NumberOfPiecesID_NumberOfCassets_ID FOREIGN KEY REFERENCES [NumberOfCassets] ([ID]) NULL,
	CONSTRAINT PK_CassetteType_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [NumberOfCassets]
(
	[ID]				INT IDENTITY(1,1),
	[TotalNumber]		INT							NOT NULL,
	[IssuedNow]			INT							NOT NULL,
	[IssuedInTotal]		BIGINT						NOT NULL,
	[IssuedInAMonth]	BIGINT						NOT NULL,
	CONSTRAINT PK_NumberOfCassets_ID PRIMARY KEY ([ID])
)
GO
/* Конец */

CREATE TABLE [CompanySupplier]
(
	[ID]				INT IDENTITY(1,1),
	[NameCompany]		NVARCHAR(255)				NOT NULL,
	CONSTRAINT PK_CompanySupplier_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [VideoRecording]
(
	[ID]				INT IDENTITY(1,1),
	[RecordingName]		NVARCHAR(255)				NOT NULL,
	[Duration]			INT							NOT NULL,
	[Category]			NVARCHAR(255)				NOT NULL,
	[YearOfIssue]		DATE						NOT NULL,
	[Manufacturer]		NVARCHAR(255)				NOT NULL,
	CONSTRAINT PK_VideoRecording_ID PRIMARY KEY ([ID])
)
GO
/* Конец */

/* Клиентские данные */
CREATE TABLE [Client]
(
	[ID]				INT IDENTITY(1,1),
	[Surname]			NVARCHAR(100)				NOT NULL,
	[Name]				NVARCHAR(100)				NOT NULL,
	[Patronymic]		NVARCHAR(100)				NOT NULL,
	[PassportID]		INT CONSTRAINT FK_Client_PassportID_PassportDate_ID FOREIGN KEY REFERENCES [PassportDate] ([ID]) NOT NULL,
	[Address]			NVARCHAR(100)				NOT NULL,
	[Phone]				NVARCHAR(20)				NOT NULL,
	[OrderID]			INT CONSTRAINT FK_Client_OrderID_TakenCassets_ID FOREIGN KEY REFERENCES [TakenCassets] ([ID]) NOT NULL,
	CONSTRAINT PK_Client_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [PassportDate]
(
	[ID]				INT IDENTITY(1,1),
	[Series]			INT							NOT NULL,
	[Number]			INT							NOT NULL,
	[DataOfIssue]		DATE						NOT NULL,
	[IssuedBy]			NVARCHAR(100)				NOT NULL,
	CONSTRAINT PK_PassportDate_ID PRIMARY KEY ([ID])
)
GO

/* Взятые касеты и заимствующие таблицы */
CREATE TABLE [TakenCassets]
(
	[ID]				INT IDENTITY(1,1),
	[TitleID]			INT CONSTRAINT FK_TakenCassets_TitleID_OrderTitle_ID FOREIGN KEY REFERENCES [OrderTitle] ([ID]) NOT NULL,				
	[Number]			NVARCHAR(20)				NOT NULL,
	[DataOfIssue]		DATE						NOT NULL,		
	[ReturnDate]		DATE						NOT NULL,
	[TotalCost]			MONEY						NOT NULL,
	CONSTRAINT PK_TakenCassets_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [OrderTitle]
(
	[ID]				INT IDENTITY(1,1),
	[Title]				NVARCHAR(100)				NOT NULL,
	[NowName]			NVARCHAR(100)				NOT NULL,
	[InPast]			NVARCHAR(100)				NOT NULL,
	CONSTRAINT PK_OrderTitle_ID PRIMARY KEY ([ID])
)
GO
/* Конец */

