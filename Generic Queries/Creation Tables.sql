-- Use Examination_System database
USE Examination_System;
GO
-- Table title: Choices
-- Table Purpose: Stores the possible choices for each question in the system.
IF OBJECT_ID('Choices', 'U') IS NOT NULL
    DROP TABLE Choices;
CREATE TABLE Choices (
    Q_id INT NOT NULL,
    Choice_Id INT NOT NULL,
    Choice_Text VARCHAR(255),
    PRIMARY KEY (Q_id, Choice_Id),
    CONSTRAINT FK_Choice_Question FOREIGN KEY (Q_id) REFERENCES Question(Q_id)
);

-- Table title: Branch
-- Table Purpose: Stores information about branches (locations) of the institution.
IF OBJECT_ID('Branch', 'U') IS NOT NULL
    DROP TABLE Branch;
CREATE TABLE Branch (
    B_id INT PRIMARY KEY,
    B_name VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    ZIP_Code VARCHAR(20),
    Street VARCHAR(255),
    B_Phone VARCHAR(20),
    Mgr_Name VARCHAR(20),
    Mgr_Phone VARCHAR(20),
    Mgr_Selected_Date DATE
);

-- Table title: Instructor
-- Table Purpose: Stores information about instructors (teachers) in the system.
IF OBJECT_ID('Instructor', 'U') IS NOT NULL
    DROP TABLE Instructor;
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

-- Table title: Track
-- Table Purpose: Stores information about tracks (specializations) offered by the institution.
IF OBJECT_ID('Track', 'U') IS NOT NULL
    DROP TABLE Track;
CREATE TABLE Track (
    T_id INT PRIMARY KEY,
    T_Name VARCHAR(255) NOT NULL,
    FK_Ins_Id INT,
    FOREIGN KEY (FK_Ins_Id) REFERENCES Instructor(Ins_id)
);

-- Table title: BranchTrack
-- Table Purpose: Represents the many-to-many relationship between Branch and Track tables.
IF OBJECT_ID('BranchTrack', 'U') IS NOT NULL
    DROP TABLE BranchTrack;
CREATE TABLE BranchTrack (
    B_id INT,
    T_id INT,
    PRIMARY KEY (B_id, T_id),
    FOREIGN KEY (B_id) REFERENCES Branch(B_id),
    FOREIGN KEY (T_id) REFERENCES Track(T_id)
);

-- Table title: Ins_Track
-- Table Purpose: Represents the many-to-many relationship between Instructor and Track tables.
IF OBJECT_ID('Ins_Track', 'U') IS NOT NULL
    DROP TABLE Ins_Track;
CREATE TABLE Ins_Track (
    Ins_id INT,
    T_id INT,
    HireDate DATE,
    PRIMARY KEY (Ins_id, T_id),
    FOREIGN KEY (Ins_id) REFERENCES Instructor(Ins_id),
    FOREIGN KEY (T_id) REFERENCES Track(T_id)
);

-- Table title: Course
-- Table Purpose: Stores information about courses offered by the institution.
IF OBJECT_ID('Course', 'U') IS NOT NULL
    DROP TABLE Course;
CREATE TABLE Course (
    C_id INT PRIMARY KEY,
    Hours INT NOT NULL,
    C_Name VARCHAR(255) NOT NULL,
    FK_Ins_id INT,
    FK_Top_id INT,
    FOREIGN KEY (FK_Ins_id) REFERENCES Instructor(Ins_id),
    FOREIGN KEY (FK_Top_id) REFERENCES Topic(Top_id)
);

-- Table title: Topic
-- Table Purpose: Stores information about topics covered in courses.
IF OBJECT_ID('Topic', 'U') IS NOT NULL
    DROP TABLE Topic;
CREATE TABLE Topic (
    Top_id INT PRIMARY KEY,
    Top_name VARCHAR(100),  
    Fk_crs_id INT NULL,
    CONSTRAINT cTopic FOREIGN KEY (Fk_crs_id) REFERENCES Course(C_id)
);
GO


ALTER TABLE Topic ALTER COLUMN Top_name VARCHAR(100);
-- Table title: Track_Course_Contain
-- Table Purpose: Represents the many-to-many relationship between Track and Course tables.
IF OBJECT_ID('Track_Course_Contain', 'U') IS NOT NULL
    DROP TABLE Track_Course_Contain;
CREATE TABLE Track_Course_Contain (
    C_id INT,
    T_id INT,
    PRIMARY KEY (C_id, T_id),
    FOREIGN KEY (C_id) REFERENCES Course(C_id),
    FOREIGN KEY (T_id) REFERENCES Track(T_id)
);

-- Table title: Student
-- Table Purpose: Stores information about students enrolled in the institution.
IF OBJECT_ID('Student', 'U') IS NOT NULL
    DROP TABLE Student;
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

-- Table title: Enroll_Crs_Std
-- Table Purpose: Represents the many-to-many relationship between Course and Student tables.
IF OBJECT_ID('Enroll_Crs_Std', 'U') IS NOT NULL
    DROP TABLE Enroll_Crs_Std;
CREATE TABLE Enroll_Crs_Std (
    C_id INT,
    S_id INT,
    PRIMARY KEY (C_id, S_id),
    FOREIGN KEY (C_id) REFERENCES Course(C_id),
    FOREIGN KEY (S_id) REFERENCES Student(S_id)
);

-- Table title: Exam
-- Table Purpose: Stores information about exams conducted for courses.
IF OBJECT_ID('Exam', 'U') IS NOT NULL
    DROP TABLE Exam;
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

-- Table title: Std_Exam
-- Table Purpose: Represents the many-to-many relationship between Student and Exam tables.
IF OBJECT_ID('Std_Exam', 'U') IS NOT NULL
    DROP TABLE Std_Exam;
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

-- Table title: Question
-- Table Purpose: Stores information about questions used in exams.
IF OBJECT_ID('Question', 'U') IS NOT NULL
    DROP TABLE Question;
CREATE TABLE Question (
    Q_id INT PRIMARY KEY,
    Body TEXT,
    CorrectAns VARCHAR(255),
    Type VARCHAR(50),
    Grade DECIMAL(5, 2)
);

-- Table title: ExamQuestion
-- Table Purpose: Represents the many-to-many relationship between Exam and Question tables.
IF OBJECT_ID('ExamQuestion', 'U') IS NOT NULL
    DROP TABLE ExamQuestion;
CREATE TABLE ExamQuestion (
    Ex_Id INT,
    Q_id INT,
    Std_Answer VARCHAR(255),
    PRIMARY KEY (Ex_Id, Q_id),
    FOREIGN KEY (Ex_Id) REFERENCES Exam(Ex_ID),
    FOREIGN KEY (Q_id) REFERENCES Question(Q_id)
);

-- Table title: Exam_Attendance
-- Table Purpose: Tracks student attendance for exams.
IF OBJECT_ID('Exam_Attendance', 'U') IS NOT NULL
    DROP TABLE Exam_Attendance;
CREATE TABLE Exam_Attendance (
    S_id INT,
    C_id INT,
    Ex_id INT,
    PRIMARY KEY (S_id, C_id, Ex_id),
    FOREIGN KEY (S_id) REFERENCES Student(S_id),
    FOREIGN KEY (C_id) REFERENCES Course(C_id),
    FOREIGN KEY (Ex_id) REFERENCES Exam(Ex_ID)
);
