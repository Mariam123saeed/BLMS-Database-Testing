# 🏦 Banking Loan Management System (BLMS) – Database Testing

## 📌 Project Overview

**BLMS (Banking Loan Management System)** is a team-based **Database Testing project** focused on validating the database layer of a banking system.

The project covers **data integrity, database constraints, relationships, business rules, and triggers** using SQL.

### Main Modules

* Customers
* Accounts
* Loans
* Collaterals
* Transactions
* Fees
* Branches
* Employees

---

## 🎯 Testing Scope

### In Scope

* Database structure and relationships
* Primary & Foreign Keys
* `NOT NULL`, `UNIQUE`, `CHECK`, and `ENUM` constraints
* Business rule validation
* Trigger testing
* Positive & Negative testing
* Boundary Value Testing
* Data integrity and consistency

### Operations Tested

* `INSERT`
* `UPDATE`
* `SELECT` for validation

### Out of Scope

* Front-end UI
* APIs
* Reporting dashboards

---

# 🗄️ Database – MySQL

**MySQL** was used as the main **Relational Database Management System (RDBMS)**.

### Database Structure

The database contains **8 tables**:

`Customers` · `Branches` · `Accounts` · `Employees` · `Loans` · `Collaterals` · `Fees` · `Transactions`

### MySQL was used to

* Create the database schema and tables
* Define Primary and Foreign Keys
* Apply database constraints
* Create and test triggers
* Insert and update test data
* Execute SQL validation queries
* Verify business rules and data integrity

### MySQL Installation – Ubuntu

```bash
sudo apt update
sudo apt install mysql-server
sudo systemctl status mysql
sudo mysql
```

Official documentation:
`https://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/`

---

# 🖥️ DBeaver Community Edition

**DBeaver CE** was used as the **GUI database client** for working with MySQL.

It was used for:

* Connecting to the MySQL database
* Creating and inspecting tables
* Writing and executing SQL queries
* Running `INSERT` and `UPDATE` operations
* Running validation `SELECT` queries
* Viewing table data
* Inspecting database relationships
* Testing and validating SQL scripts

### DBeaver CE Installation – Ubuntu

```bash
sudo snap install dbeaver-ce --stable
dbeaver-ce
```

Official website:
`https://dbeaver.io/`

---

# 🧪 Testing Approach

The project included:

* Requirement Analysis
* Test Estimation & Sizing
* Test Planning
* Test Case Design
* SQL Execution
* Result Validation
* Defect Reporting
* UAT
* Test Summary Reporting

### Examples of Tested Scenarios

* Duplicate customer email
* Invalid Foreign Key
* Negative account balance
* Negative transaction amount
* Overdraft attempt
* Loan repayment exceeding outstanding balance
* Collateral value below 50% of loan principal
* Invalid ENUM values
* Trigger-based calculations

---

# 🐞 Jira – Test Management & Bug Tracking

The team used **Jira** for:

* Test Case Management
* Bug Tracking
* Task Management
* Test Execution Tracking
* Retesting
* Defect Status Tracking
* Team Project Management

### Jira Project

`JIRA_PROJECT_LINK`

> Jira access may require authorization.

---

# 📄 Project Deliverables

| Deliverable         | Tool            |
| ------------------- | --------------- |
| BRD / Final Task    | Microsoft Word  |
| Test Plan           | Microsoft Word  |
| Test Cases          | Jira            |
| Estimation & Sizing | Microsoft Excel |
| UAT Report          | Microsoft Excel |
| Test Summary Report | Microsoft Word  |
| Bug Tracking        | Jira            |
| Database Testing    | MySQL + DBeaver |

---

# 🛠️ Tools & Technologies

* **MySQL** – Database Management & Testing
* **DBeaver CE** – Database GUI / SQL Client
* **SQL** – Database Testing & Validation
* **Jira** – Test Management & Bug Tracking
* **Microsoft Excel** – Estimation & Sizing, UAT
* **Microsoft Word** – BRD, Test Plan & Test Summary Report
* **Git / GitHub** – Version Control

---

# 📊 Project Summary

| Item                 | Details          |
| -------------------- | ---------------- |
| Project Type         | Database Testing |
| Domain               | Banking          |
| Database             | MySQL            |
| Tables               | 8                |
| Estimated Test Cases | 50–60            |
| Business Rules       | 25+              |
| Triggers             | 2                |
| Main Operations      | INSERT / UPDATE  |
| Validation           | SQL SELECT       |
| Test Management      | Jira             |
| Project Type         | Team Project     |

---

# 📁 Repository Structure

```text
BLMS-Database-Testing/
│
├── README.md
│
├── Database/
│   └── BLMS_Database_Schema.sql
│
├── Documentation/
│   ├── Final Task.docx
│   └── Test Plan For BLMS.docx
│
├── Estimation/
│   └── testing_effort_estimation-Banking.xlsx
│
├── UAT/
│   └── BLMS_UAT_Document.xlsx
│
├── Test-Report/
│   └── test status report.docx
│
└── .gitignore
```

---

# 👩‍💻 My Role

**QA / Database Tester**

* Analyzed requirements and business rules
* Designed and executed database test cases
* Wrote SQL queries for testing and validation
* Tested constraints and relationships
* Validated business rules and database triggers
* Reported and tracked defects using Jira
* Contributed to UAT
* Contributed to Estimation & Sizing
* Contributed to Test Plan and Test Summary Report
