-- Create employee department
CREATE TABLE employee (
  emp_id INTEGER,
  emp_name VARCHAR2(50) NOT NULL,
  role VARCHAR2(10) NOT NULL,
  salary NUMBER NOT NULL,
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
  manager_id INTEGER NOT NULL,
  PRIMARY KEY(dept_id)
);

-- add data employee data
INSERT INTO employee (emp_id)

-- add foreign key
ALTER TABLE department ADD FOREIGN KEY(manager_id) REFERENCES employee(emp_id)
ALTER TABLE employee ADD FOREIGN KEY(dept_id) REFERENCES department(dept_id)
