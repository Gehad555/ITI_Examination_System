-- Stored Procedure for CRUD Operations on the 'Branch' Table
Use Examination_System;

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



GO
--check if the procedure exists , then drop it
if OBJECT_ID('GetBranch_SP','p') IS NOT NULL
	Drop Procedure GetBranch_SP;

GO
-- Read (Select) Branche
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
--check if the procedure exists , then drop it
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
--check if the procedure exists , then drop it
if OBJECT_ID('DeleteBranch_SP','p') IS NOT NULL
	Drop Procedure DeleteBranch_SP;

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



-- Stored Procedure for CRUD Operations on the 'Track' Table


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



GO
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
--check if the procedure exists , then drop it
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
--check if the procedure exists , then drop it
if OBJECT_ID('DeleteTrack_SP','p') IS NOT NULL
	Drop Procedure DeleteTrack_SP;

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

-- Stored Procedure for CRUD Operations on the 'BranchTrack' Table

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


GO
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
--check if the procedure exists , then drop it
if OBJECT_ID('DeleteBranchTrack_SP','p') IS NOT NULL
	Drop Procedure DeleteBranchTrack_SP;

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

-- Stored Procedure for Update Operation on the 'BranchTrack' Table

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
