-- retrieve department name given the dept id
CREATE FUNCTION get_dept_name(i_dept_id IN INTEGER) RETURN VARCHAR2 AS
d_name VARCHAR2(50);
BEGIN
    SELECT dept_name INTO d_name FROM department WHERE dept_id = i_dept_id;
    RETURN d_name;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Invalid department ID');
        RETURN NULL;
END;
/