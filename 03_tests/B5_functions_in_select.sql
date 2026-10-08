-- use select statements to test all functions

-- correct usage
SELECT get_annual_salary(1) FROM dual;
SELECT get_years_of_service(2) FROM dual;
SELECT calculate_tax_amt(10000) FROM dual;
SELECT get_dept_name(3) FROM dual;
SELECT validate_payroll(1, 1500000, 12) FROM dual;
SELECT validate_payroll(4, 450000, 8) FROM dual;
SELECT validate_payroll(1, 1500000, NULL) FROM dual;

-- incorrect usage
-- invalid emp_id returns NULL
SELECT get_annual_salary(5) FROM dual;
SELECT get_years_of_service(5) FROM dual;

-- Negative salary
SELECT calculate_tax_amt(-10000) FROM dual;

-- invalid dept_id
SELECT get_dept_name(4) FROM dual;
SELECT get_dept_name(NULL) FROM dual;

-- invalid payroll data
SELECT validate_payroll(4, 1500000, 12) FROM dual;
SELECT validate_payroll(1, 1500000, 16) FROM dual;
SELECT validate_payroll(1, NULL, 12) FROM dual;