
Use Examination_System;
--check if the procedure exists , then drop it
if OBJECT_ID('GetBranch_SP','p') IS NOT NULL
	Drop Procedure GetBranch_SP;

GO
-- Read (Select) Branch
CREATE PROCEDURE GetBranch_SP
AS
BEGIN
    BEGIN TRY
        SELECT * FROM Branch;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while fetching Branch data!';
        THROW;
    END CATCH;
END;


GO

-------------------------------------------------------
--check if the procedure exists , then drop it
if OBJECT_ID('GetBranchTrack_SP','p') IS NOT NULL
	Drop Procedure GetBranchTrack_SP;

GO

-- Read (Select) BranchTrack
CREATE PROCEDURE GetBranchTrack_SP
AS
BEGIN
    BEGIN TRY
        SELECT * FROM BranchTrack;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while fetching BranchTrack data!';
        THROW;
    END CATCH;
END;




GO
-------------------------------------------------------
--check if the procedure exists , then drop it
if OBJECT_ID('GetTrack_SP','p') IS NOT NULL
	Drop Procedure GetTrack_SP;

GO
-- Read (Select) Tracks
CREATE PROCEDURE GetTrack_SP
AS
BEGIN
    BEGIN TRY
        SELECT * FROM Track;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while fetching Track data!';
        THROW;
    END CATCH;
END;


GO
--------------------------------------------------------

--check if the procedure exists , then drop it
if OBJECT_ID('GetIns_Track_SP','p') IS NOT NULL
	Drop Procedure GetIns_Track_SP;

GO
CREATE PROCEDURE GetIns_Track_SP
    @Iid INT,
    @Tid INT,
    @hire date
AS
BEGIN
	begin try 
    SELECT *
    FROM Ins_Track
    WHERE Ins_id = @Iid AND Ins_id=@Iid AND HireDate=@hire
	end try
	begin catch 
	print 'This id does not exist'
	end catch;
END;


GO
--------------------------------------------------------


--check if the procedure exists , then drop it
if OBJECT_ID('GetInstructor_SP','p') IS NOT NULL
	Drop Procedure GetInstructor_SP;

GO

CREATE PROCEDURE GetInstructor_SP
AS
BEGIN
    BEGIN TRY
        SELECT * FROM Instructor;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while retrieving the Instructors.';
        THROW;
    END CATCH;
END;

Go



-------------------------------------------------------------



--check if the procedure exists , then drop it
if OBJECT_ID('GetTrackCourseContain_SP','p') IS NOT NULL
	Drop Procedure GetTrackCourseContain_SP;

GO

CREATE PROCEDURE GetTrackCourseContain_SP
AS
BEGIN
    BEGIN TRY
        SELECT * FROM Track_Course_Contain;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while retrieving the records.';
        THROW;
    END CATCH;
END;

GO
-------------------------------------------------------------------

IF OBJECT_ID('GetCourseById','P') IS NOT NULL
		DROP PROCEDURE GetCourseById_SP;
Go
CREATE PROCEDURE GetCourseById
    @C_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Course WHERE C_id = @C_id)
    BEGIN
        SELECT *
        FROM Course
        WHERE C_id = @C_id;
    END
    ELSE
    BEGIN
        PRINT 'Course not found';
    END
END;

GO

IF OBJECT_ID('GetCoursesForStudent','P') IS NOT NULL
		DROP PROCEDURE GetCoursesForStudent_SP;
Go
CREATE PROCEDURE GetCoursesForStudent
    @S_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Student WHERE S_id = @S_id)
    BEGIN
        SELECT C.*
        FROM Course C
        JOIN Enroll_Crs_Std E ON C.C_id = E.C_id
        WHERE E.S_id = @S_id;
    END
    ELSE
    BEGIN
        PRINT 'Student not found';
    END
END;

Go


--------------------------------------------------------------

IF OBJECT_ID('GetTopicById_SP','P') IS NOT NULL
		DROP PROCEDURE GetTopicById_SP;
Go
Create Procedure GetTopicById_SP
    @Top_Id int
AS
BEGIN
    BEGIN TRY                 
            select * from Topic
            where Top_id = @Top_Id;     
    END TRY
    BEGIN CATCH        
        select 'An error occurred: ' + ERROR_MESSAGE() AS Msg;      
    END CATCH
END;
Go
---------------------------------------------------------------

IF OBJECT_ID('GetAllStudents','P') IS NOT NULL
		DROP PROCEDURE GetAllStudents_SP;
Go
CREATE PROCEDURE GetAllStudents
AS
BEGIN
    SELECT *
    FROM Student;
END;

GO

---------------------------------------------------------------------
IF OBJECT_ID('GetStudentsInCourse','P') IS NOT NULL
		DROP PROCEDURE GetStudentsInCourse_SP;
Go
CREATE PROCEDURE GetStudentsInCourse
    @C_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Course WHERE C_id = @C_id)
    BEGIN
        SELECT S.*
        FROM Student S
        JOIN Enroll_Crs_Std E ON S.S_id = E.S_id
        WHERE E.C_id = @C_id;
    END
    ELSE
    BEGIN
        PRINT 'Course not found';
    END
END;
GO
-------------------------------------------------------------------------
-- It filters based on the Student ID (@p_SID) and Exam ID (@p_Ex_ID).
IF OBJECT_ID('GetStdExam_Sp','P') IS NOT NULL
		DROP PROCEDURE GetStdExam_Sp;
Go
Create Procedure GetStdExam_Sp
     @p_SID int ,    
     @p_Ex_ID int     
As
BEGIN
    BEGIN TRY
        select * from  Std_Exam
        where  SID = @p_SID and  Ex_ID = @p_Ex_ID;
    END TRY
    BEGIN CATCH        
        select 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO
--------------------------------------------------------------------------
-- It filters based on the Student ID (@S_id), Course ID (@C_id), and Exam ID (@Ex_id).
IF OBJECT_ID('GetExamAttendance_Sp','P') IS NOT NULL
		DROP PROCEDURE GetExamAttendance_Sp;
Go
Create Procedure GetExamAttendance_Sp
    @S_id int,    
    @C_id int,  
    @Ex_id int
AS
BEGIN
    BEGIN TRY        
        select * from Exam_Attendance
        where S_id = @S_id and C_id = @C_id and Ex_id = @Ex_id;
    END TRY
    BEGIN CATCH        
        select 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO
--------------------------------------------------------------------
IF OBJECT_ID('GetExamById_SP','P') IS NOT NULL
		DROP PROCEDURE GetExamById_SP;
Go
Create Procedure GetExamById_SP
    @Ex_Id int
AS
BEGIN
    BEGIN TRY                 
            select * from Exam
            where Ex_Id = @Ex_Id;     
    END TRY
    BEGIN CATCH        
        select 'An error occurred: ' + ERROR_MESSAGE() AS Msg;      
    END CATCH
END;
GO
-------------------------------------------------------------------
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
-----------------------------------------------------------------
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















