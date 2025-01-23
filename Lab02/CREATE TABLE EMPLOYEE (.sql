CREATE TABLE EMPLOYEE (
emp_id NUMBER PRIMARY KEY,
emp_firstname VARCHAR2(50) NOT NULL,
emp_lastname VARCHAR2(50) NOT NULL,
emp_address VARCHAR2(50) NOT NULL,
emp_phone NUMBER UNIQUE NOT NULL,
emp_dob DATE NOT NULL,
emp_salary DECIMAL(10,2) CHECK (emp_salary >=0), 
emp_sex VARCHAR2(10) NOT NULL
);

INSERT INTO EMPLOYEE (
    emp_id, emp_firstname, emp_lastname, emp_address, emp_phone, emp_dob, emp_salary, emp_sex
) VALUES (
    3, 
    'Alice', 
    'Johnson', 
    '789 Oak St, Gotham', 
    7654321098, 
    TO_DATE('1992-12-10', 'YYYY-MM-DD'), 
    45000.00, 
    'Female'
);