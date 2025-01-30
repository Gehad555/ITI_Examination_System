CREATE TRIGGER trg_AfterInsertStudent
ON Student
AFTER INSERT
AS
BEGIN
   
    INSERT INTO Enroll_Crs_Std (C_id, S_id)
    SELECT TC.C_id, I.S_id
    FROM inserted I
    JOIN Track_Course_Contain TC ON I.Fk_Track = TC.T_id;

   
    INSERT INTO Exam_Attendance (S_id, C_id, Ex_id)
    SELECT I.S_id, EC.C_id, E.Ex_Id
    FROM inserted I
    JOIN Enroll_Crs_Std EC ON I.S_id = EC.S_id
    JOIN Exam E ON EC.C_id = E.Fk_CID;

    PRINT 'Student successfully added to all courses and related exams.';
END;
GO



CREATE TRIGGER trg_AfterDeleteStudent
ON Student
AFTER DELETE
AS
BEGIN
    -- Delete related records from Enroll_Crs_Std
    DELETE FROM Enroll_Crs_Std
    WHERE S_id IN (SELECT S_id FROM deleted);

    -- Delete related records from Exam_Attendance
    DELETE FROM Exam_Attendance
    WHERE S_id IN (SELECT S_id FROM deleted);

    PRINT 'Related records for the student have been deleted successfully.';
END;
GO





