CREATE DATABASE [WholesaleBase]
USE WholesaleBase
GO

CREATE TABLE [Product]
(
	[ID]					INT IDENTITY(0,1),
	[ProducrName]			NVARCHAR(100)				NOT NULL,
	[QuanInStock]			INT							NOT NULL,
	[Unit]					NVARCHAR(30)				NOT NULL,
	[PriceOfUnit]			MONEY						NOT NULL,
	[ProdDescriptionID]		INT CONSTRAINT FK_Product_ProdDescriptionID_ProductDescription_ID FOREIGN KEY REFERENCES [ProductDescription] ([ID]) NOT NULL,
	CONSTRAINT PK_Product_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [ProductDescription]
(
	[ID]					INT IDENTITY(0,1),
	[Title]					NVARCHAR(MAX)				NOT NULL,
	CONSTRAINT PK_ProductDescription_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Provider]
(
	[ID]					INT IDENTITY(0,1),
	[Surname]				NVARCHAR(MAX)				NOT NULL,
	[Name]					NVARCHAR(MAX)				NOT NULL,
	[Patronymic]			NVARCHAR(MAX)				NOT NULL,
	[Phone]					NVARCHAR(50)				NOT NULL,
	[Address]				NVARCHAR(50)				NOT NULL,
	[DeliveryTime]			DATETIME					NOT NULL,
	[NumberOfGoods]			INT							NOT NULL,
	[AccountNumber]			BIGINT							NOT NULL,
	[ProductID]				INT CONSTRAINT FK_Provider_ProductID_Product_ID FOREIGN KEY REFERENCES [Product] ([ID]) NOT NULL,
	CONSTRAINT PK_Provider_ID PRIMARY KEY ([ID])
)
GO

DROP TABLE [Provider]
DROP TABLE [Product]
DROP TABLE [ProductDescription]