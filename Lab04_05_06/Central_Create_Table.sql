CREATE TABLE Central_Student (
    StudentNo NUMBER PRIMARY KEY,
    StudentName VARCHAR2(50),
    Degree VARCHAR2(50),
    GPA DECIMAL(3,2),
    Department VARCHAR(50)
);

CREATE TABLE Central_Professor (
    ProfName VARCHAR2(50) PRIMARY KEY,
    ProfOffice VARCHAR2(20),
    ProfPhone VARCHAR2(20)
);

CREATE TABLE Central_Course (
    CourseNo NUMBER PRIMARY KEY,
    CourseName VARCHAR2(50),
    Credits NUMBER
);

CREATE TABLE Central_Can_Teach (
    CourseNo NUMBER,
    ProfName VARCHAR2(50),
    Preference VARCHAR2(50),
    Evaluation VARCHAR2(50),
    PRIMARY KEY (CourseNo, ProfName),
    CONSTRAINT FK_CourseNo FOREIGN KEY (CourseNo) REFERENCES Central_Course(CourseNo),
    CONSTRAINT FK_ProfName FOREIGN KEY (ProfName) REFERENCES Central_Professor(ProfName)
);

CREATE TABLE Central_Teaches (
    CourseNo NUMBER,
    ProfName VARCHAR2(50),
    Term VARCHAR2(20),
    PRIMARY KEY (CourseNo, ProfName),
    FOREIGN KEY (CourseNo) REFERENCES Central_Course(CourseNo),
    FOREIGN KEY (ProfName) REFERENCES Central_Professor(ProfName)
);

CREATE TABLE Central_Enrolled (
    StudentNo NUMBER,
    CourseNo NUMBER,
    ProfName VARCHAR2(50),
    Status VARCHAR2(20),
    PRIMARY KEY (StudentNo, CourseNo, ProfName),
    FOREIGN KEY (StudentNo) REFERENCES Central_Student(StudentNo),
    FOREIGN KEY (CourseNo) REFERENCES Central_Course(CourseNo),
    FOREIGN KEY (ProfName) REFERENCES Central_Professor(ProfName)
);
DROP TABLE Central_Can_Teach;
DROP TABLE Central_Teaches;
DROP TABLE Central_Enrolled;

