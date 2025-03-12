SELECT * FROM EMPLOYEES;

--Season 01
--01 READ COMMITTED: Repeatable Read
UPDATE EMPLOYEES SET Salary =Salary + 3000 WHERE emp_id = 1;
COMMIT;

--Season 01
--02 READ COMMITTED: Phantom Read
INSERT INTO EMPLOYEES(Emp_ID, Name, Position, Salary)  
VALUES(4, 'Sophia', 'Executive Assistant', 13000);
COMMIT;
SELECT * FROM EMPLOYEES; 

--Season 01
--03 READ SERIALIZABL: Repeatable Read Test
UPDATE EMPLOYEES SET Salary =Salary + 3000 WHERE emp_id = 1;
COMMIT;
SELECT * FROM EMPLOYEES;

--Season 01
--04 READ SERIALIZABL: Phantom Read Test
DELETE FROM EMPLOYEES WHERE EMP_ID = 4;
COMMIT;
SELECT * FROM EMPLOYEES;

