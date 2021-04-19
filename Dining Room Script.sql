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
	[DishID]			INT CONSTRAINT FK_Work_DishId_DishConnect_ID FOREIGN KEY REFERENCES [DishConnect] ([ID]) NULL,
	[WorkersID]			INT CONSTRAINT FK_Work_WorkersID_WorkersConnect_ID FOREIGN KEY REFERENCES [WorkersConnect] ([ID]) NULL,
	[ProductsID]		INT CONSTRAINT FK_Work_ProductsID_ProductsConnect_ID FOREIGN KEY REFERENCES [ProductsConnect] ([ID]) NULL,
	CONSTRAINT PK_Work_ID PRIMARY KEY ([ID])
)
GO

/*-----------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE [DishConnect]
(
	[ID]				INT IDENTITY(1,1),
	[DishConId]			INT CONSTRAINT FK_DishConnect_DishConID_Dish_ID FOREIGN KEY REFERENCES [Dish]([ID]) NOT NULL,
	CONSTRAINT PK_DishConnect_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Dish]
(
	[ID]				INT IDENTITY(1,1),
	[NameOfDish]		NVARCHAR(100)				NOT NULL,
	[Price]				MONEY						NOT NULL,
	CONSTRAINT PK_Dish_ID PRIMARY KEY ([ID])
)
GO
/*-----------------------------------------------------------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE [WorkersConnect]
(
	[ID]				INT IDENTITY(1,1),
	[WorkConnectID]		INT CONSTRAINT FK_WorkersConnect_WorkConnectID_Workers_ID FOREIGN KEY REFERENCES [Workers]([ID]) NOT NULL,
	CONSTRAINT PK_WorkersConnect_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Workers]
(
	[ID]				INT IDENTITY(1,1),
	[Position]			NVARCHAR(100)				NOT NULL,
	[WorkPlace]			NVARCHAR(100)				NOT NULL,
	[WageID]			INT CONSTRAINT FK_Workers_WageID_Wage_ID FOREIGN KEY REFERENCES [Wage] ([ID]) NOT NULL,
	CONSTRAINT PK_Workers_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Wage]
(
	[ID]				INT IDENTITY(1,1),
	[Title]				MONEY						NOT NULL,
	CONSTRAINT PK_Wage_ID PRIMARY KEY ([ID])
)
GO
/*-----------------------------------------------------------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE [ProductsConnect]
(
	[ID]				INT IDENTITY(1,1),
	[ProdConnectID]		INT CONSTRAINT FK_Products_ProdConnectID_Products_ID FOREIGN KEY REFERENCES [Products] ([ID]) NOT NULL,
	CONSTRAINT PK_ProductsConnect_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Products]
(
	[ID]				INT IDENTITY(1,1),
	[TotalSum]			MONEY						NOT NULL,
	[TotalProducts]		INT							NOT NULL,
	[DateOfAcceptance]	DATETIME					NOT NULL,
	[ProductUnitID]		INT CONSTRAINT FK_Products_ProductsUnitID_ProductsUnit_ID FOREIGN KEY REFERENCES [ProductUnit] ([ID]) NOT NULL,
	CONSTRAINT PK_ProductsMain_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [ProductUnit]
(
	[ID]				INT IDENTITY(1,1),
	[ProductName]		NVARCHAR(100)				 NOT NULL,
	[PriceWithUnit]		MONEY						 NOT NULL,		
	CONSTRAINT PK_Products_ID PRIMARY KEY ([ID])
)
GO
/*-----------------------------------------------------------------------------------------------------------------------------*/