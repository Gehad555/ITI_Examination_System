USE Examination_System;
-- Execute GetExamQuestion_SP
EXEC GetExamQuestion_SP @Ex_Id = 1, @Q_id = 1;

-- Execute InsertExamQuestion_SP
EXEC InsertExamQuestion_SP @Ex_Id = 11, @Q_id = 10, @Std_Answer = 'Sample Answer';

-- Execute DeleteExamQuestion_SP
EXEC DeleteExamQuestion_SP @Ex_Id = 11, @Q_id = 10;

-- Execute GetQuestion_SP
EXEC GetQuestion_SP @Q_id = 10;

-- Execute InsertQuestion_SP
EXEC InsertQuestion_SP 
    @Q_id = 11, 
    @Body = 'Define SQL and its purpose.', 
    @CorrectAns = 'Structured Query Language', 
    @Type = 'Choice', 
    @Grade = 10.00;

-- Execute DeleteQuestion_SP
EXEC DeleteQuestion_SP @Q_id = 11;


-- Execute GetChoice_SP
EXEC GetChoice_SP @Q_id = 4, @Choice_Id = 1;

-- Execute InsertChoice_SP
EXEC InsertChoice_SP 
    @Q_id = 11, 
    @Choice_Id = 1, 
    @Choice_Text = 'Structured Query Language';

-- Execute DeleteChoice_SP
EXEC DeleteChoice_SP @Q_id = 11, @Choice_Id = 1;


-- Update Choices
EXEC Update_Choices_SP @Q_id = 1, @Choice_Id = 2, @Choice_Text = 'Updated Choice Text';

-- Update Question
EXEC Update_Question_SP 
    @Q_id = 1, 
    @Body = 'Updated Body', 
    @CorrectAns = 'Correct Answer', 
    @Type = 'Choice', 
    @Grade = 5.0;

-- Update ExamQuestion
EXEC Update_ExamQuestion_SP @Ex_Id = 1, @Q_id = 2, @Std_Answer = 'Updated Answer';
