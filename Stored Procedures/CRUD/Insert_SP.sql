USE Examination_System
-- Table: Branch
--1
IF OBJECT_ID('InsertBranch_SP','p') IS NOT NULL
    DROP PROCEDURE InsertBranch_SP;
GO
-- Create (Insert) a new Branch
CREATE PROCEDURE InsertBranch_SP
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
        INSERT INTO Branch (B_id, B_name, City, ZIP_Code, Street, B_Phone, Mgr_Name, Mgr_Phone, Mgr_Selected_Date)
        VALUES (@B_id, @B_name, @City, @ZIP_Code, @Street, @B_Phone, @Mgr_Name, @Mgr_Phone, @Mgr_Selected_Date);
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred during insertion into Branch!';
        THROW;
    END CATCH;
END;

-- Table: BranchTrack
--2
GO
IF OBJECT_ID('InsertBranchTrack_SP','p') IS NOT NULL
    DROP PROCEDURE InsertBranchTrack_SP;
GO
-- Create (Insert) a new BranchTrack
CREATE PROCEDURE InsertBranchTrack_SP
    @B_id INT,
    @T_id INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO BranchTrack (B_id, T_id)
        VALUES (@B_id, @T_id);
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred during insertion into BranchTrack!';
        THROW;
    END CATCH;
END;

-- Table: Track
--3
GO
IF OBJECT_ID('InsertTrack_SP','p') IS NOT NULL
    DROP PROCEDURE InsertTrack_SP;
GO
-- Create (Insert) a new Track
CREATE PROCEDURE InsertTrack_SP
    @T_id INT,
    @T_Name VARCHAR(255),
    @FK_Ins_Id INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Track (T_id, T_Name, FK_Ins_Id)
        VALUES (@T_id, @T_Name, @FK_Ins_Id);
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred during insertion into Track!';
        THROW;
    END CATCH;
END;

-- Table: Ins_Track
--4
GO
IF OBJECT_ID('InsertIns_Track_SP','p') IS NOT NULL
    DROP PROCEDURE InsertIns_Track_SP;
GO
CREATE PROCEDURE InsertIns_Track_SP
    @Iid INT,
    @Tid INT,
    @hire DATE
AS
BEGIN
    BEGIN TRY 
        INSERT INTO Ins_Track (Ins_id,T_id,HireDate)
        VALUES (@Iid, @Tid, @hire);
    END TRY
    BEGIN CATCH 
        PRINT 'An error occurred during insertion to Ins_Track table';
    END CATCH;
END;

-- Table: Instructor
--5
GO
IF OBJECT_ID('InsertInstructor_SP','p') IS NOT NULL
    DROP PROCEDURE InsertInstructor_SP;
GO
CREATE PROCEDURE InsertInstructor_SP
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
        INSERT INTO Instructor (Ins_id, Ins_Fname, Ins_Lname, City, Street, Phone, Email, Password, Salary, Promotion_Date, Gender)
        VALUES (@Ins_id, @Ins_Fname, @Ins_Lname, @City, @Street, @Phone, @Email, @Password, @Salary, @Promotion_Date, @Gender);
        PRINT 'Instructor inserted successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while inserting the Instructor.';
        THROW;
    END CATCH;
END;

-- Table: Track_Course_Contain
--6
GO
IF OBJECT_ID('InsertTrackCourseContain_SP','p') IS NOT NULL
    DROP PROCEDURE InsertTrackCourseContain_SP;
GO
CREATE PROCEDURE InsertTrackCourseContain_SP
    @C_id INT,
    @T_id INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Track_Course_Contain (C_id, T_id)
        VALUES (@C_id, @T_id);
        PRINT 'Record inserted successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while inserting the record.';
        THROW;
    END CATCH;
END;

-- Table: Course
--7
GO
IF OBJECT_ID('InsertCourse_SP','p') IS NOT NULL
    DROP PROCEDURE InsertCourse_SP;
GO
CREATE PROCEDURE InsertCourse_SP
    @C_id INT,
    @Hours INT,
    @C_Name VARCHAR(255),
    @FK_Ins_id INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Course WHERE C_id = @C_id)
    BEGIN
        INSERT INTO Course (C_id, Hours, C_Name, FK_Ins_id)
        VALUES (@C_id, @Hours, @C_Name, @FK_Ins_id);
        PRINT 'Course added successfully';
    END
    ELSE
    BEGIN
        PRINT 'Course with this ID already exists';
    END
END;

-- Table: Topic
--8
GO
IF OBJECT_ID('InsertTopic_Sp','P') IS NOT NULL
    DROP PROCEDURE InsertTopic_Sp;
GO
CREATE PROCEDURE InsertTopic_Sp
    @Top_Id INT,        
    @TName VARCHAR(100),
	@Fk_crs_ID INT

AS
BEGIN
    BEGIN TRY          
        INSERT INTO Topic (Top_id, Top_name,Fk_crs_ID)
        VALUES (@Top_Id, @TName,@Fk_crs_ID);        
        IF @@ROWCOUNT > 0
            SELECT 'Data inserted successfully into topic' AS Msg;
    END TRY
    BEGIN CATCH                
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;

-- Table: Enroll_Crs_Std
--9
GO
IF OBJECT_ID('InsertEnrollment_SP','p') IS NOT NULL
    DROP PROCEDURE InsertEnrollment_SP;
GO
CREATE PROCEDURE InsertEnrollment_SP
    @C_id INT,
    @S_id INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Enroll_Crs_Std WHERE C_id = @C_id AND S_id = @S_id)
    BEGIN
        INSERT INTO Enroll_Crs_Std (C_id, S_id)
        VALUES (@C_id, @S_id);
        PRINT 'Enrollment added successfully';
    END
    ELSE
    BEGIN
        PRINT 'Student is already enrolled in this course';
    END
END;

-- Table: Student
--10
GO
IF OBJECT_ID('InsertStudent_SP','p') IS NOT NULL
    DROP PROCEDURE InsertStudent_SP;
GO
CREATE PROCEDURE InsertStudent_SP
    @S_id INT,
    @F_Name VARCHAR(100),
    @L_Name VARCHAR(100),
    @Phone VARCHAR(20),
    @Email VARCHAR(255),
    @Password VARCHAR(255),
    @Gender CHAR(1),
    @Age INT,
    @Fk_Track INT,
    @Street VARCHAR(255),
    @City VARCHAR(100),
    @Start_Date DATE,
    @End_Date DATE
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Student WHERE S_id = @S_id)
    BEGIN
        INSERT INTO Student (S_id, F_Name, L_Name, Phone, Email, Password, Gender, Age, Fk_Track, Street, City, Start_Date, End_Date)
        VALUES (@S_id, @F_Name, @L_Name, @Phone, @Email, @Password, @Gender, @Age, @Fk_Track, @Street, @City, @Start_Date, @End_Date);
        PRINT 'Student added successfully';
    END
    ELSE
    BEGIN
        PRINT 'Student with this ID already exists';
    END
END;

-- Table: Std_Exam
--11
GO
IF OBJECT_ID('InsertStdExam_Sp','P') IS NOT NULL
    DROP PROCEDURE InsertStdExam_Sp;
GO
CREATE PROCEDURE InsertStdExam_Sp
    @SID INT,       
    @Ex_ID INT,      
    @Grade VARCHAR(10),  
    @Date DATE,      
    @Duration INT    
AS
BEGIN
    BEGIN TRY    
        INSERT INTO Std_Exam (SID, Ex_ID, Grade, Date, Duration)
        VALUES (@SID, @Ex_ID, @Grade, @Date, @Duration);             
        IF @@ROWCOUNT > 0
            SELECT 'Data inserted successfully into Std_Exam' AS Msg;
    END TRY
    BEGIN CATCH                
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;

-- Table: Exam_Attendance
--12
GO
IF OBJECT_ID('InsertExamAttendance_Sp','P') IS NOT NULL
    DROP PROCEDURE InsertExamAttendance_Sp;
GO
CREATE PROCEDURE InsertExamAttendance_Sp
    @S_id INT,   
    @C_id INT,    
    @Ex_id INT  
AS
BEGIN
    BEGIN TRY        
        INSERT INTO Exam_Attendance (S_id, C_id, Ex_id)
        VALUES (@S_id, @C_id, @Ex_id);      
        IF @@ROWCOUNT > 0
            SELECT 'Data inserted successfully into Exam_Attendance' AS Msg;
    END TRY
    BEGIN CATCH        
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;

-- Table: Exam
--13
GO
IF OBJECT_ID('InsertExam_Sp','P') IS NOT NULL
    DROP PROCEDURE InsertExam_Sp;
GO
CREATE PROCEDURE InsertExam_Sp
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
        INSERT INTO Exam (Ex_Id, EName, No_MCQ, No_TF, Fk_CID, Start_Time, Duration)
        VALUES (@Ex_Id, @EName, @No_MCQ, @No_TF, @Fk_CID, @Start_Time, @Duration);        
        IF @@ROWCOUNT > 0
            SELECT 'Data inserted successfully into Exam' AS Msg;
    END TRY
    BEGIN CATCH                
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;

-- Table: ExamQuestion
--14
GO
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

-- Table: Question
--15
GO
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
        INSERT INTO Question (Q_id, Body, CorrectAns, Type, Grade)
        VALUES (@Q_id, @Body, @CorrectAns, @Type, @Grade);
        PRINT 'Record inserted successfully';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while inserting the record';
    END CATCH
END;

-- Table: Choices
--16
GO
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