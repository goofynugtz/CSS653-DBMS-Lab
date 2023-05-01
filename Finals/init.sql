CREATE TABLE patients(PatientId varchar(6) PRIMARY KEY, PatientName varchar(50), PatientAge int, PatientGender varchar(1), DoctorId varchar(6));
ALTER TABLE patients ADD FOREIGN KEY (DoctorId) REFERENCES doctors(DoctorId); 
CREATE TABLE doctors(DoctorId varchar(6) PRIMARY KEY, DoctorName varchar(50), DoctorAge int, DoctorGender varchar(1), Speciality varchar(20));

INSERT INTO patients VALUES ('PAT011', 'Tessa Curry', 25, 'F', 'DOC100');
INSERT INTO patients VALUES ('PAT013', 'Raquel R. Washington', 43, 'M', 'DOC100');
INSERT INTO patients VALUES ('PAT015', 'Shawn Terrell', 36, 'M', 'DOC101');
INSERT INTO patients VALUES ('PAT017', 'Stephanie Green', 57, 'M', 'DOC102');
INSERT INTO patients VALUES ('PAT019', 'Nyla Pearson', 27, 'F', 'DOC100');
INSERT INTO patients VALUES ('PAT020', 'El Person', 27, 'F', 'DOC100');
INSERT INTO patients VALUES ('PAT021', 'Naman', 27, 'F', 'DOC101');
INSERT INTO patients VALUES ('PAT022', 'Kamal Hasan', 37, 'F', 'DOC102');

INSERT INTO doctors VALUES ('DOC100', 'ABC', 40, "M", 'Cardiologist');
INSERT INTO doctors VALUES ('DOC101', 'XYZ', 42, "M", 'Dermatologist');
INSERT INTO doctors VALUES ('DOC102', 'DAS', 44, "M", 'Gastroenterologist');
INSERT INTO doctors VALUES ('DOC103', 'BAS', 35, "M", 'Hematologist');

-- a
SELECT AVG(PatientAge) AS "Average Patient Age" FROM patients WHERE PatientName REGEXP '[A-Z][a-z]*[aeiou][a-z]*[aeiou][a-z]*[aeiou][a-z]*';

-- b
SELECT d.DoctorName, COUNT(p.PatientId) AS "PatientCount"
FROM doctors d
JOIN patients p ON d.DoctorId = p.DoctorId
WHERE d.Speciality = "Cardiologist" AND p.PatientName = "%R%";
GROUP BY d.DoctorId;

-- c
SELECT doctors.DoctorName, COUNT(patients.PatientId) AS PatientCount
FROM doctors
JOIN patients ON doctors.DoctorId = patients.DoctorId
WHERE patients.PatientAge > 30 AND patients.PatientName LIKE "%K%"
GROUP BY doctors.DoctorId
ORDER BY PatientCount DESC LIMIT 1;

-- d
SELECT doctors.Speciality, COUNT(patients.PatientId) AS PatientCount
FROM doctors
JOIN patients ON doctors.DoctorId = patients.DoctorId
WHERE patients.PatientAge % 3 = 0 AND patients.PatientName = REVERSE(patients.PatientName)
GROUP BY doctors.Speciality;

-- e
SELECT doctors.DoctorName, patients.PatientGender, AVG(patients.PatientAge) AS "Average Age"
FROM doctors
JOIN patients ON doctors.DoctorId = patients.DoctorId
GROUP BY doctors.DoctorId, patients.PatientGender;

SELECT *, AVG(PatientAge) AS "Average Age (M)" 
FROM patients 
WHERE PatientGender="M" GROUP BY DoctorId;
SELECT *, AVG(PatientAge) AS "Average Age (F)" 
FROM patients 
WHERE PatientGender="F" GROUP BY DoctorId;