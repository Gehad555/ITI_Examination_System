use ITI_Examination_System

CREATE TABLE Choices (
    Q_id INT NOT NULL,             -- Foreign Key referencing Question(Q_id)
    Choice_Id INT NOT NULL,        -- Unique identifier for each choice in a question
    Choice_Text VARCHAR(255),      -- Text of the choice
    PRIMARY KEY (Q_id, Choice_Id), -- Composite Primary Key
    CONSTRAINT FK_Choice_Question FOREIGN KEY (Q_id) REFERENCES Question(Q_id)
);

CREATE TABLE Branch (
    B_id INT PRIMARY KEY, 
    B_name VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    ZIP_Code VARCHAR(20),
    Street VARCHAR(255), 
    B_Phone VARCHAR(20) ,
	Mgr_Name  VARCHAR(20) ,
	Mgr_Phone  VARCHAR(20),
	Mgr_Selected_Date DATE
);
CREATE TABLE Instructor (
    Ins_id INT PRIMARY KEY,
    Ins_Fname VARCHAR(100) NOT NULL,
    Ins_Lname VARCHAR(100) NOT NULL,
    City VARCHAR(100), 
    Street VARCHAR(255), 
    Phone VARCHAR(20), 
    Email VARCHAR(255), 
    Password VARCHAR(255), 
    Salary DECIMAL(10, 2), 
    Promotion_Date DATE,
    Gender CHAR(1)
);

CREATE TABLE Track (
    T_id INT PRIMARY KEY, 
    T_Name VARCHAR(255) NOT NULL, 
    FK_Ins_Id INT, 
    FOREIGN KEY (FK_Ins_Id) REFERENCES Instructor(Ins_id) 
);


CREATE TABLE BranchTrack (
    B_id INT,
    T_id INT, 
    PRIMARY KEY (B_id, T_id), 
    FOREIGN KEY (B_id) REFERENCES Branch(B_id), 
    FOREIGN KEY (T_id) REFERENCES Track(T_id) 
);

CREATE TABLE Ins_Track (
    Ins_id INT, 
    T_id INT, 
    HireDate DATE, 
    PRIMARY KEY (Ins_id, T_id), 
    FOREIGN KEY (Ins_id) REFERENCES Instructor(Ins_id), 
    FOREIGN KEY (T_id) REFERENCES Track(T_id) 
);

CREATE TABLE Course (
    C_id INT PRIMARY KEY, 
    Hours INT NOT NULL, 
    C_Name VARCHAR(255) NOT NULL, 
    FK_Ins_id INT, 
    FOREIGN KEY (FK_Ins_id) REFERENCES Instructor(Ins_id) 
);

CREATE TABLE Track_Course_Contain (
    C_id INT, 
    T_id INT, 
    PRIMARY KEY (C_id, T_id),
    FOREIGN KEY (C_id) REFERENCES Course(C_id),
    FOREIGN KEY (T_id) REFERENCES Track(T_id)
);

CREATE TABLE Student (
    S_id INT PRIMARY KEY, 
    F_Name VARCHAR(100) NOT NULL, 
    L_Name VARCHAR(100) NOT NULL, 
    Phone VARCHAR(20), 
    Email VARCHAR(255), 
    Password VARCHAR(255),
    Gender CHAR(1), 
    Age INT, 
    Fk_Track INT, 
    Street VARCHAR(255), 
    City VARCHAR(100),
    Start_Date DATE, 
    End_Date DATE, 
    FOREIGN KEY (Fk_Track) REFERENCES Track(T_id)
);

CREATE TABLE Enroll_Crs_Std (
    C_id INT, 
    S_id INT, 
    PRIMARY KEY (C_id, S_id),
    FOREIGN KEY (C_id) REFERENCES Course(C_id), 
    FOREIGN KEY (S_id) REFERENCES Student(S_id) 
);

CREATE TABLE Exam (
    Ex_Id INT PRIMARY KEY, 
    EName VARCHAR(255) NOT NULL, 
    No_MCQ INT,
    No_TF INT, 
    Fk_CID INT, 
    Start_Time DATETIME, 
    Duration INT, 
    FOREIGN KEY (Fk_CID) REFERENCES Course(C_id)
);

CREATE TABLE Std_Exam (
    SID INT, 
    Ex_ID INT, 
    Grade VARCHAR(10), 
    Date DATE,
    Duration INT, 
    PRIMARY KEY (SID, Ex_ID), 
    FOREIGN KEY (SID) REFERENCES Student(S_id), 
    FOREIGN KEY (Ex_ID) REFERENCES Exam(Ex_ID)
);

CREATE TABLE Question (
    Q_id INT PRIMARY KEY, 
    Header VARCHAR(255), 
    Body TEXT, 
    CorrectAns VARCHAR(255), 
    Type VARCHAR(50), 
    Grade DECIMAL(5, 2) 
);


CREATE TABLE ExamQuestion (
    Ex_Id INT, 
    Q_id INT, 
    Std_Answer VARCHAR(255), 
    PRIMARY KEY ( Ex_Id, Q_id), 
    FOREIGN KEY ( Ex_Id) REFERENCES Exam(Ex_ID), 
    FOREIGN KEY (Q_id) REFERENCES Question(Q_id) 
);

CREATE TABLE Exam_Attendance (
    S_id INT, 
    C_id INT,
    Ex_id INT, 
    PRIMARY KEY (S_id, C_id, Ex_id), 
    FOREIGN KEY (S_id) REFERENCES Student(S_id),
    FOREIGN KEY (C_id) REFERENCES Course(C_id),
    FOREIGN KEY (Ex_id) REFERENCES Exam(Ex_ID) 
);














