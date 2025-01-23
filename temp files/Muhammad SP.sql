USE Examination_System;
-- Check if the procedure exists, then drop it
IF OBJECT_ID('GetExamQuestion_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetExamQuestion_SP;
GO
CREATE PROCEDURE GetExamQuestion_SP
    @Ex_Id INT,
    @Q_id INT
AS
BEGIN
    BEGIN TRY
        SELECT *
        FROM ExamQuestion
        WHERE Ex_Id = @Ex_Id AND Q_id = @Q_id;
        PRINT 'Query executed successfully';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while executing the query';
    END CATCH
END;
GO

-- Check if the procedure exists, then drop it
IF OBJECT_ID('InsertExamQuestion_SP', 'P') IS NOT NULL
    DROP PROCEDURE InsertExamQuestion_SP;
GO
CREATE PROCEDURE InsertExamQuestion_SP
    @Ex_Id INT,
    @Q_id INT,
    @Std_Answer VARCHAR(255)
AS
BEGIN
    BEGIN TRY
        INSERT INTO ExamQuestion (Ex_Id, Q_id, Std_Answer)
        VALUES (@Ex_Id, @Q_id, @Std_Answer);
        PRINT 'Record inserted successfully';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while inserting the record';
    END CATCH
END;
GO

-- Check if the procedure exists, then drop it
IF OBJECT_ID('DeleteExamQuestion_SP', 'P') IS NOT NULL
    DROP PROCEDURE DeleteExamQuestion_SP;
GO
CREATE PROCEDURE DeleteExamQuestion_SP
    @Ex_Id INT,
    @Q_id INT
AS
BEGIN
    BEGIN TRY
        DELETE FROM ExamQuestion
        WHERE Ex_Id = @Ex_Id AND Q_id = @Q_id;
        PRINT 'Record deleted successfully';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while deleting the record';
    END CATCH
END;
GO
IF OBJECT_ID('Update_ExamQuestion_SP', 'P') IS NOT NULL
    DROP PROCEDURE Update_ExamQuestion_SP;
GO
CREATE PROCEDURE Update_ExamQuestion_SP
    @Ex_Id INT,
    @Q_id INT,
    @Std_Answer VARCHAR(255)
AS
BEGIN
    UPDATE ExamQuestion
    SET Std_Answer = @Std_Answer
    WHERE Ex_Id = @Ex_Id AND Q_id = @Q_id;
END;
GO

------------------------------------------------------------------------
-- Stored Procedures for Question
-- Check if the procedure exists, then drop it
IF OBJECT_ID('GetQuestion_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetQuestion_SP;
GO
CREATE PROCEDURE GetQuestion_SP
    @Q_id INT
AS
BEGIN
    BEGIN TRY
        SELECT *
        FROM Question
        WHERE Q_id = @Q_id;
        PRINT 'Query executed successfully';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while executing the query';
    END CATCH
END;
GO

-- Check if the procedure exists, then drop it
IF OBJECT_ID('InsertQuestion_SP', 'P') IS NOT NULL
    DROP PROCEDURE InsertQuestion_SP;
GO
CREATE PROCEDURE InsertQuestion_SP
    @Q_id INT,
    @Body TEXT,
    @CorrectAns VARCHAR(255),
    @Type VARCHAR(50),
    @Grade DECIMAL(5, 2)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Question (Q_id,Body, CorrectAns, Type, Grade)
        VALUES (@Q_id, @Body, @CorrectAns, @Type, @Grade);
        PRINT 'Record inserted successfully';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while inserting the record';
    END CATCH
END;
GO

-- Check if the procedure exists, then drop it
IF OBJECT_ID('DeleteQuestion_SP', 'P') IS NOT NULL
    DROP PROCEDURE DeleteQuestion_SP;
GO
CREATE PROCEDURE DeleteQuestion_SP
    @Q_id INT
AS
BEGIN
    BEGIN TRY
        DELETE FROM Question
        WHERE Q_id = @Q_id;
        PRINT 'Record deleted successfully';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while deleting the record';
    END CATCH
END;
GO
IF OBJECT_ID('Update_Question_SP', 'P') IS NOT NULL
    DROP PROCEDURE Update_Question_SP;
GO
CREATE PROCEDURE Update_Question_SP
    @Q_id INT,
    @Body TEXT,
    @CorrectAns VARCHAR(255),
    @Type VARCHAR(50),
    @Grade DECIMAL(5, 2)
AS
BEGIN
    UPDATE Question
    SET 
        Body = @Body,
        CorrectAns = @CorrectAns,
        Type = @Type,
        Grade = @Grade
    WHERE Q_id = @Q_id;
END;
GO



----------------------------------------------------------------------------
-- Stored Procedures for Choices

-- Check if the procedure exists, then drop it
IF OBJECT_ID('GetChoice_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetChoice_SP;
GO
CREATE PROCEDURE GetChoice_SP
    @Q_id INT,
    @Choice_Id INT
AS
BEGIN
    BEGIN TRY
        SELECT *
        FROM Choices
        WHERE Q_id = @Q_id AND Choice_Id = @Choice_Id;
        PRINT 'Query executed successfully';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while executing the query';
    END CATCH
END;
GO

-- Check if the procedure exists, then drop it
IF OBJECT_ID('InsertChoice_SP', 'P') IS NOT NULL
    DROP PROCEDURE InsertChoice_SP;
GO
CREATE PROCEDURE InsertChoice_SP
    @Q_id INT,
    @Choice_Id INT,
    @Choice_Text VARCHAR(255)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Choices (Q_id, Choice_Id, Choice_Text)
        VALUES (@Q_id, @Choice_Id, @Choice_Text);
        PRINT 'Record inserted successfully';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while inserting the record';
    END CATCH
END;
GO

-- Check if the procedure exists, then drop it
IF OBJECT_ID('DeleteChoice_SP', 'P') IS NOT NULL
    DROP PROCEDURE DeleteChoice_SP;
GO
CREATE PROCEDURE DeleteChoice_SP
    @Q_id INT,
    @Choice_Id INT
AS
BEGIN
    BEGIN TRY
        DELETE FROM Choices
        WHERE Q_id = @Q_id AND Choice_Id = @Choice_Id;
        PRINT 'Record deleted successfully';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while deleting the record';
    END CATCH
END;
GO

IF OBJECT_ID('Update_Choices_SP', 'P') IS NOT NULL
    DROP PROCEDURE Update_Choices_SP;
GO
CREATE PROCEDURE Update_Choices_SP
    @Q_id INT,
    @Choice_Id INT,
    @Choice_Text VARCHAR(255)
AS
BEGIN
    UPDATE Choices
    SET Choice_Text = @Choice_Text
    WHERE Q_id = @Q_id AND Choice_Id = @Choice_Id;
END;
GO



