IF OBJECT_ID('GetStudentGradesAllCoures_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetStudentGradesAllCoures_SP;
GO
CREATE OR ALTER PROCEDURE GetStudentGradesAllCoures_SP
    @Std_ID INT
AS
BEGIN
    BEGIN TRY
        SELECT 
            S.S_ID,
            CONCAT(S.F_Name, ' ', S.L_Name) AS StudentName,
            C.C_ID,C.C_Name,
            ISNULL(COUNT(DISTINCT E.Ex_Id), 0) AS ExamCount, 
            ISNULL(SUM(CAST(SE.Grade AS FLOAT)), 0) AS TotalGrade,  
            CASE 
                WHEN ISNULL(SUM(CAST(SE.Grade AS FLOAT)), 0) >= (ISNULL(COUNT(DISTINCT E.Ex_Id), 0) * 10) / 2  
                THEN 'Pass' 
                ELSE 'Fail' 
            END AS Status  
        FROM Student AS S
        INNER JOIN Enroll_Crs_Std AS ES ON S.S_ID = ES.S_ID
        INNER JOIN Course AS C ON C.C_ID = ES.C_ID
        LEFT JOIN Exam AS E ON E.Fk_CID = C.C_ID  
        LEFT JOIN Std_Exam AS SE ON E.Ex_Id = SE.Ex_ID AND SE.SID = S.S_ID 
        WHERE S.S_ID = @Std_ID
        GROUP BY S.S_ID, S.F_Name, S.L_Name, C.C_ID, C.C_Name
        ORDER BY C.C_ID;
    END TRY
    BEGIN CATCH
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;     
    END CATCH
END;
GO

exec GetStudentGradesAllCoures_SP 1
