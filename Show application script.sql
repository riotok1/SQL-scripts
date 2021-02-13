CREATE DATABASE [CoppDB]
USE CoppDB
GO

CREATE TABLE [COPP]
(
	[ID]					INT IDENTITY(1,1),
	[NumberOfRooms]			INT							NOT NULL,
	CONSTRAINT PK_COPP_ID PRIMARY KEY ([ID])
)
GO

INSERT INTO [COPP] ([NumberOfRooms]) VALUES ('10')

CREATE TABLE [Room]
(
	[ID]					INT IDENTITY(1,1),
	[ImageRoom]				IMAGE						NOT NULL,
	[NameOfRoom]			NVARCHAR(100)				NOT NULL,
	[NumberOfPK]			INT							NOT NULL,
	[SpecificationsID]		INT CONSTRAINT FK_Room_SpecificationsID_Specifications_ID FOREIGN KEY REFERENCES [Specifications] ([ID]) NOT NULL,
	CONSTRAINT PK_Room_ID PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Specifications]
(
	[ID]					INT IDENTITY(1,1),
	[MotherBoard]			NVARCHAR(100)				NOT NULL, 
	[CPU]					NVARCHAR(100)				NOT NULL,
	[VideoCard]				NVARCHAR(100)				NOT NULL,
	[RAM]					INT							NOT NULL,
	[PowerSupply]			INT							NOT NULL,
	CONSTRAINT PK_Specifications_ID PRIMARY KEY ([ID])
)
GO
spe

DROP TABLE [COPP]
DROP TABLE [Room]
DROP TABLE [Specifications]