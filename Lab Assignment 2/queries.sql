-- 1. Find all the students’ name, city, course allotted 
-- from the CSE department.
SELECT * 
FROM student s
JOIN programme p
ON s.Programme = p.ProgrammeCode
WHERE p.DeptCode = 'CSE';

-- 2. List the total number of Faculty in the CSE department.
SELECT COUNT(t.EmpCode) AS "Faculty Count"
FROM teacher t
WHERE t.Department = 'CSE';

-- 3. List the available courses from the CSE department.
SELECT *
FROM courses c
WHERE c.OfferringDept = 'CSE';

-- 4. List the all students in a particular semester.
SELECT *
FROM student
WHERE Semester = 4;

-- 5. List the students who earned CGPA greater than or equal to 8.5.
SELECT s.RollNo, s.Name, ROUND(h.CGPA, 2) AS "CGPA" 
FROM student s
JOIN (
  SELECT g.RollNo, SUM(g.Marks)/COUNT(g.RollNo)/9.5 AS "CGPA"
  FROM grades g
  GROUP BY g.RollNo
) h
ON s.RollNo = h.RollNo
WHERE h.CGPA >= 8.5;
