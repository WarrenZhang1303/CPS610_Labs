BEGIN
-- Start the transaction
SAVEPOINT start_transaction;
-- Updates:
UPDATE EMPLOYEES SET Salary =45000 - 100 WHERE emp_id = 1;

UPDATE EMPLOYEES@DB2 SET Salary = 45000 - 100 WHERE emp_id = 1; 
COMMIT;

EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK TO start_transaction;
    DBMS_OUTPUT.PUT_LINE('Error occurred; Trigger Insert rolled back.');
END;
/