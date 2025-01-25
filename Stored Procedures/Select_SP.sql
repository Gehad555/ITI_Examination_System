Use Examination_System;
 
-- Table: Branch
IF OBJECT_ID('GetBranch_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetBranch_SP;
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

-- Table: BranchTrack
IF OBJECT_ID('GetBranchTrack_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetBranchTrack_SP;
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

-- Table: Track
IF OBJECT_ID('GetTrack_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetTrack_SP;
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

-- Table: Ins_Track
IF OBJECT_ID('GetIns_Track_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetIns_Track_SP;
GO

CREATE PROCEDURE GetIns_Track_SP
    @Iid INT,
    @Tid INT,
    @hire DATE
AS
BEGIN
    BEGIN TRY
        SELECT * FROM Ins_Track
        WHERE Ins_id = @Iid AND T_id = @Tid AND HireDate = @hire;
    END TRY
    BEGIN CATCH
        PRINT 'This id does not exist';
    END CATCH;
END;
GO

-- Table: Instructor
IF OBJECT_ID('GetInstructor_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetInstructor_SP;
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
GO

-- Table: Track_Course_Contain
IF OBJECT_ID('GetTrackCourseContain_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetTrackCourseContain_SP;
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

-- Table: Course
IF OBJECT_ID('GetCourseById_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetCourseById_SP;
GO

CREATE PROCEDURE GetCourseById_SP
    @C_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Course WHERE C_id = @C_id)
    BEGIN
        SELECT * FROM Course WHERE C_id = @C_id;
    END
    ELSE
    BEGIN
        PRINT 'Course not found';
    END
END;
GO

-- Table: Enroll_Crs_Std
IF OBJECT_ID('GetCoursesForStudent_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetCoursesForStudent_SP;
GO

CREATE PROCEDURE GetCoursesForStudent_SP
    @S_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Student WHERE S_id = @S_id)
    BEGIN
        SELECT C.* FROM Course C
        JOIN Enroll_Crs_Std E ON C.C_id = E.C_id
        WHERE E.S_id = @S_id;
    END
    ELSE
    BEGIN
        PRINT 'Student not found';
    END
END;
GO

-- Table: Topic
IF OBJECT_ID('GetTopicById_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetTopicById_SP;
GO

CREATE PROCEDURE GetTopicById_SP
    @Top_Id INT
AS
BEGIN
    BEGIN TRY
        SELECT * FROM Topic WHERE Top_id = @Top_Id;
    END TRY
    BEGIN CATCH
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;
    END CATCH
END;
GO

-- Table: Student
IF OBJECT_ID('GetAllStudents_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetAllStudents_SP;
GO

CREATE PROCEDURE GetAllStudents_SP
AS
BEGIN
    SELECT * FROM Student;
END;
GO

-- Table: Enroll_Crs_Std
IF OBJECT_ID('GetStudentsInCourse_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetStudentsInCourse_SP;
GO

CREATE PROCEDURE GetStudentsInCourse_SP
    @C_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Course WHERE C_id = @C_id)
    BEGIN
        SELECT S.* FROM Student S
        JOIN Enroll_Crs_Std E ON S.S_id = E.S_id
        WHERE E.C_id = @C_id;
    END
    ELSE
    BEGIN
        PRINT 'Course not found';
    END
END;
GO

-- Table: Std_Exam
IF OBJECT_ID('GetStdExam_Sp', 'P') IS NOT NULL
    DROP PROCEDURE GetStdExam_Sp;
GO

CREATE PROCEDURE GetStdExam_Sp
    @p_SID INT,
    @p_Ex_ID INT
AS
BEGIN
    BEGIN TRY
        SELECT * FROM Std_Exam WHERE SID = @p_SID AND Ex_ID = @p_Ex_ID;
    END TRY
    BEGIN CATCH
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;
    END CATCH
END;
GO

-- Table: Exam_Attendance
IF OBJECT_ID('GetExamAttendance_Sp', 'P') IS NOT NULL
    DROP PROCEDURE GetExamAttendance_Sp;
GO

CREATE PROCEDURE GetExamAttendance_Sp
    @S_id INT,
    @C_id INT,
    @Ex_id INT
AS
BEGIN
    BEGIN TRY
        SELECT * FROM Exam_Attendance WHERE S_id = @S_id AND C_id = @C_id AND Ex_id = @Ex_id;
    END TRY
    BEGIN CATCH
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;
    END CATCH
END;
GO

-- Table: Exam
IF OBJECT_ID('GetExamById_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetExamById_SP;
GO

CREATE PROCEDURE GetExamById_SP
    @Ex_Id INT
AS
BEGIN
    BEGIN TRY
        SELECT * FROM Exam WHERE Ex_Id = @Ex_Id;
    END TRY
    BEGIN CATCH
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;
    END CATCH
END;
GO

-- Table: ExamQuestion
IF OBJECT_ID('GetExamQuestion_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetExamQuestion_SP;
GO

CREATE PROCEDURE GetExamQuestion_SP
    @Ex_Id INT,
    @Q_id INT
AS
BEGIN
    BEGIN TRY
        SELECT * FROM ExamQuestion WHERE Ex_Id = @Ex_Id AND Q_id = @Q_id;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while executing the query';
    END CATCH
END;
GO

-- Table: Question
IF OBJECT_ID('GetQuestion_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetQuestion_SP;
GO

CREATE PROCEDURE GetQuestion_SP
    @Q_id INT
AS
BEGIN
    BEGIN TRY
        SELECT * FROM Question WHERE Q_id = @Q_id;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while executing the query';
    END CATCH
END;
GO

-- Table: Choices
IF OBJECT_ID('GetChoice_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetChoice_SP;
GO

CREATE PROCEDURE GetChoice_SP
    @Q_id INT,
    @Choice_Id INT
AS
BEGIN
    BEGIN TRY
        SELECT * FROM Choices WHERE Q_id = @Q_id AND Choice_Id = @Choice_Id;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while executing the query';
    END CATCH
END;
GO