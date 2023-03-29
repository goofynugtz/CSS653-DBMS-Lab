SHOW DATABASES;
DROP DATABASE assignment_2;
CREATE DATABASE assignment_2;
USE assignment_2;

CREATE TABLE dept(DeptCode varchar(5) PRIMARY KEY, DeptName varchar(50) UNIQUE, HOD varchar(5));

INSERT INTO dept VALUES ('CSE', 'Computer Science and Engineering', '');
INSERT INTO dept VALUES ('EE', 'Electrical Engineering', '');

CREATE TABLE programme(Name varchar(25) PRIMARY KEY, Duration int, ProgrammeCode varchar(7) UNIQUE, DeptCode varchar(5), FOREIGN KEY (DeptCode) REFERENCES dept(DeptCode));

INSERT INTO programme VALUES ('B.Tech CSE', 4, 'CSE_UG', 'CSE');
INSERT INTO programme VALUES ('M.Tech CSE', 2, 'CSE_PG', 'CSE');
INSERT INTO programme VALUES ('PhD CSE', 1, 'CSE_PhD', 'CSE');
INSERT INTO programme VALUES ('B.Tech EE', 4, 'EE_UG', 'EE');
INSERT INTO programme VALUES ('M.Tech EE', 2, 'EE_PG', 'EE');
INSERT INTO programme VALUES ('PhD EE', 1, 'EE_PhD', 'EE');


CREATE TABLE student(RollNo varchar(8) PRIMARY KEY, Name varchar(25), Address varchar(100), Semester int, Programme varchar(7), FOREIGN KEY (Programme) REFERENCES programme(ProgrammeCode));


INSERT INTO student VALUES ('20CS8001', 'Ryan Howard', 'West Bengal', 4, 'CSE_UG');
INSERT INTO student VALUES ('20CS8002', 'Jaelynn Le', 'Assam', 4, 'CSE_UG');
INSERT INTO student VALUES ('20CS8003', 'Jean Stout', 'Rajasthan', 4, 'CSE_UG');
INSERT INTO student VALUES ('20CS8004', 'Francesca Haley', 'Punjab', 4, 'CSE_UG');
INSERT INTO student VALUES ('20CS7001', 'Jim Halpert', 'Haryana', 4, 'CSE_PG');
INSERT INTO student VALUES ('20CS7002', 'Peyton Schwartz', 'Punjab', 4, 'CSE_PG');
INSERT INTO student VALUES ('20CS6001', 'Kaylen Fuller', 'Telangana', 4, 'CSE_PhD');
INSERT INTO student VALUES ('20CS6002', 'Allison Perkins', 'Maharashtra', 4, 'CSE_PhD');

INSERT INTO student VALUES ('19CS8001', 'Ashleigh Abbott', 'West Bengal', 5, 'CSE_UG');
INSERT INTO student VALUES ('19CS8002', 'Martin Rangel', 'Assam', 5, 'CSE_UG');
INSERT INTO student VALUES ('19CS8003', 'Scott Powell', 'Rajasthan', 5, 'CSE_UG');
INSERT INTO student VALUES ('19CS8004', 'Chaim Mcgee', 'Punjab', 5, 'CSE_UG');
INSERT INTO student VALUES ('19CS7001', 'Blaze Faulkner', 'Haryana', 5, 'CSE_PG');
INSERT INTO student VALUES ('19CS7002', 'Hezekiah Mcclain', 'Punjab', 5, 'CSE_PG');
INSERT INTO student VALUES ('19CS6001', 'Sienna Roman', 'Telangana', 5, 'CSE_PhD');
INSERT INTO student VALUES ('19CS6002', 'Adriana Hurley', 'Maharashtra', 5, 'CSE_PhD');

INSERT INTO student VALUES ('20EE8001', 'Michael Scott', 'Bihar', 4, 'EE_UG');
INSERT INTO student VALUES ('20EE8002', 'Kaleb Beltran', 'Uttar Pradesh', 4, 'EE_UG');
INSERT INTO student VALUES ('20EE8003', 'Helen Bond', 'Himachal Pradesh', 4, 'EE_UG');
INSERT INTO student VALUES ('20EE8004', 'Tomas Berry', 'Mizoram', 4, 'EE_UG');
INSERT INTO student VALUES ('20EE7001', 'Kody Hancock', 'Kerala', 4, 'EE_PG');
INSERT INTO student VALUES ('20EE7002', 'Kevin Malone', 'West Bengal', 4, 'EE_PG');
INSERT INTO student VALUES ('20EE6001', 'Theresa Dorsey', 'Madhya Pradesh', 4, 'EE_PhD');
INSERT INTO student VALUES ('20EE6002', 'Stacy Cuevas', 'Arunachal Pradesh', 4, 'EE_PhD');


CREATE TABLE courses(CourseID varchar(6) PRIMARY KEY, Title varchar(50), Credit int, Type varchar(8), OfferringDept varchar(5), FOREIGN KEY (OfferringDept) REFERENCES dept(DeptCode), ProgrammeCode varchar(6), FOREIGN KEY (ProgrammeCode) REFERENCES programme(ProgrammeCode));
ALTER TABLE courses ADD CONSTRAINT check_type CHECK (Type in ("Core", "Elective"));

INSERT INTO courses VALUES ('CSC401', 'Computer Organization and Architecture', 4, 'Core', 'CSE', 'CSE_UG');
INSERT INTO courses VALUES ('CSC402', 'Theory of Computation', 3, 'Core', 'CSE', 'CSE_UG');
INSERT INTO courses VALUES ('CSC501', 'Operating Systems', 3, 'Core', 'CSE', 'CSE_UG');
INSERT INTO courses VALUES ('CSC502', 'Database Management System', 4, 'Core', 'CSE', 'CSE_UG');

INSERT INTO courses VALUES ('ECS401', 'Power Systems - I', 4, 'Core', 'EE', 'EE_UG');
INSERT INTO courses VALUES ('ECS402', 'Electrical Machines - I', 4, 'Core', 'EE', 'EE_UG');
INSERT INTO courses VALUES ('ECS501', 'Electrical Machines - II', 4, 'Core', 'EE', 'EE_UG');
INSERT INTO courses VALUES ('ECS502', 'Control Systems', 4, 'Core', 'EE', 'EE_UG');

CREATE TABLE student_course(RollNo varchar(8), FOREIGN KEY (RollNo) REFERENCES student(RollNo), CourseID varchar(6), FOREIGN KEY (CourseID) REFERENCES courses(CourseID), PRIMARY KEY(RollNo, CourseID), Semester int);

INSERT INTO student_course VALUES ('20CS8001', 'CSC401', 4);
INSERT INTO student_course VALUES ('20CS8001', 'CSC402', 4);
INSERT INTO student_course VALUES ('20CS8002', 'CSC401', 4);
INSERT INTO student_course VALUES ('20CS8002', 'CSC402', 4);
INSERT INTO student_course VALUES ('20CS8003', 'CSC401', 4);
INSERT INTO student_course VALUES ('20CS8003', 'CSC402', 4);
INSERT INTO student_course VALUES ('20CS8004', 'CSC401', 4);
INSERT INTO student_course VALUES ('20CS8004', 'CSC402', 4);
INSERT INTO student_course VALUES ('19CS8001', 'CSC501', 5);
INSERT INTO student_course VALUES ('19CS8001', 'CSC502', 5);
INSERT INTO student_course VALUES ('19CS8002', 'CSC501', 5);
INSERT INTO student_course VALUES ('19CS8002', 'CSC502', 5);
INSERT INTO student_course VALUES ('19CS8003', 'CSC501', 5);
INSERT INTO student_course VALUES ('19CS8003', 'CSC502', 5);
INSERT INTO student_course VALUES ('19CS8004', 'CSC501', 5);
INSERT INTO student_course VALUES ('19CS8004', 'CSC502', 5);

CREATE TABLE teacher(EmpCode varchar(4) PRIMARY KEY, EmpName varchar(25), Department varchar(5), FOREIGN KEY (Department) REFERENCES dept(DeptCode), Designation varchar(25));

INSERT INTO teacher VALUES ('CS01', 'Subrata Nandi', 'CSE', 'Professor');
INSERT INTO teacher VALUES ('CS02', 'Bibhash Sen', 'CSE', 'Associate Professor');
INSERT INTO teacher VALUES ('CS03', 'Suvrojit Das', 'CSE', 'Associate Professor');
INSERT INTO teacher VALUES ('CS04', 'Suvamoy Changder', 'CSE', 'Associate Professor');
INSERT INTO teacher VALUES ('CS05', 'Animesh Dutta', 'CSE', 'Associate Professor');
INSERT INTO teacher VALUES ('EE01', 'Sankar Narayan Mahato', 'EE', 'Professor');
INSERT INTO teacher VALUES ('EE02', 'Aritro Dey', 'EE', 'Associate Professor');
INSERT INTO teacher VALUES ('EE03', 'Jitesh Chandra Barman', 'EE', 'Associate Professor');
INSERT INTO teacher VALUES ('EE04', 'Manika Saha', 'EE', 'Associate Professor');
INSERT INTO teacher VALUES ('EE05', 'Rajdip Dey', 'EE', 'Trainee Teacher');

UPDATE dept SET HOD = 'CS01' WHERE DeptCode = 'CSE';
UPDATE dept SET HOD = 'EE01' WHERE DeptCode = 'EE'; 

ALTER TABLE dept ADD FOREIGN KEY (HOD) REFERENCES teacher(EmpCode); 

CREATE TABLE dept_courses(DeptCode varchar(5), FOREIGN KEY (DeptCode) REFERENCES dept(DeptCode), Semester int, CourseID varchar(6), FOREIGN KEY (CourseID) REFERENCES courses(CourseID), Teacher varchar(5), FOREIGN KEY (Teacher) REFERENCES teacher(EmpCode));

INSERT INTO dept_courses VALUES ('CSE', 4, 'CSC401', 'CS02');
INSERT INTO dept_courses VALUES ('CSE', 4, 'CSC402', 'CS03');
INSERT INTO dept_courses VALUES ('CSE', 5, 'CSC501', 'CS01');
INSERT INTO dept_courses VALUES ('CSE', 5, 'CSC502', 'CS05');
INSERT INTO dept_courses VALUES ('EE', 4, 'ECS401', 'EE02');
INSERT INTO dept_courses VALUES ('EE', 4, 'ECS402', 'EE03');
INSERT INTO dept_courses VALUES ('EE', 5, 'ECS501', 'EE01');
INSERT INTO dept_courses VALUES ('EE', 5, 'ECS502', 'EE05');


CREATE TABLE grades(RollNo varchar(8), CourseID varchar(6), PRIMARY KEY(RollNo, CourseID), Marks int, FOREIGN KEY (RollNo) REFERENCES student(RollNo), FOREIGN KEY (CourseID) REFERENCES courses(CourseID));

INSERT INTO grades VALUES ('20CS8001', 'CSC401', 70);
INSERT INTO grades VALUES ('20CS8001', 'CSC402', 90);
INSERT INTO grades VALUES ('20CS8002', 'CSC401', 50);
INSERT INTO grades VALUES ('20CS8002', 'CSC402', 50);
INSERT INTO grades VALUES ('20CS8003', 'CSC401', 60);
INSERT INTO grades VALUES ('20CS8003', 'CSC402', 70);
INSERT INTO grades VALUES ('20CS8004', 'CSC401', 80);
INSERT INTO grades VALUES ('20CS8004', 'CSC402', 90);
INSERT INTO grades VALUES ('20CS7001', 'CSC401', 40);
INSERT INTO grades VALUES ('20CS7001', 'CSC402', 50);
INSERT INTO grades VALUES ('20CS7002', 'CSC401', 65);
INSERT INTO grades VALUES ('20CS7002', 'CSC402', 75);
INSERT INTO grades VALUES ('20CS6001', 'CSC401', 80);
INSERT INTO grades VALUES ('20CS6001', 'CSC402', 80);
INSERT INTO grades VALUES ('20CS6002', 'CSC401', 90);
INSERT INTO grades VALUES ('20CS6002', 'CSC402', 90);

INSERT INTO grades VALUES ('20EE8001', 'ECS401', 70);
INSERT INTO grades VALUES ('20EE8001', 'ECS402', 90);
INSERT INTO grades VALUES ('20EE8002', 'ECS401', 50);
INSERT INTO grades VALUES ('20EE8002', 'ECS402', 50);
INSERT INTO grades VALUES ('20EE8003', 'ECS401', 60);
INSERT INTO grades VALUES ('20EE8003', 'ECS402', 70);
INSERT INTO grades VALUES ('20EE8004', 'ECS401', 80);
INSERT INTO grades VALUES ('20EE8004', 'ECS402', 90);
INSERT INTO grades VALUES ('20EE7001', 'ECS401', 40);
INSERT INTO grades VALUES ('20EE7001', 'ECS402', 50);
INSERT INTO grades VALUES ('20EE7002', 'ECS401', 65);
INSERT INTO grades VALUES ('20EE7002', 'ECS402', 75);
INSERT INTO grades VALUES ('20EE6001', 'ECS401', 80);
INSERT INTO grades VALUES ('20EE6001', 'ECS402', 80);
INSERT INTO grades VALUES ('20EE6002', 'ECS401', 90);
INSERT INTO grades VALUES ('20EE6002', 'ECS402', 90);
