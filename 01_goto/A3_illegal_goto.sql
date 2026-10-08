-- illegal goto
DECLARE
    num INTEGER := -1;
    is_negative EXCEPTION;
BEGIN
    IF num < 0 THEN
        raise is_negative;
    END IF;
    GOTO end_program;

    <<error_label>>
    DBMS_OUTPUT.PUT_LINE('Number cannot be negative');

    <<end_program>>
        NULL;
EXCEPTION
    WHEN is_negative THEN
        GOTO error_label;

END;
/

-- fix: remove unnecessary goto error_label
DECLARE
    num INTEGER := -1;
    is_negative EXCEPTION;
BEGIN
    IF num < 0 THEN
        raise is_negative;
    END IF;

EXCEPTION
    WHEN is_negative THEN
        DBMS_OUTPUT.PUT_LINE('Number cannot be negative');

END;
/