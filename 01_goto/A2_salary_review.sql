-- calculate manager employee raise based on the total number of hours worked on project(s)
-- 1hour -> 1% increase
DECLARE
    hours_worked NUMBER;
    current_salary NUMBER;
    updated_salary NUMBER;
BEGIN
    -- get current salary of manager
    SELECT monthly_salary 
    INTO current_salary
    FROM employee
    WHERE role = 'Manager';

    -- get total hours worked on project
    SELECT sum(no_hours)
    INTO hours_worked
    FROM emp_proj
    WHERE emp_id = (
        SELECT emp_id FROM employee WHERE role = 'Manager'
    ); 

    GOTO raise_salary;

    <<raise_salary>>
        updated_salary := current_salary * (1+(hours_worked/100));
        DBMS_OUTPUT.PUT_LINE('Updated manager salary: ' || updated_salary);
      
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Could not retrieve data from database');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Expected only one manager');
END;
/