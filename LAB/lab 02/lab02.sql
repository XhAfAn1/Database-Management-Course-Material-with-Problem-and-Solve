DROP TABLE account CASCADE CONSTRAINT;
DROP TABLE customer CASCADE CONSTRAINT;
DROP TABLE depositor CASCADE CONSTRAINT;

-- Task 1

CREATE TABLE account(
account_no CHAR(5),
balance NUMBER NOT NULL,
CONSTRAINT ac_pk PRIMARY KEY(account_no),
CONSTRAINT bl_pk CHECK(balance > 0)
);

select * FROM account;
desc account;

CREATE TABLE customer(
customer_no CHAR(5),
customer_name VARCHAR2(20) NOT NULL, 
customer_city VARCHAR2(10),
CONSTRAINT cus_pk PRIMARY KEY(customer_no) 
);
select * FROM customer;
desc customer;

CREATE TABLE depositor(
account_no CHAR(5),
customer_no CHAR(5),
CONSTRAINT dep_pk PRIMARY KEY(account_no,customer_no)
);
select * FROM depositor;
desc depositor;

-- Task 2 start
--i
ALTER TABLE customer 
ADD date_of_birth DATE;
--ii
ALTER TABLE customer 
DROP COLUMN date_of_birth;

--iii
ALTER TABLE depositor 
RENAME COLUMN account_no TO a_no;
ALTER TABLE depositor 
RENAME COLUMN customer_no TO c_no;

--iv
ALTER TABLE depositor ADD CONSTRAINT depositor_fk1 
FOREIGN KEY(a_no) REFERENCES account(account_no);

ALTER TABLE depositor ADD CONSTRAINT depositor_fk2 
FOREIGN KEY(c_no) REFERENCES customer(customer_no);


-- Task 3 
-- insert account 
INSERT INTO account VALUES('A-101',12000);
INSERT INTO account VALUES('A-102',6000);
INSERT INTO account VALUES('A-103',2500);

-- insert customer 
INSERT INTO customer VALUES('C-101','Alice','Dhaka');
INSERT INTO customer VALUES('C-102','Annie','Dhaka');
INSERT INTO customer VALUES('C-103','Bob','Chittagong');
INSERT INTO customer VALUES('C-104','Charlie','Khulna');

-- insert depositor 
INSERT INTO depositor VALUES('A-101','C-101');
INSERT INTO depositor VALUES('A-103','C-102');
INSERT INTO depositor VALUES('A-103','C-104');
INSERT INTO depositor VALUES('A-102','C-103');


-- Task 4
--i
SELECT customer_name,customer_city 
FROM customer;

--ii
SELECT DISTINCT customer_city 
FROM customer;

--iii
SELECT account_no
FROM account
WHERE balance > 7000;

--iv
SELECT customer_no,customer_name 
FROM customer
WHERE customer_city = 'Khulna';

--v
SELECT customer_no,customer_name 
FROM customer
WHERE customer_city != 'Dhaka';

--vi
SELECT Customer_name, Customer_city 
FROM account,depositor , customer
WHERE depositor.a_no=account.account_no
AND depositor.c_no=customer.Customer_no
AND BALANCE > 7000
;

--vii
SELECT Customer_name, Customer_city
FROM Customer JOIN Depositor
ON depositor.c_no=customer.Customer_no
JOIN Account ON depositor.a_no=account.account_no
WHERE balance > 7000 AND customer_city != 'Khulna';

--viii
SELECT Account_no,Balance FROM Account 
JOIN Depositor ON depositor.a_no=account.account_no
JOIN Customer ON depositor.c_no=customer.Customer_no
WHERE Customer_no='C-102';

--ix
SELECT Account_no,Balance FROM Account 
JOIN Depositor ON depositor.a_no=account.account_no
JOIN Customer ON depositor.c_no=customer.Customer_no
WHERE Customer_city IN('Dhaka','Khulna');

--x
SELECT Customer_name, Customer_city
FROM Customer JOIN Depositor
ON depositor.c_no=customer.Customer_no
JOIN Account ON depositor.a_no=account.account_no
WHERE Account_no IS NULL;
--x
SELECT Customer_name, Customer_city
FROM Customer WHERE Customer_no 
NOT IN (SELECT c_no FROM Depositor) ;