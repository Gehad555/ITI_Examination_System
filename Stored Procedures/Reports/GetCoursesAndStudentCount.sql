IF OBJECT_ID('GetCoursesAndStudentCount_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetCoursesAndStudentCount_SP;
GO
CREATE PROCEDURE GetCoursesAndStudentCount_SP
    @InstructorID INT
AS
BEGIN
    BEGIN TRY
        SELECT 
            CONCAT(I.Ins_Fname, ' ', I.Ins_Lname) AS Instructor_Name, 
            C.C_Name AS Course_Name,COUNT(ECS.S_id) AS Number_of_Students
        FROM 
            Instructor I
        JOIN 
            Course C ON I.Ins_id = C.FK_Ins_id
        JOIN 
            Enroll_Crs_Std ECS ON C.C_id = ECS.C_id
        WHERE 
            I.Ins_id = @InstructorID
        GROUP BY 
            CONCAT(I.Ins_Fname, ' ', I.Ins_Lname), C.C_Name
        ORDER BY 
            COUNT(ECS.S_id) DESC; 
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while fetching courses and student counts!';
        THROW;
    END CATCH;
END;
GO
