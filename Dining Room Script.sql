CREATE DATABASE [ManagerDiningRoom]
USE ManagerDiningRoom
GO

CREATE TABLE [Manager]
(
	[ID]				INT IDENTITY(1,1),
	[Surname]			NVARCHAR(100)				NOT NULL,
	[Name]				NVARCHAR(100)				NOT NULL,
	[SignID]			INT CONSTRAINT FK_Manager_SignID_SignIn_ID FOREIGN KEY REFERENCES [SignIn] ([ID]) NOT NULL,
	CONSTRAINT PK_Manager_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [Manager] ([Surname], [Name], [SignID]) VALUES ('Иванова','Анна','1')

CREATE TABLE [SignIn]
(
	[ID]				INT IDENTITY(1,1),
	[LogIn]				NVARCHAR(100)				NOT NULL,
	[Password]			NVARCHAR(100)				NOT NULL,
	[RoleID]			NCHAR(1) CONSTRAINT FK_SignIn_RoleID_Role_IDRole FOREIGN KEY REFERENCES [Role] ([IDRole]) NOT NULL,
	CONSTRAINT PK_SignIn_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [SignIn] ([LogIn],[Password],[RoleID]) VALUES ('Sali','1004','A')
INSERT INTO [SignIn] ([LogIn],[Password],[RoleID]) VALUES ('User','1234','U')
GO

CREATE TABLE [Role]
(
	[IDRole]			NCHAR(1)					NOT NULL,
	[Title]				NVARCHAR(30)				NOT NULL,
	CONSTRAINT PK_Role_IDRole PRIMARY KEY ([IDRole])
)
GO

INSERT INTO [Role] ([IDRole],[Title]) VALUES ('A','Admin')
INSERT INTO [Role] ([IDRole],[Title]) VALUES ('U','User')
GO

CREATE TABLE [Work]
(
	[ID]				INT IDENTITY(1,1),
	[DishID]			INT CONSTRAINT FK_Work_DishId_Dish_ID FOREIGN KEY REFERENCES [Dish] ([ID]) NULL,
	[WorkerPostID]		INT CONSTRAINT FK_Work_WorkerPostID_WorkerPost_ID FOREIGN KEY REFERENCES [WorkerPost] ([ID]) NULL,
	[ProductsDateID]	INT CONSTRAINT FK_Work_PoductsDateID_PoductsDate_ID FOREIGN KEY REFERENCES [PoductsDate] ([ID]) NULL,
	CONSTRAINT PK_Work_ID PRIMARY KEY ([ID])
)
GO

DROP TABLE [Products]

SELECT * FROM [Position]

/*-----------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE [Dish]
(
	[ID]				INT IDENTITY(1,1),
	[DishImg]			IMAGE						NOT NULL,		
	[NameOfDish]		NVARCHAR(100)				NOT NULL,
	[CategoryID]		INT CONSTRAINT FK_Dish_CategoryID_Category_ID FOREIGN KEY REFERENCES [Category] ([ID]) NOT NULL,
	[Volume]			NVARCHAR(100)				NOT NULL,
	[Price]				BIGINT						NOT NULL,
	CONSTRAINT PK_Dish_ID PRIMARY KEY ([ID])
)
GO 

CREATE TABLE [Category]
(
	[ID]				INT IDENTITY(1,1),
	[Title]				NVARCHAR(100)				NOT NULL,
	CONSTRAINT PK_Category_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [Category] ([Title]) VALUES ('Горячее')
INSERT INTO [Category] ([Title]) VALUES ('Холодное')
/*-----------------------------------------------------------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE [WorkerPost]
(
	[ID]				INT IDENTITY(1,1),
	[WorkersID]			INT CONSTRAINT FK_WorkStaff_WorkersID_Workers_ID FOREIGN KEY REFERENCES [Workers] ([ID]) NOT NULL,
	[PostsID]			INT CONSTRAINT FK_WorkStaff_PostsID_Posts_ID FOREIGN KEY REFERENCES [Posts] ([ID]) NOT NULL,
	[DateOfHiring]		DATE						NOT NULL,
	CONSTRAINT PK_WorkStaff_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Workers]
(
	[ID]				INT IDENTITY(1,1),
	[Surname]			NVARCHAR(100)				NOT NULL,
	[Name]				NVARCHAR(100)				NOT NULL,
	[Patronymic]		NVARCHAR(100)				NOT NULL,
	[Age]				NVARCHAR(50)				NOT NULL,
	[Expirience]		NVARCHAR(50)				NOT NULL,
	[UsStaff]			NVARCHAR(100)				NOT NULL,
	CONSTRAINT PK_WorkPerson_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Posts]
(
	[ID]				INT IDENTITY(1,1),
	[WorkerImg]			IMAGE						NOT NULL,
	[WorkPlace]			NVARCHAR(100)				NOT NULL,
	[Wage]				BIGINT					    NOT NULL,
	[PositionID]		INT CONSTRAINT FK_Workers_PositionID_Position_ID FOREIGN KEY REFERENCES [Position] ([ID]) NOT NULL,
	CONSTRAINT PK_Workers_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Position] 
(
	[ID]				INT IDENTITY(1,1),
	[Title]				NVARCHAR(100)				NOT NULL,
	CONSTRAINT PK_Position_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [Position] ([Title]) VALUES ('Повар')
INSERT INTO [Position] ([Title]) VALUES ('Официант')
INSERT INTO [Position] ([Title]) VALUES ('Кассир')
INSERT INTO [Position] ([Title]) VALUES ('Клинер')
INSERT INTO [Position] ([Title]) VALUES ('Охрана')
/*-----------------------------------------------------------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE [PoductsDate]
(
	[ID]				INT IDENTITY(1,1),
	[DateID]			INT CONSTRAINT FK_ProductsDate_Date_DateOfAcceptance_ID FOREIGN KEY REFERENCES [DateOfAcceptance] ([ID]) NOT NULL,
	[ProductsID]		INT CONSTRAINT FK_ProductsDate_ProductsID_Products_ID FOREIGN KEY REFERENCES [Products] ([ID]) NOT NULL,
	[TotalSum]			FLOAT						NOT NULL,
	[Count]				INT							NOT NULL,
	CONSTRAINT PK_ProductsDate_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [DateOfAcceptance]
(
	[ID]				INT IDENTITY(1,1),
	[DateTitle]			DATE						NOT NULL,
	[TimeTile]			NVARCHAR(50)				NOT NULL,
	CONSTRAINT PK_DateOfAcceptance_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Products]
(
	[ID]				INT IDENTITY(1,1),
	[ProductImage]		IMAGE						NOT NULL,
	[ProductName]		NVARCHAR(100)				NOT NULL,
	[Price]				BIGINT						NOT NULL,
	[Count]				INT							NOT NULL,
	CONSTRAINT PK_Products_ID PRIMARY KEY ([ID])
)
GO

/*-----------------------------------------------------------------------------------------------------------------------------*/