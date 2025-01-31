USE Examination_System;

INSERT INTO Branch (B_id, B_name, City, ZIP_Code, Street, B_Phone, Mgr_Name, Mgr_Phone, Mgr_Selected_Date)
VALUES
(1, 'ITI Smart Village', 'Giza', 12577, 'Smart Village', '02-35355678', 'Ahmed Ali', '010-1234567', '2022-01-15'),
(2, 'ITI Alexandria', 'Alexandria', 21615, 'Al Smoha', '03-4242433', 'Mona Khaled', '011-2345678', '2022-03-01'),
(3, 'ITI Mansoura', 'Mansoura', 35511, 'Mansoura Center', '050-2266412', 'Tamer Mostafa', '012-3456789', '2021-12-10'),
(4, 'ITI Ismailia', 'Ismailia', 41522, 'Technology Zone', '064-3487552', 'Sara Mahmoud', '013-4567890', '2022-04-20'),
(5, 'ITI Assiut', 'Assiut', 71515, 'Assiut Technology', '088-2456783', 'Youssef Hany', '014-5678901', '2022-05-25'),
(6, 'ITI Sohag', 'Sohag', 82515, 'Sohag Technology', '093-2267345', 'Nada Hassan', '015-6789012', '2022-06-30'),
(7, 'ITI Aswan', 'Aswan', 42511, 'Aswan Innovation', '097-2345678', 'Omar Reda', '016-7890123', '2021-11-18'),
(8, 'ITI Port Said', 'Port Said', 42511, 'Port Said Technology', '066-3456789', 'Mai Sami', '017-8901234', '2021-09-22'),
(9, 'ITI Zagazig', 'Zagazig', 44515, 'Zagazig Campus', '055-2234567', 'Hesham Ibrahim', '018-9012345', '2022-02-14'),
(10, 'ITI Fayoum', 'Fayoum', 63511, 'Fayoum Technology', '084-2245678', 'Laila Khalil', '019-0123456', '2021-08-05');



INSERT INTO Instructor (Ins_id, Ins_Fname, Ins_Lname, City, Street, Phone, Email, Password, Salary, Promotion_Date, Gender)
VALUES
(1, 'Ahmed', 'Hassan', 'Cairo', 'Nasr City', '01012345678', 'ahmed.hassan@example.com', 'pass123', 15000, '2023-06-15', 'M'),
(2, 'Sara', 'Ali', 'Giza', 'Mohandessin', '01123456789', 'sara.ali@example.com', 'pass456', 14000, '2022-12-01', 'F'),
(3, 'Mohamed', 'Fawzy', 'Alexandria', 'Smoha', '01234567890', 'mohamed.fawzy@example.com', 'pass789', 16000, '2023-01-20', 'M'),
(4, 'Mona', 'Youssef', 'Mansoura', 'Talkha', '01098765432', 'mona.youssef@example.com', 'pass321', 14500, '2022-10-10', 'F'),
(5, 'Ibrahim', 'Sayed', 'Ismailia', 'Technology Zone', '01298765432', 'ibrahim.sayed@example.com', 'pass654', 15500, '2023-03-25', 'M'),
(6, 'Laila', 'Mahmoud', 'Sohag', 'Downtown', '01198765432', 'laila.mahmoud@example.com', 'pass111', 13500, '2022-11-05', 'F'),
(7, 'Khaled', 'Adel', 'Port Said', 'Port Area', '01045678901', 'khaled.adel@example.com', 'pass222', 14000, '2023-07-30', 'M'),
(8, 'Nada', 'Omar', 'Aswan', 'City Center', '01145678901', 'nada.omar@example.com', 'pass333', 13800, '2022-09-15', 'F'),
(9, 'Tarek', 'Ibrahim', 'Fayoum', 'New Fayoum', '01245678901', 'tarek.ibrahim@example.com', 'pass444', 14200, '2023-02-10', 'M'),
(10, 'Hana', 'Salem', 'Zagazig', 'Tech Campus', '01098712345', 'hana.salem@example.com', 'pass555', 15000, '2023-08-01', 'F');


INSERT INTO Question (Q_id,Body, CorrectAns, Type, Grade) 
VALUES
-- True/False Questions
(1, 'Is the Earth round?',  'True', 'True/False', 1.00),
(2, 'Is 2+2 equal to 5?',  'False', 'True/False', 1.00),
(3, 'Does water boil at 100°C?', 'True', 'True/False', 1.00),
(4, 'Is the sun a planet?',  'False', 'True/False', 1.00),
(5, 'Is Python a programming language?',  'False', 'True/False', 1.00),

-- Choice Questions
(6, 'What is the capital of Egypt?', 'Cairo', 'Choice', 2.00),
(7, 'What is 5+3?',  '8', 'Choice', 2.00),
(8, 'Which is a mammal?', 'Dolphin', 'Choice', 2.00),
(9, 'What is the chemical symbol for water?', 'H2O', 'Choice', 2.00),
(10, 'What is the largest planet?',  'Jupiter', 'Choice', 2.00);




INSERT INTO Track (T_id, T_Name, FK_Ins_Id) 
VALUES
(1, 'Full Stack .NET', 1),
(2, 'Data Science', 2),
(3, 'Artificial Intelligence', 3),
(4, 'Cybersecurity', 4),
(5, 'Mobile App Development', 5),
(6, 'Cloud Computing', 6),
(7, 'Game Development', 7),
(8, 'DevOps Engineering', 8),
(9, 'Frontend Development', 9),
(10, 'Backend Development', 10);

--Branch Track

INSERT INTO BranchTrack (B_id, T_id) 
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

--Ins-Tarck

INSERT INTO Ins_Track (Ins_id, T_id,HireDate) 
VALUES
(1, 1, '2022-01-15'),
(2, 2, '2022-02-10'),
(3, 3, '2022-03-20'),
(4, 4, '2022-04-05'),
(5, 5, '2022-05-15'),
(6, 6, '2022-06-25'),
(7, 7, '2022-07-10'),
(8, 8, '2022-08-15'),
(9, 9, '2022-09-05'),
(10, 10, '2022-10-01');

--Course

INSERT INTO Course(C_id,Hours,C_Name,FK_ins_id) 
VALUES
(1, 40, 'Introduction to Programming', 1),
(2, 35, 'Data Structures', 2),
(3, 50, 'Database Management Systems', 3),
(4, 45, 'Web Development', 4),
(5, 30, 'Machine Learning Basics', 5),
(6, 20, 'Cybersecurity Fundamentals', 6),
(7, 25, 'Cloud Computing', 7),
(8, 40, 'Mobile App Development', 8),
(9, 30, 'Artificial Intelligence', 9),
(10, 50, 'Advanced Python Programming', 10);


-- Insert data into the Topic table
INSERT INTO Topic (Top_id, Top_name)
VALUES
(1, 'Programming'),
(2, 'Database'),
(3, 'Web Development'),
(4, 'Mobile Development'),
(5, 'Data Analysis'),
(6, 'Machine Learning'),
(7, 'Networking'),
(8, 'Cybersecurity'),
(9, 'Cloud Computing'),
(10, 'Artificial Intelligence');

--Track_Course_Contain

INSERT INTO Track_Course_Contain(C_id,T_id) 
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

--student

INSERT INTO Student (S_id, F_Name, L_Name, Phone, Email, Password, Gender, Age, Fk_Track, Street, City, Start_Date, End_Date)
VALUES
	 (1, 'John', 'Doe', '1234567890', 'john.doe@example.com', 'password123', 'M', 22, 1, '123 Main St', 'Cairo', '2023-01-01', '2023-12-31'),
(2, 'Jane', 'Smith', '9876543210', 'jane.smith@example.com', 'password123', 'F', 21, 2, '456 Elm St', 'Alexandria', '2023-02-01', '2023-12-31'),
(3, 'Ahmed', 'Ali', '1122334455', 'ahmed.ali@example.com', 'password123', 'M', 23, 3, '789 Maple St', 'Giza', '2023-03-01', '2023-12-31'),
(4, 'Sara', 'Hassan', '5566778899', 'sara.hassan@example.com', 'password123', 'F', 22, 4, '321 Oak St', 'Mansoura', '2023-04-01', '2023-12-31'),
(5, 'Mark', 'Taylor', '7788996655', 'mark.taylor@example.com', 'password123', 'M', 20, 5, '987 Cedar St', 'Cairo', '2023-05-01', '2023-12-31'),
(6, 'Layla', 'Adel', '6655778899', 'layla.adel@example.com', 'password123', 'F', 22, 6, '654 Spruce St', 'Asyut', '2023-06-01', '2023-12-31'),
(7, 'Ali', 'Farouk', '3344556677', 'ali.farouk@example.com', 'password123', 'M', 24, 7, '852 Pine St', 'Luxor', '2023-07-01', '2023-12-31'),
(8, 'Nour', 'Ibrahim', '4455667788', 'nour.ibrahim@example.com', 'password123', 'F', 21, 8, '147 Willow St', 'Ismailia', '2023-08-01', '2023-12-31'),
(9, 'Tamer', 'Said', '9988776655', 'tamer.said@example.com', 'password123', 'M', 23, 9, '258 Ash St', 'Fayoum', '2023-09-01', '2023-12-31'),
(10, 'Aya', 'Gamal', '7766554433', 'aya.gamal@example.com', 'password123', 'F', 22, 10, '369 Birch St', 'Cairo', '2023-10-01', '2023-12-31'),
(11, 'Khaled', 'Omar', '2233445566', 'khaled.omar@example.com', 'password123', 'M', 24, 1, '456 Willow St', 'Zagazig', '2023-11-01', '2023-12-31'),
(12, 'Mona', 'Hafez', '1122443366', 'mona.hafez@example.com', 'password123', 'F', 23, 2, '123 Cedar St', 'Tanta', '2023-11-15', '2023-12-31'),
(13, 'Hassan', 'Adel', '6655443322', 'hassan.adel@example.com', 'password123', 'M', 22, 3, '789 Maple St', 'Sohag', '2023-11-20', '2023-12-31'),
(14, 'Laila', 'Kamal', '2233557799', 'laila.kamal@example.com', 'password123', 'F', 20, 4, '321 Birch St', 'Minya', '2023-11-25', '2023-12-31'),
(15, 'Omar', 'Saeed', '5566447788', 'omar.saeed@example.com', 'password123', 'M', 25, 5, '987 Spruce St', 'Cairo', '2023-12-01', '2023-12-31'),
(16, 'Hala', 'Youssef', '8877665544', 'hala.youssef@example.com', 'password123', 'F', 21, 6, '654 Elm St', 'Beni Suef', '2023-12-05', '2023-12-31'),
(17, 'Mahmoud', 'Fathi', '3344221133', 'mahmoud.fathi@example.com', 'password123', 'M', 23, 7, '258 Oak St', 'Aswan', '2023-12-10', '2023-12-31'),
(18, 'Nadia', 'Samir', '9988772211', 'nadia.samir@example.com', 'password123', 'F', 22, 8, '147 Ash St', 'Port Said', '2023-12-15', '2023-12-31'),
(19, 'Adel', 'Mostafa', '7766558899', 'adel.mostafa@example.com', 'password123', 'M', 24, 9, '369 Willow St', 'Damietta', '2023-12-20', '2023-12-31'),
(20, 'Salma', 'Hisham', '8899776655', 'salma.hisham@example.com', 'password123', 'F', 21, 10, '741 Cedar St', 'Sharqia', '2023-12-25', '2023-12-31'),
(21, 'Ali', 'Salem', '1122334455', 'ali.salem@example.com', 'password123', 'M', 22, 1, '123 Main St', 'Cairo', '2024-01-01', '2024-12-31'),
(22, 'Dina', 'Farouk', '2233445566', 'dina.farouk@example.com', 'password123', 'F', 21, 2, '456 Elm St', 'Alexandria', '2024-01-05', '2024-12-31'),
(23, 'Youssef', 'Mahmoud', '3344556677', 'youssef.mahmoud@example.com', 'password123', 'M', 23, 3, '789 Maple St', 'Giza', '2024-01-10', '2024-12-31'),
(24, 'Nourhan', 'Samy', '4455667788', 'nourhan.samy@example.com', 'password123', 'F', 22, 4, '321 Oak St', 'Mansoura', '2024-01-15', '2024-12-31'),
(25, 'Tamer', 'Hesham', '5566778899', 'tamer.hesham@example.com', 'password123', 'M', 24, 5, '987 Cedar St', 'Cairo', '2024-01-20', '2024-12-31'),
(26, 'Lamis', 'Ahmed', '6677889900', 'lamis.ahmed@example.com', 'password123', 'F', 21, 6, '654 Spruce St', 'Asyut', '2024-01-25', '2024-12-31'),
(27, 'Omar', 'Khaled', '7788990011', 'omar.khaled@example.com', 'password123', 'M', 23, 7, '852 Pine St', 'Luxor', '2024-02-01', '2024-12-31'),
(28, 'Mariam', 'Gaber', '8899001122', 'mariam.gaber@example.com', 'password123', 'F', 22, 8, '147 Willow St', 'Ismailia', '2024-02-05', '2024-12-31'),
(29, 'Adel', 'Sameh', '9900112233', 'adel.sameh@example.com', 'password123', 'M', 24, 9, '258 Ash St', 'Fayoum', '2024-02-10', '2024-12-31'),
(30, 'Aya', 'Shokry', '0011223344', 'aya.shokry@example.com', 'password123', 'F', 20, 10, '369 Birch St', 'Cairo', '2024-02-15', '2024-12-31'),
(31, 'Karim', 'Hany', '1122443366', 'karim.hany@example.com', 'password123', 'M', 22, 1, '123 Main St', 'Giza', '2024-02-20', '2024-12-31'),
(32, 'Nesma', 'Hassan', '2233554477', 'nesma.hassan@example.com', 'password123', 'F', 21, 2, '456 Elm St', 'Alexandria', '2024-02-25', '2024-12-31'),
(33, 'Mostafa', 'Ibrahim', '3344665588', 'mostafa.ibrahim@example.com', 'password123', 'M', 23, 3, '789 Maple St', 'Tanta', '2024-03-01', '2024-12-31'),
(34, 'Rania', 'Gamal', '4455776699', 'rania.gamal@example.com', 'password123', 'F', 22, 4, '321 Oak St', 'Zagazig', '2024-03-05', '2024-12-31'),
(35, 'Hossam', 'Ayman', '5566887700', 'hossam.ayman@example.com', 'password123', 'M', 24, 5, '987 Cedar St', 'Cairo', '2024-03-10', '2024-12-31'),
(36, 'Heba', 'Sherif', '6677998811', 'heba.sherif@example.com', 'password123', 'F', 21, 6, '654 Spruce St', 'Beni Suef', '2024-03-15', '2024-12-31'),
(37, 'Mahmoud', 'Ali', '7788009911', 'mahmoud.ali@example.com', 'password123', 'M', 23, 7, '852 Pine St', 'Aswan', '2024-03-20', '2024-12-31'),
(38, 'Yasmin', 'Tawfik', '8899110022', 'yasmin.tawfik@example.com', 'password123', 'F', 22, 8, '147 Willow St', 'Damietta', '2024-03-25', '2024-12-31'),
(39, 'Fady', 'Fouad', '9900221133', 'fady.fouad@example.com', 'password123', 'M', 24, 9, '258 Ash St', 'Ismailia', '2024-03-30', '2024-12-31'),
(40, 'Nada', 'Amr', '0011332244', 'nada.amr@example.com', 'password123', 'F', 20, 10, '369 Birch St', 'Cairo', '2024-04-01', '2024-12-31');



--Enroll_Crs_Std

INSERT INTO Enroll_Crs_Std(C_id,S_id) 
VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10),
(2, 11), (2, 12), (2, 13), (2, 14), (2, 15), (2, 16), (2, 17), (2, 18), (2, 19), (2, 20),
(3, 21), (3, 22), (3, 23), (3, 24), (3, 25), (3, 26), (3, 27), (3, 28), (3, 29), (3, 30),
(4, 31), (4, 32), (4, 33), (4, 34), (4, 35), (4, 36), (4, 37), (4, 38), (4, 39), (4, 40),
(5, 1), (5, 2), (5, 3), (5, 4), (5, 5), (5, 6), (5, 7), (5, 8), (5, 9), (5, 10),
(6, 11), (6, 12), (6, 13), (6, 14), (6, 15), (6, 16), (6, 17), (6, 18), (6, 19), (6, 20),
(7, 21), (7, 22), (7, 23), (7, 24), (7, 25), (7, 26), (7, 27), (7, 28), (7, 29), (7, 30),
(8, 31), (8, 32), (8, 33), (8, 34), (8, 35), (8, 36), (8, 37), (8, 38), (8, 39), (8, 40),
(9, 1), (9, 2), (9, 3), (9, 4), (9, 5), (9, 6), (9, 7), (9, 8), (9, 9), (9, 10),
(10, 11), (10, 12), (10, 13), (10, 14), (10, 15), (10, 16), (10, 17), (10, 18), (10, 19), (10, 20);

--Exam 

INSERT INTO Exam(Ex_id,EName,No_MCQ,No_TF,Fk_CID,Start_Time,Duration) 
VALUES

(1, 'Introduction to Programming', 5, 5, 1, '2025-03-01 10:00:00',2),
(2, 'Data Structures', 5, 5, 2, '2025-05-15 09:00:00', 3),
(3, 'Database Management Systems', 5, 5, 3, '2025-04-10 14:00:00', 2),
(4, 'Web Development', 5, 5, 4, '2025-06-05 11:00:00', 2),
(5, 'Machine Learning Basics', 5, 5, 5, '2025-03-20 10:00:00', 3),
(6, 'Cybersecurity Fundamentals', 5, 5, 6, '2025-05-25 13:00:00', 3),
(7, 'Cloud Computing', 5, 5, 7, '2025-04-12 15:00:00', 2),
(8, 'Mobile App Development', 5, 5, 8, '2025-06-10 09:00:00', 2),
(9, 'Artificial Intelligence', 5, 5, 9, '2025-03-30 14:00:00', 3),
(10, 'Advanced Python Programming', 5, 5, 10, '2025-05-18 11:00:00', 2);

--Std-Exam

INSERT INTO Std_Exam(SID,Ex_ID,Grade,Date,Duration) 
VALUES

(1, 1, 'A', '2025-03-01', 2),
(2, 1, 'B', '2025-03-01', 3),
(3, 1, 'C', '2025-03-01', 2),
(4, 1, 'B+', '2025-03-01', 2),
(5, 1, 'A-', '2025-03-01', 2),
(6, 2, 'A', '2025-05-15', 3),
(7, 2, 'B', '2025-05-15', 2),
(8, 2, 'C+', '2025-05-15', 3),
(9, 2, 'A', '2025-05-15', 2),
(10, 2, 'B-', '2025-05-15', 2),
(11, 3, 'C', '2025-04-10', 3),
(12, 3, 'A-', '2025-04-10', 3),
(13, 3, 'B+', '2025-04-10', 2),
(14, 3, 'B', '2025-04-10', 3),
(15, 3, 'A', '2025-04-10', 2),
(16, 4, 'B', '2025-06-05', 3),
(17, 4, 'A+', '2025-06-05', 3),
(18, 4, 'B+', '2025-06-05', 2),
(19, 4, 'C', '2025-06-05', 2),
(20, 4, 'A-', '2025-06-05', 2),
(21, 5, 'B+', '2025-03-20', 3),
(22, 5, 'C+', '2025-03-20', 3),
(23, 5, 'A', '2025-03-20', 3),
(24, 5, 'B-', '2025-03-20', 3),
(25, 5, 'A-', '2025-03-20', 3),
(26, 6, 'B', '2025-05-25', 2),
(27, 6, 'A', '2025-05-25', 2),
(28, 6, 'C+', '2025-05-25', 3),
(29, 6, 'B+', '2025-05-25', 2),
(30, 6, 'A-', '2025-05-25', 3),
(31, 7, 'A', '2025-04-12', 3),
(32, 7, 'B-', '2025-04-12', 2),
(33, 7, 'B+', '2025-04-12', 2),
(34, 7, 'A-', '2025-04-12', 3),
(35, 7, 'C', '2025-04-12', 3),
(36, 8, 'A', '2025-06-10', 2),
(37, 8, 'B+', '2025-06-10', 2),
(38, 8, 'A-', '2025-06-10', 3),
(39, 8, 'B', '2025-06-10', 3),
(40, 8, 'C+', '2025-06-10', 2);


--Exam-Attendance

INSERT INTO Exam_Attendance(S_iD,C_iD,Ex_id) 
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 2, 6),
(7, 2, 7),
(8, 2, 8),
(9, 2, 9),
(10, 2, 10),
(11, 3, 1),
(12, 3, 2),
(13, 3, 3),
(14, 3, 4),
(15, 3, 5),
(16, 4, 6),
(17, 4, 7),
(18, 4, 8),
(19, 4, 9),
(20, 4, 10),
(21, 5, 1),
(22, 5, 2),
(23, 5, 3),
(24, 5, 4),
(25, 5, 5),
(26, 6, 6),
(27, 6, 7),
(28, 6, 8),
(29, 6, 9),
(30, 6, 10),
(31, 7, 1),
(32, 7, 2),
(33, 7, 3),
(34, 7, 4),
(35, 7, 5),
(36, 8, 6),
(37, 8, 7),
(38, 8, 8),
(39, 8, 9),
(40, 8, 10);

--ExamQuestion
INSERT INTO ExamQuestion(Ex_Id,Q_id,Std_Answer) 
VALUES

-- Exam 1
(1, 1, 'True'),
(1, 2, 'False'),
(1, 3, 'True'),
(1, 4, 'False'),
(1, 5, 'True'),
(1, 6, 'Cairo'),
(1, 7, '8'),
(1, 8, 'Dolphin'),
(1, 9, 'H2O'),
(1, 10, 'Jupiter'),

-- Exam 2
(2, 1, 'False'),
(2, 2, 'True'),
(2, 3, 'True'),
(2, 4, 'False'),
(2, 5, 'False'),
(2, 6, 'Cairo'),
(2, 7, '8'),
(2, 8, 'Dolphin'),
(2, 9, 'H2O'),
(2, 10, 'Jupiter'),

-- Exam 3
(3, 1, 'True'),
(3, 2, 'False'),
(3, 3, 'True'),
(3, 4, 'False'),
(3, 5, 'True'),
(3, 6, 'Cairo'),
(3, 7, '8'),
(3, 8, 'Dolphin'),
(3, 9, 'H2O'),
(3, 10, 'Jupiter'),

-- Exam 4
(4, 1, 'False'),
(4, 2, 'True'),
(4, 3, 'True'),
(4, 4, 'False'),
(4, 5, 'False'),
(4, 6, 'Cairo'),
(4, 7, '8'),
(4, 8, 'Dolphin'),
(4, 9, 'H2O'),
(4, 10, 'Jupiter'),

-- Exam 5
(5, 1, 'True'),
(5, 2, 'False'),
(5, 3, 'True'),
(5, 4, 'False'),
(5, 5, 'True'),
(5, 6, 'Cairo'),
(5, 7, '8'),
(5, 8, 'Dolphin'),
(5, 9, 'H2O'),
(5, 10, 'Jupiter'),

-- Exam 6
(6, 1, 'True'),
(6, 2, 'False'),
(6, 3, 'True'),
(6, 4, 'False'),
(6, 5, 'True'),
(6, 6, 'Cairo'),
(6, 7, '8'),
(6, 8, 'Dolphin'),
(6, 9, 'H2O'),
(6, 10, 'Jupiter'),

-- Exam 7
(7, 1, 'False'),
(7, 2, 'True'),
(7, 3, 'True'),
(7, 4, 'False'),
(7, 5, 'False'),
(7, 6, 'Cairo'),
(7, 7, '8'),
(7, 8, 'Dolphin'),
(7, 9, 'H2O'),
(7, 10, 'Jupiter'),

-- Exam 8
(8, 1, 'True'),
(8, 2, 'False'),
(8, 3, 'True'),
(8, 4, 'False'),
(8, 5, 'True'),
(8, 6, 'Cairo'),
(8, 7, '8'),
(8, 8, 'Dolphin'),
(8, 9, 'H2O'),
(8, 10, 'Jupiter'),

-- Exam 9
(9, 1, 'False'),
(9, 2, 'True'),
(9, 3, 'True'),
(9, 4, 'False'),
(9, 5, 'False'),
(9, 6, 'Cairo'),
(9, 7, '8'),
(9, 8, 'Dolphin'),
(9, 9, 'H2O'),
(9, 10, 'Jupiter'),

-- Exam 10
(10, 1, 'True'),
(10, 2, 'False'),
(10, 3, 'True'),
(10, 4, 'False'),
(10, 5, 'True'),
(10, 6, 'Cairo'),
(10, 7, '8'),
(10, 8, 'Dolphin'),
(10, 9, 'H2O'),
(10, 10, 'Jupiter');



--Choices
INSERT INTO Choices (Q_id, Choice_ID, Choice_Text)
VALUES
-- Choices for Question 1 (True/False)
(1, 1, 'True'),
(1, 2, 'False'),

-- Choices for Question 2 (True/False)
(2, 1, 'True'),
(2, 2, 'False'),

-- Choices for Question 3 (True/False)
(3, 1, 'True'),
(3, 2, 'False'),

-- Choices for Question 4 (True/False)
(4, 1, 'True'),
(4, 2, 'False'),

-- Choices for Question 5 (True/False)
(5, 1, 'True'),
(5, 2, 'False'),

-- Choices for Question 6
(6, 1, 'Atom'),
(6, 2, 'Molecule'),
(6, 3, 'Electron'),
(6, 4, 'Proton'),

-- Choices for Question 7
(7, 1, 'Pacific Ocean'),
(7, 2, 'Atlantic Ocean'),
(7, 3, 'Indian Ocean'),
(7, 4, 'Arctic Ocean'),

-- Choices for Question 8
(8, 1, 'Leonardo da Vinci'),
(8, 2, 'Vincent van Gogh'),
(8, 3, 'Michelangelo'),
(8, 4, 'Pablo Picasso'),

-- Choices for Question 9
(9, 1, 'Cheetah'),
(9, 2, 'Lion'),
(9, 3, 'Tiger'),
(9, 4, 'Leopard'),

-- Choices for Question 10
(10, 1, 'Seven'),
(10, 2, 'Five'),
(10, 3, 'Six'),
(10, 4, 'Eight');


INSERT INTO Topic (Top_id, Top_name, Fk_crs_id) VALUES
-- Course ID 1: C# Programming
(1, 'C# Fundamentals', 1),
(2, 'C# Object-Oriented Programming', 1),
(3, 'C# Advanced Topics', 1),

-- Course ID 2: CSS
(4, 'CSS Basics', 2),
(5, 'CSS Flexbox & Grid', 2),
(6, 'CSS Animations & Transitions', 2),

-- Course ID 3: HTML
(7, 'HTML Elements', 3),
(8, 'HTML Forms & Tables', 3),
(9, 'HTML5 Features', 3),

-- Course ID 4: JavaScript
(10, 'JavaScript Basics', 4),
(11, 'JavaScript ES6+', 4),
(12, 'JavaScript DOM Manipulation', 4),

-- Course ID 5: Machine Learning
(13, 'Supervised Learning', 5),
(14, 'Unsupervised Learning', 5),
(15, 'Neural Networks', 5),

-- Course ID 6: Cybersecurity
(16, 'Network Security', 6),
(17, 'Ethical Hacking', 6),
(18, 'Cryptography Basics', 6),

-- Course ID 7: Cloud Computing
(19, 'Cloud Architecture', 7),
(20, 'AWS Basics', 7),
(21, 'Google Cloud Platform', 7),

-- Course ID 8: Mobile App Development
(22, 'Android Development', 8),
(23, 'iOS Development', 8),
(24, 'Cross-Platform Development', 8),

-- Course ID 9: Artificial Intelligence
(25, 'AI Fundamentals', 9),
(26, 'Computer Vision', 9),
(27, 'Natural Language Processing', 9),

-- Course ID 10: Python Programming
(28, 'Python Basics', 10),
(29, 'Python for Data Science', 10),
(30, 'Advanced Python Techniques', 10);
