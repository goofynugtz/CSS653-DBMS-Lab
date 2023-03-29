DROP PROCEDURE IF EXISTS Fact;
DELIMITER //
CREATE procedure Fact(n int)
begin
DECLARE a, res bigint;
SET a = n;
SET res = a;
WHILE a>1 do
SET res = res * (a-1),
a = a-1;
END while;
SELECT res as Answer;
END //  

call Fact(5);
