-- 6. How much subjects are registered by a student in each semester?
SELECT dc.Semester, COUNT(dc.CourseID) AS "Course count"
FROM dept_courses dc
GROUP BY dc.Semester;

-- 7.  List the common students who are allotted the same 
-- courses of both the programme MCA and M.Tech.


-- 8. List the total number of student enrolled in the 
-- subject DBMS.
SELECT COUNT(RollNo) AS "DBMS Count"
FROM student_course sc
WHERE sc.CourseID = 'CSC502';

-- 9. Retrieve the semester of the student under 
-- DBMS subject.
SELECT Semester
FROM student_course
WHERE CourseID = 'CSC502'
GROUP BY Semester;

-- 10. Retrieve all the student name and arrange into 
-- ascending order
SELECT *
FROM student s
ORDER BY s.Name;