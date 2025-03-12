--OPEN TRIGGER
ALTER TRIGGER trg_insert_Employees ENABLE;
--CLOSE TRIGGER
ALTER TRIGGER trg_insert_Employees DISABLE;

CREATE OR REPLACE TRIGGER trg_insert_Employees
AFTER INSERT ON EMPLOYEES
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        MERGE INTO EMPLOYEES@DB2 E
                USING (SELECT :NEW.emp_id AS emp_id,
                :NEW.Name AS Name, 
                :NEW.DEPARTMENT AS DEPARTMENT,
                :NEW.Salary AS Salary FROM DUAL) S 
                ON (E.emp_id =S.emp_id) 
                WHEN NOT MATCHED THEN
                    INSERT(E.emp_id,E.Name,E.DEPARTMENT,E.Salary) 
                    VALUES(S.emp_id,S.Name,S.DEPARTMENT,S.Salary,);
    END IF;

    IF DELETING THEN
        DELETE FROM EMPLOYEES@DB2 E WHERE E.emp_id =:OLD.emp_id;
            
    END IF;
    
    END;
    /
