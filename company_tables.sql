-------------------------------
--Dunder Mifflin--Create_Tables
--Author: Carlos Vasquez
--Tool used: SSMS

--------- CREATE TABLES -----------
1. CREATE TABLE employee 
(emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT);

2. CREATE TABLE branch 
(branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL);

-- idetnity foreign keys to establish relationships
ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

-- continue to create remaining tables

CREATE TABLE client 
(client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL);

CREATE TABLE works_with
(emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE);

CREATE TABLE branch_supplier
(branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE);

----------- INSERT VALUES -------------

-- empolyee and branch tables
-- This is a complex data schema and data needs to be inserted in a specific way for the data schema that was created

-------------------------------------------------------------------------------
For example:
-- Corporate

-- The employee id (employee table) and branch id (branch table) share a foreign key (branch id in employee) that point to each other. i.e  the branch id (branch table)
points to the branch name and the branch table has column with a manager id which points to a specific employee (emplyee id on employee table)
Begin by using INSERT INTO

INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);
-- David Wallace should have an ID of 1 but because the corporate branch ID (branch table) hasn't been created yet we will be unble to enter that informatin as it is a foreign key
in employee table. Continue with branch information

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');
-- now that David Wallace information has been entered you can
enter his employee id numer in the brach id (branch table) to reference it as a realtion to the employee id (employee table)

-- now you can update david wallace information
UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

-insert the values for the remaning corporate employees

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- repeat the same steps with the Scranton and Stamford employees
-- Scranton
-----------------------------------
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);
--------------------------------------

-- Stamford
--------------------------------------
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);
---------------------------------------

-- Finish completing rest of the tables

-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES
(2, 'Hammer Mill', 'Paper'),
(2, 'Uni-ball', 'Writing Utensils'),
(3, 'Patriot Paper', 'Paper'),
(2, 'J.T. Forms & Labels', 'Custom Forms'),
(3, 'Uni-ball', 'Writing Utensils'),
(3, 'Hammer Mill', 'Paper'),
(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES
(400, 'Dunmore Highschool', 2),
(401, 'Lackawana Country', 2),
(402, 'FedEx', 3),
(403, 'John Daly Law, LLC', 3),
(404, 'Scranton Whitepages', 2),
(405, 'Times Newspaper', 3),
(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES
(105, 400, 55000),
(102, 401, 267000),
(108, 402, 22500),
(107, 403, 5000),
(108, 403, 12000),
(105, 404, 33000),
(107, 405, 26000),
(102, 406, 15000),
(105, 406, 130000);