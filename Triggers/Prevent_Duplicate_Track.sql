CREATE TRIGGER trg_PreventDuplicateTrack
ON Track
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT t.T_Name
        FROM Track t
        INNER JOIN inserted i ON t.T_Name = i.T_Name
    )
    BEGIN
        PRINT '? This track already exists! You cannot add a track with the same name.';
        ROLLBACK TRANSACTION;
        RETURN;
    END

    INSERT INTO Track (T_id, T_Name, FK_Ins_Id)
    SELECT T_id, T_Name, FK_Ins_Id FROM inserted;
    
    PRINT '? Track has been successfully inserted!';
END;
GO
