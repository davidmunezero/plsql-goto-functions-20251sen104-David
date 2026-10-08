-- calculate annual salary for a given employee

CREATE FUNCTION get_annual_salary(i_emp_id INTEGER) RETURN NUMBER AS
    annual_salary NUMBER;
BEGIN
    SELECT monthly_salary*12
    INTO annual_salary
    FROM employee
    WHERE emp_id = i_emp_id;
    RETURN annual_salary;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Invalid employee ID');
        RETURN NULL;
END;
/