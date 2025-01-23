-----------------------------------Student--------------------------
CREATE PROCEDURE GetAllStudents
AS
BEGIN
    SELECT *
    FROM Student;
END;

--------------------------------------------------------------------

CREATE PROCEDURE GetStudentById
    @S_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Student WHERE S_id = @S_id)
    BEGIN
        SELECT *
        FROM Student
        WHERE S_id = @S_id;
    END
    ELSE
    BEGIN
        SELECT 'Student not found';
    END
END;

EXEC GetStudentById @S_id = 1;
--------------------------------------------------------------------
CREATE PROCEDURE DeleteStudent
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
--------------------------------------------------------------------
CREATE PROCEDURE InsertStudent
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

---------------------------------------------------------------------
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


-----------------------------------Course--------------------------
CREATE PROCEDURE InsertCourse
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

----------------------------------------------------------------------------
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
---------------------------------------------------------------------------
CREATE PROCEDURE DeleteCourse
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
------------------------------------------------------------------------------
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

---------------------------------Enroll_Crs_Std--------------------------
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
--------------------------------------------------------------------------
CREATE PROCEDURE DeleteEnrollment
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
-------------------------------------------------------------------------------
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
-----------------------------------------------------------------------------------
CREATE PROCEDURE InsertEnrollment
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
-------------------------------------------------------------------------------------



