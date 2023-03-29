SHOW DATABASES;
DROP DATABASE assignment_6;
CREATE DATABASE assignment_6;
USE assignment_6;

CREATE TABLE accounts(AccountNo int PRIMARY KEY, AccountHolder varchar(50), balance double);

CREATE TABLE transactions(TransactionId int PRIMARY KEY NOT NULL AUTO_INCREMENT, FromAccount int, FOREIGN KEY (FromAccount) REFERENCES accounts(AccountNo), ToAccount int, FOREIGN KEY (ToAccount) REFERENCES accounts(AccountNo), Amount double, TransactionDate date DEFAULT (CURRENT_DATE));

ALTER TABLE transactions AUTO_INCREMENT = 2990;

INSERT INTO accounts VALUES (1231, "Remington Santos", 6342.23);
INSERT INTO accounts VALUES (1232, "Lisa Cooley", 78342.00);
INSERT INTO accounts VALUES (1233, "Jean Willis", 342.00);
INSERT INTO accounts VALUES (1234, "Anya Shah", 306.50);
INSERT INTO accounts VALUES (5678, "Kendal Ayers", 42.9);
INSERT INTO accounts VALUES (5679, "Maren Todd", 420.69);
INSERT INTO accounts VALUES (5680, "Demarcus Moore", 14300.00);

SAVEPOINT init;
