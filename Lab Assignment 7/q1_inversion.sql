DROP PROCEDURE INVERT;
DELIMITER //
CREATE procedure INVERT()
begin
DECLARE num,rev int;
SET num = 9635;
SET rev = 0;
WHILE num>0 do
set rev = (rev*10) + mod(num,10);
set num = floor(num/10);
END while;
select rev;
END //  

call INVERT();
