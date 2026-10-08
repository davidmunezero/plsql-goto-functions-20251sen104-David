BEGIN
    -- valid usage
    DBMS_OUTPUT.PUT_LINE(get_annual_salary(2));
    DBMS_OUTPUT.PUT_LINE(get_years_of_service(3));
    DBMS_OUTPUT.PUT_LINE(calculate_tax_amt(20000));
    DBMS_OUTPUT.PUT_LINE(get_dept_name(1));

    -- invalid usage
    DBMS_OUTPUT.PUT_LINE(get_annual_salary(7));
    DBMS_OUTPUT.PUT_LINE(get_years_of_service(6));
    DBMS_OUTPUT.PUT_LINE(calculate_tax_amt(-20000));
    DBMS_OUTPUT.PUT_LINE(get_dept_name(-1));
END;
/