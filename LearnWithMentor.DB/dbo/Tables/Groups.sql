﻿CREATE TABLE Groups
(
    Id INT IDENTITY(1,1),
    Name NVARCHAR(MAX) NOT NULL,
    Mentor_Id INT,

CONSTRAINT PK_Group_Id PRIMARY KEY CLUSTERED(Id),
CONSTRAINT FK_Groups_To_Users FOREIGN KEY (Mentor_Id)  REFERENCES Users (Id)
)
