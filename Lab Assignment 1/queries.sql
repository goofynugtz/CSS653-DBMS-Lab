-- a
SELECT AVG(Salary) FROM emp;

-- b
SELECT * 
FROM emp 
WHERE Salary>7000 
AND 
Salary<18000;

-- c
SELECT * 
FROM emp 
WHERE LENGTH(Ename) = 4 
AND 
Ename LIKE 'AS%';

-- d
SELECT d.Dno, d.DesDname, 
COUNT(e.Eno) AS "Count"
FROM emp e
JOIN dept d
ON e.Dno = d.Dno
GROUP BY d.Dno;

-- e
SELECT MAX(Salary)-MIN(Salary) 
AS "Difference" FROM emp;