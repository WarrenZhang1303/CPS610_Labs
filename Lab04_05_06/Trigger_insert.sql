--OPEN TRIGGER
ALTER TRIGGER trg_replicate_Student ENABLE;
--CLOSE TRIGGER
ALTER TRIGGER trg_replicate_Student DISABLE;

CREATE OR REPLACE TRIGGER trg_replicate_Student
AFTER INSERT OR UPDATE OR DELETE ON Central_Student
FOR EACH ROW
BEGIN
    IF INSERTING OR UPDATING THEN
        IF :NEW.Department ='Engineering' THEN
            MERGE INTO Engineering_Student@DB3 E
                USING (SELECT :NEW.STUDENTNO AS STUDENTNO,
                :NEW.STUDENTNAME AS STUDENTNAME, 
                :NEW.DEGREE AS DEGREE,
                :NEW.GPA AS GPA, :NEW.DEPARTMENT AS DEPARTMENT FROM DUAL) S 
                ON (E.STUDENTNO =S.STUDENTNO) 
                WHEN MATCHED THEN
                    UPDATE SET E.STUDENTNAME=S.STUDENTNAME,
                    E.DEGREE=S.DEGREE,E.GPA=S.GPA,E.DEPARTMENT=S.DEPARTMENT
                WHEN NOT MATCHED THEN
                    INSERT(E.STUDENTNO,E.STUDENTNAME,E.DEGREE,E.GPA,E.DEPARTMENT) 
                    VALUES(S.STUDENTNO,S.STUDENTNAME,S.DEGREE,S.GPA,S.DEPARTMENT);
        END IF;
        
        IF :NEW.Department = 'Science' THEN
            MERGE INTO Science_Student@DB2 E
                USING (SELECT :NEW.STUDENTNO AS STUDENTNO,
                :NEW.STUDENTNAME AS STUDENTNAME, 
                :NEW.DEGREE AS DEGREE,
                :NEW.GPA AS GPA, :NEW.DEPARTMENT AS DEPARTMENT FROM DUAL) S 
                ON (E.STUDENTNO =S.STUDENTNO) 
                WHEN MATCHED THEN
                    UPDATE SET E.STUDENTNAME=S.STUDENTNAME,
                    E.DEGREE=S.DEGREE,E.GPA=S.GPA,E.DEPARTMENT=S.DEPARTMENT
                WHEN NOT MATCHED THEN
                    INSERT(E.STUDENTNO,E.STUDENTNAME,E.DEGREE,E.GPA,E.DEPARTMENT) 
                    VALUES(S.STUDENTNO,S.STUDENTNAME,S.DEGREE,S.GPA,S.DEPARTMENT);
        END IF;
    END IF;
    IF DELETING THEN
         IF :OLD.Department ='Engineering' THEN
            DELETE FROM Engineering_Student@DB3 E WHERE E.STUDENTNO =:OLD.STUDENTNO; 
        END IF;
    IF :OLD.Department = 'Science' THEN
            DELETE FROM Science_Student@DB2 S WHERE S.STUDENTNO=:OLD.STUDENTNO;   
        END IF;
    END IF;
    END;
    /
