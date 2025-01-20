USE Examination_System;
CREATE TABLE Choices (
    Q_id INT NOT NULL,
    Choice_Id INT NOT NULL,
    Choice_Text VARCHAR(255),
    PRIMARY KEY (Q_id, Choice_Id)
);
INSERT INTO Branch (B_id, B_name, City, ZIP_Code, Street, B_Phone) 
VALUES
(1, 'ITI Smart Village', 'Giza', '12577', 'Smart Village', '02-35355678'),
(2, 'ITI Alexandria', 'Alexandria', '21615', 'Al Smoha', '03-4242433'),
(3, 'ITI Mansoura', 'Mansoura', '35511', 'Mansoura Center', '050-2266412'),
(4, 'ITI Ismailia', 'Ismailia', '41522', 'Technology Zone', '064-3487552'),
(5, 'ITI Assiut', 'Assiut', '71515', 'Assiut Technology Park', '088-2456783'),
(6, 'ITI Sohag', 'Sohag', '82515', 'Sohag Technology Zone', '093-2267345'),
(7, 'ITI Aswan', 'Aswan', '81511', 'Aswan Innovation Hub', '097-2345678'),
(8, 'ITI Port Said', 'Port Said', '42511', 'Port Said Tech Park', '066-3546789'),
(9, 'ITI Zagazig', 'Zagazig', '44515', 'Zagazig Campus', '055-2234567'),
(10, 'ITI Fayoum', 'Fayoum', '63511', 'Fayoum Technology Center', '084-2245678');
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
INSERT INTO Question (Q_id, Body, CorrectAns, Type, Grade)
VALUES
-- True/False Questions
(1, 'The sun rises in the east.', 'True', 'True/False', 5),
(2, 'Water boils at 50 degrees Celsius.', 'False', 'True/False', 5),
(3, 'The capital of France is Paris.', 'True', 'True/False', 5),
(4, 'The earth is flat.', 'False', 'True/False', 5),
(5, 'Humans can breathe in space without a spacesuit.', 'False', 'True/False', 5),
(6, 'Lightning is hotter than the surface of the sun.', 'True', 'True/False', 5),
(7, 'The Great Wall of China is visible from space.', 'False', 'True/False', 5),
(8, 'Plants convert sunlight into energy through photosynthesis.', 'True', 'True/False', 5),
(9, 'Gold is heavier than silver.', 'True', 'True/False', 5),
(10, 'Bats are blind.', 'False', 'True/False', 5),
(11, 'Diamonds are made of compressed coal.', 'False', 'True/False', 5),
(12, 'Sound travels faster in water than in air.', 'True', 'True/False', 5),
(13, 'Sharks are mammals.', 'False', 'True/False', 5),
(14, 'Venus is the hottest planet in the solar system.', 'True', 'True/False', 5),
(15, 'The Statue of Liberty was a gift from France to the United States.', 'True', 'True/False', 5),
(16, 'A leap year has 366 days.', 'True', 'True/False', 5),
(17, 'Penguins can fly.', 'False', 'True/False', 5),
(18, 'The human body has 206 bones.', 'True', 'True/False', 5),
(19, 'Mount Everest is the tallest mountain in the world.', 'True', 'True/False', 5),
(20, 'Chocolate is toxic to dogs.', 'True', 'True/False', 5),

-- Multiple-Choice Questions
(21, 'What is the capital of Egypt?', 'Cairo', 'Choice', 10),
(22, 'Which planet is known as the Red Planet?', 'Mars', 'Choice', 10),
(23, 'Who wrote "Romeo and Juliet"?', 'William Shakespeare', 'Choice', 10),
(24, 'What is the largest mammal in the world?', 'Blue Whale', 'Choice', 10),
(25, 'Which element has the chemical symbol "O"?', 'Oxygen', 'Choice', 10),
(26, 'What is the smallest unit of matter?', 'Atom', 'Choice', 10),
(27, 'Which ocean is the largest?', 'Pacific Ocean', 'Choice', 10),
(28, 'Who painted the Mona Lisa?', 'Leonardo da Vinci', 'Choice', 10),
(29, 'What is the fastest land animal?', 'Cheetah', 'Choice', 10),
(30, 'How many continents are there?', 'Seven', 'Choice', 10),
(31, 'What is the freezing point of water?', '0°C', 'Choice', 10),
(32, 'Who discovered gravity?', 'Isaac Newton', 'Choice', 10),
(33, 'What is the capital of Japan?', 'Tokyo', 'Choice', 10),
(34, 'Which gas do plants absorb during photosynthesis?', 'Carbon Dioxide', 'Choice', 10),
(35, 'What is the main ingredient in bread?', 'Flour', 'Choice', 10),
(36, 'How many planets are in the solar system?', 'Eight', 'Choice', 10),
(37, 'Who developed the theory of relativity?', 'Albert Einstein', 'Choice', 10),
(38, 'What is the chemical symbol for gold?', 'Au', 'Choice', 10),
(39, 'What is the hardest natural substance?', 'Diamond', 'Choice', 10),
(40, 'Which country has the largest population?', 'China', 'Choice', 10);
-- True/False Choices for Questions 1-20 (Each has 2 choices)
INSERT INTO Choices (Q_id, Choice_ID, Choice_Text)
VALUES
-- True/False Choices for Question 1
(1, 1, 'True'),
(1, 2, 'False'),

-- True/False Choices for Question 2
(2, 1, 'True'),
(2, 2, 'False'),

-- True/False Choices for Question 3
(3, 1, 'True'),
(3, 2, 'False'),

-- True/False Choices for Question 4
(4, 1, 'True'),
(4, 2, 'False'),

-- True/False Choices for Question 5
(5, 1, 'True'),
(5, 2, 'False'),

-- True/False Choices for Question 6
(6, 1, 'True'),
(6, 2, 'False'),

-- True/False Choices for Question 7
(7, 1, 'True'),
(7, 2, 'False'),

-- True/False Choices for Question 8
(8, 1, 'True'),
(8, 2, 'False'),

-- True/False Choices for Question 9
(9, 1, 'True'),
(9, 2, 'False'),

-- True/False Choices for Question 10
(10, 1, 'True'),
(10, 2, 'False'),

-- True/False Choices for Question 11
(11, 1, 'True'),
(11, 2, 'False'),

-- True/False Choices for Question 12
(12, 1, 'True'),
(12, 2, 'False'),

-- True/False Choices for Question 13
(13, 1, 'True'),
(13, 2, 'False'),

-- True/False Choices for Question 14
(14, 1, 'True'),
(14, 2, 'False'),

-- True/False Choices for Question 15
(15, 1, 'True'),
(15, 2, 'False'),

-- True/False Choices for Question 16
(16, 1, 'True'),
(16, 2, 'False'),

-- True/False Choices for Question 17
(17, 1, 'True'),
(17, 2, 'False'),

-- True/False Choices for Question 18
(18, 1, 'True'),
(18, 2, 'False'),

-- True/False Choices for Question 19
(19, 1, 'True'),
(19, 2, 'False'),

-- True/False Choices for Question 20
(20, 1, 'True'),
(20, 2, 'False');

-- Multiple-Choice Questions (Each question has 4 choices)
INSERT INTO Choices (Q_id, Choice_ID, Choice_Text)
VALUES
-- Choices for Question 21
(21, 1, 'Cairo'),
(21, 2, 'Alexandria'),
(21, 3, 'Giza'),
(21, 4, 'Aswan'),

-- Choices for Question 22
(22, 1, 'Mars'),
(22, 2, 'Venus'),
(22, 3, 'Jupiter'),
(22, 4, 'Saturn'),

-- Choices for Question 23
(23, 1, 'William Shakespeare'),
(23, 2, 'Charles Dickens'),
(23, 3, 'J.K. Rowling'),
(23, 4, 'Mark Twain'),

-- Choices for Question 24
(24, 1, 'Blue Whale'),
(24, 2, 'Elephant'),
(24, 3, 'Giraffe'),
(24, 4, 'Hippopotamus'),

-- Choices for Question 25
(25, 1, 'Oxygen'),
(25, 2, 'Hydrogen'),
(25, 3, 'Nitrogen'),
(25, 4, 'Helium'),

-- Choices for Question 26
(26, 1, 'Atom'),
(26, 2, 'Molecule'),
(26, 3, 'Electron'),
(26, 4, 'Proton'),

-- Choices for Question 27
(27, 1, 'Pacific Ocean'),
(27, 2, 'Atlantic Ocean'),
(27, 3, 'Indian Ocean'),
(27, 4, 'Arctic Ocean'),

-- Choices for Question 28
(28, 1, 'Leonardo da Vinci'),
(28, 2, 'Vincent van Gogh'),
(28, 3, 'Michelangelo'),
(28, 4, 'Pablo Picasso'),

-- Choices for Question 29
(29, 1, 'Cheetah'),
(29, 2, 'Lion'),
(29, 3, 'Tiger'),
(29, 4, 'Leopard'),

-- Choices for Question 30
(30, 1, 'Seven'),
(30, 2, 'Five'),
(30, 3, 'Six'),
(30, 4, 'Eight'),

-- Choices for Question 31
(31, 1, '0°C'),
(31, 2, '32°C'),
(31, 3, '100°C'),
(31, 4, '50°C'),

-- Choices for Question 32
(32, 1, 'Isaac Newton'),
(32, 2, 'Galileo Galilei'),
(32, 3, 'Albert Einstein'),
(32, 4, 'Marie Curie'),

-- Choices for Question 33
(33, 1, 'Tokyo'),
(33, 2, 'Beijing'),
(33, 3, 'Seoul'),
(33, 4, 'Bangkok'),

-- Choices for Question 34
(34, 1, 'Carbon Dioxide'),
(34, 2, 'Oxygen'),
(34, 3, 'Nitrogen'),
(34, 4, 'Hydrogen'),

-- Choices for Question 35
(35, 1, 'Flour'),
(35, 2, 'Sugar'),
(35, 3, 'Salt'),
(35, 4, 'Water'),

-- Choices for Question 36
(36, 1, 'Eight'),
(36, 2, 'Nine'),
(36, 3, 'Seven'),
(36, 4, 'Six'),

-- Choices for Question 37
(37, 1, 'Albert Einstein'),
(37, 2, 'Isaac Newton'),
(37, 3, 'Marie Curie'),
(37, 4, 'Nikola Tesla'),

-- Choices for Question 38
(38, 1, 'Au'),
(38, 2, 'Ag'),
(38, 3, 'Cu'),
(38, 4, 'Fe'),

-- Choices for Question 39
(39, 1, 'Diamond'),
(39, 2, 'Graphite'),
(39, 3, 'Quartz'),
(39, 4, 'Topaz'),

-- Choices for Question 40
(40, 1, 'China'),
(40, 2, 'India'),
(40, 3, 'USA'),
(40, 4, 'Indonesia');

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



