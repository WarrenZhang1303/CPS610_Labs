 COMMIT;
 ROLLBACK;
SELECT * FROM EMPLOYEES@DB2;

INSERT INTO employees(Emp_ID, Name, DEPARTMENT, Salary, Bonus)
VALUES(1, 'Eric', 'Manager', 20000, 1000);

INSERT INTO employees(Emp_ID, Name, DEPARTMENT, Salary, Bonus)
VALUES(2, 'Jessica', 'Accountant', 8500, 500);

INSERT INTO employees(Emp_ID, Name, DEPARTMENT, Salary, Bonus)
VALUES(3, 'Andrew', 'Executive Assistant', 13000, 800);
