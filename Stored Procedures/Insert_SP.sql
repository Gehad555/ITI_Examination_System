USE Examination_System
-- INSERT Stored Procedure on the 'Branch' Table
--1
--check if the procedure exists , then drop it
if OBJECT_ID('InsertBranch_SP','p') IS NOT NULL
	Drop Procedure InsertBranch_SP;

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


--2
GO
--check if the procedure exists , then drop it
if OBJECT_ID('InsertBranchTrack_SP','p') IS NOT NULL
	Drop Procedure InsertBranchTrack_SP;

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



--3
GO
--check if the procedure exists , then drop it
if OBJECT_ID('InsertTrack_SP','p') IS NOT NULL
	Drop Procedure InsertTrack_SP;

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



--Stored Procedures of:(Ins_Track, Instructor, Track_Course_Contain)
--4
--Ins_Track:
--check if the procedure exists , then drop it
if OBJECT_ID('InsertIns_Track_SP','p') IS NOT NULL
	Drop Procedure InsertIns_Track_SP;

GO
CREATE PROCEDURE InsertIns_Track_SP
    @Iid INT,
    @Tid INT,
    @hire date
AS
BEGIN
	begin try 
    INSERT INTO Ins_Track (Ins_id,T_id,HireDate)
    VALUES (@Iid, @Tid, @hire);
	end try
	begin catch 
	print 'an error occured during insertion to Ins_Track table'
	end catch;
END;


--Instructor
GO
--check if the procedure exists , then drop it
if OBJECT_ID('InsertInstructor_SP','p') IS NOT NULL
	Drop Procedure InsertInstructor_SP;

GO
--5
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

--6
--TrackCourseContain
GO
--check if the procedure exists , then drop it
if OBJECT_ID('InsertTrackCourseContain_SP','p') IS NOT NULL
	Drop Procedure InsertTrackCourseContain_SP;

GO
--3-Track_Course_Contain
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



--7
GO
if OBJECT_ID('InsertCourse_SP','p') IS NOT NULL
	Drop Procedure InsertCourse_SP;
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


--8
Go
--insert operation
IF OBJECT_ID('InsertTopic_Sp','P') IS NOT NULL
		DROP PROCEDURE InsertTopic_Sp;
Go
create procedure InsertTopic_Sp
    @Top_Id INT,        
    @TName VARCHAR(20),      
AS
BEGIN
    BEGIN TRY          
        Insert Into Topic (Top_id, Top_name)
        Values (@Top_Id, @TName);        
		IF @@ROWCOUNT > 0
			SELECT 'Data inserted successfully into topic' AS Msg;
		ELSE
			SELECT 'Insert operation failed. No rows affected.' AS Msg;
    END TRY
    BEGIN CATCH                
        Select 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO

--9
GO
if OBJECT_ID('InsertEnrollment_SP','p') IS NOT NULL
	Drop Procedure InsertEnrollment_SP;
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

--10
GO
if OBJECT_ID('InsertStudent_SP','p') IS NOT NULL
	Drop Procedure InsertStudent_SP;
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

--11
GO
-- It requires the Student ID (@SID), Exam ID (@Ex_ID), Grade, Date, and Duration.
IF OBJECT_ID('InsertStdExam_Sp','P') IS NOT NULL
		DROP PROCEDURE InsertStdExam_Sp;
Go
Create Procedure InsertStdExam_Sp
    @SID int,       
    @Ex_ID int,      
    @Grade varchar(10),  
    @Date date,      
    @Duration int    
AS
BEGIN
    BEGIN TRY    
        Insert Into Std_Exam (SID, Ex_ID, Grade, Date, Duration)
        Values (@SID, @Ex_ID, @Grade, @Date, @Duration);             
		IF @@ROWCOUNT > 0
			SELECT 'Data inserted successfully into Std_Exam' AS Msg;
		ELSE
			SELECT 'Insert operation failed. No rows affected.' AS Msg;
    END TRY
    BEGIN CATCH                
        Select 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;


--12
GO
-- This stored procedure inserts a record into the Exam_Attendance table.
IF OBJECT_ID('InsertExamAttendance_Sp','P') IS NOT NULL
		DROP PROCEDURE InsertExamAttendance_Sp;
Go
create Procedure InsertExamAttendance_Sp
    @S_id int,   
    @C_id int,    
    @Ex_id int  
AS
BEGIN
    BEGIN TRY        
        insert into Exam_Attendance (S_id, C_id, Ex_id)
        Values (@S_id, @C_id, @Ex_id);      
		IF @@ROWCOUNT > 0
			SELECT 'Data inserted successfully into Exam_Attendance' AS Msg;
		ELSE
			SELECT 'Insert operation failed. No rows affected.' AS Msg;
    END TRY
    BEGIN CATCH        
        Select 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO

--13
GO
-- Creating a stored procedure to insert a new exam into the Exam table
IF OBJECT_ID('InsertExam_Sp','P') IS NOT NULL
		DROP PROCEDURE InsertExam_Sp;
Go
create procedure InsertExam_Sp
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
        Insert Into Exam (Ex_Id, EName, No_MCQ, No_TF, Fk_CID, Start_Time, Duration)
        Values (@Ex_Id, @EName, @No_MCQ, @No_TF, @Fk_CID, @Start_Time, @Duration);        
		IF @@ROWCOUNT > 0
			SELECT 'Data inserted successfully into Exam' AS Msg;
		ELSE
			SELECT 'Insert operation failed. No rows affected.' AS Msg;
    END TRY
    BEGIN CATCH                
        Select 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO


--14
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

--15
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

--16
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
