GO


IF OBJECT_ID('GenerateExam', 'P') IS NOT NULL
    DROP PROCEDURE GenerateExam;
GO

CREATE PROCEDURE GenerateExam
    @InstructorID INT,
    @CourseID INT,
    @ExamName NVARCHAR(255), 
    @Duration INT, 
    @StartTime TIME, 
    @TotalMCQ INT 
    
AS
BEGIN
    DECLARE @ExamID INT;
    DECLARE @AvailableMCQ INT;
    DECLARE @AvailableTF INT;
	set @ExamID= (select count(ex_id) from Exam)+1
	BEGIN TRY
        -- التحقق من أن المدرب مرتبط بالكورس عبر التراك
        IF NOT EXISTS (
            SELECT top(1)*
            FROM dbo.Track T
            JOIN dbo.Track_Course_Contain TC ON T.T_id = TC.T_id  JOIN dbo.Course c on TC.C_id=c.C_id
            WHERE T.FK_Ins_Id = @InstructorID AND C.C_id = @CourseID
        )
        BEGIN
            RAISERROR ('Instructor does not have permission for this course.', 16, 1);
            RETURN;
        END
		-- التحقق من وجود عدد كافٍ من الأسئلة
        SELECT @AvailableMCQ = COUNT(*)
        FROM dbo.Question q join ExamQuestion eq on q.Q_id=eq.Q_id 
		join exam e on eq.Ex_Id=e.Ex_Id join Course c on e.Fk_CID=c.C_id
        WHERE e.Fk_CID = @CourseID AND q.Type = 'Choice';

        SELECT @AvailableTF = COUNT(*)
         FROM dbo.Question q join ExamQuestion eq on q.Q_id=eq.Q_id 
		join exam e on eq.Ex_Id=e.Ex_Id join Course c on e.Fk_CID=c.C_id
        WHERE Fk_CID = @CourseID AND Type = 'True/False';

        IF @AvailableMCQ < @TotalMCQ 
        BEGIN
            RAISERROR ('Not enough questions available for the specified exam.', 16, 1);
            RETURN;
        END
		-- إدخال بيانات الامتحان في جدول Exam
        INSERT INTO dbo.Exam (Ex_Id,EName, No_MCQ, No_TF, Fk_CID, Start_Time, Duration)
        VALUES (@ExamID,@ExamName, @TotalMCQ,2-@TotalMCQ, @CourseID, @StartTime, @Duration);

      

		INSERT INTO dbo.ExamQuestion (Ex_Id, Q_id)
        SELECT TOP (@TotalMCQ) @ExamID, q.Q_id
        FROM dbo.Question q join ExamQuestion eq on q.Q_id=eq.Q_id 
		join exam e on eq.Ex_Id=e.Ex_Id join Course c on e.Fk_CID=c.C_id
        WHERE Fk_CID = @CourseID AND Type = 'Choice'
        ORDER BY NEWID();

 
        INSERT INTO dbo.ExamQuestion (Ex_Id, Q_id)
        SELECT TOP (2-@TotalMCQ) @ExamID, q.Q_id
         FROM dbo.Question q join ExamQuestion eq on q.Q_id=eq.Q_id 
		join exam e on eq.Ex_Id=e.Ex_Id join Course c on e.Fk_CID=c.C_id
        WHERE Fk_CID = @CourseID AND Type = 'True/False'
        ORDER BY NEWID();

        PRINT 'Exam created success'

END TRY
    BEGIN CATCH
        PRINT 'An error occurred while creating the exam.';
        THROW;
    END CATCH
END;
GO


--GenerateExam 1 ,1, 'Introduction to Programming' ,2,'2025-03-01 10:00:00.000',1

 