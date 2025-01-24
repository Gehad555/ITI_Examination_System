USE Examination_System;
--Stored Procedure for Update Operation in Examination_System

-- Stored Procedure for Update Operation on the 'Branch' Table
--check if the procedure exists , then drop it
GO
if OBJECT_ID('UpdateBranch_SP','p') IS NOT NULL
	Drop Procedure UpdateBranch_SP;

GO
-- Update a Branch
CREATE PROCEDURE UpdateBranch_SP
    @B_id INT,
    @B_name VARCHAR(255),
    @City VARCHAR(100),
    @ZIP_Code VARCHAR(20),
    @Street VARCHAR(255),
    @B_Phone VARCHAR(20),
    @Mgr_Name VARCHAR(20),
    @Mgr_Phone VARCHAR(20),
    @Mgr_Selected_Date DATE
AS
BEGIN
    BEGIN TRY
        UPDATE Branch
        SET B_name = @B_name,
            City = @City,
            ZIP_Code = @ZIP_Code,
            Street = @Street,
            B_Phone = @B_Phone,
            Mgr_Name = @Mgr_Name,
            Mgr_Phone = @Mgr_Phone,
            Mgr_Selected_Date = @Mgr_Selected_Date
        WHERE B_id = @B_id;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred during update in Branch!';
        THROW;
    END CATCH;
END;
GO



-- Stored Procedure for Update Operation on the 'BranchTrack' Table
GO
IF OBJECT_ID('UpdateBranchTrack_SP', 'P') IS NOT NULL
    DROP PROCEDURE UpdateBranchTrack_SP;

GO

-- Update a BranchTrack
CREATE PROCEDURE UpdateBranchTrack_SP
    @B_id INT,
    @T_id INT,
    @New_B_id INT,
    @New_T_id INT
AS
BEGIN
    BEGIN TRY
        UPDATE BranchTrack
        SET B_id = @New_B_id,
            T_id = @New_T_id
        WHERE B_id = @B_id AND T_id = @T_id;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred during the update in BranchTrack!';
        THROW;
    END CATCH;
END;
GO



-- Stored Procedure for Update Operation on the 'Track' Table
--check if the procedure exists , then drop it
GO
if OBJECT_ID('UpdateTrack_SP','p') IS NOT NULL
	Drop Procedure UpdateTrack_SP;

GO
-- Update a Track
CREATE PROCEDURE UpdateTrack_SP
    @T_id INT,
    @T_Name VARCHAR(255),
    @FK_Ins_Id INT
AS
BEGIN
    BEGIN TRY
        UPDATE Track
        SET T_Name = @T_Name,
            FK_Ins_Id = @FK_Ins_Id
        WHERE T_id = @T_id;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred during update in Track!';
        THROW;
    END CATCH;
END;
GO

-- Stored Procedure for Update Operation on the 'Ins-Track' Table
--check if the procedure exists , then drop it
GO
if OBJECT_ID('UpdateIns_Track_SP','p') IS NOT NULL
	Drop Procedure UpdateIns_Track_SP;

GO

CREATE PROCEDURE UpdateIns_Track_SP
    @Iid INT,
    @Tid INT,
    @hire date
AS
BEGIN
	begin try
    UPDATE Ins_Track
    SET T_id=@Tid, Ins_id=@Iid ,HireDate=@hire
    WHERE T_id=@Tid
	end try
	begin catch
		print 'an error occured during updating Ins_Track table'
	end catch
END;
GO


-- Stored Procedure for Update Operation on the 'Instructor' Table
--check if the procedure exists , then drop it
GO
if OBJECT_ID('UpdateInstructor_SP','p') IS NOT NULL
	Drop Procedure UpdateInstructor_SP;

GO

CREATE PROCEDURE UpdateInstructor_SP
    @Ins_id INT,
    @Ins_Fname VARCHAR(100),
    @Ins_Lname VARCHAR(100),
    @City VARCHAR(100),
    @Street VARCHAR(255),
    @Phone VARCHAR(20),
    @Email VARCHAR(255),
    @Password VARCHAR(255),
    @Salary DECIMAL(10, 2),
    @Promotion_Date DATE,
    @Gender CHAR(1)
AS
BEGIN
    BEGIN TRY
        UPDATE Instructor
        SET Ins_Fname = @Ins_Fname,
            Ins_Lname = @Ins_Lname,
            City = @City,
            Street = @Street,
            Phone = @Phone,
            Email = @Email,
            Password = @Password,
            Salary = @Salary,
            Promotion_Date = @Promotion_Date,
            Gender = @Gender
        WHERE Ins_id = @Ins_id;

        PRINT 'Instructor updated successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while updating the Instructor.';
        THROW;
    END CATCH;
END;
GO

-- Stored Procedure for Update Operation on the 'Track_Course_Contain' Table
--check if the procedure exists , then drop it
GO
if OBJECT_ID('UpdateTrackCourseContain_SP','p') IS NOT NULL
	Drop Procedure UpdateTrackCourseContain_SP;

GO

CREATE PROCEDURE UpdateTrackCourseContain_SP
    @Old_C_id INT,
    @Old_T_id INT,
    @New_C_id INT,
    @New_T_id INT
AS
BEGIN
    BEGIN TRY
     
        DELETE FROM Track_Course_Contain
        WHERE C_id = @Old_C_id AND T_id = @Old_T_id;

      
        INSERT INTO Track_Course_Contain (C_id, T_id)
        VALUES (@New_C_id, @New_T_id);

        PRINT 'Record updated successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while updating the record.';
        THROW;
    END CATCH;
END;
GO


-- Stored Procedure for Update Operation on the 'UpdateCourse' Table
--check if the procedure exists , then drop it
GO
if OBJECT_ID('UpdateCourse','p') IS NOT NULL
	Drop Procedure UpdateCourse;

GO
CREATE PROCEDURE UpdateCourse
    @C_id INT,                
    @Hours INT = NULL,        
    @C_Name VARCHAR(255) = NULL
AS
BEGIN
   
    IF EXISTS (SELECT 1 FROM Course WHERE C_id = @C_id)
    BEGIN
       
        UPDATE Course
        SET Hours = COALESCE(@Hours, Hours),
            C_Name = COALESCE(@C_Name, C_Name)
        WHERE C_id = @C_id;
        
        PRINT 'Course updated successfully';
    END
    ELSE
    BEGIN
        PRINT 'Course not found';
    END
END;
Go

-- Stored Procedure for Update Operation on the 'Topic' Table
--check if the procedure exists , then drop it

Go
IF OBJECT_ID('UpdateTopic_Sp','P') IS NOT NULL
		DROP PROCEDURE UpdateTopic_Sp;
Go
Create Procedure UpdateTopic_Sp
    @Top_Id INT,        
    @TName VARCHAR(20),                        
AS
BEGIN
    BEGIN TRY          
        UPDATE Topic
        SET 
            Top_name = @TName, 
        WHERE Top_id = @Top_Id ;       
		IF @@ROWCOUNT > 0
			SELECT 'Topic data updated successfully.' AS Msg;
		ELSE
			SELECT 'No data was updated, the topic record might not exist.' AS Msg
    END TRY
    BEGIN CATCH        
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO


-- Stored Procedure for Update Operation on the 'UpdateStudent' Table

--check if the procedure exists , then drop it

GO
if OBJECT_ID('UpdateStudent','p') IS NOT NULL
	Drop Procedure UpdateStudent;

GO
CREATE PROCEDURE UpdateStudent
    @S_id INT,
    @F_Name VARCHAR(100) = NULL,
    @L_Name VARCHAR(100) = NULL,
    @Phone VARCHAR(20) = NULL,
    @Email VARCHAR(255) = NULL,
    @Password VARCHAR(255) = NULL,
    @Gender CHAR(1) = NULL,
    @Age INT = NULL,
    @Fk_Track INT = NULL,
    @Street VARCHAR(255) = NULL,
    @City VARCHAR(100) = NULL,
    @Start_Date DATE = NULL,
    @End_Date DATE = NULL
AS
BEGIN
  
    IF EXISTS (SELECT 1 FROM Student WHERE S_id = @S_id)
    BEGIN
        UPDATE Student
        SET F_Name = COALESCE(@F_Name, F_Name),
            L_Name = COALESCE(@L_Name, L_Name),
            Phone = COALESCE(@Phone, Phone),
            Email = COALESCE(@Email, Email),
            Password = COALESCE(@Password, Password),
            Gender = COALESCE(@Gender, Gender),
            Age = COALESCE(@Age, Age),
            Fk_Track = COALESCE(@Fk_Track, Fk_Track),
            Street = COALESCE(@Street, Street),
            City = COALESCE(@City, City),
            Start_Date = COALESCE(@Start_Date, Start_Date),
            End_Date = COALESCE(@End_Date, End_Date)
        WHERE S_id = @S_id;
        
        PRINT 'Student updated successfully';
    END
    ELSE
    BEGIN
        PRINT 'Student not found';
    END
END;
GO


-- Stored Procedure for Update Operation on the 'StdExam' Table
--check if the procedure exists , then drop it


GO
IF OBJECT_ID('UpdateStdExam_Sp','P') IS NOT NULL
		DROP PROCEDURE UpdateStdExam_Sp;
Go
Create Procedure UpdateStdExam_Sp
    @SID INT,             
    @Ex_ID INT,              
    @Grade VARCHAR(10),      
    @Date DATE,              
    @Duration INT            
AS
BEGIN
    BEGIN TRY           
        UPDATE Std_Exam
        SET 
            Grade = @Grade, 
            Date = @Date, 
            Duration = @Duration
        WHERE SID = @SID AND Ex_ID = @Ex_ID;         
        IF @@ROWCOUNT > 0
            SELECT 'Student exam data updated successfully.' AS Msg;
        ELSE
            SELECT 'No data was updated, the student exam record might not exist.' AS Msg;
    END TRY
    BEGIN CATCH        
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO

-- Stored Procedure for Update Operation on the 'ExamAttendance' Table
--check if the procedure exists , then drop it

GO
IF OBJECT_ID('UpdateExamAttendance_Sp','P') IS NOT NULL
		DROP PROCEDURE UpdateExamAttendance_Sp;
Go
Create Procedure UpdateExamAttendance_Sp
    @S_id INT,              
    @C_id INT,              
    @Ex_id INT              
AS
BEGIN
    BEGIN TRY          
        UPDATE Exam_Attendance
        SET 
            S_id = @S_id, 
            C_id = @C_id, 
            Ex_id = @Ex_id
        WHERE S_id = @S_id AND C_id = @C_id AND Ex_id = @Ex_id;       
		IF @@ROWCOUNT > 0
			SELECT 'Exam attendance data updated successfully.' AS Msg;
		ELSE
			SELECT 'No data was updated, the attendance record might not exist.' AS Msg
    END TRY
    BEGIN CATCH        
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO


-- Stored Procedure for Update Operation on the 'Exam' Table
--check if the procedure exists , then drop it

GO
IF OBJECT_ID('UpdateExam_Sp','P') IS NOT NULL
		DROP PROCEDURE UpdateExam_Sp;
Go
Create Procedure UpdateExam_Sp
    @Ex_Id INT,             
    @EName VARCHAR(255),    
    @No_MCQ INT,            
    @No_TF INT,             
    @Fk_CID INT,            
    @Start_Time DATETIME,  
    @Duration INT           
AS
BEGIN
    BEGIN TRY            
        UPDATE Exam
        SET 
            EName = @EName, 
            No_MCQ = @No_MCQ, 
            No_TF = @No_TF, 
            Fk_CID = @Fk_CID, 
            Start_Time = @Start_Time, 
            Duration = @Duration
        WHERE Ex_Id = @Ex_Id;                 
		IF @@ROWCOUNT > 0
			SELECT 'Exam data updated successfully.' AS Msg;
		ELSE
			SELECT 'No data was updated, the exam ID might not exist.' AS Msg;
    END TRY
    BEGIN CATCH       
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO


-- Stored Procedure for Update Operation on the 'ExamQuestion' Table
--check if the procedure exists , then drop it

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

-- Stored Procedure for Update Operation on the 'Question' Table
--check if the procedure exists , then drop it

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

-- Stored Procedure for Update Operation on the 'Choices' Table
--check if the procedure exists , then drop it

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


