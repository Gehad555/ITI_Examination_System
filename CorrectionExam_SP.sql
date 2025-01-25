-- CorrectExam_SP: Procedure to calculate student's total grade
CREATE PROCEDURE CorrectExam_SP
    @ExamID INT,
    @StudentID INT,
    @TotalGrade DECIMAL(5, 2) OUTPUT
AS
BEGIN
    SET @TotalGrade = 0;

    DECLARE ExamCursor CURSOR FOR
    SELECT Q.Grade, EQ.Std_Answer, Q.CorrectAns
    FROM ExamQuestion EQ
    INNER JOIN Question Q ON EQ.Q_id = Q.Q_id
	INNER JOIN Std_Exam SE ON SE.Ex_ID = EQ.Ex_Id AND SE.SID = @StudentID
    WHERE EQ.Ex_Id = @ExamID;

    DECLARE @Grade DECIMAL(5, 2);
    DECLARE @Std_Answer VARCHAR(255);
    DECLARE @CorrectAns VARCHAR(255);

    OPEN ExamCursor;

    FETCH NEXT FROM ExamCursor INTO @Grade, @Std_Answer, @CorrectAns;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @Std_Answer = @CorrectAns
        BEGIN
            SET @TotalGrade = @TotalGrade + @Grade;
        END;

        FETCH NEXT FROM ExamCursor INTO @Grade, @Std_Answer, @CorrectAns;
    END;

    CLOSE ExamCursor;
    DEALLOCATE ExamCursor;

    UPDATE Std_Exam
    SET Grade = CAST(@TotalGrade AS VARCHAR(10))
    WHERE SID = @StudentID AND Ex_ID = @ExamID;
END;
GO


-- TotalGradeForExam_SP: Procedure to calculate total grade for the exam
ALTER PROCEDURE TotalGradeForExam_SP
    @ExamID INT,
    @TotalGrade DECIMAL(5, 2) OUTPUT
AS
BEGIN
    SET @TotalGrade = 0;

    -- Sum up the grades of all questions in the exam
    SELECT @TotalGrade = SUM(q.Grade)
    FROM Question q
    INNER JOIN ExamQuestion eq ON q.Q_id = eq.Q_id
    INNER JOIN Exam e ON eq.Ex_Id = e.Ex_Id
    WHERE e.Ex_Id = @ExamID;
END;
GO


-- Execute both procedures and print results
DECLARE @TotalGrade DECIMAL(5, 2);
DECLARE @ExamTotalGrade DECIMAL(5, 2);

-- Execute CorrectExam_SP to get student's total grade
EXEC CorrectExam_SP
    @ExamID = 1,   
    @StudentID = 5,
    @TotalGrade = @TotalGrade OUTPUT;

-- Execute TotalGradeForExam_SP to get total grade for the exam
EXEC TotalGradeForExam_SP
    @ExamID = 1,
    @TotalGrade = @ExamTotalGrade OUTPUT;

-- Print both the student's total grade and the total grade for the exam
PRINT 'Student Total Grade: ' + CAST(@TotalGrade AS VARCHAR(10)) + ' / '+ CAST(@ExamTotalGrade AS VARCHAR(10));
