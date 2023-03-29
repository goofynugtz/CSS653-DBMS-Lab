DROP PROCEDURE IF EXISTS Fib;
DROP Table IF EXISTS fibonacci;
CREATE Table fibonacci(f int);
DELIMITER //
CREATE procedure Fib()
begin
DECLARE a,b,c, counter int;
SET counter = 10;
SET a = 0;
SET b = 1;
INSERT INTO fibonacci VALUES (a);
INSERT INTO fibonacci VALUES (b);
WHILE counter>=0 do
set c = a + b;
set a = b;
SET b = c;
SET counter = counter-1;
INSERT INTO fibonacci VALUES (c);
END while;
END //  

call Fib();
SELECT * from fibonacci
