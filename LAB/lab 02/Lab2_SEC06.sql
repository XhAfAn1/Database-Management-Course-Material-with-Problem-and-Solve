DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;
DROP TABLE course CASCADE CONSTRAINTS;

CREATE TABLE department(
    dept_name VARCHAR2(30) NOT NULL,
    building VARCHAR2(30),
    budget NUMBER,
    CONSTRAINT DPT_NM_PK PRIMARY KEY(dept_name),
    CONSTRAINT BUDGET_CHK CHECK(budget>0)
);

CREATE TABLE course(
    course_id VARCHAR2(20),
    title VARCHAR2(30),
    dept_name VARCHAR2(30),
    credits NUMBER,
    CONSTRAINT CID_PK PRIMARY KEY(course_id),
    CONSTRAINT DN_FK FOREIGN KEY(dept_name) REFERENCES department(dept_name) 
    ON DELETE CASCADE,
    CONSTRAINT CREDIT_CK CHECK(credits>=1)   
);

INSERT INTO department VALUES('CSE','MB',100000);
INSERT INTO department VALUES('BBA','AB3',55000);
INSERT INTO department(DEPT_NAME, BUILDING) VALUES('ENGLISH','FUB');

SELECT * FROM DEPARTMENT;
SELECT * FROM COURSE;

INSERT INTO course VALUES('CSE302','DATABASE SYSTEMS','CSE',4.5);
INSERT INTO course VALUES('CSE103','STRUCTURED PROGRAMMING','BBA',4);

ALTER TABLE DEPARTMENT ADD CHAIRPERSON VARCHAR2(20);
--ALTER TABLE DEPARTMENT DROP COLUMN BUDGET;
ALTER TABLE DEPARTMENT RENAME COLUMN CHAIRPERSON TO DEPT_HEAD;  
ALTER TABLE FACULTY RENAME TO DEPARTMENT; 

UPDATE DEPARTMENT
SET CHAIRPERSON = 'MI'
WHERE DEPT_NAME = 'CSE';

SELECT * FROM user_cons_columns 
WHERE TABLE_NAME = 'COURSE';

SELECT *
FROM DEPARTMENT, COURSE
WHERE department.dept_name = COURSE.DEPT_NAME;

SELECT *
FROM DEPARTMENT NATURAL JOIN COURSE;

