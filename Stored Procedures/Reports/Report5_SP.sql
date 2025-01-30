USE Examination_System;
GO
ALTER TABLE Question ALTER COLUMN Body NVARCHAR(MAX);
ALTER TABLE Choices ALTER COLUMN Choice_Text NVARCHAR(MAX);

IF OBJECT_ID('GetExamQuestionsWithDetails_R5_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetExamQuestionsWithDetails_R5_SP;
GO

CREATE PROCEDURE GetExamQuestionsWithDetails_R5_SP
    @ExamID INT  -- Exam ID to filter by
AS
BEGIN
    SELECT 
        E.Ex_Id AS ExamID,
        E.EName AS ExamName,
        E.No_MCQ AS NumberOfMCQs,
        E.No_TF AS NumberOfTrueFalse,
        E.Start_Time AS ExamStartTime,
        E.Duration AS ExamDuration,
        C.C_Name AS CourseName,
        Q.Q_id AS QuestionID,
        Q.Body AS QuestionText,
        Q.Type AS QuestionType,
        Q.CorrectAns AS CorrectAnswer,
        Q.Grade AS QuestionGrade,
        STRING_AGG(CH.Choice_Text, ', ') AS Choices 
    FROM 
        Exam E
    INNER JOIN 
        ExamQuestion EQ ON E.Ex_Id = EQ.Ex_Id
    INNER JOIN 
        Question Q ON EQ.Q_id = Q.Q_id
    INNER JOIN 
        Course C ON E.Fk_CID = C.C_id
   
   LEFT JOIN 
        Choices CH ON Q.Q_id = CH.Q_id 
    WHERE 
        E.Ex_Id = @ExamID
    GROUP BY 
        E.Ex_Id, E.EName, E.No_MCQ, E.No_TF, E.Start_Time, E.Duration,
        C.C_Name, Q.Q_id, Q.Body, Q.Type, Q.CorrectAns, Q.Grade
    ORDER BY 
        Q.Q_id;  
END;
GO

EXEC GetExamQuestionsWithDetails_R5_SP @ExamID = 1;