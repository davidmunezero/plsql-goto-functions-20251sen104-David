-- get years of service for a employee

CREATE FUNCTION get_years_of_service(i_emp_id IN INTEGER) RETURN INTEGER AS 
start_date DATE;
years INTEGER;
BEGIN
    -- get date
    SELECT join_date INTO start_date
    FROM employee WHERE emp_id = i_emp_id;
    -- calculate years
    years := TRUNC(MONTHS_BETWEEN(sysdate, start_date) / 12);
    RETURN years;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Invalid employee ID');
        RETURN NULL;
END;
/