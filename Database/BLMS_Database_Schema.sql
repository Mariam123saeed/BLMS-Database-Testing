-- =========================================
-- Create Database
-- =========================================

DROP DATABASE IF EXISTS bankingLoan_db;

CREATE DATABASE bankingLoan_db;

USE bankingLoan_db;


-- =========================================
-- 1. Customers
-- =========================================

CREATE TABLE Customers (
    customer_id INT NOT NULL AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL,

    PRIMARY KEY (customer_id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =========================================
-- 2. Branches
-- =========================================

CREATE TABLE Branches (
    branch_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),

    PRIMARY KEY (branch_id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =========================================
-- 3. Accounts
-- =========================================

CREATE TABLE Accounts (
    account_number INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    account_type ENUM('Savings','Current','Loan') NOT NULL,
    balance DECIMAL(15,2) CHECK (balance >= 0),

    PRIMARY KEY (account_number),

    KEY customer_id (customer_id),

    CONSTRAINT accounts_ibfk_1
        FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =========================================
-- 4. Employees
-- =========================================

CREATE TABLE Employees (
    employee_id INT NOT NULL AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    branch_id INT NOT NULL,

    PRIMARY KEY (employee_id),

    KEY branch_id (branch_id),

    CONSTRAINT employees_ibfk_1
        FOREIGN KEY (branch_id)
        REFERENCES Branches(branch_id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =========================================
-- 5. Loans
-- =========================================

CREATE TABLE Loans (
    loan_id INT NOT NULL AUTO_INCREMENT,
    account_number INT NOT NULL,
    loan_type ENUM('Personal','Home','Auto','Business') NOT NULL,
    principal_amount DECIMAL(15,2) DEFAULT NULL,
    interest_rate DECIMAL(5,2) DEFAULT NULL,
    start_date DATE NOT NULL,
    term_months INT DEFAULT NULL,
    status ENUM('Active','Closed','Default') DEFAULT 'Active',

    PRIMARY KEY (loan_id),

    KEY account_number (account_number),

    CONSTRAINT loans_ibfk_1
        FOREIGN KEY (account_number)
        REFERENCES Accounts(account_number),

    CONSTRAINT loans_chk_1
        CHECK (principal_amount > 0),

    CONSTRAINT loans_chk_2
        CHECK (interest_rate > 0),

    CONSTRAINT loans_chk_3
        CHECK (term_months > 0)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =========================================
-- 6. Collaterals
-- =========================================

CREATE TABLE Collaterals (
    collateral_id INT NOT NULL AUTO_INCREMENT,
    loan_id INT NOT NULL,
    type ENUM('Property','Vehicle','Gold','Other') NOT NULL,
    value DECIMAL(15,2) DEFAULT NULL,

    PRIMARY KEY (collateral_id),

    KEY loan_id (loan_id),

    CONSTRAINT collaterals_ibfk_1
        FOREIGN KEY (loan_id)
        REFERENCES Loans(loan_id),

    CONSTRAINT collaterals_chk_1
        CHECK (value >= 0)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =========================================
-- 7. Fees
-- =========================================

CREATE TABLE Fees (
    fee_id INT NOT NULL AUTO_INCREMENT,
    account_number INT DEFAULT NULL,
    loan_id INT DEFAULT NULL,
    fee_type ENUM('Overdraft','Late Repayment') NOT NULL,
    amount DECIMAL(10,2) DEFAULT NULL,

    PRIMARY KEY (fee_id),

    KEY account_number (account_number),
    KEY loan_id (loan_id),

    CONSTRAINT fees_ibfk_1
        FOREIGN KEY (account_number)
        REFERENCES Accounts(account_number),

    CONSTRAINT fees_ibfk_2
        FOREIGN KEY (loan_id)
        REFERENCES Loans(loan_id),

    CONSTRAINT fees_chk_1
        CHECK (amount > 0)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =========================================
-- 8. Transactions
-- =========================================

CREATE TABLE Transactions (
    transaction_id INT NOT NULL AUTO_INCREMENT,
    account_number INT NOT NULL,
    transaction_type ENUM(
        'Deposit',
        'Withdrawal',
        'Loan Disbursement',
        'Repayment'
    ) NOT NULL,
    amount DECIMAL(15,2) DEFAULT NULL,
    transaction_date DATE NOT NULL,

    PRIMARY KEY (transaction_id),

    KEY account_number (account_number),

    CONSTRAINT transactions_ibfk_1
        FOREIGN KEY (account_number)
        REFERENCES Accounts(account_number),

    CONSTRAINT transactions_chk_1
        CHECK (amount > 0)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =========================================
-- INSERT DATA
-- =========================================


-- Customers
INSERT INTO Customers
(full_name, date_of_birth, email, phone)
VALUES
('Ahmed Hassan', '1990-05-15', 'ahmed.hassan@email.com', '01012345678'),
('Mariam Ali', '1995-08-20', 'mariam.ali@email.com', '01123456789'),
('Omar Mohamed', '1988-03-10', 'omar.mohamed@email.com', '01234567890'),
('Sara Mahmoud', '1992-11-25', 'sara.mahmoud@email.com', '01545678901'),
('Youssef Ibrahim', '1985-07-05', 'youssef.ibrahim@email.com', '01098765432');


-- Accounts
INSERT INTO Accounts
(customer_id, account_type, balance)
VALUES
(1, 'Savings', 50000.00),
(2, 'Current', 75000.00),
(3, 'Loan', 150000.00),
(4, 'Savings', 30000.00),
(5, 'Loan', 250000.00);


-- Loans
INSERT INTO Loans
(account_number, loan_type, principal_amount, interest_rate,
 start_date, term_months, status)
VALUES
(3, 'Personal', 100000.00, 8.50, '2026-01-15', 36, 'Active'),
(5, 'Home', 500000.00, 7.25, '2025-06-01', 120, 'Active'),
(3, 'Auto', 200000.00, 9.00, '2026-02-10', 60, 'Active'),
(5, 'Business', 750000.00, 6.75, '2024-03-20', 84, 'Closed'),
(3, 'Personal', 50000.00, 10.00, '2025-01-10', 24, 'Default');


-- Collaterals
INSERT INTO Collaterals
(loan_id, type, value)
VALUES
(1, 'Gold', 120000.00),
(2, 'Property', 800000.00),
(3, 'Vehicle', 250000.00),
(4, 'Property', 1000000.00),
(5, 'Gold', 70000.00);

////////////////////////////////////////

//TC_14
INSERT INTO Loans (account_number, loan_type, principal_amount, interest_rate, start_date, term_months)
VALUES (1, 'Personal', 100000, 10.00, '2026-08-30', 12);

//TC_17
INSERT INTO Loans (account_number, loan_type, principal_amount, interest_rate, start_date, term_months)
VALUES (1, 'Personal', 100000, 10.00, '2026-08-30', 12);

SELECT *
FROM Loans
WHERE account_number = 1
  AND loan_type = 'Personal'
  AND principal_amount = 100000
  AND interest_rate = 10.00
  AND start_date = '2026-08-30'
  AND term_months = 12;

//TC_20

INSERT INTO Loans (account_number, loan_type, principal_amount, interest_rate, start_date, term_months)
VALUES (2, 'Personal', 50000, 10.00, '2026-08-30', 12);

//TC_23
INSERT INTO Loans (account_number, loan_type, principal_amount, interest_rate, start_date, term_months)
VALUES (999999, 'Personal', 50000, 10.00, '2026-08-30', 12);

//TC_27
INSERT INTO Loans (account_number, loan_type, principal_amount, interest_rate, start_date, term_months) 
VALUES (3, 'Personal', 50000, 10.00, '2026-08-30', 12);
//TC_33
INSERT INTO Loans (account_number, loan_type, principal_amount, interest_rate, start_date, term_months)
VALUES (5, 'Education', 50000, 10.00, '2026-08-30', 12);
//TC_46
INSERT INTO Loans (account_number, loan_type, principal_amount, interest_rate, start_date, term_months)
VALUES (4, 'Personal', 0, 10.00, '2026-08-30', 12);
//TC_49
INSERT INTO Loans (account_number, loan_type, principal_amount, interest_rate, start_date, term_months)
VALUES (2, 'Personal', -1000, 10.00, '2026-08-30', 12);
//TC_71
DESCRIBE Loans;

//TC_75
INSERT INTO Loans
(account_number, loan_type, principal_amount, interest_rate, start_date, term_months)
VALUES
(5, 'Personal', 100000.50, 10.00, '2026-08-30', 12);

//TC_78
INSERT INTO Loans (account_number, loan_type, principal_amount, interest_rate, start_date, term_months)
VALUES (5, 'Personal', 100000, 10.00, '2026-08-30', 12);

//TC_82
INSERT INTO Loans (account_number, loan_type, principal_amount, interest_rate, start_date, term_months)
VALUES (1, 'Personal', 100000, 0, '2026-08-30', 12);

//TC_85
INSERT INTO Loans (account_number, loan_type, principal_amount, interest_rate, start_date, term_months)
VALUES (3, 'Personal', 100000, -5.00, '2026-08-30', 12);

//TC_92
INSERT INTO Loans (account_number, loan_type, principal_amount, interest_rate, start_date, term_months) 
VALUES (5, 'Personal', 100000, 10.00, '2026-08-30', 12);

//TC_98(BUG)
INSERT INTO Loans
(account_number, loan_type, principal_amount, interest_rate, start_date, term_months)
VALUES
(1, 'Personal', 100000, 10.00, '2026-08-30', 12);

SELECT *
FROM Loans
WHERE account_number = 1
ORDER BY loan_id DESC
LIMIT 1;

SELECT *
FROM Repayment_Schedule
WHERE loan_id = (
    SELECT loan_id
    FROM Loans
    WHERE account_number = 1
    ORDER BY loan_id DESC
    LIMIT 1
);
//TC_104
INSERT INTO Loans (account_number, loan_type, principal_amount, interest_rate, start_date, term_months) 
VALUES (1001, 'Personal', NULL, 10.00, '2026-08-30', 12);

//TC_108
INSERT INTO Loans
(account_number, loan_type, principal_amount, interest_rate, start_date, term_months, status)
VALUES
(1, 'Personal', 100000, 10.00, '2024-08-30', 12, 'Default');

INSERT INTO Loans
(account_number, loan_type, principal_amount, interest_rate, start_date, term_months)
VALUES
(1, 'Home', 50000, 10.00, '2026-08-30', 12);
SELECT *
FROM Loans
WHERE account_number = 1;

//TC_123
INSERT INTO Loans
(account_number, loan_type, principal_amount, interest_rate, start_date, term_months)
VALUES
(5, 'Personal', 50000, 10.00, '2026-08-30', 12);

//TC_210
UPDATE Loans SET principal_amount = 120000, interest_rate = 12.00, term_months = 24 WHERE loan_id = 1;

TC_214
-- 1. Create a valid loan
INSERT INTO Loans
(account_number, loan_type, principal_amount, interest_rate, start_date, term_months)
VALUES
(1, 'Personal', 100000.00, 10.00, '2026-08-30', 12);

-- 2. Get the created Loan ID
SET @loan_id = LAST_INSERT_ID();

-- 3. Check the Loan before UPDATE
SELECT
    loan_id,
    account_number,
    loan_type,
    principal_amount,
    interest_rate,
    start_date,
    term_months
FROM Loans
WHERE loan_id = @loan_id;

-- 4. Update the Loan
UPDATE Loans
SET principal_amount = 120000.00
WHERE loan_id = @loan_id;

-- 5. Verify the Loan after UPDATE
SELECT
    loan_id,
    account_number,
    loan_type,
    principal_amount,
    interest_rate,
    start_date,
    term_months
FROM Loans
WHERE loan_id = @loan_id;


/////////Manage Colletrals///////
TC_132
INSERT INTO Collaterals (loan_id, type, value)
VALUES (1, 'Vehicle', 60000);

//TC_138
INSERT INTO Collaterals (loan_id, type, value)
VALUES (999999, 'Vehicle', 60000);

//TC_144
INSERT INTO Collaterals (loan_id, type, value) VALUES (1, 'other', 60000);
//TC_147
INSERT INTO Collaterals (loan_id, type, value)
VALUES (1, 'Cash', 60000);

//TC_154
INSERT INTO Loans
(account_number, loan_type, principal_amount, interest_rate, start_date, term_months)
VALUES
(5, 'Personal', 100000.00, 10.00, '2026-08-30', 12);

-- 2. Get the created Loan ID
SET @loan_id = LAST_INSERT_ID();

-- 3. Try to create collateral with value less than 50% of loan principal
INSERT INTO Collaterals
(loan_id, type, value)
VALUES
(@loan_id, 'Property', 40000.00);

//TC_168
INSERT INTO Collaterals (loan_id, type, value) VALUES (NULL, 'Vehicle', 60000);

//TC_170
UPDATE Collaterals SET type = 'Vehicle', value = 70000 WHERE collateral_id = 1;




//TC_189
UPDATE Fees
SET fee_type = 'Overdraft'
WHERE fee_id = 1;

 
SELECT * FROM Fees WHERE fee_id=1;
