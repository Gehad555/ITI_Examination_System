--	Report that takes the student ID and returns the grades of the
--  student in all courses.
exec  GetStudentGradesAllCoures_SP 1
IF OBJECT_ID('GetStudentGradesAllCoures_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetStudentGradesAllCoures_SP;
GO
CREATE OR ALTER PROCEDURE GetStudentGradesAllCoures_SP
	@Std_ID INT
As
	BEGIN
		BEGIN TRY
			SELECT S.S_ID,CONCAT(S.F_Name , ' ',S.L_Name) AS StudentName ,
			C.C_ID , C.C_Name ,ISNULL(SUM(Cast(SE.Grade As Float)),0) as TotalGrade   FROM
			Student AS S inner join Enroll_Crs_Std AS ES
			on S.S_id = ES.S_id
			inner join Course AS C
			on C.C_id = ES.C_id
			inner join Exam AS E
			on E.Fk_CID = C.C_id
			inner join Std_Exam AS SE
			on E.Ex_Id = SE.Ex_ID
			where S.S_id = @Std_ID
			group by S.S_ID ,S.F_Name,S.L_Name,C.C_ID,C.C_Name
			order by C.C_ID
		END TRY
		BEGIN CATCH
			SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;     
		END CATCH
	END;
GO

