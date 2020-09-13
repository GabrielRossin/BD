SET SERVEROUTPUT ON
BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO WORLD');
END;
/

DECLARE
    mensagem varchar2(20) := ('Hello World1');
BEGIN
    DBMS_OUTPUT.PUT_LINE(mensagem);
END;
/
DECLARE
    mensagem varchar(20);
BEGIN
    mensagem := '&input';
    DBMS_OUTPUT.PUT_LINE ('Hello ' || mensagem);
END;
/

SET SERVEROUTPUT ON

DECLARE
    sobrenome employees.last_name %type;
BEGIN
    select last_name into sobrenome
    from  employees
    where employee_id = 100;
    
    DBMS_OUTPUT.PUT_LINE('O sobrenome do empregado é ' || sobrenome);
END;
/

DECLARE 
    dptno number := 9999 ;
BEGIN
    INSERT INTO departments(department_id , department_name)
    VALUES (dptno , 'Teste');
END;
/


DECLARE
    dptno number := 9999;
BEGIN
  delete from departments
  where department_id = dptno;
END;
/

select * from departments;





















