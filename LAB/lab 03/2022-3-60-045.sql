@ C:\Users\saifi\OneDrive\Desktop\banking.sql

--1
SELECT branch_name,branch_city
FROM branch
WHERE assets > 1000000;


--2
SELECT account_number,balance
FROM account
WHERE branch_name = 'Downtown' 
or balance >= 600 and balance <= 750;

--3
SELECT account_number
FROM account NATURAL JOIN branch 
WHERE branch_city = 'Rye';

--4
SELECT Loan.loan_number FROM Loan 
JOIN Borrower ON Loan.loan_number=Borrower.loan_number
JOIN Customer ON Customer.customer_name=Borrower.customer_name
WHERE amount>=1000 AND customer_city='Harrison';


--5
SELECT * FROM Account 
ORDER BY balance DESC;


--6
SELECT * FROM Customer 
ORDER BY customer_city;


--7
SELECT customer_name FROM Customer 
NATURAL JOIN Depositor INTERSECT 
SELECT customer_name FROM Customer 
NATURAL JOIN Borrower;


--8
SELECt customer_name,customer_city,customer_street
FROM Customer NATURAL JOIN Depositor UNION 
SELECT customer_name,customer_city,customer_street
FROM Customer NATURAL JOIN Borrower;


--9
SELECt customer_name,customer_city
FROM Customer NATURAL JOIN Borrower MINUS
SELECT customer_name,customer_city
FROM Customer NATURAL JOIN Depositor;

--10
SELECT SUM(assets) AS TOTAL_ASSETS
FROM Branch;


--11
SELECT branch_name, AVG(balance) AS AVERAGE_BALANCE 
FROM Account GROUP BY branch_name;


--12
SELECT branch_city, AVG(balance) AS AVERAGE_BALANCE 
FROM Account NATURAL JOIN Branch GROUP BY branch_city;


--13
SELECT branch_name, MIN(amount) AS MINIMUM_AMOUNT 
FROM Loan GROUP BY branch_name;


--14
SELECT branch_name, COUNT(*) AS total_loan
FROM Loan GROUP BY branch_name;


--15
SELECT customer_name,account_number 
FROM Account NATURAL JOIN Depositor
WHERE balance=(SELECT MAX(balance)FROM Account);