-- let's rewrite A1 without goto statements

DECLARE
    num INTEGER := 10; 
BEGIN
    IF MOD(num, 2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE(num || ' is even');
    ELSE
        DBMS_OUTPUT.PUT_LINE(num || ' is odd');
    END IF;

END;
/