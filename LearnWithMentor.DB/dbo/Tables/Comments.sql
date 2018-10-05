﻿CREATE TABLE Comments
(
    Id INT IDENTITY (1,1) NOT NULL,
    PlanTask_Id INT NOT NULL,    
    Text NVARCHAR(MAX) NOT NULL,
	Create_Id INT NOT NULL,	
	Create_Date DATETIME,
	Mod_Date DATETIME,

 CONSTRAINT PK_Comments_Id PRIMARY KEY CLUSTERED (Id),
 CONSTRAINT FK_Comments_To_PlanTasks FOREIGN KEY (PlanTask_Id)  REFERENCES PlanTasks (Id),
 CONSTRAINT FK_Comments_To_UsersC FOREIGN KEY (Create_Id)  REFERENCES Users (Id)
)

GO
CREATE TRIGGER T_Insert_Comments
ON Comments AFTER INSERT
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM INSERTED) OR (TRIGGER_NESTLEVEL() > 1)
		RETURN
	UPDATE Comments
	SET Create_Date = GETDATE()
	WHERE Id IN (SELECT Id FROM INSERTED)
END;

GO
CREATE TRIGGER T_Update_Comments
ON Comments AFTER UPDATE
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM INSERTED) OR (TRIGGER_NESTLEVEL() > 1)
		RETURN
	UPDATE Comments
	SET Mod_Date = GETDATE()
	WHERE Id IN (SELECT Id FROM INSERTED)
END;
