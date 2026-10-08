-- classify number as even or odd
DECLARE
    num INTEGER := 10; 
BEGIN
    IF MOD(num, 2) = 0 THEN
        GOTO even;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(num || ' is odd');
    GOTO end_block;
    
    <<even>>
    DBMS_OUTPUT.PUT_LINE(num || ' is even');
    
    <<end_block>>
    NULL; -- do nothing
END;
/