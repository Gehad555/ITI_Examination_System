USE Examination_System;
GO

CREATE TRIGGER trg_Exam_Name_Check
ON Exam
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE e
    SET EName = c.C_Name
    FROM Exam e
    JOIN inserted i ON e.Ex_Id = i.Ex_Id
    JOIN Course c ON i.Fk_CID = c.C_id
    WHERE e.EName <> c.C_Name;
END;
GO
INSERT INTO Course (C_id, Hours, C_Name, FK_Ins_id)
VALUES (21, 40, 'Database Systems', NULL);
INSERT INTO Exam (Ex_Id, EName, No_MCQ, No_TF, Fk_CID, Start_Time, Duration)
VALUES (11, 'Wrong Exam Name', 10, 5, 21, '2024-09-01 10:00:00', 120);
