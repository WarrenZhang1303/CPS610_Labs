--DB2: Science Database
CREATE TABLE Science_Student (
    StudentNo NUMBER PRIMARY KEY,
    StudentName VARCHAR(50),
    Degree VARCHAR2(50),
    GPA DECIMAL(3,2),
    Department VARCHAR(50)
);

CREATE TABLE Science_Professor (
    ProfName VARCHAR2(50) PRIMARY KEY,
    ProfOffice VARCHAR2(20),
    ProfPhone VARCHAR2(20)
);

CREATE TABLE Science_Course (
    CourseNo NUMBER PRIMARY KEY,
    CourseName VARCHAR2(50),
    Credits NUMBER
);

CREATE TABLE Science_Can_Teach (
    CourseNo NUMBER,
    ProfName VARCHAR2(50),
    Preference VARCHAR2(50),
    Evaluation VARCHAR2(50),
    PRIMARY KEY (CourseNo, ProfName),
    FOREIGN KEY (CourseNo) REFERENCES Science_Course(CourseNo),
    FOREIGN KEY (ProfName) REFERENCES Science_Professor(ProfName)
);

CREATE TABLE Science_Teaches (
    CourseNo NUMBER,
    ProfName VARCHAR2(50),
    Term VARCHAR2(20),
    PRIMARY KEY (CourseNo, ProfName),
    FOREIGN KEY (CourseNo) REFERENCES Science_Course(CourseNo),
    FOREIGN KEY (ProfName) REFERENCES Science_Professor(ProfName)
);

CREATE TABLE Science_Enrolled (
    StudentNo NUMBER,
    CourseNo NUMBER,
    ProfName VARCHAR2(50),
    Status VARCHAR2(20),
    PRIMARY KEY (StudentNo, CourseNo, ProfName),
    FOREIGN KEY (StudentNo) REFERENCES Science_Student(StudentNo),
    FOREIGN KEY (CourseNo) REFERENCES Science_Course(CourseNo),
    FOREIGN KEY (ProfName) REFERENCES Science_Professor(ProfName)
);
DROP TABLE Science_Enrolled;
DROP TABLE Science_Teaches;
DROP TABLE Science_Can_Teach;