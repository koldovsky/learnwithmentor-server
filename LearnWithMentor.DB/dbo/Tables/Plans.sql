﻿CREATE TABLE Plans
(
    Id INT IDENTITY,
    Name NVARCHAR(50) NOT NULL,
    Description NVARCHAR(500),
	Image VARCHAR(MAX),
	Image_Name NVARCHAR(1000),
    Published BIT  NOT NULL CONSTRAINT DF_Plans_Published  DEFAULT  0,
    Create_Id INT NOT NULL,
	Mod_Id INT,
	Create_Date DATETIME,
	Mod_Date DATETIME,


CONSTRAINT PK_Plans_Id PRIMARY KEY (Id),
CONSTRAINT FK_Plans_To_UsersC FOREIGN KEY (Create_Id)  REFERENCES Users (Id),
CONSTRAINT FK_Plans_To_UsersM FOREIGN KEY (Mod_Id)  REFERENCES Users (Id)
)
GO
CREATE TRIGGER T_Insert_Plans
ON Plans AFTER INSERT
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM INSERTED) OR (TRIGGER_NESTLEVEL() > 1)
		RETURN
	UPDATE Plans
	SET Create_Date = GETDATE()
	WHERE Id IN (SELECT Id FROM INSERTED)
END;
GO
CREATE TRIGGER T_Update_Plans
ON Plans AFTER UPDATE
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM INSERTED) OR (TRIGGER_NESTLEVEL() > 1)
		RETURN
	UPDATE Plans
	SET Mod_Date = GETDATE()
	WHERE Id IN (SELECT Id FROM INSERTED)
END;
