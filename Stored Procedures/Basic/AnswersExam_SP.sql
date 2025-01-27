USE Examination_System;
GO
IF OBJECT_ID('GetExamAnswers_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetExamAnswers_SP;
GO
-- Create the stored procedure
CREATE PROCEDURE GetExamAnswers_SP
    @ExamID INT,          
    @StudentID INT       
AS
BEGIN
    SELECT 
        Q.Q_id AS QuestionID,
        Q.Body AS QuestionText,
        Q.Type AS QuestionType,
        Q.CorrectAns AS CorrectAnswer,
        EQ.Std_Answer AS StudentAnswer,
        Q.Grade AS QuestionGrade,
        SE.Grade AS StudentGrade,
        E.EName AS ExamName,
        C.C_Name AS CourseName,
        S.F_Name + ' ' + S.L_Name AS StudentName
    FROM 
        ExamQuestion EQ
    INNER JOIN 
        Question Q ON EQ.Q_id = Q.Q_id
    INNER JOIN 
        Exam E ON EQ.Ex_Id = E.Ex_Id
    INNER JOIN 
        Course C ON E.Fk_CID = C.C_id
    INNER JOIN 
        Std_Exam SE ON E.Ex_Id = SE.Ex_ID AND SE.SID = @StudentID
    INNER JOIN 
        Student S ON SE.SID = S.S_id
    WHERE 
        EQ.Ex_Id = @ExamID
        AND SE.SID = @StudentID;
END;
GO

-- Execute the stored procedure with sample parameters
EXEC GetExamAnswers_SP @ExamID = 1, @StudentID = 1;