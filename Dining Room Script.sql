CREATE DATABASE [DiningRoom]
USE DiningRoom
GO

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
	[WorkersID]			INT CONSTRAINT FK_Work_WorkersID_Workers_ID FOREIGN KEY REFERENCES [Workers] ([ID]) NULL,
	[ProductsID]		INT CONSTRAINT FK_Work_ProductsID_Products_ID FOREIGN KEY REFERENCES [Products] ([ID]) NULL,
	CONSTRAINT PK_Work_ID PRIMARY KEY ([ID])
)
GO

DROP TABLE [Work]
DROP TABLE [Dish]
DROP TABLE [ProductUnit]


/*-----------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE [Dish]
(
	[ID]				INT IDENTITY(1,1),
	[DishImg]			IMAGE						NOT NULL,		
	[NameOfDish]		NVARCHAR(100)				NOT NULL,
	[CategoryID]		INT CONSTRAINT FK_Dish_CategoryID_Category_ID FOREIGN KEY REFERENCES [Category] ([ID]) NOT NULL,
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
CREATE TABLE [Workers]
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
CREATE TABLE [Products]
(
	[ID]				INT IDENTITY(1,1),
	[TotalSum]			BIGINT						NOT NULL,
	[TotalProducts]		INT							NOT NULL,
	[DateOfAcceptance]	DATETIME					NOT NULL,
	[ProductUnitID]		INT CONSTRAINT FK_Products_ProductsUnitID_ProductsUnit_ID FOREIGN KEY REFERENCES [ProductUnit] ([ID]) NOT NULL,
	CONSTRAINT PK_ProductsMain_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [ProductUnit]
(
	[ID]				INT IDENTITY(1,1),
	[ProductImg]		IMAGE						 NOT NULL,
	[ProductName]		NVARCHAR(100)				 NOT NULL,
	[PriceWithUnit]		BIGINT						 NOT NULL,		
	CONSTRAINT PK_Products_ID PRIMARY KEY ([ID])
)
GO
/*-----------------------------------------------------------------------------------------------------------------------------*/