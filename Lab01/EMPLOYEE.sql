SELECT INSTANCE_NAME, HOST_NAME, VERSION FROM V$INSTANCE;

SELECT SYS_CONTEXT('USERENV', 'SERVICE_NAME') AS SERVICE_NAME FROM DUAL;

SELECT SYS_CONTEXT('USERENV', 'INSTANCE_NAME') AS INSTANCE_NAME,
       SYS_CONTEXT('USERENV', 'HOST') AS HOST
FROM DUAL;

DROP DATABASE LINK db2;
CREATE DATABASE LINK db2
CONNECT TO p7zhang IDENTIFIED BY "03178102"
USING
'(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=oracle12c.scs.ryerson.ca)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=orcl12c)))';

SELECT * FROM p7zhang.DB2_TEST@db2;
SELECT * FROM p7zhang.EMPLOYEE@db2;
INSERT INTO p7test.tests@db2 (test_id, test_name) VALUES
(1,'Hello! Can you see me!');
//GRANT CONNECT, RESOURCE TO p7test;

CREATE TABLE p7zhang.tests(
    test_id number PRIMARY KEY,
    test_name VARCHAR2(50)
);
INSERT INTO p7zhang.DB2_test@db2 (test_id, test_name) VALUES
(2,'Hello! Can you see me! Message from DB1');

 SELECT * FROM db2_test@db2;
 
 SELECT *
FROM db2_test@db2
WHERE owner = 'p7zhang';
grant select on DB2_TEST TO k1xu;