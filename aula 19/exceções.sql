SET SERVEROUTPUT ON;

CREATE TABLE ERRORS 
( 
    e_date DATE, 
    error_code NUMBER, 
    error_msg VARCHAR2(255)
);

DECLARE
    lname VARCHAR2(15);
BEGIN
    select last_name into lname
    from employees
    where first_name = 'John';
    dbms_output.put_line('O sobrenome de John é: ' || lname);
EXCEPTION
    when too_many_rows THEN
        DBMS_OUTPUT.PUT_LINE('O comando select into recuperou muitas tuplas');
    WHEN OTHERS THEN 
        errcode := SQLCODE ; 
        errmsg := SQLERRM ;
        INSERT INTO errors (e_date, error_code, error_msg) 
        VALUES (SYSDATE, errcode, errmsg);  
    
END;
/

SET SERVEROUTPUT ON 
DECLARE 
        insert_excep EXCEPTION; 
        PRAGMA EXCEPTION_INIT(insert_excep, -01400); 
BEGIN 
        INSERT INTO departments(department_id, department_name)
        VALUES (280, NULL); 
EXCEPTION 
    WHEN insert_excep THEN 
    DBMS_OUTPUT.PUT_LINE('INSERT OPERATION FAILED'); 
    DBMS_OUTPUT.PUT_LINE(SQLERRM); 
END; 
/
DECLARE 
    invalid_department EXCEPTION; 
    name VARCHAR2(20):= '&name'; 
    deptno NUMBER := &deptno; 
BEGIN 
    UPDATE departments 
    SET department_name = name
    WHERE department_id = deptno; 
    IF SQL%NOTFOUND THEN 
                RAISE invalid_department; 
    END IF; 
EXCEPTION 
        WHEN invalid_department THEN
                    DBMS_OUTPUT.PUT_LINE('Não existe o department id informado'); 
END; 
/

