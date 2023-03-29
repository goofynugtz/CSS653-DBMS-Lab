DROP PROCEDURE IF EXISTS AREA;
DROP TABLE IF EXISTS areas;
CREATE Table  areas(Radius int PRIMARY KEY, Area double);
DELIMITER //
CREATE procedure AREA()
begin
DECLARE R, A double;
SET R = 3;
WHILE r<8 do
set A = 3.1412 *R*R;
INSERT INTO areas VALUES (R, round(A, 2));
-- select A;
SET R = R+1;
END while;
END //  

call AREA();
SELECT * FROM areas;