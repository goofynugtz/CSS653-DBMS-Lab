
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


























DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts(AccountId varchar(6) PRIMARY KEY, Name varchar(5), Balance int);
INSERT INTO accounts VALUES ('AC_001', 'A', 5000);
INSERT INTO accounts VALUES ('AC_002', 'B', 10000);
INSERT INTO accounts VALUES ('AC_003', 'C', 5000);
INSERT INTO accounts VALUES ('AC_004', 'D', 2000);
INSERT INTO accounts VALUES ('AC_005', 'E', 250);

DROP PROCEDURE IF EXISTS Debit;
DELIMITER //
CREATE procedure Debit(AccountNo varchar(6))
begin
IF((SELECT a.Balance FROM accounts a WHERE a.AccountId = AccountNo) >= 2500)
  THEN UPDATE accounts a SET a.Balance = a.Balance - 2000 WHERE a.AccountId = AccountNo;
  SELECT a.Balance, "Account Debited" AS "Output" FROM accounts a WHERE a.AccountId = AccountNo;
ELSE
  SELECT a.Balance, "Insufficient Balance" AS "Output" FROM accounts a WHERE a.AccountId = AccountNo;
END IF;
END //

call Debit("AC_001");
SELECT * FROM accounts;
