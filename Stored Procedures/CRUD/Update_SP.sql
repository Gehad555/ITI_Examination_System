USE Examination_System;

-- Table: Branch
IF OBJECT_ID('UpdateBranch_SP','P') IS NOT NULL DROP PROCEDURE UpdateBranch_SP;
GO
CREATE PROCEDURE UpdateBranch_SP
    @B_id INT,
    @B_name VARCHAR(255) = NULL,
    @City VARCHAR(100) = NULL,
    @ZIP_Code VARCHAR(20) = NULL,
    @Street VARCHAR(255) = NULL,
    @B_Phone VARCHAR(20) = NULL,
    @Mgr_Name VARCHAR(20) = NULL,
    @Mgr_Phone VARCHAR(20) = NULL,
    @Mgr_Selected_Date DATE = NULL
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Branch WHERE B_id = @B_id)
    BEGIN
        BEGIN TRY
            UPDATE Branch SET
                B_name = COALESCE(@B_name, B_name),
                City = COALESCE(@City, City),
                ZIP_Code = COALESCE(@ZIP_Code, ZIP_Code),
                Street = COALESCE(@Street, Street),
                B_Phone = COALESCE(@B_Phone, B_Phone),
                Mgr_Name = COALESCE(@Mgr_Name, Mgr_Name),
                Mgr_Phone = COALESCE(@Mgr_Phone, Mgr_Phone),
                Mgr_Selected_Date = COALESCE(@Mgr_Selected_Date, Mgr_Selected_Date)
            WHERE B_id = @B_id;
            PRINT 'Branch updated successfully';
        END TRY
        BEGIN CATCH
            PRINT 'Error updating branch: ' + ERROR_MESSAGE();
        END CATCH
    END
    ELSE PRINT 'Branch not found';
END;
GO

-- Table: BranchTrack
IF OBJECT_ID('UpdateBranchTrack_SP','P') IS NOT NULL DROP PROCEDURE UpdateBranchTrack_SP;
GO
CREATE PROCEDURE UpdateBranchTrack_SP
    @B_id INT,
    @T_id INT,
    @New_B_id INT = NULL,
    @New_T_id INT = NULL
AS
BEGIN
    IF EXISTS (SELECT 1 FROM BranchTrack WHERE B_id = @B_id AND T_id = @T_id)
    BEGIN
        BEGIN TRY
            UPDATE BranchTrack SET
                B_id = COALESCE(@New_B_id, B_id),
                T_id = COALESCE(@New_T_id, T_id)
            WHERE B_id = @B_id AND T_id = @T_id;
            PRINT 'Branch-track association updated successfully';
        END TRY
        BEGIN CATCH
            PRINT 'Error updating branch-track: ' + ERROR_MESSAGE();
        END CATCH
    END
    ELSE PRINT 'Branch-track association not found';
END;
GO

-- Table: Track
IF OBJECT_ID('UpdateTrack_SP','P') IS NOT NULL DROP PROCEDURE UpdateTrack_SP;
GO
CREATE PROCEDURE UpdateTrack_SP
    @T_id INT,
    @T_Name VARCHAR(255) = NULL,
    @FK_Ins_Id INT = NULL
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Track WHERE T_id = @T_id)
    BEGIN
        BEGIN TRY
            UPDATE Track SET
                T_Name = COALESCE(@T_Name, T_Name),
                FK_Ins_Id = COALESCE(@FK_Ins_Id, FK_Ins_Id)
            WHERE T_id = @T_id;
            PRINT 'Track updated successfully';
        END TRY
        BEGIN CATCH
            PRINT 'Error updating track: ' + ERROR_MESSAGE();
        END CATCH
    END
    ELSE PRINT 'Track not found';
END;
GO

-- Table: Ins_Track
IF OBJECT_ID('UpdateIns_Track_SP','P') IS NOT NULL DROP PROCEDURE UpdateIns_Track_SP;
GO
CREATE PROCEDURE UpdateIns_Track_SP
    @Iid INT,
    @Tid INT,
    @hire DATE = NULL
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Ins_Track WHERE Ins_id = @Iid AND T_id = @Tid)
    BEGIN
        BEGIN TRY
            UPDATE Ins_Track SET
                HireDate = COALESCE(@hire, HireDate)
            WHERE Ins_id = @Iid AND T_id = @Tid;
            PRINT 'Instructor-track updated successfully';
        END TRY
        BEGIN CATCH
            PRINT 'Error updating instructor-track: ' + ERROR_MESSAGE();
        END CATCH
    END
    ELSE PRINT 'Instructor-track association not found';
END;
GO

-- Table: Instructor
IF OBJECT_ID('UpdateInstructor_SP','P') IS NOT NULL DROP PROCEDURE UpdateInstructor_SP;
GO
CREATE PROCEDURE UpdateInstructor_SP
    @Ins_id INT,
    @Ins_Fname VARCHAR(100) = NULL,
    @Ins_Lname VARCHAR(100) = NULL,
    @City VARCHAR(100) = NULL,
    @Street VARCHAR(255) = NULL,
    @Phone VARCHAR(20) = NULL,
    @Email VARCHAR(255) = NULL,
    @Password VARCHAR(255) = NULL,
    @Salary DECIMAL(10,2) = NULL,
    @Promotion_Date DATE = NULL,
    @Gender CHAR(1) = NULL
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Instructor WHERE Ins_id = @Ins_id)
    BEGIN
        BEGIN TRY
            UPDATE Instructor SET
                Ins_Fname = COALESCE(@Ins_Fname, Ins_Fname),
                Ins_Lname = COALESCE(@Ins_Lname, Ins_Lname),
                City = COALESCE(@City, City),
                Street = COALESCE(@Street, Street),
                Phone = COALESCE(@Phone, Phone),
                Email = COALESCE(@Email, Email),
                Password = COALESCE(@Password, Password),
                Salary = COALESCE(@Salary, Salary),
                Promotion_Date = COALESCE(@Promotion_Date, Promotion_Date),
                Gender = COALESCE(@Gender, Gender)
            WHERE Ins_id = @Ins_id;
            PRINT 'Instructor updated successfully';
        END TRY
        BEGIN CATCH
            PRINT 'Error updating instructor: ' + ERROR_MESSAGE();
        END CATCH
    END
    ELSE PRINT 'Instructor not found';
END;
GO

-- Table: Track_Course_Contain
IF OBJECT_ID('UpdateTrackCourseContain_SP','P') IS NOT NULL DROP PROCEDURE UpdateTrackCourseContain_SP;
GO
CREATE PROCEDURE UpdateTrackCourseContain_SP
    @Old_C_id INT,
    @Old_T_id INT,
    @New_C_id INT = NULL,
    @New_T_id INT = NULL
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Track_Course_Contain WHERE C_id = @Old_C_id AND T_id = @Old_T_id)
    BEGIN
        BEGIN TRY
            UPDATE Track_Course_Contain SET
                C_id = COALESCE(@New_C_id, C_id),
                T_id = COALESCE(@New_T_id, T_id)
            WHERE C_id = @Old_C_id AND T_id = @Old_T_id;
            PRINT 'Track-course association updated successfully';
        END TRY
        BEGIN CATCH
            PRINT 'Error updating track-course: ' + ERROR_MESSAGE();
        END CATCH
    END
    ELSE PRINT 'Track-course association not found';
END;
GO

-- Table: Course
IF OBJECT_ID('UpdateCourse_SP','P') IS NOT NULL DROP PROCEDURE UpdateCourse_SP;
GO
CREATE PROCEDURE UpdateCourse_SP
    @C_id INT,
    @Hours INT = NULL,
    @C_Name VARCHAR(255) = NULL,
    @FK_Ins_id INT = NULL
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Course WHERE C_id = @C_id)
    BEGIN
        BEGIN TRY
            UPDATE Course SET
                Hours = COALESCE(@Hours, Hours),
                C_Name = COALESCE(@C_Name, C_Name),
                FK_Ins_id = COALESCE(@FK_Ins_id, FK_Ins_id)
            WHERE C_id = @C_id;
            PRINT 'Course updated successfully';
        END TRY
        BEGIN CATCH
            PRINT 'Error updating course: ' + ERROR_MESSAGE();
        END CATCH
    END
    ELSE PRINT 'Course not found';
END;
GO

-- Table: Topic
IF OBJECT_ID('UpdateTopic_Sp','P') IS NOT NULL DROP PROCEDURE UpdateTopic_Sp;
GO
CREATE PROCEDURE UpdateTopic_Sp
    @Top_Id INT,
    @TName VARCHAR(100) = NULL,
    @FK_CRS_ID INT = NULL
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Topic WHERE Top_id = @Top_Id)
    BEGIN
        BEGIN TRY
            UPDATE Topic 
            SET 
                Top_name = COALESCE(@TName, Top_name),
                Fk_crs_id = COALESCE(@FK_CRS_ID, Fk_crs_id)
            WHERE Top_id = @Top_Id;
            
            PRINT 'Topic updated successfully';
        END TRY
        BEGIN CATCH
            PRINT 'Error updating topic: ' + ERROR_MESSAGE();
        END CATCH
    END
    ELSE 
        PRINT 'Topic not found';
END;
GO


-- Table: Student
IF OBJECT_ID('UpdateStudent_Sp','P') IS NOT NULL DROP PROCEDURE UpdateStudent_Sp;
GO
CREATE PROCEDURE UpdateStudent_Sp
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
        BEGIN TRY
            UPDATE Student SET
                F_Name = COALESCE(@F_Name, F_Name),
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
        END TRY
        BEGIN CATCH
            PRINT 'Error updating student: ' + ERROR_MESSAGE();
        END CATCH
    END
    ELSE PRINT 'Student not found';
END;
GO

-- Table: Std_Exam
IF OBJECT_ID('UpdateStdExam_Sp','P') IS NOT NULL DROP PROCEDURE UpdateStdExam_Sp;
GO
CREATE PROCEDURE UpdateStdExam_Sp
    @SID INT,
    @Ex_ID INT,
    @Grade VARCHAR(10) = NULL,
    @Date DATE = NULL,
    @Duration INT = NULL
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Std_Exam WHERE SID = @SID AND Ex_ID = @Ex_ID)
    BEGIN
        BEGIN TRY
            UPDATE Std_Exam SET
                Grade = COALESCE(@Grade, Grade),
                Date = COALESCE(@Date, Date),
                Duration = COALESCE(@Duration, Duration)
            WHERE SID = @SID AND Ex_ID = @Ex_ID;
            PRINT 'Student exam record updated successfully';
        END TRY
        BEGIN CATCH
            PRINT 'Error updating student exam: ' + ERROR_MESSAGE();
        END CATCH
    END
    ELSE PRINT 'Student exam record not found';
END;
GO

-- Table: Exam_Attendance
IF OBJECT_ID('UpdateExamAttendance_Sp','P') IS NOT NULL DROP PROCEDURE UpdateExamAttendance_Sp;
GO
CREATE PROCEDURE UpdateExamAttendance_Sp
    @S_id INT,
    @C_id INT,
    @Ex_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Exam_Attendance WHERE S_id = @S_id AND C_id = @C_id AND Ex_id = @Ex_id)
    BEGIN
        BEGIN TRY
            -- Add actual update logic if table contains updatable columns
            PRINT 'Exam attendance update not implemented (no updatable columns)';
        END TRY
        BEGIN CATCH
            PRINT 'Error updating attendance: ' + ERROR_MESSAGE();
        END CATCH
    END
    ELSE PRINT 'Attendance record not found';
END;
GO

-- Table: Exam
IF OBJECT_ID('UpdateExam_Sp','P') IS NOT NULL DROP PROCEDURE UpdateExam_Sp;
GO
CREATE PROCEDURE UpdateExam_Sp
    @Ex_Id INT,
    @EName VARCHAR(255) = NULL,
    @No_MCQ INT = NULL,
    @No_TF INT = NULL,
    @Fk_CID INT = NULL,
    @Start_Time DATETIME = NULL,
    @Duration INT = NULL
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Exam WHERE Ex_Id = @Ex_Id)
    BEGIN
        BEGIN TRY
            UPDATE Exam SET
                EName = COALESCE(@EName, EName),
                No_MCQ = COALESCE(@No_MCQ, No_MCQ),
                No_TF = COALESCE(@No_TF, No_TF),
                Fk_CID = COALESCE(@Fk_CID, Fk_CID),
                Start_Time = COALESCE(@Start_Time, Start_Time),
                Duration = COALESCE(@Duration, Duration)
            WHERE Ex_Id = @Ex_Id;
            PRINT 'Exam updated successfully';
        END TRY
        BEGIN CATCH
            PRINT 'Error updating exam: ' + ERROR_MESSAGE();
        END CATCH
    END
    ELSE PRINT 'Exam not found';
END;
GO

-- Table: ExamQuestion
IF OBJECT_ID('Update_ExamQuestion_SP','P') IS NOT NULL DROP PROCEDURE Update_ExamQuestion_SP;
GO
CREATE PROCEDURE Update_ExamQuestion_SP
    @Ex_Id INT,
    @Q_id INT,
    @Std_Answer VARCHAR(255) = NULL
AS
BEGIN
    IF EXISTS (SELECT 1 FROM ExamQuestion WHERE Ex_Id = @Ex_Id AND Q_id = @Q_id)
    BEGIN
        BEGIN TRY
            UPDATE ExamQuestion SET
                Std_Answer = COALESCE(@Std_Answer, Std_Answer)
            WHERE Ex_Id = @Ex_Id AND Q_id = @Q_id;
            PRINT 'Exam question updated successfully';
        END TRY
        BEGIN CATCH
            PRINT 'Error updating exam question: ' + ERROR_MESSAGE();
        END CATCH
    END
    ELSE PRINT 'Exam question not found';
END;
GO

-- Table: Question
IF OBJECT_ID('Update_Question_SP','P') IS NOT NULL DROP PROCEDURE Update_Question_SP;
GO
CREATE PROCEDURE Update_Question_SP
    @Q_id INT,
    @Body TEXT = NULL,
    @CorrectAns VARCHAR(255) = NULL,
    @Type VARCHAR(50) = NULL,
    @Grade DECIMAL(5,2) = NULL
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Question WHERE Q_id = @Q_id)
    BEGIN
        BEGIN TRY
            UPDATE Question SET
                Body = COALESCE(@Body, Body),
                CorrectAns = COALESCE(@CorrectAns, CorrectAns),
                Type = COALESCE(@Type, Type),
                Grade = COALESCE(@Grade, Grade)
            WHERE Q_id = @Q_id;
            PRINT 'Question updated successfully';
        END TRY
        BEGIN CATCH
            PRINT 'Error updating question: ' + ERROR_MESSAGE();
        END CATCH
    END
    ELSE PRINT 'Question not found';
END;
GO

-- Table: Choices
IF OBJECT_ID('Update_Choices_SP','P') IS NOT NULL DROP PROCEDURE Update_Choices_SP;
GO
CREATE PROCEDURE Update_Choices_SP
    @Q_id INT,
    @Choice_Id INT,
    @Choice_Text VARCHAR(255) = NULL
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Choices WHERE Q_id = @Q_id AND Choice_Id = @Choice_Id)
    BEGIN
        BEGIN TRY
            UPDATE Choices SET
                Choice_Text = COALESCE(@Choice_Text, Choice_Text)
            WHERE Q_id = @Q_id AND Choice_Id = @Choice_Id;
            PRINT 'Choice updated successfully';
        END TRY
        BEGIN CATCH
            PRINT 'Error updating choice: ' + ERROR_MESSAGE();
        END CATCH
    END
    ELSE PRINT 'Choice not found';
END;
GO


