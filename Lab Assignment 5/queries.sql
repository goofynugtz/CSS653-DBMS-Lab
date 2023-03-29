-- 1. 
SELECT *
FROM patients
WHERE DateOfReg >= '2020-07-02' 
AND 
DateOfReg <= '2020-08-08';

-- 2.
UPDATE patients
SET PatientName = 'Tessa Curry'
WHERE PatientId = 'PT011';

-- 3.
SELECT p.PatientName, r.TestName, r.Result
FROM patients p
JOIN lab_tests r
ON p.PatientId = r.PatientId
WHERE r.TestDate = '2020-07-08';

-- 4.
SELECT COUNT(p.PatientId) AS "Patient Count"
FROM doctors d
JOIN patients p
ON d.DoctorId = p.RefferedBy
WHERE d.DoctorName = 'ABC';

-- 5.
SELECT d.DoctorId, d.DoctorName, COUNT(p.PatientId) 
AS "Count"
FROM patients p
JOIN doctors d
ON d.DoctorId = p.RefferedBy
GROUP BY d.DoctorId
HAVING Count = (
  SELECT MAX(Count) FROM (
    SELECT dx.DoctorId, COUNT(px.PatientId) AS "Count"
    FROM patients px
    JOIN doctors dx
    ON dx.DoctorId = px.RefferedBy
    GROUP BY dx.DoctorId
  ) q
);

-- 6.
UPDATE patients
SET BedNo = '456'
WHERE PatientId = 'PT023';

-- 7.
SELECT b.BedNo AS "Not Alloted"
FROM beds b
EXCEPT (
  SELECT p.BedNo
  FROM patients p
);

-- 8.
SELECT BedNo
FROM beds
WHERE WardNo = 10
EXCEPT
(
  SELECT b.BedNo
  FROM beds b
  JOIN patients p
  ON p.BedNo = b.BedNo
  WHERE b.WardNo = 10
);

-- 9.
SELECT x.PatientName
FROM (
  SELECT p.PatientName, p.BedNo
  FROM patients p
  JOIN doctors d
  ON p.RefferedBy = d.DoctorId
  WHERE d.DoctorName = 'XYZ' AND p.Gender = 'M'
) x
JOIN beds b
ON x.BedNo = b.BedNo
WHERE b.WardNo = 13;

-- 10.
SELECT p.* 
FROM patients p
JOIN doctors d
ON p.RefferedBy = d.DoctorId
WHERE d.DoctorName LIKE '%DAS%' AND p.Age >= 50;