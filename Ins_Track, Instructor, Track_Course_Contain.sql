--Stored Procedures of:(Ins_Track, Instructor, Track_Course_Contain)
Use Examination_System;
--check if the procedure exists , then drop it
if OBJECT_ID('InsertIns_Track_SP','p') IS NOT NULL
	Drop Procedure InsertIns_Track_SP;

GO
--1-Ins_Track:
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


GO
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
--check if the procedure exists , then drop it
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
--check if the procedure exists , then drop it
if OBJECT_ID('DeleteIns_Track_SP','p') IS NOT NULL
	Drop Procedure DeleteIns_Track_SP;

GO

CREATE PROCEDURE DeleteIns_Track_SP
     @Iid INT,
    @Tid INT
AS
BEGIN
	begin try
    DELETE FROM Ins_Track
    WHERE T_id=@Tid and  Ins_id=@Iid
	end try
	begin catch
		print 'an error occured during deleting from Ins_Track table'
	end catch
END;


GO
--check if the procedure exists , then drop it
if OBJECT_ID('InsertInstructor_SP','p') IS NOT NULL
	Drop Procedure InsertInstructor_SP;

GO
--2
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

GO

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

--check if the procedure exists , then drop it
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

--check if the procedure exists , then drop it
if OBJECT_ID('DeleteInstructor_SP','p') IS NOT NULL
	Drop Procedure DeleteInstructor_SP;

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

Go

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

--check if the procedure exists , then drop it
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

--check if the procedure exists , then drop it
if OBJECT_ID('DeleteTrackCourseContain_SP','p') IS NOT NULL
	Drop Procedure DeleteTrackCourseContain_SP;

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