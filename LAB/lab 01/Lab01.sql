DROP TABLE instructor_2022360045 CASCADE CONSTRAINT;
DROP TABLE course_2022360045 CASCADE CONSTRAINT;

CREATE TABLE instructor_2022360045 (
 ID NUMBER, Name  VARCHAR2(30) ,Dept_Name  VARCHAR2(30) , Salary NUMBER
);

CREATE TABLE course_2022360045 (
 Course_ID VARCHAR2(30), Title VARCHAR2(30) ,Dept_Name  VARCHAR2(30) , Credits NUMBER
);


INSERT INTO instructor_2022360045 (id, name, dept_name, salary) VALUES (10101, 'Srinivasan', 'Comp. Sci.', 65000); 
INSERT INTO instructor_2022360045 VALUES (12121, 'Wu', 'Finance', 90000); 
INSERT INTO instructor_2022360045 VALUES (15151, 'Mozart', 'Music', 40000); 
INSERT INTO instructor_2022360045 VALUES (22222, 'Einstein', 'Physics', 95000); 
INSERT INTO instructor_2022360045 VALUES (32343, 'El Said', 'History', 60000); 
INSERT INTO instructor_2022360045 VALUES (33456, 'Gold', 'Physics', 87000); 
INSERT INTO instructor_2022360045 VALUES (45565, 'Katz', 'Comp. Sci.', 75000); 
INSERT INTO instructor_2022360045 VALUES (58583, 'Califieri', 'History', 62000); 
INSERT INTO instructor_2022360045 VALUES (76543, 'Singh', 'Finance', 80000); 
INSERT INTO instructor_2022360045 VALUES (76766, 'Crick', 'Biology', 72000); 
INSERT INTO instructor_2022360045 VALUES (83821, 'Brandt', 'Comp. Sci.', 92000); 
INSERT INTO instructor_2022360045 VALUES (98345, 'Kim', 'Elec. Eng.', 80000); 

INSERT INTO course_2022360045 VALUES ('BIO-101', 'Intro. to Biology', 'Biology', 4); 
INSERT INTO course_2022360045 VALUES ('BIO-301', 'Genetics', 'Biology', 4); 
INSERT INTO course_2022360045 VALUES ('BIO-399', 'Computational Biology', 'Biology', 3); 
INSERT INTO course_2022360045 VALUES ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', 4); 
INSERT INTO course_2022360045 VALUES ('CS-190', 'Game Design', 'Comp. Sci.', 4); 
INSERT INTO course_2022360045 VALUES ('CS-315', 'Robotics', 'Comp. Sci.', 3); 
INSERT INTO course_2022360045 VALUES ('CS-319', 'Image Processing', 'Comp. Sci.', 3); 
INSERT INTO course_2022360045 VALUES ('CS-347', 'Database System Concepts', 'Comp. Sci.', 3); 
INSERT INTO course_2022360045 VALUES ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', 3); 
INSERT INTO course_2022360045 VALUES ('FIN-201', 'Investment Banking', 'Finance', 3); 
INSERT INTO course_2022360045 VALUES ('HIS-351', 'World History', 'History', 3); 
INSERT INTO course_2022360045 VALUES ('MU-199', 'Music Video Production', 'Music', 3); 
INSERT INTO course_2022360045 VALUES ('PHY-101', 'Physical Principles', 'Physics', 4); 

SELECT * FROM instructor_2022360045;
SELECT * FROM course_2022360045;
--LAB TASK 03
-- I
SELECT Name FROM instructor_2022360045;
--II
SELECT Course_ID,Title FROM course_2022360045;
--III
SELECT Name,dept_name FROM instructor_2022360045 WHERE ID=22222;
--IV
SELECT Title,credits FROM course_2022360045 WHERE dept_name='Comp. Sci.';
--V
SELECT name, dept_name FROM instructor_2022360045 WHERE Salary > 70000;
--VI
SELECT title FROM course_2022360045 WHERE credits >= 4;
--VII
SELECT Name, Dept_name FROM instructor_2022360045 WHERE salary > 80000 AND salary < 100000;
--VIII
SELECT Title,credits FROM course_2022360045 WHERE dept_name !='Comp. Sci.';
--IX
SELECT * FROM instructor_2022360045;
--X
SELECT * FROM course_2022360045 WHERE dept_name ='Biology' AND Credits != 4;
