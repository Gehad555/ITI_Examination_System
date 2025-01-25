-- Table: Branch
IF OBJECT_ID('DeleteBranch_SP','p') IS NOT NULL
    DROP PROCEDURE DeleteBranch_SP;
GO
-- Delete a Branch
CREATE PROCEDURE DeleteBranch_SP
    @B_id INT
AS
BEGIN
    BEGIN TRY
        DELETE FROM Branch WHERE B_id = @B_id;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred during deletion in Branch!';
        THROW;
    END CATCH;
END;
GO

-- Table: Track
IF OBJECT_ID('DeleteTrack_SP','p') IS NOT NULL
    DROP PROCEDURE DeleteTrack_SP;
GO
-- Delete a Track
CREATE PROCEDURE DeleteTrack_SP
    @T_id INT
AS
BEGIN
    BEGIN TRY
        DELETE FROM Track WHERE T_id = @T_id;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred during deletion in Track!';
        THROW;
    END CATCH;
END;
GO

-- Table: BranchTrack
IF OBJECT_ID('DeleteBranchTrack_SP','p') IS NOT NULL
    DROP PROCEDURE DeleteBranchTrack_SP;
GO
-- Delete a BranchTrack
CREATE PROCEDURE DeleteBranchTrack_SP
    @B_id INT,
    @T_id INT
AS
BEGIN
    BEGIN TRY
        DELETE FROM BranchTrack
        WHERE B_id = @B_id AND T_id = @T_id;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred during deletion in BranchTrack!';
        THROW;
    END CATCH;
END;
GO

-- Table: Ins_Track
IF OBJECT_ID('DeleteIns_Track_SP','p') IS NOT NULL
    DROP PROCEDURE DeleteIns_Track_SP;
GO
CREATE PROCEDURE DeleteIns_Track_SP
     @Iid INT,
    @Tid INT
AS
BEGIN
    BEGIN TRY
        DELETE FROM Ins_Track
        WHERE T_id=@Tid AND Ins_id=@Iid
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred during deleting from Ins_Track table';
    END CATCH;
END;
GO

-- Table: Instructor
IF OBJECT_ID('DeleteInstructor_SP','p') IS NOT NULL
    DROP PROCEDURE DeleteInstructor_SP;
GO
CREATE PROCEDURE DeleteInstructor_SP
    @Ins_id INT
AS
BEGIN
    BEGIN TRY
        DELETE FROM Instructor
        WHERE Ins_id = @Ins_id;
        PRINT 'Instructor deleted successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while deleting the Instructor.';
        THROW;
    END CATCH;
END;
GO

-- Table: Track_Course_Contain
IF OBJECT_ID('DeleteTrackCourseContain_SP','p') IS NOT NULL
    DROP PROCEDURE DeleteTrackCourseContain_SP;
GO
CREATE PROCEDURE DeleteTrackCourseContain_SP
    @C_id INT,
    @T_id INT
AS
BEGIN
    BEGIN TRY
        DELETE FROM Track_Course_Contain
        WHERE C_id = @C_id AND T_id = @T_id;
        PRINT 'Record deleted successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while deleting the record.';
        THROW;
    END CATCH;
END;
GO

-- Table: Course
IF OBJECT_ID('DeleteCourse_SP','p') IS NOT NULL
    DROP PROCEDURE DeleteCourse_SP;
GO
CREATE PROCEDURE DeleteCourse_SP
    @C_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Course WHERE C_id = @C_id)
    BEGIN
        DELETE FROM Course
        WHERE C_id = @C_id;
        PRINT 'Course deleted successfully';
    END
    ELSE
    BEGIN
        PRINT 'Course not found';
    END
END;
GO

-- Table: Enroll_Crs_Std
IF OBJECT_ID('DeleteEnrollment_SP','p') IS NOT NULL
    DROP PROCEDURE DeleteEnrollment_SP;
GO
CREATE PROCEDURE DeleteEnrollment_SP
    @C_id INT,
    @S_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Enroll_Crs_Std WHERE C_id = @C_id AND S_id = @S_id)
    BEGIN
        DELETE FROM Enroll_Crs_Std
        WHERE C_id = @C_id AND S_id = @S_id;
        PRINT 'Enrollment deleted successfully';
    END
    ELSE
    BEGIN
        PRINT 'Enrollment not found';
    END
END;
GO

-- Table: Student
IF OBJECT_ID('DeleteStudent_SP','p') IS NOT NULL
    DROP PROCEDURE DeleteStudent_SP;
GO
CREATE PROCEDURE DeleteStudent_SP
    @S_id INT,
    @Message NVARCHAR(255) OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Student WHERE S_id = @S_id)
    BEGIN
        DELETE FROM Student
        WHERE S_id = @S_id;
        SET @Message = 'Student deleted successfully';
    END
    ELSE
    BEGIN
        SET @Message = 'Student not found';
    END
END;
GO

-- Table: Std_Exam
IF OBJECT_ID('DeleteStdExam_Sp','P') IS NOT NULL
    DROP PROCEDURE DeleteStdExam_Sp;
GO
CREATE PROCEDURE DeleteStdExam_Sp
    @SID INT,               
    @Ex_ID INT              
AS
BEGIN
    BEGIN TRY       
        DELETE FROM Std_Exam WHERE SID = @SID AND Ex_ID = @Ex_ID;          
        IF @@ROWCOUNT > 0        
            SELECT 'Std_Exam data deleted successfully.' AS Msg;        
        ELSE        
            SELECT 'No Std_Exam record found with the specified SID and Ex_ID.' AS Msg;        
    END TRY
    BEGIN CATCH        
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO

-- Table: Exam_Attendance
IF OBJECT_ID('DeleteExamAttendance_Sp','P') IS NOT NULL
    DROP PROCEDURE DeleteExamAttendance_Sp;
GO
CREATE PROCEDURE DeleteExamAttendance_Sp
    @S_id INT,              
    @C_id INT,          
    @Ex_id INT             
AS
BEGIN
    BEGIN TRY       
        DELETE FROM Exam_Attendance WHERE S_id = @S_id AND C_id = @C_id AND Ex_id = @Ex_id;  
        IF @@ROWCOUNT > 0        
            SELECT 'Exam attendance data deleted successfully.' AS Msg;        
        ELSE        
            SELECT 'No attendance record found with the specified IDs.' AS Msg;        
    END TRY
    BEGIN CATCH       
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO

-- Table: Std_Exam (Duplicate - same as previous)
IF OBJECT_ID('DeleteStdExam_Sp','P') IS NOT NULL
    DROP PROCEDURE DeleteStdExam_Sp;
GO
-- Procedure definition remains same as previous

-- Table: ExamQuestion
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

-- Table: Question
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

-- Table: Choices
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

-- Table: Topic
IF OBJECT_ID('DeleteTopic_Sp','P') IS NOT NULL
    DROP PROCEDURE DeleteTopic_Sp;
GO
CREATE PROCEDURE DeleteTopic_Sp
    @Top_Id INT              
AS
BEGIN
    BEGIN TRY       
        DELETE FROM Topic WHERE Top_id = @Top_Id;          
        IF @@ROWCOUNT > 0
            SELECT 'Topic data deleted successfully.' AS Msg;
        ELSE
            SELECT 'No data was deleted. The topic ID might not exist.' AS Msg;
    END TRY
    BEGIN CATCH
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO