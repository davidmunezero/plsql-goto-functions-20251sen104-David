-- validate payroll for particular employee

CREATE FUNCTION validate_payroll(i_emp_id INTEGER, amount NUMBER, bonus NUMBER) RETURN VARCHAR2 AS
emp_salary NUMBER;
BEGIN
    -- get employee's salary
    SELECT monthly_salary INTO emp_salary FROM employee WHERE emp_id = i_emp_id;

    -- validate payroll amount
    IF amount IS NULL OR amount <= 0 OR emp_salary != amount THEN
         RAISE_APPLICATION_ERROR(-20001, 'Error: Invalid payroll amount');
    END IF;

    -- validate bonus 0-15%
    IF bonus < 0 OR bonus > 15 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Error: Invalid bonus');
    END IF;

    -- no errors, so payroll data is valid
    RETURN 'Valid';
    
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Invalid employee ID');
        RETURN 'Invalid';
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        RETURN 'Invalid';

END;
/