-- create PDB
CREATE PLUGGABLE DATABASE company
-- create local user within PDB
ADMIN USER company IDENTIFIED BY profit
-- instruct Oracle where to store the pdb's data files
FILE_NAME_CONVERT=
('C:\APP\HP\PRODUCT\21C\ORADATA\XE\PDBSEED\',
 'C:\APP\HP\PRODUCT\21C\ORADATA\XE\company\');

-- Create employee department
CREATE TABLE employee (
  emp_id INTEGER,
  emp_name VARCHAR2(50) NOT NULL,
  role VARCHAR2(10) NOT NULL CHECK(role IN ('Manager', 'Accountant', 'Regular', 'Secretary', 'Technician')),
  monthly_salary NUMBER NOT NULL CHECK(monthly_salary >= 0),
  email VARCHAR2(30) UNIQUE,
  phone_num VARCHAR2(10) UNIQUE,
  join_date DATE,
  dept_id INTEGER,
  PRIMARY KEY(emp_id)
);

-- Create department table
CREATE TABLE department (
  dept_id INTEGER,
  dept_name VARCHAR2(15) NOT NULL UNIQUE,
  manager_id INTEGER NOT NULL UNIQUE,
  PRIMARY KEY(dept_id)
);

-- create project table
CREATE TABLE project (
  project_id INTEGER PRIMARY KEY,
  project_name VARCHAR(20) NOT NULL,
  manager_id INTEGER NOT NULL,
  start_date DATE,
  deadline DATE,
  CONSTRAINT chk_deadline CHECK(deadline >= start_date)
);

CREATE TABLE emp_proj (
  emp_id INTEGER,
  project_id INTEGER,
  no_hours NUMBER NOT NULL CHECK(no_hours > 0),
  PRIMARY KEY(emp_id, project_id)
);

-- employee data
INSERT INTO employee VALUES (1, 'Jean Claude Mugisha', 'Manager', 1500000, 'jc.mugisha@corp.rw', '0788123456', DATE '2020-03-15', 1);
INSERT INTO employee VALUES (2, 'Aline Uwase', 'Accountant', 950000, 'a.uwase@corp.rw', '0722234567', DATE '2021-07-01', 2);
INSERT INTO employee VALUES (3, 'Eric Niyonzima', 'Technician', 600000, 'e.niyonzima@corp.rw', '0733345678', DATE '2022-01-10', 3);
INSERT INTO employee VALUES (4, 'Grace Ingabire', 'Secretary', 450000, 'g.ingabire@corp.rw', 0789456789, DATE '2023-05-22', 1);

-- department data
INSERT INTO department VALUES (1, 'Marketing', 4);
INSERT INTO department VALUES (2, 'Finance', 2);
INSERT INTO department VALUES (3, 'Tech', 3);

-- project data
INSERT INTO project VALUES (1, 'Athlean X', 4, DATE '2024-05-22', DATE '2024-11-22');
INSERT INTO project VALUES (2, 'Mars Co', 1, DATE '2024-06-22', DATE '2025-05-22');
INSERT INTO project VALUES (3, 'Company Website', 3, DATE '2024-01-12', DATE '2025-02-01');

-- emp_proj data
INSERT INTO emp_proj VALUES (4,1,24);
INSERT INTO emp_proj VALUES (1,2,52);
INSERT INTO emp_proj VALUES (3,3,16);
INSERT INTO emp_proj VALUES (2,1,20);
INSERT INTO emp_proj VALUES (3,2,2);

-- add foreign key
ALTER TABLE department ADD FOREIGN KEY(manager_id) REFERENCES employee(emp_id);
ALTER TABLE employee ADD FOREIGN KEY(dept_id) REFERENCES department(dept_id);
ALTER TABLE project ADD FOREIGN KEY(manager_id) REFERENCES employee(emp_id);
ALTER TABLE emp_proj ADD FOREIGN KEY(emp_id) REFERENCES employee(emp_id);
ALTER TABLE emp_proj ADD FOREIGN KEY(project_id) REFERENCES project(project_id);

