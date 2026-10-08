BEGIN
    -- valid usage
    DBMS_OUTPUT.PUT_LINE(validate_payroll(1, 1500000, 10));
    DBMS_OUTPUT.PUT_LINE(validate_payroll(2, 950000, 8));

    -- invalid usage
    DBMS_OUTPUT.PUT_LINE(validate_payroll(1, 100000, 10));
    DBMS_OUTPUT.PUT_LINE(validate_payroll(1, 1500000, 16));
    DBMS_OUTPUT.PUT_LINE(validate_payroll(1, NULL, 12));
END;
/