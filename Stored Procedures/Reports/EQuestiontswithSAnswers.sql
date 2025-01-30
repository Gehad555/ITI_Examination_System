GO
IF OBJECT_ID('EQuestiontswithSAnswers_SP', 'P') IS NOT NULL
    DROP PROCEDURE EQuestiontswithSAnswers_SP;
GO
create procedure EQuestiontswithSAnswers_SP
@Qid int,
@Sid int
as
	begin
		select Q.Body ,EQ.Std_Answer,Q.CorrectAns
		from Question Q join ExamQuestion EQ 
		on Q.Q_id=EQ.Q_id 
		join Exam_Attendance EA 
		on  EQ.Ex_Id=EA.Ex_id
		where EQ.Ex_Id=@Qid AND EA.S_id=@Sid
	end




