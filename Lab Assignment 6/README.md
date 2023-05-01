# Lab 6

Q. Suppose you have two tables named "Accounts" and "Transactions":  
i. "Accounts" table, which contains the following columns:  
  - account_number (integer)  
  -	account_holder (text)  
  -	balance (float)  

ii. "Transactions" table, which contains the following columns:
  -	transaction_id (integer)
  -	from_account (integer)
  -	to_account (integer)
  -	amount (float)
  -	transaction_date (date)

a. Write an SQL transaction that transfers $100 from account number 1234 to account number 5678, and records the transaction in the "Transactions" table. The transaction should only occur if the balance of account number 1234 is greater than or equal to $100. If the transaction occurs successfully, the balance of account number 1234 should be reduced by $100, and the balance of account number 5678 should be increased by $100.

b. Write an SQL transaction that transfers $500 from account "A" to account "B", and inserts a new row into the "Transactions" table to record the transfer. However, the transaction should only be committed if both updates (i.e. transferring the money and inserting the transaction record) occur successfully.

c. Write an SQL transaction that transfers $1000 from account number 1234 to account number 5678, and inserts a new row into the "Transactions" table to record the transfer. However, the transaction should only be committed if all of the following conditions are met:
1. The balance of account 1234 is greater than or equal to $1000.
2. The balance of account 5678 is less than or equal to $5000.
3. The transaction date is on or after the current date.
