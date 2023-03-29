SHOW DATABASES;
DROP DATABASE assignment_4;
CREATE DATABASE assignment_4;
USE assignment_4;

CREATE TABLE Books(BookId varchar(5) PRIMARY KEY, Author varchar(50), Title varchar(50), Subject varchar(50));
INSERT INTO Books VALUES ("BK001", "Kenneth Bridges", "Accountancy and Management", "Economics"); 
INSERT INTO Books VALUES ("BK002", "Kenneth Bridges", "Microeconomics in Details", "Economics"); 
INSERT INTO Books VALUES ("BK003", "Breanna Benson", "Macroeconomics in Breif", "Economics");
INSERT INTO Books VALUES ("BK004", "Kai Hwang", "Computer Architecture and Parallel Processing", "Computer Architecture");
INSERT INTO Books VALUES ("BK005", "MJ Flynn", "Computer Architecture: Pipelined", "Computer Architecture");
INSERT INTO Books VALUES ("BK006", "Siman Haykin", "Neural Networks", "Soft Computing");
INSERT INTO Books VALUES ("BK007", "B. Yegnanarayana", "Artificial Neural Networks", "Soft Computing");
INSERT INTO Books VALUES ("BK008", "E. Navathe", "Database Systems", "Database Management Systems");
INSERT INTO Books VALUES ("BK009", "Siman Haykin", "Java by Oracle", "Oracle");

CREATE TABLE Journals(JournalId varchar(5) PRIMARY KEY, Title varchar(50), Publisher varchar(50), SubjectArea varchar(50));
INSERT INTO Journals VALUES ("JN001", "Sustainability in swine production", "James L Sartin", "Animal Frontiers");
INSERT INTO Journals VALUES ("JN002", "Bioinformatics", "Katelyn Kim", "Bioinformatics");

CREATE TABLE Magazines(MagazineID varchar(5) PRIMARY KEY, Title varchar(10), Publisher varchar(50));

CREATE TABLE Department(DeptId varchar(3) PRIMARY KEY, DeptName varchar(50));
INSERT INTO Department VALUES ("CSE", "Computer Science and Engineering");
INSERT INTO Department VALUES ("ECE", "Electronics and Communication Engineering");
INSERT INTO Department VALUES ("ME", "Mechanical Engineering");

CREATE TABLE Student(RollNo varchar(8) PRIMARY KEY, Name varchar(50), DeptId varchar(3), FOREIGN KEY (DeptId) REFERENCES Department(DeptId));
INSERT INTO Student VALUES ("CSB06001", "Jair Newton", "CSE");
INSERT INTO Student VALUES ("CSB06002", "Kyra Evans", "CSE");
INSERT INTO Student VALUES ("CSB06003", "Cornelius Humphrey", "ECE");
INSERT INTO Student VALUES ("CSB06004", "Gage Haas", "ECE");
INSERT INTO Student VALUES ("CSB06005", "Talan Murillo", "ME");
INSERT INTO Student VALUES ("CSB06006", "Lauryn Marks", "ME");

CREATE TABLE IssuedBooks(IssueId varchar(5), BookId varchar(5), FOREIGN KEY (BookId) REFERENCES Books(BookId), IssuedBy varchar(8), FOREIGN KEY (IssuedBy) REFERENCES Student(RollNo), IssuedOnDate date, ReturnedOnDate date);

INSERT INTO IssuedBooks VALUES ("IS765", "BK008", "CSB06001", "2008-08-22", "2008-08-25");
INSERT INTO IssuedBooks VALUES ("IS766", "BK004", "CSB06002", "2008-08-24", "2008-08-25");
INSERT INTO IssuedBooks VALUES ("IS767", "BK001", "CSB06003", "2008-08-26", "2008-08-28");
INSERT INTO IssuedBooks VALUES ("IS768", "BK003", "CSB06004", "2008-09-12", "2008-09-15");
INSERT INTO IssuedBooks VALUES ("IS769", "BK005", "CSB06004", "2008-09-15", "2008-09-20");
INSERT INTO IssuedBooks VALUES ("IS770", "BK005", "CSB06004", "2008-09-18", "2008-09-25");
INSERT INTO IssuedBooks VALUES ("IS771", "BK001", "CSB06001", "2008-09-20", "2008-09-25");
