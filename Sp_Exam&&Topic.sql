/*start topic*/
--select operation
IF OBJECT_ID('GetTopicById_SP','P') IS NOT NULL
		DROP PROCEDURE GetTopicById_SP;
Go
Create Procedure GetTopicById_SP
    @Top_Id int
AS
BEGIN
    BEGIN TRY                 
            select * from Topic
            where Top_id = @Top_Id;     
    END TRY
    BEGIN CATCH        
        select 'An error occurred: ' + ERROR_MESSAGE() AS Msg;      
    END CATCH
END;
Go
--insert operation
IF OBJECT_ID('InsertTopic_Sp','P') IS NOT NULL
		DROP PROCEDURE InsertTopic_Sp;
Go
create procedure InsertTopic_Sp
    @Top_Id INT,        
    @TName VARCHAR(20),      
AS
BEGIN
    BEGIN TRY          
        Insert Into Topic (Top_id, Top_name)
        Values (@Top_Id, @TName);        
		IF @@ROWCOUNT > 0
			SELECT 'Data inserted successfully into topic' AS Msg;
		ELSE
			SELECT 'Insert operation failed. No rows affected.' AS Msg;
    END TRY
    BEGIN CATCH                
        Select 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO
--update operation
IF OBJECT_ID('UpdateTopic_Sp','P') IS NOT NULL
		DROP PROCEDURE UpdateTopic_Sp;
Go
Create Procedure UpdateTopic_Sp
    @Top_Id INT,        
    @TName VARCHAR(20),                        
AS
BEGIN
    BEGIN TRY          
        UPDATE Topic
        SET 
            Top_name = @TName, 
        WHERE Top_id = @Top_Id ;       
		IF @@ROWCOUNT > 0
			SELECT 'Topic data updated successfully.' AS Msg;
		ELSE
			SELECT 'No data was updated, the topic record might not exist.' AS Msg
    END TRY
    BEGIN CATCH        
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO
--delete operation
IF OBJECT_ID('DeleteTopic_Sp','P') IS NOT NULL
		DROP PROCEDURE DeleteTopic_Sp;
Go
Create procedure DeleteTopic_Sp
    @Top_Id INT              
AS
BEGIN
    BEGIN TRY       
	    DELETE FROM Topic WHERE Top_id = @Top_Id;          
		IF @@ROWCOUNT > 0
			SELECT 'Topic data deleted successfully.' AS Msg;
		ELSE
			SELECT 'No data was deleted. The topic ID might not exist.' AS Msg;
    END TRY
    BEGIN CATCH
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
Go
/*end topic*/


/*Delete Operation */
-- Create Procedure to delete data from the Exam table
IF OBJECT_ID('DeleteExam_Sp','P') IS NOT NULL
		DROP PROCEDURE DeleteExam_Sp;
Go
Create procedure DeleteExam_Sp
    @Ex_Id INT              
AS
BEGIN
    BEGIN TRY       
	    DELETE FROM Exam WHERE Ex_Id = @Ex_Id;          
		IF @@ROWCOUNT > 0
			SELECT 'Exam data deleted successfully.' AS Msg;
		ELSE
			SELECT 'No data was deleted. The exam ID might not exist.' AS Msg;
    END TRY
    BEGIN CATCH
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
Go
-- Create Procedure to delete data from the Std_Exam table
IF OBJECT_ID('DeleteStdExam_Sp','P') IS NOT NULL
		DROP PROCEDURE DeleteStdExam_Sp;
Go
Create Procedure DeleteStdExam_Sp
    @SID INT,               
    @Ex_ID INT              
AS
BEGIN
    BEGIN TRY       
	    DELETE FROM Std_Exam WHERE SID = @SID AND Ex_ID = @Ex_ID;          
		IF @@ROWCOUNT > 0        
			SELECT 'Std_Exam data deleted successfully.' AS Msg;        
		ELSE        
			SELECT 'No Std_Exam record found with the specified SID and Ex_ID.' AS Msg;        
    END TRY
    BEGIN CATCH        
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO
-- Create Procedure to delete data from the Exam_Attendance table
IF OBJECT_ID('DeleteExamAttendance_Sp','P') IS NOT NULL
		DROP PROCEDURE DeleteExamAttendance_Sp;
Go
Create Procedure DeleteExamAttendance_Sp
    @S_id INT,              
    @C_id INT,          
    @Ex_id INT             
AS
BEGIN
    BEGIN TRY       
		DELETE FROM Exam_Attendance WHERE S_id = @S_id AND C_id = @C_id AND Ex_id = @Ex_id;  
		IF @@ROWCOUNT > 0        
			SELECT 'Exam attendance data deleted successfully.' AS Msg;        
		ELSE        
			SELECT 'No attendance record found with the specified IDs.' AS Msg;        
    END TRY
    BEGIN CATCH       
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
Go

/*Update Operation*/
-- Create Procedure to update an existing record in the Exam table
IF OBJECT_ID('UpdateExam_Sp','P') IS NOT NULL
		DROP PROCEDURE UpdateExam_Sp;
Go
Create Procedure UpdateExam_Sp
    @Ex_Id INT,             
    @EName VARCHAR(255),    
    @No_MCQ INT,            
    @No_TF INT,             
    @Fk_CID INT,            
    @Start_Time DATETIME,  
    @Duration INT           
AS
BEGIN
    BEGIN TRY            
        UPDATE Exam
        SET 
            EName = @EName, 
            No_MCQ = @No_MCQ, 
            No_TF = @No_TF, 
            Fk_CID = @Fk_CID, 
            Start_Time = @Start_Time, 
            Duration = @Duration
        WHERE Ex_Id = @Ex_Id;                 
		IF @@ROWCOUNT > 0
			SELECT 'Exam data updated successfully.' AS Msg;
		ELSE
			SELECT 'No data was updated, the exam ID might not exist.' AS Msg;
    END TRY
    BEGIN CATCH       
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO
-- Create Procedure to update a student's exam record in the Std_Exam table
IF OBJECT_ID('UpdateStdExam_Sp','P') IS NOT NULL
		DROP PROCEDURE UpdateStdExam_Sp;
Go
Create Procedure UpdateStdExam_Sp
    @SID INT,             
    @Ex_ID INT,              
    @Grade VARCHAR(10),      
    @Date DATE,              
    @Duration INT            
AS
BEGIN
    BEGIN TRY           
        UPDATE Std_Exam
        SET 
            Grade = @Grade, 
            Date = @Date, 
            Duration = @Duration
        WHERE SID = @SID AND Ex_ID = @Ex_ID;         
        IF @@ROWCOUNT > 0
            SELECT 'Student exam data updated successfully.' AS Msg;
        ELSE
            SELECT 'No data was updated, the student exam record might not exist.' AS Msg;
    END TRY
    BEGIN CATCH        
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO
-- Create Procedure to update the Exam Attendance record in the Exam_Attendance table
IF OBJECT_ID('UpdateExamAttendance_Sp','P') IS NOT NULL
		DROP PROCEDURE UpdateExamAttendance_Sp;
Go
Create Procedure UpdateExamAttendance_Sp
    @S_id INT,              
    @C_id INT,              
    @Ex_id INT              
AS
BEGIN
    BEGIN TRY          
        UPDATE Exam_Attendance
        SET 
            S_id = @S_id, 
            C_id = @C_id, 
            Ex_id = @Ex_id
        WHERE S_id = @S_id AND C_id = @C_id AND Ex_id = @Ex_id;       
		IF @@ROWCOUNT > 0
			SELECT 'Exam attendance data updated successfully.' AS Msg;
		ELSE
			SELECT 'No data was updated, the attendance record might not exist.' AS Msg
    END TRY
    BEGIN CATCH        
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO
/*Insert Operation*/

-- This stored procedure inserts a record into the Exam_Attendance table.
IF OBJECT_ID('InsertExamAttendance_Sp','P') IS NOT NULL
		DROP PROCEDURE InsertExamAttendance_Sp;
Go
create Procedure InsertExamAttendance_Sp
    @S_id int,   
    @C_id int,    
    @Ex_id int  
AS
BEGIN
    BEGIN TRY        
        insert into Exam_Attendance (S_id, C_id, Ex_id)
        Values (@S_id, @C_id, @Ex_id);      
		IF @@ROWCOUNT > 0
			SELECT 'Data inserted successfully into Exam_Attendance' AS Msg;
		ELSE
			SELECT 'Insert operation failed. No rows affected.' AS Msg;
    END TRY
    BEGIN CATCH        
        Select 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO
-- It requires the Student ID (@SID), Exam ID (@Ex_ID), Grade, Date, and Duration.
IF OBJECT_ID('InsertStdExam_Sp','P') IS NOT NULL
		DROP PROCEDURE InsertStdExam_Sp;
Go
Create Procedure InsertStdExam_Sp
    @SID int,       
    @Ex_ID int,      
    @Grade varchar(10),  
    @Date date,      
    @Duration int    
AS
BEGIN
    BEGIN TRY    
        Insert Into Std_Exam (SID, Ex_ID, Grade, Date, Duration)
        Values (@SID, @Ex_ID, @Grade, @Date, @Duration);             
		IF @@ROWCOUNT > 0
			SELECT 'Data inserted successfully into Std_Exam' AS Msg;
		ELSE
			SELECT 'Insert operation failed. No rows affected.' AS Msg;
    END TRY
    BEGIN CATCH                
        Select 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO
-- Creating a stored procedure to insert a new exam into the Exam table
IF OBJECT_ID('InsertExam_Sp','P') IS NOT NULL
		DROP PROCEDURE InsertExam_Sp;
Go
create procedure InsertExam_Sp
    @Ex_Id INT,        
    @EName VARCHAR(255),
    @No_MCQ INT,       
    @No_TF INT,         
    @Fk_CID INT,        
    @Start_Time DATETIME, 
    @Duration INT       
AS
BEGIN
    BEGIN TRY          
        Insert Into Exam (Ex_Id, EName, No_MCQ, No_TF, Fk_CID, Start_Time, Duration)
        Values (@Ex_Id, @EName, @No_MCQ, @No_TF, @Fk_CID, @Start_Time, @Duration);        
		IF @@ROWCOUNT > 0
			SELECT 'Data inserted successfully into Exam' AS Msg;
		ELSE
			SELECT 'Insert operation failed. No rows affected.' AS Msg;
    END TRY
    BEGIN CATCH                
        Select 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO
/*Select Operation*/

-- It filters based on the Student ID (@S_id), Course ID (@C_id), and Exam ID (@Ex_id).
IF OBJECT_ID('GetExamAttendance_Sp','P') IS NOT NULL
		DROP PROCEDURE GetExamAttendance_Sp;
Go
Create Procedure GetExamAttendance_Sp
    @S_id int,    
    @C_id int,  
    @Ex_id int
AS
BEGIN
    BEGIN TRY        
        select * from Exam_Attendance
        where S_id = @S_id and C_id = @C_id and Ex_id = @Ex_id;
    END TRY
    BEGIN CATCH        
        select 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO
-- It filters based on the Student ID (@p_SID) and Exam ID (@p_Ex_ID).
IF OBJECT_ID('GetStdExam_Sp','P') IS NOT NULL
		DROP PROCEDURE GetStdExam_Sp;
Go
Create Procedure GetStdExam_Sp
     @p_SID int ,    
     @p_Ex_ID int     
As
BEGIN
    BEGIN TRY
        select * from  Std_Exam
        where  SID = @p_SID and  Ex_ID = @p_Ex_ID;
    END TRY
    BEGIN CATCH        
        select 'An error occurred: ' + ERROR_MESSAGE() AS Msg;        
    END CATCH
END;
GO
-- It filters based on the Exam ID (@Ex_Id).
IF OBJECT_ID('GetExamById_SP','P') IS NOT NULL
		DROP PROCEDURE GetExamById_SP;
Go
Create Procedure GetExamById_SP
    @Ex_Id int
AS
BEGIN
    BEGIN TRY                 
            select * from Exam
            where Ex_Id = @Ex_Id;     
    END TRY
    BEGIN CATCH        
        select 'An error occurred: ' + ERROR_MESSAGE() AS Msg;      
    END CATCH
END;
GO