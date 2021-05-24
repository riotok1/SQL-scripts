CREATE DATABASE [CoffeeHouse]
USE CoffeeHouse
GO

CREATE TABLE [SignIn]
(
	[ID]							INT IDENTITY(1,1),
	[LogIn]							NVARCHAR(50)					NOT NULL,
	[Password]						NVARCHAR(50)					NOT NULL,
	[RoleID]						NCHAR(1) CONSTRAINT FK_SignIn_RoleID_Role_ID FOREIGN KEY REFERENCES [Role] ([ID]) NOT NULL,
	CONSTRAINT PK_SignIn_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [SignIn] ([LogIn], [Password], [RoleID]) VALUES ('Sali','1004','A')
INSERT INTO [SignIn] ([LogIn], [Password], [RoleID]) VALUES ('User','1234','U')
 
CREATE TABLE [Role]
(
	[ID]							NCHAR(1)						NOT NULL,
	[Title]							NVARCHAR(30)					NOT NULL,
	CONSTRAINT PK_Role_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [Role] ([ID], [Title]) VALUES ('A','Admin')
INSERT INTO [Role] ([ID], [Title]) VALUES ('U','User')
 
CREATE TABLE [Stock]
(
	[ID]							INT IDENTITY(1,1),
	[CoffeeID]						INT CONSTRAINT FK_Stock_CoffeeID_Menu_ID FOREIGN KEY REFERENCES [Menu] ([ID]) NOT NULL,
	[Discount]						INT								NOT NULL,
	CONSTRAINT PK_Stock_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Menu]
(
	[ID]							INT IDENTITY(1,1),
	[CoffeeImg]						NVARCHAR(MAX)					NOT NULL,
	[CoffeeName]					NVARCHAR(100)					NOT NULL,
	[Cost]							INT								NOT NULL,
	[TypeID]						INT CONSTRAINT FK_Menu_TypeID_CoffeeType_ID FOREIGN KEY REFERENCES [CoffeeType] ([ID]) NOT NULL,
	[StructureID]					INT CONSTRAINT FK_Menu_StructureID_Structure_ID FOREIGN KEY REFERENCES [Structure] ([ID]) NOT NULL,
	CONSTRAINT PK_Menu_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [CoffeeType]
(
	[ID]							INT IDENTITY(1,1),
	[Title]							NVARCHAR(50)					NOT NULL,
	CONSTRAINT PK_CoffeeType_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [CoffeeType] ([Title]) VALUES ('Горячий')
INSERT INTO [CoffeeType] ([Title]) VALUES ('Холодный')
  
CREATE TABLE [Structure]
(
	[ID]							INT IDENTITY(1,1),
	[FirIngredient]					NVARCHAR(100)					NULL,
	[SecIngredient]					NVARCHAR(100)					NULL,
	[ThirIngredient]				NVARCHAR(100)					NULL,
	[ForIngredient]					NVARCHAR(100)					NULL,
	CONSTRAINT PK_Structure_ID PRIMARY KEY ([ID])
)
GO

