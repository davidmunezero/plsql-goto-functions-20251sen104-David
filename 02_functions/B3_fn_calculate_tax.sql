-- assume tax is 18%
CREATE FUNCTION calculate_tax_amt(salary NUMBER) RETURN NUMBER AS
tax_rate CONSTANT INTEGER DEFAULT 18;
BEGIN
    IF salary < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be negative');
    END IF;
    RETURN salary * (tax_rate/100);
EXCEPTION 
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error message: ' || SQLERRM);
        RETURN -1;
END;
/