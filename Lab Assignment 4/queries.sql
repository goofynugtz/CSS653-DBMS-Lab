-- a.
SELECT b.BookId, b.Title 
FROM IssuedBooks i NATURAL JOIN Books b
WHERE i.IssuedOnDate >= '2008-08-08' 
AND i.IssuedOnDate <= '2008-08-29';

-- b.
SELECT b.Author, COUNT(b.BookId) AS "Books Published"
FROM Books b
GROUP BY b.Author;

-- c.
SELECT b.Author, COUNT(b.BookId) AS "BooksPublished"
FROM Books b
GROUP BY b.Author
HAVING BooksPublished = (
  SELECT MAX(BooksPublished) FROM (
    SELECT b.Author, COUNT(b.BookId) AS "BooksPublished"
    FROM Books b
    GROUP BY b.Author
  ) q
);

-- d.
SELECT COUNT(b.BookId) AS "Total Books"
FROM Books b;

-- e.
SELECT COUNT(b.BookId) AS "Issue Count"
FROM Books b
NATURAL JOIN IssuedBooks i
WHERE i.IssuedBy = "CSB06001";

-- f.
UPDATE Books
SET Author = 'ABC'
WHERE BookId = 'BK003';

-- g.
SELECT s.RollNo, s.Name, s.DeptId
FROM Student s
JOIN (
  SELECT i.IssuedBy 
  FROM IssuedBooks i
  NATURAL JOIN (
    SELECT b.BookId
    FROM Books b
    NATURAL JOIN IssuedBooks i
    WHERE b.Author = "E. Navathe" AND b.Title = "Database Systems"
  ) q
) r
ON r.IssuedBy = s.RollNo;

-- h.
SELECT d.DeptId, d.DeptName, q.Count
FROM Department d
JOIN (
  SELECT s.DeptId, COUNT(s.RollNo) AS "Count"
  FROM Student s
  JOIN IssuedBooks i
  ON i.IssuedBy = s.RollNo
  GROUP BY s.DeptId
) q
ON d.DeptId = q.DeptId;

-- i.
SELECT b.* 
FROM Books b
WHERE b.Subject LIKE "%ORA%";

