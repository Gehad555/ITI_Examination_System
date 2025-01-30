IF OBJECT_ID('GetTopicNameByID_SP', 'P') IS NOT NULL
    DROP PROCEDURE GetTopicNameByID_SP;
GO
CREATE OR ALTER PROCEDURE GetTopicNameByID_SP
	@CRS_ID INT
As
	BEGIN
		BEGIN TRY
		Select T.TOP_iD ,T.TOP_Name , C.C_Name FROM
		Course AS C inner join Topic AS T
		on T.Fk_crs_id = C.C_id 
		where C.C_id = @CRS_ID 
		END   TRY
		BEGIN CATCH
			SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Msg;    
		END CATCH
	END;


