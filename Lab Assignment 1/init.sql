SHOW DATABASES;
CREATE DATABASE assignment_1;
USE assignment_1;
CREATE TABLE dept(Dno int PRIMARY KEY, DesDname varchar(15));
CREATE TABLE emp(Eno char(2) PRIMARY KEY CHECK (left(Eno,1) = 'E'), Ename varchar(10) NOT NULL, City varchar(10), Salary int, Dno int, FOREIGN KEY (Dno) REFERENCES dept(Dno));
ALTER TABLE emp ADD CONSTRAINT check_city CHECK (City in ("Chennai", "Mumbai", "Kolkata", "Delhi"));
CREATE TABLE project(Pno char(2), Eno char(2), PRIMARY KEY(Pno, Eno), FOREIGN KEY (Eno) REFERENCES emp(Eno));

INSERT INTO dept VALUES ('1', 'CSE');
INSERT INTO dept VALUES ('2', 'ECE');
INSERT INTO dept VALUES ('3', 'EE');
INSERT INTO dept VALUES ('4', 'ME');
INSERT INTO dept VALUES ('5', 'BT');

INSERT INTO emp VALUES ('E1', 'Rahul', 'Chennai', 10000, '2');
INSERT INTO emp VALUES ('E2', 'Michael', 'Delhi', 20000, '1');
INSERT INTO emp VALUES ('E3', 'Jack', 'Kolkata', 8000, '3');
INSERT INTO emp VALUES ('E4', 'David', 'Chennai', 5000, '5');
INSERT INTO emp VALUES ('E5', 'Ashley', 'Delhi', 4000, '5');
INSERT INTO emp VALUES ('E6', 'Aser', 'Mumbai', 9000, '1');
