SHOW DATABASES;
DROP DATABASE assignment_5;
CREATE DATABASE assignment_5;
USE assignment_5;

CREATE TABLE patients(PatientId varchar(5) PRIMARY KEY, 
PatientName varchar(50), Address varchar(50), 
Gender varchar(1), Age int, BedNo varchar(3), 
DateOfReg DATE, RefferedBy varchar(5));

INSERT INTO patients VALUES ('PT011', 'Tessa Curry', 'Rajasthan', 'F', 25, '111', 20200702, 'DC100');
INSERT INTO patients VALUES ('PT013', 'Raquel Rush', 'Uttar Pradesh', 'M', 43, '112', 20200705, 'DC100');
INSERT INTO patients VALUES ('PT015', 'Shawn Terrell', 'Goa', 'M', 36, '113', 20200726, 'DC101');
INSERT INTO patients VALUES ('PT017', 'Stephanie Green', 'Sikkim', 'M', 57, '114', 20200806, 'DC102');
INSERT INTO patients VALUES ('PT019', 'Nyla Pearson', 'Delhi', 'F', 27, '115', 20200808, 'DC100');
INSERT INTO patients VALUES ('PT020', 'Angela Sandoval', 'Kerala', 'F', 56, '116', 20200812, 'DC101');
INSERT INTO patients VALUES ('PT021', 'Ireland Salazar', 'Bihar', 'M', 23, '119', 20200813, 'DC104');
INSERT INTO patients VALUES ('PT023', 'Nyla Monroe', 'Mizoram', 'F', 45, '123', 20200817, 'DC103');
INSERT INTO patients VALUES ('PT025', 'Adan Ayala', 'Manipur', 'F', 50, '122', 20200820, 'DC100');
INSERT INTO patients VALUES ('PT029', 'Kash Welch', 'Tripura', 'M', 51, '120', 20200825, 'DC102');


CREATE TABLE doctors(DoctorId varchar(5) PRIMARY KEY, 
DoctorName varchar(50), Specialization varchar(20));

INSERT INTO doctors VALUES ('DC100', 'ABC', 'Endocrinologist');
INSERT INTO doctors VALUES ('DC101', 'XYZ', 'Dermatologist');
INSERT INTO doctors VALUES ('DC102', 'DAS', 'Gastroenterologist');
INSERT INTO doctors VALUES ('DC103', 'BAS', 'Hematologist');
INSERT INTO doctors VALUES ('DC104', 'HIJ', 'Internist');

ALTER TABLE patients ADD FOREIGN KEY (RefferedBy) 
REFERENCES doctors(DoctorId); 


CREATE TABLE lab_tests(TestNo varchar(5), 
PatientId varchar(5), PRIMARY KEY(TestNo, PatientId), 
FOREIGN KEY (PatientId) REFERENCES patients(PatientId), 
TestName varchar(50), TestDate DATE, Result varchar(8), 
RefferedBy varchar(5), FOREIGN KEY (RefferedBy) 
REFERENCES doctors(DoctorId));

INSERT INTO lab_tests VALUES ('TC201', 'PT011', 'Albumin Blood Test', 20200708, 'Negative', 'DC100');
INSERT INTO lab_tests VALUES ('TC202', 'PT013', 'CCP Antibody Test', 20200708, 'Positive', 'DC100');
INSERT INTO lab_tests VALUES ('TC203', 'PT017', 'Homocysteine Test', 20200806, 'Positive', 'DC102');
INSERT INTO lab_tests VALUES ('TC204', 'PT019', 'Iron Tests', 20200820, 'Negative', 'DC100');
INSERT INTO lab_tests VALUES ('TC205', 'PT023', 'Lyme Disease Tests', 20200820, 'Negative', 'DC100');
INSERT INTO lab_tests VALUES ('TC206', 'PT029', 'Magnesium Blood Test', 20200826, 'Positive', 'DC100');


CREATE TABLE beds(BedNo varchar(3) PRIMARY KEY, 
WardNo int);

INSERT INTO beds VALUES ('111', 13);
INSERT INTO beds VALUES ('112', 13);
INSERT INTO beds VALUES ('113', 13);
INSERT INTO beds VALUES ('114', 13);
INSERT INTO beds VALUES ('115', 13);
INSERT INTO beds VALUES ('116', 11);
INSERT INTO beds VALUES ('117', 11);
INSERT INTO beds VALUES ('118', 11);
INSERT INTO beds VALUES ('119', 11);
INSERT INTO beds VALUES ('120', 11);
INSERT INTO beds VALUES ('121', 10);
INSERT INTO beds VALUES ('122', 10);
INSERT INTO beds VALUES ('123', 10);
INSERT INTO beds VALUES ('124', 10);
INSERT INTO beds VALUES ('125', 10);
INSERT INTO beds VALUES ('456', 4);

ALTER TABLE patients ADD FOREIGN KEY (BedNo) 
REFERENCES beds(BedNo);
