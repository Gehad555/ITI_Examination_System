GO
CREATE TRIGGER SetDefaultHireDateAfterInsert
ON Ins_Track
AFTER INSERT
AS
BEGIN
    
    UPDATE IT
    SET IT.HireDate = GETDATE()
    FROM Ins_Track IT 
    WHERE IT.HireDate IS NULL;
END;

INSERT INTO Ins_Track (T_id, Ins_id) VALUES (1, 101);