
1.
SET AUTOCOMMIT = 0;
BEGIN TRANSACTION;
  INSERT INTO transactions(FromAccount, ToAccount, Amount)
  IF((SELECT a.balance FROM accounts a WHERE a.AccountNo = 1234) > 100) 
      UPDATE accounts a SET a.balance = a.balance + 100 WHERE a.AccountNo = 5678;
      UPDATE accounts a SET a.balance = a.balance - 100 WHERE a.AccountNo = 1234;
      INSERT INTO transactions(FromAccount, ToAccount, Amount) VALUES (1234, 5678, 100);
  ELSE
      ROLLBACK;
  END IF


START TRANSACTION;
UPDATE accounts a 
SET a.balance = IF(a.balance >= 100, a.balance - 100, a.balance)
WHERE a.AccountNo = 1234;
UPDATE accounts a 
SET a.balance = a.balance + 100
WHERE a.AccountNo = 5678;
INSERT INTO transactions(FromAccount, ToAccount, Amount) VALUES (1234, 5678, 100);
COMMIT;





BEGIN IF (SELECT a.balance FROM accounts a WHERE a.AccountNo = 1234) > 100
UPDATE accounts a SET a.balance = a.balance + 100 WHERE a.AccountNo = 5678;
UPDATE accounts a SET a.balance = a.balance - 100 WHERE a.AccountNo = 1234;
END IF;




show databases;
USE assignment_6;
SELECT * FROM accounts;

SET AUTOCOMMIT = 0;
DELIMITER //
CREATE PROCEDURE txn(FromAccount int, ToAccount int, Amount double)
BEGIN
START TRANSACTION;
UPDATE accounts a SET a.balance = a.balance + Amount WHERE a.AccountNo = ToAccount;
UPDATE accounts a SET a.balance = a.balance - Amount WHERE a.AccountNo = FromAccount;
INSERT INTO transactions(FromAccount, ToAccount, Amount) VALUES (FromAccount, ToAccount, Amount);
SELECT * FROM accounts;
IF((SELECT a.balance FROM accounts a WHERE a.AccountNo = FromAccount) > Amount) THEN
  COMMIT;
ELSE
  ROLLBACK;
END IF;
END //

CALL txn(1234, 5678, 100);



