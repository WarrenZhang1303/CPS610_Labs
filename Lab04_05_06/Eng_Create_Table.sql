--DB3: Engineering Database
CREATE TABLE Engineering_Student (
    StudentNo NUMBER PRIMARY KEY,
    StudentName VARCHAR(50),
    Degree VARCHAR2(50),
    GPA DECIMAL(3,2),
    Department VARCHAR(50)
);


CREATE TABLE Engineering_Professor (
    ProfName VARCHAR2(50) PRIMARY KEY,
    ProfOffice VARCHAR2(20),
    ProfPhone VARCHAR2(20)
);

CREATE TABLE Engineering_Course (
    CourseNo NUMBER PRIMARY KEY,
    CourseName VARCHAR2(50),
    Credits NUMBER
);

CREATE TABLE Engineering_Can_Teach (
    CourseNo NUMBER,
    ProfName VARCHAR2(50),
    Preference VARCHAR2(50),
    Evaluation VARCHAR2(50),
    PRIMARY KEY (CourseNo, ProfName),
    FOREIGN KEY (CourseNo) REFERENCES Engineering_Course(CourseNo),
    FOREIGN KEY (ProfName) REFERENCES Engineering_Professor(ProfName)
);

CREATE TABLE Engineering_Teaches (
    CourseNo NUMBER,
    ProfName VARCHAR2(50),
    Term VARCHAR2(20),
    PRIMARY KEY (CourseNo, ProfName),
    FOREIGN KEY (CourseNo) REFERENCES Engineering_Course(CourseNo),
    FOREIGN KEY (ProfName) REFERENCES Engineering_Professor(ProfName)
);

CREATE TABLE Engineering_Enrolled (
    StudentNo NUMBER,
    CourseNo NUMBER,
    ProfName VARCHAR2(50),
    Status VARCHAR2(20),
    PRIMARY KEY (StudentNo, CourseNo, ProfName),
    FOREIGN KEY (StudentNo) REFERENCES Engineering_Student(StudentNo),
    FOREIGN KEY (CourseNo) REFERENCES Engineering_Course(CourseNo),
    FOREIGN KEY (ProfName) REFERENCES Engineering_Professor(ProfName)
);

DROP TABLE Engineering_Can_Teach;
DROP TABLE Engineering_Teaches;
DROP TABLE Engineering_Enrolled;